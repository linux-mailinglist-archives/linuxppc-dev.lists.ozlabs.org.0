Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0488E930
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:35:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nPlsBFY2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4W2N43yCz3w4p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:35:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nPlsBFY2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vz53mtSz3vqW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:32:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27D52CE26F2;
	Wed, 27 Mar 2024 15:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE57C433F1;
	Wed, 27 Mar 2024 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711553534;
	bh=fEZXobeh9Qm14atTzQRk5gNLt2hyN44gGXIHb89n/fM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nPlsBFY2n75dYGZ/PvNEhdIEQboMUhNLh40mqEb8TvuGyF35dXMgWppBhFyu+DaZU
	 ylw13U+FHygPCroJKf5ogRik2RJXXAo6BzC4xMkd+eL3TtykJGJcpSxIYOrd5JfZ4Y
	 8Y8qHCxPgrh0+z9Y0+fExYRjsYz/5+6qM/onpALTNfCcda32LPapgP982blQpcPUJ0
	 PESC9mSpaIt5UG2W2WsmRS5QvWWmQTovnQStsAcTe1rNhr773paC376WrEOpH6fUEs
	 tCWOo6vvAF042rg+UD6uUfR/JDE+OECQGmYLPoM8ewWd3eaNvPhrUprFH/PwIELqFV
	 toaX7mq5W0yjA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Mar 2024 17:32:06 +0200
Message-Id: <D04N3769KDZ2.3SYZTF7EJ68MG@kernel.org>
Subject: Re: [PATCH v7 5/6] docs: document DCP-backed trusted keys kernel
 params
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240327082454.13729-1-david@sigma-star.at>
 <20240327082454.13729-6-david@sigma-star.at>
In-Reply-To: <20240327082454.13729-6-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Mar 27, 2024 at 10:24 AM EET, David Gstir wrote:
> Document the kernel parameters trusted.dcp_use_otp_key
> and trusted.dcp_skip_zk_test for DCP-backed trusted keys.
>
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 24c02c704049..b6944e57768a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6698,6 +6698,7 @@
>  			- "tpm"
>  			- "tee"
>  			- "caam"
> +			- "dcp"
>  			If not specified then it defaults to iterating through
>  			the trust source list starting with TPM and assigns the
>  			first trust source as a backend which is initialized
> @@ -6713,6 +6714,18 @@
>  			If not specified, "default" is used. In this case,
>  			the RNG's choice is left to each individual trust source.
> =20
> +	trusted.dcp_use_otp_key
> +			This is intended to be used in combination with
> +			trusted.source=3Ddcp and will select the DCP OTP key
> +			instead of the DCP UNIQUE key blob encryption.
> +
> +	trusted.dcp_skip_zk_test
> +			This is intended to be used in combination with
> +			trusted.source=3Ddcp and will disable the check if all
> +			the blob key is zero'ed. This is helpful for situations where
> +			having this key zero'ed is acceptable. E.g. in testing
> +			scenarios.
> +
>  	tsc=3D		Disable clocksource stability checks for TSC.
>  			Format: <string>
>  			[x86] reliable: mark tsc clocksource as reliable, this

Nicely documented, i.e. even I can understand what is said here :-)

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
