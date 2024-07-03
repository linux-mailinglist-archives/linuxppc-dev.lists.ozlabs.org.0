Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9092594E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:42:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ijdbt7xg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbvg71GFz3d2W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:42:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ijdbt7xg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbtR15rhz3cZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:41:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0975DCE2A9B;
	Wed,  3 Jul 2024 10:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F42C2BD10;
	Wed,  3 Jul 2024 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720003290;
	bh=vgXfThRtXrQ3WeSSg7JY98NnV/Woiv8luRBEyLCeIYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ijdbt7xgZsywBooEPssKc8vdPrXC/WPfsDeiQymGFLNpNdQwBK/lojF5MXypNztMv
	 xdK++V+p8+WGokw3nt/AS65Y1mcY4yTt4SUno4HwICxLoV0Ln95D+vwz/xeEv9TCSU
	 HzQUDCsSXT/LvN/kWUnPjLBwBCvmfP3nX1C9pJ1uBFP7jwp2bD/YgJzXFFufgA2PLd
	 5yQQhy/P5hVdn724ENuNLbrzCKa6P9k6tckNhKdLmMe7FW+WGvUi/M2tqdT8ae8oNO
	 mic4NQ/4WNbAZLX0Tw3h2Z3JI3ExSLVDkP50rUE3IzDYsfONM9Rmwxmv1BmNUkUcQM
	 CERkSeQZFfAAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sOxQV-009PLh-Uj;
	Wed, 03 Jul 2024 11:41:28 +0100
Date: Wed, 03 Jul 2024 11:41:27 +0100
Message-ID: <86a5iyahbc.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives after the of/irq updates 2024-05-29
In-Reply-To: <B550D4C4-6F82-409E-B5A8-E7D123ACB93D@xenosoft.de>
References: <86cynv9dx7.wl-maz@kernel.org>
	<B550D4C4-6F82-409E-B5A8-E7D123ACB93D@xenosoft.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.3
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: chzigotzky@xenosoft.de, robh@kernel.org, apatel@ventanamicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, madskateman@gmail.com, rtd2@xtra.co.nz, matthew@a-eon.biz, darren@stevens-zone.net, info@xenosoft.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 03 Jul 2024 11:26:17 +0100,
Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>=20
> On 3. Jul 2024, at 08:40, Marc Zyngier <maz@kernel.org> wrote:
>=20
> This isn't a DTS. This is a listing of all the nodes, not something I
> can use to feed the kernel. I explained how to generate it.
>=20
> Download the compiled device tree for the Nemo board:
> http://www.xenosoft.de/fdt-nemo-board.zip
>=20
> No, thank you.
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>=20
> You know already the device tree: https://lists.ozlabs.org/pipermail/linu=
xppc-dev/2021-November/236587.html

Do you think I keep this sort of things from almost three years ago? I
have better things to do.

Now, either you provide the required information in the required form
or you don't. Either you test the proposed patches or you don't.

If you do, great, and I'll do my best to help you. If you don't, also
great, because I can go back to the stuff I'm actually interested in
(i.e. not your machine).

This is your call, and only yours.

	M.

--=20
Without deviation from the norm, progress is not possible.
