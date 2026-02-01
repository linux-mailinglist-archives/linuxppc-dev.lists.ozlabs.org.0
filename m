Return-Path: <linuxppc-dev+bounces-16501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JxAB77Tf2mjyAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 23:29:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353FC766F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 23:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f44D85D3Pz2yrl;
	Mon, 02 Feb 2026 09:29:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769984952;
	cv=none; b=ghQRUrDUOJnk9Iew/7vyeZ1xQjkoS+ysgQuOp+yB7789FQ2KRebvz+APU59EtcWwR+pG4yfmVfAcqZe5kMsKpt3GnB0XPFYhjigAzJav5BNqcz39I3Za8qc7qtOqNNFl5cVeR0aFrmovK5Cp7KbMj7X0xgB3mLC3Vx0lX/DaIQlg7Iyv4EC5Yyf1EbtOdlxjbxSELvobyN2LiY+sbUiKIWpDqUYGWy8oZZ76k01mA+n+Bf/gJK4XaPgsaTQrEVMyPiLoNN1DzQAH94mBgEQbsFzMRdOVnFIfIsTv8+uz9q/8gwaig/xPyjpepHZTwYLSrKewjz/5kGhPLNztrnA62g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769984952; c=relaxed/relaxed;
	bh=Z9B0iwRdcfSMyYw2xUFYbLThRCzv45G5fYlmY7N08Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBYb8DWpFOws53ljamWgo10QRLfdeq6EQ9+YeDFUorz5Og78PQ2c+euOGo+cICKPhjUE8G/BJk/qbtIF7H0t0B3TPHDQRttelae0UmtBg4SoZEeHU8yJbFrEfwq5NBT30zejdcE28mCKxKMcyf6XglZ5jwZpLtjmZ6lorHSFwgpJfRfKRCswkUu6+fLVXI174NIjdhfRmVDO4zPyVX498BVTyuTWEOqKqZCYafcNibEBtutkgpogbZbxIOGvMY2wzaQdxJ8GEx1qA+1m6KC6w5FsfwS9APj9w4XsTp+4rIn9mW+L6B0vCn3/rCOJqu1s5UHWeBOmEBfA77YVW/w6nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YGPdnvNo; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YGPdnvNo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f44D70yJWz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 09:29:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 205F760008;
	Sun,  1 Feb 2026 22:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730B0C4CEF7;
	Sun,  1 Feb 2026 22:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769984947;
	bh=DxXTUd2sVNIlf9nm0i+s4NtR8Hl+nkM+Cwtr/R7+iTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGPdnvNokhVj+bbB6U2HTakzEQs77Eyc+70jNzgOcQSCdfQqtZVP2S13HH2JdSqvI
	 iiJ1Y0MHxXi9fkxF1/sxXDH8OFXKQ9hIgGY+/T+AzAg2cSqD9g/Id231r+pE3GgolW
	 oFBdb8DbL7XwUR5wpCundArK6kJ7sPkYNHhLvCrN9Bktw2ilWGCCe2gnbrDF4ioVGW
	 7jjGdJgaanmc7+qN7t20BJs9TMTFY57dFq9FqN39kf6UAZsUc6xJRMxJXvFBr3IbQa
	 kUO+0nawWrDdPzjg9Qu+zn49Bvg6iM5P9jbOOvi0vbHIFcZtM0xst3mPnDyM+KHCkY
	 dk1PHcxOZWEsg==
Date: Mon, 2 Feb 2026 00:29:04 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	James.Bottomley@hansenpartnership.com, zohar@linux.ibm.com,
	nayna@linux.ibm.com, rnsastry@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v6 6/6] docs: trusted-encryped: add PKWM as a new trust
 source
Message-ID: <aX_TsBNTMvvsM_bt@kernel.org>
References: <20260201135930.898721-1-ssrish@linux.ibm.com>
 <20260201135930.898721-7-ssrish@linux.ibm.com>
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
In-Reply-To: <20260201135930.898721-7-ssrish@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16501-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jarkko@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,hansenpartnership.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:ssrish@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@hansenpartnership.com,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9353FC766F
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 07:29:30PM +0530, Srish Srinivasan wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
> 
> Update Documentation/security/keys/trusted-encrypted.rst and Documentation/
> admin-guide/kernel-parameters.txt with PowerVM Key Wrapping Module (PKWM)
> as a new trust source
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

And you are free to take 5/6 and 6/6 to a pull request if you prefer
that route.

> ---
>  .../admin-guide/kernel-parameters.txt         |  1 +
>  .../security/keys/trusted-encrypted.rst       | 50 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1058f2a6d6a8..aac15079b33d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7790,6 +7790,7 @@ Kernel parameters
>  			- "tee"
>  			- "caam"
>  			- "dcp"
> +			- "pkwm"
>  			If not specified then it defaults to iterating through
>  			the trust source list starting with TPM and assigns the
>  			first trust source as a backend which is initialized
> diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
> index eae6a36b1c9a..ddff7c7c2582 100644
> --- a/Documentation/security/keys/trusted-encrypted.rst
> +++ b/Documentation/security/keys/trusted-encrypted.rst
> @@ -81,6 +81,14 @@ safe.
>           and the UNIQUE key. Default is to use the UNIQUE key, but selecting
>           the OTP key can be done via a module parameter (dcp_use_otp_key).
>  
> +     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
> +
> +         Rooted to a unique, per-LPAR key, which is derived from a system-wide,
> +         randomly generated LPAR root key. Both the per-LPAR keys and the LPAR
> +         root key are stored in hypervisor-owned secure memory at runtime,
> +         and the LPAR root key is additionally persisted in secure locations
> +         such as the processor SEEPROMs and encrypted NVRAM.
> +
>    *  Execution isolation
>  
>       (1) TPM
> @@ -102,6 +110,14 @@ safe.
>           environment. Only basic blob key encryption is executed there.
>           The actual key sealing/unsealing is done on main processor/kernel space.
>  
> +     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
> +
> +         Fixed set of cryptographic operations done on on-chip hardware
> +         cryptographic acceleration unit NX. Keys for wrapping and unwrapping
> +         are managed by PowerVM Platform KeyStore, which stores keys in an
> +         isolated in-memory copy in secure hypervisor memory, as well as in a
> +         persistent copy in hypervisor-encrypted NVRAM.
> +
>    * Optional binding to platform integrity state
>  
>       (1) TPM
> @@ -129,6 +145,11 @@ safe.
>           Relies on Secure/Trusted boot process (called HAB by vendor) for
>           platform integrity.
>  
> +     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
> +
> +         Relies on secure and trusted boot process of IBM Power systems for
> +         platform integrity.
> +
>    *  Interfaces and APIs
>  
>       (1) TPM
> @@ -149,6 +170,11 @@ safe.
>           Vendor-specific API that is implemented as part of the DCP crypto driver in
>           ``drivers/crypto/mxs-dcp.c``.
>  
> +     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
> +
> +         Platform Keystore has well documented interfaces in PAPR document.
> +         Refer to ``Documentation/arch/powerpc/papr_hcalls.rst``
> +
>    *  Threat model
>  
>       The strength and appropriateness of a particular trust source for a given
> @@ -191,6 +217,10 @@ selected trust source:
>       a dedicated hardware RNG that is independent from DCP which can be enabled
>       to back the kernel RNG.
>  
> +   * PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
> +
> +     The normal kernel random number generator is used to generate keys.
> +
>  Users may override this by specifying ``trusted.rng=kernel`` on the kernel
>  command-line to override the used RNG with the kernel's random number pool.
>  
> @@ -321,6 +351,26 @@ Usage::
>  specific to this DCP key-blob implementation.  The key length for new keys is
>  always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
>  
> +Trusted Keys usage: PKWM
> +------------------------
> +
> +Usage::
> +
> +    keyctl add trusted name "new keylen [options]" ring
> +    keyctl add trusted name "load hex_blob" ring
> +    keyctl print keyid
> +
> +    options:
> +       wrap_flags=   ascii hex value of security policy requirement
> +                       0x00: no secure boot requirement (default)
> +                       0x01: require secure boot to be in either audit or
> +                             enforced mode
> +                       0x02: require secure boot to be in enforced mode
> +
> +"keyctl print" returns an ASCII hex copy of the sealed key, which is in format
> +specific to PKWM key-blob implementation.  The key length for new keys is
> +always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
> +
>  Encrypted Keys usage
>  --------------------
>  
> -- 
> 2.47.3
> 

BR, Jarkko

