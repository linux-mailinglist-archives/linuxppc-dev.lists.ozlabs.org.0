Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE887894B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 21:08:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qpKTJnaU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttnrr6bQNz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 07:08:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qpKTJnaU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttnr40QlSz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 07:07:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 059FCCE126B;
	Mon, 11 Mar 2024 20:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBBCC433F1;
	Mon, 11 Mar 2024 20:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710187648;
	bh=WBtBCCMn2JMwUS5VVGHL+yTt7qkPpG1ZJQA8yWr+M5w=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qpKTJnaURjnr9qyMxxS06UflehxFUN6v0OqYQKl6DqRi1nweRVVV/ivK1D5TMqyUe
	 Go3Ar0AuaK6I7kVk1CdNT9w1bSz26h92HPVVGtPkpGcCqw3VXKlZSK1lxVU3tFP1hu
	 CBoQTBN7JDL2FRIWrHHc8Gu09GGXq5pYvbFPRFJBNc3GXeL54y441hKHV+TmCLqTo+
	 ViEDNTStK3tlBuz3EG/eoeOvj52RkgMZD13LEiA/dOCeFD8J3qagtJUO2vFm6a2XWp
	 ZugulwiUUCbthW5vQ8oE9hwGR+oRtQY9o46qnBscOszPbc5RGMAMEMqkv54kJKxdHs
	 17b+JtrrT6lWg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Mar 2024 22:07:19 +0200
Message-Id: <CZR6X7KLX6NC.1BH2NHDTNL3C@kernel.org>
Subject: Re: [PATCH v6 3/6] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>
X-Mailer: aerc 0.17.0
References: <20240307153842.80033-1-david@sigma-star.at>
 <20240307153842.80033-4-david@sigma-star.at>
 <CZNRMR5YZPQO.1QBLW62A6S840@kernel.org>
 <655221B7-634C-4493-A781-CF014DFFC8BF@sigma-star.at>
In-Reply-To: <655221B7-634C-4493-A781-CF014DFFC8BF@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan
 Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James
 Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li
 Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 8, 2024 at 9:17 AM EET, David Gstir wrote:
> Hi Jarkko,
>
> > On 07.03.2024, at 20:30, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> [...]
>
> >> +
> >> +static int trusted_dcp_init(void)
> >> +{
> >> + int ret;
> >> +
> >> + if (use_otp_key)
> >> + pr_info("Using DCP OTP key\n");
> >> +
> >> + ret =3D test_for_zero_key();
> >> + if (ret) {
> >> + pr_err("Test for zero'ed keys failed: %i\n", ret);
> >=20
> > I'm not sure whether this should err or warn.
> >=20
> > What sort of situations can cause the test the fail (e.g.
> > adversary/interposer, bad configuration etc.).
>
> This occurs when the hardware is not in "secure mode". I.e. it=E2=80=99s =
a bad configuration issue.
> Once the board is properly configured, this will never trigger again.
> Do you think a warning is better for this then?

Bad configuration is not unexpected configuration so it cannot possibly
be an error situation as far as Linux is considered. So warning is=20
appropriate here I'd figure.

BR, Jarkko
