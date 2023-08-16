Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180A77EACD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 22:37:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kV+v+yOY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR0LK1K7mz3cKK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 06:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kV+v+yOY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR0KR4p16z2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 06:36:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05AF46451B;
	Wed, 16 Aug 2023 20:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB137C433C8;
	Wed, 16 Aug 2023 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692218185;
	bh=3znihyA+oNNC5toukf3Se/qa9M83w2qHg2WPNYDnsfA=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=kV+v+yOYJZeyBmuLXMZ4+RVu+Q24pkibRr9FH84OWhE0s70azYDnh1PYnm9swJ/Yc
	 Y0CqaTIjHL6zDsSZZzs5LbqUkQaoNwLH65wGXGE5dBaUjlKiTjFgcXJWfnI8/yM3c8
	 ct22xLe44OMHIwkwNUu33fZZnR7hiEL0GksRUvPKnkb5c5DFiesYkMLcD817R67KLH
	 IC6Dm8GmiQvISEC+4cAgD8VPCXIa0NYWam00jcgqMKF3lzqDOt3yH0dH1E4O4GDGmi
	 9CavmiUNmMk4Ywrb/J2G893+f/+r2QyxnIY3vGekvTR/QXSmp2H2PkmgchhZRbRp1W
	 Ik+M3mMLZY2hA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Aug 2023 23:36:22 +0300
Message-Id: <CUU9A4V7EREZ.2CPPYURBAGN95@suppilovahvero>
To: "Nayna Jain" <nayna@linux.ibm.com>, <linux-integrity@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] integrity: PowerVM support for loading third
 party code signing keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230815112722.1591829-1-nayna@linux.ibm.com>
 <20230815112722.1591829-7-nayna@linux.ibm.com>
In-Reply-To: <20230815112722.1591829-7-nayna@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, inux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-security-module@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Aug 15, 2023 at 2:27 PM EEST, Nayna Jain wrote:
> On secure boot enabled PowerVM LPAR, third party code signing keys are
> needed during early boot to verify signed third party modules. These
> third party keys are stored in moduledb object in the Platform
> KeyStore (PKS).
>
> Load third party code signing keys onto .secondary_trusted_keys keyring.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  certs/system_keyring.c                        | 30 +++++++++++++++++++
>  include/keys/system_keyring.h                 |  4 +++
>  .../platform_certs/keyring_handler.c          |  8 +++++
>  .../platform_certs/keyring_handler.h          |  5 ++++
>  .../integrity/platform_certs/load_powerpc.c   | 17 +++++++++++
>  5 files changed, 64 insertions(+)
>
> diff --git a/certs/system_keyring.c b/certs/system_keyring.c
> index b348e0898d34..33841c91f12c 100644
> --- a/certs/system_keyring.c
> +++ b/certs/system_keyring.c
> @@ -152,6 +152,36 @@ static __init struct key_restriction *get_builtin_an=
d_secondary_restriction(void
> =20
>  	return restriction;
>  }
> +
> +/**
> + * add_to_secondary_keyring - Add to secondary keyring.
> + * @source: Source of key
> + * @data: The blob holding the key
> + * @len: The length of the data blob
> + *
> + * Add a key to the secondary keyring. The key must be vouched for by a =
key in the builtin,
> + * machine or secondary keyring itself.
> + */
> +void __init add_to_secondary_keyring(const char *source, const void *dat=
a, size_t len)
> +{
> +	key_ref_t key;
> +	key_perm_t perm;
> +
> +	perm =3D (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW;
> +
> +	key =3D key_create_or_update(make_key_ref(secondary_trusted_keys, 1),
> +				   "asymmetric",
> +				   NULL, data, len, perm,
> +				   KEY_ALLOC_NOT_IN_QUOTA);
> +	if (IS_ERR(key)) {
> +		pr_err("Problem loading X.509 certificate from %s to secondary keyring=
 %ld\n",
> +		       source, PTR_ERR(key));
> +		return;
> +	}
> +
> +	pr_notice("Loaded X.509 cert '%s'\n", key_ref_to_ptr(key)->description)=
;
> +	key_ref_put(key);
> +}
>  #endif
>  #ifdef CONFIG_INTEGRITY_MACHINE_KEYRING
>  void __init set_machine_trusted_keys(struct key *keyring)
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.=
h
> index 7e2583208820..8365adf842ef 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -50,9 +50,13 @@ int restrict_link_by_digsig_builtin_and_secondary(stru=
ct key *keyring,
>  						  const struct key_type *type,
>  						  const union key_payload *payload,
>  						  struct key *restriction_key);
> +void __init add_to_secondary_keyring(const char *source, const void *dat=
a, size_t len);
>  #else
>  #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by_=
builtin_trusted
>  #define restrict_link_by_digsig_builtin_and_secondary restrict_link_by_d=
igsig_builtin
> +static inline void __init add_to_secondary_keyring(const char *source, c=
onst void *data, size_t len)
> +{
> +}
>  #endif
> =20
>  #ifdef CONFIG_INTEGRITY_MACHINE_KEYRING
> diff --git a/security/integrity/platform_certs/keyring_handler.c b/securi=
ty/integrity/platform_certs/keyring_handler.c
> index 586027b9a3f5..13ea17207902 100644
> --- a/security/integrity/platform_certs/keyring_handler.c
> +++ b/security/integrity/platform_certs/keyring_handler.c
> @@ -78,6 +78,14 @@ __init efi_element_handler_t get_handler_for_ca_keys(c=
onst efi_guid_t *sig_type)
>  	return NULL;
>  }
> =20
> +__init efi_element_handler_t get_handler_for_code_signing_keys(const efi=
_guid_t *sig_type)
> +{
> +	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) =3D=3D 0)
> +		return add_to_secondary_keyring;
> +
> +	return NULL;
> +}
> +
>  /*
>   * Return the appropriate handler for particular signature list types fo=
und in
>   * the UEFI dbx and MokListXRT tables.
> diff --git a/security/integrity/platform_certs/keyring_handler.h b/securi=
ty/integrity/platform_certs/keyring_handler.h
> index 6f15bb4cc8dc..f92895cc50f6 100644
> --- a/security/integrity/platform_certs/keyring_handler.h
> +++ b/security/integrity/platform_certs/keyring_handler.h
> @@ -34,6 +34,11 @@ efi_element_handler_t get_handler_for_mok(const efi_gu=
id_t *sig_type);
>   */
>  efi_element_handler_t get_handler_for_ca_keys(const efi_guid_t *sig_type=
);
> =20
> +/*
> + * Return the handler for particular signature list types for code signi=
ng keys.
> + */
> +efi_element_handler_t get_handler_for_code_signing_keys(const efi_guid_t=
 *sig_type);
> +
>  /*
>   * Return the handler for particular signature list types found in the d=
bx.
>   */
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/=
integrity/platform_certs/load_powerpc.c
> index 339053d9726d..c85febca3343 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -60,6 +60,7 @@ static int __init load_powerpc_certs(void)
>  {
>  	void *db =3D NULL, *dbx =3D NULL, *data =3D NULL;
>  	void *trustedca;
> +	void *moduledb;
>  	u64 dsize =3D 0;
>  	u64 offset =3D 0;
>  	int rc =3D 0;
> @@ -137,6 +138,22 @@ static int __init load_powerpc_certs(void)
>  		kfree(data);
>  	}
> =20
> +	data =3D get_cert_list("moduledb", 9,  &dsize);
> +	if (!data) {
> +		pr_info("Couldn't get moduledb list from firmware\n");
> +	} else if (IS_ERR(data)) {
> +		rc =3D PTR_ERR(data);
> +		pr_err("Error reading moduledb from firmware: %d\n", rc);
> +	} else {
> +		extract_esl(moduledb, data, dsize, offset);
> +
> +		rc =3D parse_efi_signature_list("powerpc:moduledb", moduledb, dsize,
> +					      get_handler_for_code_signing_keys);
> +		if (rc)
> +			pr_err("Couldn't parse moduledb signatures: %d\n", rc);
> +		kfree(data);
> +	}
> +
>  	return rc;
>  }
>  late_initcall(load_powerpc_certs);
> --=20
> 2.31.1

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I can pick this. My last PR did not went too great partly because of
mess with tpm_tis but now things are calmer.

BR, Jarkko
