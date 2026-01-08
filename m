Return-Path: <linuxppc-dev+bounces-15419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60541D0303C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 14:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn5Ln3h47z2yGq;
	Fri, 09 Jan 2026 00:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767878881;
	cv=none; b=GMIlI7zDtPLQ4F5E902UelHcCtDuoerV15rQNkxyXWrj+j7MUzkhdNDHDDo9m10FTheDurufo1FgiS4lec/LJFW89amhcxDviKh8R0pnsHVwfKvS1P1MjNwI1o3NeOpMSa4sZF7rPLVzHL6OJXAr9Z99bp0HtuxJRyU4E9zDHNW0sL6JKRoM0DZP5kixn4v/JJV9Prj1BkcAmdJyBj0fzDYjp6CafM3dPElgx3S1mxSIs4/uI1Vrr3PFD37GPWZzAsltZguKe6IO+RjWpXhGtEyOaack0peem2NsNw6P2RLt/BaxeoxWeVH/kVhrnaZRxXxL4z+g2o7oyEHXf230gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767878881; c=relaxed/relaxed;
	bh=kLymxGn1hnOGYUChZyHMdf3PvH3axcj/MEKCsdSrgN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yuk6dooFowIDBLzYseBb0BjWGZdcv6RFOpP1sBPOGxyC3xckzVIY0mrgLIkOFYLB/+6SteeT3O6FWc9mfJt+4NItHykN13YAHyYd4DcvuTmaM+pnqSjh7DIesERIoGyysAhfTpFQ/DAq0vUVqTTlwyBiyvLEl+xe7h58Lb+2MwqRYwbUt5/tB/Mseh0Zk+G/et2GI1dHRM0VYx3S86QY/BPRzlPQ5y/fxbriXXQy9u4oGd2Q8quTlARVR77CzyYxBEBYNf0f88/NQSdX8YKlX+Rcaa33bIo43SFvcnUah4VwmKYGDv6ydsyK0jqIQ1+3zfOivKCb5Tgrni20+sQcKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CH1+bSbA; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CH1+bSbA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn5Lm1jTDz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 00:28:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4B1160133;
	Thu,  8 Jan 2026 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5147C19421;
	Thu,  8 Jan 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767878877;
	bh=aZNd5ZfiO0jANMEUjjmztVseOVSusFwq/OISmXO7svU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CH1+bSbA5L8VA7mSCokBdbx0AQgkjkRqmlrahfX8ELEJ2ypQXmqMvcVRFwP7BZeA7
	 BSx1jwXQromcfmdUn8aCj7co5SIo6jWylGAll+D8/cqvoddu2YDx/42e4v3GQ3kfOz
	 +1PoWfVz+3t/HWc4puXWpPQCy6NYloGtTiCiECELj0Y0Hp+zjD/1J3iVbJxox5Ity6
	 QaQzo86aAYTUV/n2JZ6YOjcvzpmeH/Yfp1Gl7rASdzecJ/OYwGp/JWhgiT6oliOfkr
	 BlTlJ/L02ES4BbNGkIKJon53evIWuoF0ZuqgYoqF07gC76ayOx/8VUA7eTOYM4Hwv9
	 qpH7uZBqvoYSw==
Date: Thu, 8 Jan 2026 15:27:52 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	James.Bottomley@hansenpartnership.com, zohar@linux.ibm.com,
	nayna@linux.ibm.com, rnsastry@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v3 5/6] keys/trusted_keys: establish PKWM as a trusted
 source
Message-ID: <aV-w2NbxAPuuXy_U@kernel.org>
References: <20260106150527.446525-1-ssrish@linux.ibm.com>
 <20260106150527.446525-6-ssrish@linux.ibm.com>
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
In-Reply-To: <20260106150527.446525-6-ssrish@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 06, 2026 at 08:35:26PM +0530, Srish Srinivasan wrote:
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
>  MAINTAINERS                               |   9 ++
>  include/keys/trusted-type.h               |   7 +-
>  include/keys/trusted_pkwm.h               |  22 +++
>  security/keys/trusted-keys/Kconfig        |   8 ++
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_pkwm.c | 168 ++++++++++++++++++++++
>  7 files changed, 220 insertions(+), 2 deletions(-)
>  create mode 100644 include/keys/trusted_pkwm.h
>  create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648..ba51eff21a16 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14003,6 +14003,15 @@ S:	Supported
>  F:	include/keys/trusted_dcp.h
>  F:	security/keys/trusted-keys/trusted_dcp.c
>  
> +KEYS-TRUSTED-PLPKS
> +M:	Srish Srinivasan <ssrish@linux.ibm.com>
> +M:	Nayna Jain <nayna@linux.ibm.com>
> +L:	linux-integrity@vger.kernel.org
> +L:	keyrings@vger.kernel.org
> +S:	Supported
> +F:	include/keys/trusted_plpks.h
> +F:	security/keys/trusted-keys/trusted_pkwm.c
> +
>  KEYS-TRUSTED-TEE
>  M:	Sumit Garg <sumit.garg@kernel.org>
>  L:	linux-integrity@vger.kernel.org
> diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
> index 4eb64548a74f..45c6c538df22 100644
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
> +	uint16_t wrap_flags;
>  };

We should introduce:

	void *private;

And hold backend specific fields there.

This patch set does not necessarily have to migrate TPM fields to this
new framework, only start a better convention before this turns into
a chaos.

BR, Jarkko

