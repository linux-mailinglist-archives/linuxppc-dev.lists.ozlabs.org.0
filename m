Return-Path: <linuxppc-dev+bounces-16052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BCED3BB9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 00:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw5rk4RpHz2xpk;
	Tue, 20 Jan 2026 10:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768864486;
	cv=none; b=YCm+IxgZ0b4SbId/4ExFitAwb2VEWlmnQramZ/V5HuGmNCgAzcNb+Dh6wHFY5izNGba4RuzGnlP7O2yy5MG1YRLBD/1l0eQNYHSxVFg0Amq7k3LJelgopBNvxqt61Yn/bRLS51SDKQ+yGtXBCNsu1mnJaqwUZEZBy9cXH+R0MwmRY7TOYln/s8W+g6nNYYtYd9WhoQb0GpzaD9YAIQnlMPp14wS/6PoyN0SzArVbXqsVRR+0pCM9csanmtuhF1H7Ri59NTjLyh5+5/gyWR/0fBneO0aIzhrvwOx4HokBwNUjp7EhV6VviXX8CHe33V1nqu/e8YKHg3H/Dpa2YbDdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768864486; c=relaxed/relaxed;
	bh=gEqcPQ4mtGaLC8UfFwDWJrSFTDPrDT8XXDAcq21H8Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXERPWx/YUs4tjbd5fEP3oRSg/CLG3Ds0YX6D/c4nddokSYvuqx4bRdUDtxOaTniAg5mYCYjXOKIwdlzwMTvtDm7sDzEC/pFE+8eiW11kIB0xKQi6rzJIV4cbl0HGSTgTN0YR4pRBMQgbUHo7R4ny2tPR1PBEX4oAYRAsK1d3fsEmWKvCXSAPB0nkCMcS9vr31RaTCHen95nN9DStcdYK0GHM79W+fQbdCdKzVTWz5dcBpDT5y+IWi8h9G4UQcYljgDBjcrDnP94AYVLGE6QxoubBAE0We10QggLznRN1Kq6dV/okW1fzmscee3WE74uyurqDGI+Kg/MgRouMRxYOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RYye7BJ5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RYye7BJ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw5rj5Wxqz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 10:14:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78D36600CB;
	Mon, 19 Jan 2026 23:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BBCC116C6;
	Mon, 19 Jan 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768864483;
	bh=B0RnHYgliM3UDg4G4RKMHcZtze9PbAuj8QZ7UfX+upA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYye7BJ55Wc0+ly+G5fSi0/TRrqWy7YzKziAEUBdWv8aHmBC32+c62cddwjrjdGtV
	 m52o2VcZx2a3PoZeFvR6q7Rg8l0no1/QT7kM/v36GODhyOjzj/da3HqMLSmB6GMRA8
	 iFDSsP8lZYG/1uAENEPlzwgnbTmNLR3xYw/orIZVwvBT3HA581iTg8+YPXYnj/aPp8
	 fv2XbbtQy9ceAR9iTPjN4WjZm5M+7uzLoY1Pz4RmtxEPkQQPK3HTrb3iY8aoZSp1he
	 YIkGHiZSYvZnMYQJrZb/5KE8YCkUDGmYv0a065bcEsByNnSWrWpio9iBlTZ8QoDQwA
	 bUGzVbpq7+0Rg==
Date: Tue, 20 Jan 2026 01:14:38 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	James.Bottomley@hansenpartnership.com, zohar@linux.ibm.com,
	nayna@linux.ibm.com, rnsastry@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v4 5/6] keys/trusted_keys: establish PKWM as a trusted
 source
Message-ID: <aW663paEk9Cd8eUn@kernel.org>
References: <20260115100504.488665-1-ssrish@linux.ibm.com>
 <20260115100504.488665-6-ssrish@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115100504.488665-6-ssrish@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 03:35:03PM +0530, Srish Srinivasan wrote:
> The wrapping key does not exist by default and is generated by the
> hypervisor as a part of PKWM initialization. This key is then persisted by
> the hypervisor and is used to wrap trusted keys. These are variable length
> symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) are
> generated using the kernel RNG. PKWM can be used as a trust source through
> the following example keyctl commands:
> 
> keyctl add trusted my_trusted_key "new 32" @u
> 
> Use the wrap_flags command option to set the secure boot requirement for
> the wrapping request through the following keyctl commands
> 
> case1: no secure boot requirement. (default)
> keyctl usage: keyctl add trusted my_trusted_key "new 32" @u
> 	      OR
> 	      keyctl add trusted my_trusted_key "new 32 wrap_flags=0x00" @u
> 
> case2: secure boot required to in either audit or enforce mode. set bit 0
> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x01" @u
> 
> case3: secure boot required to be in enforce mode. set bit 1
> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x02" @u
> 
> NOTE:
> -> Setting the secure boot requirement is NOT a must.
> -> Only either of the secure boot requirement options should be set. Not
> both.
> -> All the other bits are required to be not set.
> -> Set the kernel parameter trusted.source=pkwm to choose PKWM as the
> backend for trusted keys implementation.
> -> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.
> 
> Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
> KeyStore, as a new trust source for trusted keys.
> 
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  This version introduces a private pointer for backend specific fields and
>  related changes specific to the PKWM backend, but defers migrating the TPM
>  fields to this new framework. That will be done independently of this
>  patch series.
>  MAINTAINERS                               |   9 +
>  include/keys/trusted-type.h               |   7 +-
>  include/keys/trusted_pkwm.h               |  33 ++++
>  security/keys/trusted-keys/Kconfig        |   8 +
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_pkwm.c | 190 ++++++++++++++++++++++
>  7 files changed, 253 insertions(+), 2 deletions(-)
>  create mode 100644 include/keys/trusted_pkwm.h
>  create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf755238c429..c98f1811f836 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14008,6 +14008,15 @@ S:	Supported
>  F:	include/keys/trusted_dcp.h
>  F:	security/keys/trusted-keys/trusted_dcp.c
>  
> +KEYS-TRUSTED-PLPKS
> +M:	Srish Srinivasan <ssrish@linux.ibm.com>
> +M:	Nayna Jain <nayna@linux.ibm.com>
> +L:	linux-integrity@vger.kernel.org
> +L:	keyrings@vger.kernel.org
> +S:	Supported
> +F:	include/keys/trusted_pkwm.h
> +F:	security/keys/trusted-keys/trusted_pkwm.c
> +
>  KEYS-TRUSTED-TEE
>  M:	Sumit Garg <sumit.garg@kernel.org>
>  L:	linux-integrity@vger.kernel.org
> diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
> index 4eb64548a74f..03527162613f 100644
> --- a/include/keys/trusted-type.h
> +++ b/include/keys/trusted-type.h
> @@ -19,7 +19,11 @@
>  
>  #define MIN_KEY_SIZE			32
>  #define MAX_KEY_SIZE			128
> -#define MAX_BLOB_SIZE			512
> +#if IS_ENABLED(CONFIG_TRUSTED_KEYS_PKWM)
> +#define MAX_BLOB_SIZE			1152
> +#else
> +#define MAX_BLOB_SIZE                   512
> +#endif
>  #define MAX_PCRINFO_SIZE		64
>  #define MAX_DIGEST_SIZE			64
>  
> @@ -46,6 +50,7 @@ struct trusted_key_options {
>  	uint32_t policydigest_len;
>  	unsigned char policydigest[MAX_DIGEST_SIZE];
>  	uint32_t policyhandle;
> +	void *private;
>  };


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

>  
>  struct trusted_key_ops {
> diff --git a/include/keys/trusted_pkwm.h b/include/keys/trusted_pkwm.h
> new file mode 100644
> index 000000000000..4035b9776394
> --- /dev/null
> +++ b/include/keys/trusted_pkwm.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PKWM_TRUSTED_KEY_H
> +#define __PKWM_TRUSTED_KEY_H
> +
> +#include <keys/trusted-type.h>
> +#include <linux/bitops.h>
> +#include <linux/printk.h>
> +
> +extern struct trusted_key_ops pkwm_trusted_key_ops;
> +
> +struct trusted_pkwm_options {
> +	u16 wrap_flags;
> +};
> +
> +static inline void dump_options(struct trusted_key_options *o)
> +{
> +	const struct trusted_pkwm_options *pkwm;
> +	bool sb_audit_or_enforce_bit;
> +	bool sb_enforce_bit;
> +
> +	pkwm = o->private;
> +	sb_audit_or_enforce_bit = pkwm->wrap_flags & BIT(0);
> +	sb_enforce_bit = pkwm->wrap_flags & BIT(1);
> +
> +	if (sb_audit_or_enforce_bit)
> +		pr_debug("secure boot mode required: audit or enforce");
> +	else if (sb_enforce_bit)
> +		pr_debug("secure boot mode required: enforce");
> +	else
> +		pr_debug("secure boot mode required: disabled");
> +}
> +
> +#endif
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
> index 204a68c1429d..9e00482d886a 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -46,6 +46,14 @@ config TRUSTED_KEYS_DCP
>  	help
>  	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
>  
> +config TRUSTED_KEYS_PKWM
> +	bool "PKWM-based trusted keys"
> +	depends on PSERIES_PLPKS >= TRUSTED_KEYS
> +	default y
> +	select HAVE_TRUSTED_KEYS
> +	help
> +	  Enable use of IBM PowerVM Key Wrapping Module (PKWM) as a trusted key backend.
> +
>  if !HAVE_TRUSTED_KEYS
>  	comment "No trust source selected!"
>  endif
> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
> index f0f3b27f688b..5fc053a21dad 100644
> --- a/security/keys/trusted-keys/Makefile
> +++ b/security/keys/trusted-keys/Makefile
> @@ -16,3 +16,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TEE) += trusted_tee.o
>  trusted-$(CONFIG_TRUSTED_KEYS_CAAM) += trusted_caam.o
>  
>  trusted-$(CONFIG_TRUSTED_KEYS_DCP) += trusted_dcp.o
> +
> +trusted-$(CONFIG_TRUSTED_KEYS_PKWM) += trusted_pkwm.o
> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
> index b1680ee53f86..2d328de170e8 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -12,6 +12,7 @@
>  #include <keys/trusted_caam.h>
>  #include <keys/trusted_dcp.h>
>  #include <keys/trusted_tpm.h>
> +#include <keys/trusted_pkwm.h>
>  #include <linux/capability.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -31,7 +32,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
>  
>  static char *trusted_key_source;
>  module_param_named(source, trusted_key_source, charp, 0);
> -MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or dcp)");
> +MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam, dcp or pkwm)");
>  
>  static const struct trusted_key_source trusted_key_sources[] = {
>  #if defined(CONFIG_TRUSTED_KEYS_TPM)
> @@ -46,6 +47,9 @@ static const struct trusted_key_source trusted_key_sources[] = {
>  #if defined(CONFIG_TRUSTED_KEYS_DCP)
>  	{ "dcp", &dcp_trusted_key_ops },
>  #endif
> +#if defined(CONFIG_TRUSTED_KEYS_PKWM)
> +	{ "pkwm", &pkwm_trusted_key_ops },
> +#endif
>  };
>  
>  DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
> diff --git a/security/keys/trusted-keys/trusted_pkwm.c b/security/keys/trusted-keys/trusted_pkwm.c
> new file mode 100644
> index 000000000000..4f391b77a907
> --- /dev/null
> +++ b/security/keys/trusted-keys/trusted_pkwm.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 IBM Corporation, Srish Srinivasan <ssrish@linux.ibm.com>
> + */
> +
> +#include <keys/trusted_pkwm.h>
> +#include <keys/trusted-type.h>
> +#include <linux/build_bug.h>
> +#include <linux/key-type.h>
> +#include <linux/parser.h>
> +#include <asm/plpks.h>
> +
> +enum {
> +	Opt_err,
> +	Opt_wrap_flags,
> +};
> +
> +static const match_table_t key_tokens = {
> +	{Opt_wrap_flags, "wrap_flags=%s"},
> +	{Opt_err, NULL}
> +};
> +
> +static int getoptions(char *datablob, struct trusted_key_options *opt)
> +{
> +	substring_t args[MAX_OPT_ARGS];
> +	char *p = datablob;
> +	int token;
> +	int res;
> +	u16 wrap_flags;
> +	unsigned long token_mask = 0;
> +	struct trusted_pkwm_options *pkwm;
> +
> +	if (!datablob)
> +		return 0;
> +
> +	pkwm = opt->private;
> +
> +	while ((p = strsep(&datablob, " \t"))) {
> +		if (*p == '\0' || *p == ' ' || *p == '\t')
> +			continue;
> +
> +		token = match_token(p, key_tokens, args);
> +		if (test_and_set_bit(token, &token_mask))
> +			return -EINVAL;
> +
> +		switch (token) {
> +		case Opt_wrap_flags:
> +			res = kstrtou16(args[0].from, 16, &wrap_flags);
> +			if (res < 0 || wrap_flags > 2)
> +				return -EINVAL;
> +			pkwm->wrap_flags = wrap_flags;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static struct trusted_key_options *trusted_options_alloc(void)
> +{
> +	struct trusted_key_options *options;
> +	struct trusted_pkwm_options *pkwm;
> +
> +	options = kzalloc(sizeof(*options), GFP_KERNEL);
> +
> +	if (options) {
> +		pkwm = kzalloc(sizeof(*pkwm), GFP_KERNEL);
> +
> +		if (!pkwm) {
> +			kfree_sensitive(options);
> +			options = NULL;
> +		} else {
> +			options->private = pkwm;
> +		}
> +	}
> +
> +	return options;
> +}
> +
> +static int trusted_pkwm_seal(struct trusted_key_payload *p, char *datablob)
> +{
> +	struct trusted_key_options *options = NULL;
> +	struct trusted_pkwm_options *pkwm = NULL;
> +	u8 *input_buf, *output_buf;
> +	u32 output_len, input_len;
> +	int rc;
> +
> +	options = trusted_options_alloc();
> +
> +	if (!options)
> +		return -ENOMEM;
> +
> +	rc = getoptions(datablob, options);
> +	if (rc < 0)
> +		goto out;
> +	dump_options(options);
> +
> +	input_len = p->key_len;
> +	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
> +	if (!input_buf) {
> +		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	memcpy(input_buf, p->key, p->key_len);
> +
> +	pkwm = options->private;
> +
> +	rc = plpks_wrap_object(&input_buf, input_len, pkwm->wrap_flags,
> +			       &output_buf, &output_len);
> +	if (!rc) {
> +		memcpy(p->blob, output_buf, output_len);
> +		p->blob_len = output_len;
> +		dump_payload(p);
> +	} else {
> +		pr_err("Wrapping of payload key failed: %d\n", rc);
> +	}
> +
> +	kfree(input_buf);
> +	kfree(output_buf);
> +
> +out:
> +	kfree_sensitive(options->private);
> +	kfree_sensitive(options);
> +	return rc;
> +}
> +
> +static int trusted_pkwm_unseal(struct trusted_key_payload *p, char *datablob)
> +{
> +	u8 *input_buf, *output_buf;
> +	u32 input_len, output_len;
> +	int rc;
> +
> +	input_len = p->blob_len;
> +	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
> +	if (!input_buf) {
> +		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(input_buf, p->blob, p->blob_len);
> +
> +	rc = plpks_unwrap_object(&input_buf, input_len, &output_buf,
> +				 &output_len);
> +	if (!rc) {
> +		memcpy(p->key, output_buf, output_len);
> +		p->key_len = output_len;
> +		dump_payload(p);
> +	} else {
> +		pr_err("Unwrapping of payload failed: %d\n", rc);
> +	}
> +
> +	kfree(input_buf);
> +	kfree(output_buf);
> +
> +	return rc;
> +}
> +
> +static int trusted_pkwm_init(void)
> +{
> +	int ret;
> +
> +	if (!plpks_wrapping_is_supported()) {
> +		pr_err("H_PKS_WRAP_OBJECT interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = plpks_gen_wrapping_key();
> +	if (ret) {
> +		pr_err("Failed to generate default wrapping key\n");
> +		return -EINVAL;
> +	}
> +
> +	return register_key_type(&key_type_trusted);
> +}
> +
> +static void trusted_pkwm_exit(void)
> +{
> +	unregister_key_type(&key_type_trusted);
> +}
> +
> +struct trusted_key_ops pkwm_trusted_key_ops = {
> +	.migratable = 0, /* non-migratable */
> +	.init = trusted_pkwm_init,
> +	.seal = trusted_pkwm_seal,
> +	.unseal = trusted_pkwm_unseal,
> +	.exit = trusted_pkwm_exit,
> +};
> -- 
> 2.47.3
> 

BR, Jarkko

