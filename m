Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7787105B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:49:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ip0RjyIj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYlq01gxz3dLQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ip0RjyIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpYl635xCz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:48:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46DCACE1780;
	Mon,  4 Mar 2024 22:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638ADC433C7;
	Mon,  4 Mar 2024 22:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709592511;
	bh=hjE6OxUTFHBTTEz1ASl4W0QebwmdYPeQryt4Ps2i3NQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ip0RjyIjHfhNyYSpPWGt+Yytbdw2gnNRsCywVX7OcVJnWySUJURfB6ik+xwZNqcSh
	 iI6rDJM1dBXkFmGVCfUIvnQTElzgdVM+t74eMg2/wmv8Y/MIZ/wlVQhoW/IM4iH5iO
	 wxEx4DENeF5UO+FpHK5ngyRSeXnAXXfgwVdd5nbRlfrNpp24vFloZZ8dV1hHt6C9eF
	 ZsKyEm9IHHyFLwvuAg4d8xfqB3nfsSzxZ+PbtdiQREX394Cpzf5o2EXwl3jTvX5Gdg
	 TEXWFFZZel9aJbd3QSH8gl+M8tQJ1Y3smFVs7cU49HpSXr8Lt60dDeu0xVKhBbfupS
	 AdsIROYBS7M/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 00:48:23 +0200
Message-Id: <CZLBYPUU992Q.2PRCZBFNZYWY6@suppilovahvero>
Subject: Re: [PATCH v5 4/6] MAINTAINERS: add entry for DCP-based trusted
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-5-david@sigma-star.at>
In-Reply-To: <20231215110639.45522-5-david@sigma-star.at>
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

On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
> This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
> found in smaller i.MX SoCs.
>
> Signed-off-by: David Gstir <david@sigma-star.at>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..988d01226131 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11647,6 +11647,15 @@ S:	Maintained
>  F:	include/keys/trusted_caam.h
>  F:	security/keys/trusted-keys/trusted_caam.c
> =20
> +KEYS-TRUSTED-DCP
> +M:	David Gstir <david@sigma-star.at>
> +R:	sigma star Kernel Team <upstream+dcp@sigma-star.at>
> +L:	linux-integrity@vger.kernel.org
> +L:	keyrings@vger.kernel.org
> +S:	Supported
> +F:	include/keys/trusted_dcp.h
> +F:	security/keys/trusted-keys/trusted_dcp.c
> +
>  KEYS-TRUSTED-TEE
>  M:	Sumit Garg <sumit.garg@linaro.org>
>  L:	linux-integrity@vger.kernel.org

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

I can for sure put this. The code quality is *not* bad :-) However, your
backing story really needs rework. It is otherwise impossible to
understand the code changes later on because amount of information is
vast, and you tend to forget details of stuff that you are not actively
working on. That is why we care so deeply about them.

BR, Jarkko
