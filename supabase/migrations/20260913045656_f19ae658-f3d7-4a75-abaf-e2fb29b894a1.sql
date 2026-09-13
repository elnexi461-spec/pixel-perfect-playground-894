
CREATE OR REPLACE FUNCTION public.svc_ensure_my_profile(_user_id uuid, _email text, _phone text DEFAULT NULL, _display_name text DEFAULT NULL, _referral_code text DEFAULT NULL)
RETURNS jsonb LANGUAGE sql SECURITY DEFINER SET search_path = public, private AS $$
  SELECT to_jsonb(private.ensure_my_profile(_user_id, _email, _phone, _display_name, _referral_code));
$$;

CREATE OR REPLACE FUNCTION public.svc_purchase_package(_user_id uuid, _package_id bigint)
RETURNS uuid LANGUAGE sql SECURITY DEFINER SET search_path = public, private AS $$
  SELECT private.purchase_package(_user_id, _package_id);
$$;

CREATE OR REPLACE FUNCTION public.svc_collect_income(_user_id uuid)
RETURNS numeric LANGUAGE sql SECURITY DEFINER SET search_path = public, private AS $$
  SELECT private.collect_income(_user_id);
$$;

CREATE OR REPLACE FUNCTION public.svc_request_withdrawal(_user_id uuid, _amount numeric, _phone text)
RETURNS uuid LANGUAGE sql SECURITY DEFINER SET search_path = public, private AS $$
  SELECT private.request_withdrawal(_user_id, _amount, _phone);
$$;

CREATE OR REPLACE FUNCTION public.svc_complete_mpesa_deposit(_checkout_request_id text, _receipt text, _amount numeric, _phone text, _metadata jsonb DEFAULT '{}'::jsonb)
RETURNS uuid LANGUAGE sql SECURITY DEFINER SET search_path = public, private AS $$
  SELECT private.complete_mpesa_deposit(_checkout_request_id, _receipt, _amount, _phone, _metadata);
$$;

CREATE OR REPLACE FUNCTION public.svc_fail_mpesa_deposit(_checkout_request_id text, _reason text, _metadata jsonb DEFAULT '{}'::jsonb)
RETURNS void LANGUAGE sql SECURITY DEFINER SET search_path = public, private AS $$
  SELECT private.fail_mpesa_deposit(_checkout_request_id, _reason, _metadata);
$$;

REVOKE ALL ON FUNCTION public.svc_ensure_my_profile(uuid, text, text, text, text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.svc_purchase_package(uuid, bigint) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.svc_collect_income(uuid) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.svc_request_withdrawal(uuid, numeric, text) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.svc_complete_mpesa_deposit(text, text, numeric, text, jsonb) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.svc_fail_mpesa_deposit(text, text, jsonb) FROM PUBLIC, anon, authenticated;

GRANT EXECUTE ON FUNCTION public.svc_ensure_my_profile(uuid, text, text, text, text) TO service_role;
GRANT EXECUTE ON FUNCTION public.svc_purchase_package(uuid, bigint) TO service_role;
GRANT EXECUTE ON FUNCTION public.svc_collect_income(uuid) TO service_role;
GRANT EXECUTE ON FUNCTION public.svc_request_withdrawal(uuid, numeric, text) TO service_role;
GRANT EXECUTE ON FUNCTION public.svc_complete_mpesa_deposit(text, text, numeric, text, jsonb) TO service_role;
GRANT EXECUTE ON FUNCTION public.svc_fail_mpesa_deposit(text, text, jsonb) TO service_role;
