Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2188E92C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:34:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RTuEzTHR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4W1b3cRFz3w3y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:34:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RTuEzTHR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VxC22r8z3vwC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:30:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC2AECE26FA;
	Wed, 27 Mar 2024 15:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79D6C43390;
	Wed, 27 Mar 2024 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711553437;
	bh=5lCcbaEaSY7dHdLxssGWY/edPLmaKRsRypjga0DHgRQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=RTuEzTHRdnapeyHjFoSR9jpteDd+sibEeJ/TWAKFfDzLI0TGODFCO0FYHFmGf5jXd
	 gJP06SupWUPkeX9f2NqvMFnh/5pF5WdSBz02QBFMBOsChwWBKpQeAwghpwvPjTKcNx
	 qX7yFkfnKOzbrqD88EI9ZwWbLB44onO1bS2aW8XU5ovW1eC20mdyXhQxVVw+WO1hw4
	 8KsfaqtigS4ksoNpvDRc/bTF9/ZZq86lRjq+cesllGxvGyEwMYZkdioWBuVj6b9BZR
	 yPmwzaC1F2nJzklX2JxaGzDF/qlDtVpd9AKHkWUzM9sCIkzPEsKSRUOHiLD9veqwUu
	 7/DoYQC0k8Q5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Mar 2024 17:30:28 +0200
Message-Id: <D04N1YLIAJQT.1WM3WVEU7R60G@kernel.org>
Subject: Re: [PATCH v7 2/6] KEYS: trusted: improve scalability of trust
 source config
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240327082454.13729-1-david@sigma-star.at>
 <20240327082454.13729-3-david@sigma-star.at>
In-Reply-To: <20240327082454.13729-3-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Mar 27, 2024 at 10:24 AM EET, David Gstir wrote:
> Enabling trusted keys requires at least one trust source implementation
> (currently TPM, TEE or CAAM) to be enabled. Currently, this is
> done by checking each trust source's config option individually.
> This does not scale when more trust sources like the one for DCP
> are added, because the condition will get long and hard to read.
>
> Add config HAVE_TRUSTED_KEYS which is set to true by each trust source
> once its enabled and adapt the check for having at least one active trust
> source to use this option. Whenever a new trust source is added, it now
> needs to select HAVE_TRUSTED_KEYS.
>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  security/keys/trusted-keys/Kconfig | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-k=
eys/Kconfig
> index dbfdd8536468..553dc117f385 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -1,3 +1,6 @@
> +config HAVE_TRUSTED_KEYS
> +	bool
> +
>  config TRUSTED_KEYS_TPM
>  	bool "TPM-based trusted keys"
>  	depends on TCG_TPM >=3D TRUSTED_KEYS
> @@ -9,6 +12,7 @@ config TRUSTED_KEYS_TPM
>  	select ASN1_ENCODER
>  	select OID_REGISTRY
>  	select ASN1
> +	select HAVE_TRUSTED_KEYS
>  	help
>  	  Enable use of the Trusted Platform Module (TPM) as trusted key
>  	  backend. Trusted keys are random number symmetric keys,
> @@ -20,6 +24,7 @@ config TRUSTED_KEYS_TEE
>  	bool "TEE-based trusted keys"
>  	depends on TEE >=3D TRUSTED_KEYS
>  	default y
> +	select HAVE_TRUSTED_KEYS
>  	help
>  	  Enable use of the Trusted Execution Environment (TEE) as trusted
>  	  key backend.
> @@ -29,10 +34,11 @@ config TRUSTED_KEYS_CAAM
>  	depends on CRYPTO_DEV_FSL_CAAM_JR >=3D TRUSTED_KEYS
>  	select CRYPTO_DEV_FSL_CAAM_BLOB_GEN
>  	default y
> +	select HAVE_TRUSTED_KEYS
>  	help
>  	  Enable use of NXP's Cryptographic Accelerator and Assurance Module
>  	  (CAAM) as trusted key backend.
> =20
> -if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE && !TRUSTED_KEYS_CAAM
> -comment "No trust source selected!"
> +if !HAVE_TRUSTED_KEYS
> +	comment "No trust source selected!"
>  endif

Tested-by: Jarkko Sakkinen <jarkko@kernel.org> # for TRUSTED_KEYS_TPM
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
