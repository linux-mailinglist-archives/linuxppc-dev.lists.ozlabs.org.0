Return-Path: <linuxppc-dev+bounces-4796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89EA04D73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 00:25:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSRwc2nQ3z30QJ;
	Wed,  8 Jan 2025 10:25:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736292304;
	cv=none; b=bw+WdlnPAXABLD170cWqdzwzdtm+8tw+szNQ1NNh+2BZo3/spcN5dXaktDXnPom5hxi5vzv7sTa6t+XsVJR46267R4wlDoy1aStcT9Hg28xLIoWePM563HkJlMM0g9+rC6BkyhmXaKesF1UsLuJGNWZgH84QtaOUnG66jl4ChABgYCvxYZaIOjZ3l5D6oYC9tjRX1VxWMUVLKog+LmLKq6HoZrRrYkU3ceo2jemQGZOnVi1grLDtfN3RhAC1AMYDuG5d6IhR7hBFamXIsWlYiK2E5QE2G3wZ5f/xPN1AMrCZvuEXpd8tE97HhT7hrYBecdVnXNrpkJ7Fhy54eivZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736292304; c=relaxed/relaxed;
	bh=qfNApwJv2dwotcBROgPp9ownGLeJOI5MBNUpUMkDs/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzhGar0OeXrOOUeHvfS0T1tLkvtHE/DPUkI2wvdr5S/6XFqWwOoMmgJ3Pd64KBI2EmwQ6sR/yQrMX/f2fxBMvg6RDNv2YiBJARyHXQoIQubqzh3pJorMoawut+TvCzNCBvmDOXXzrGv/jHNSzy0z9MESz+gSQkH0gFxMsJDp5ur+XpAdcAzZSEqKD1u5GJ/4KpSclnTvIbDc3ZqWpio2LgEjRmBru2F1GurHikE7ryUaeUSb5mZR1kOvVaNM0IKrBRL7rl52XdmZQurnpsIIDlv5v9go1vMqoFxGEbCQroWTp+GgntI3aRKuClMWEDnoPV9jBDCeLHutZeppfIsROw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=i3270LkB; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=i3270LkB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSRwV6k3dz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 10:24:55 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3B756240101
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 00:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736292290; bh=/rXHGKUIoQHoGcJIrywVuVgzNts6B4F5PDPqIq7EeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=i3270LkBHSwGdzpWKqADsIkx3UMhcCwarkZfDUVTxKHR5XxjchCn4TIjxXb6MCFTv
	 soOR+zX+OzyqIKsqd5h+yUhWoTXPohF3o0zKqc8LCNn8jqGTPHarCZcPW6/gDm9WIX
	 6ukwQ5puFjmw7KZ6AodqaT3r5ZtfHong/BJXiZXeswZJL3BkrpGkqWHL+VUGBQ9THc
	 ajOdfTUoEG+6+5XWzxm0TPUUoNj018GYLS44TrgTXXGFXoy5Gr+2YXdeZd9MIXx8NJ
	 aAK2Ce2UQz2UD6yuLzTEtD9TVcQc0tcIcnVjVaPqgQFgXiL1EG2BhlXQez8L/W0EJc
	 XXnsBpk3OtAiQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YSRwH60Yhz6tvZ;
	Wed,  8 Jan 2025 00:24:47 +0100 (CET)
Date: Tue,  7 Jan 2025 23:24:47 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 09/19] powerpc: boot: Build devicetrees when
 CONFIG_MPC831x=y
Message-ID: <Z323v2w74_lB2Ilo@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
 <6443434a-f810-4591-b1e4-cfea0bc0b993@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6443434a-f810-4591-b1e4-cfea0bc0b993@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025 at 02:55:22PM +0100, Christophe Leroy wrote:
> Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> > [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > In order to produce useful FIT images, the kernel needs to know which
> > devicetrees to build. To that end, follow the same approach as other
> > architectures, and enable devicetrees per platform.
> 
> Why do you need that ?

The FIT infrastructure uses the dtbs-y variable and the dtbs-list file
built from it in order to obtain a list of DTBs to include.

Having roughly the right DTBs included by setting a simple config
option to =y is pretty convenient.

> Why not just use CONFIG_EXTRA_TARGETS for that ?

To be honest, I didn't know about CONFIG_EXTRA_TARGETS until now.
But I also don't quite understand it:

  ()  Additional default image types

I don't need an additional image type. I want additional device trees,
if anything.

One thing I specifically wanted to avoid by using FIT is having to add
more per-board bootwrapper logic to arch/powerpc/boot/Makefile.

> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > 
> > I've only enabled MPC831x devicetrees, because that's the hardware I have.
> > ---
> >   arch/powerpc/boot/dts/Makefile | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> > index 0cd0d8558b475cfe342f36f4b78240ef88dd2e37..6aee895d5baaa2c978d4b1c82a6d198d9e166ea2 100644
> > --- a/arch/powerpc/boot/dts/Makefile
> > +++ b/arch/powerpc/boot/dts/Makefile
> > @@ -3,3 +3,8 @@
> >   subdir-y += fsl
> > 
> >   dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
> > +
> > +dtb-$(CONFIG_MPC831x) += \
> > +       kmeter1.dtb \
> > +       mpc8313erdb.dtb \
> > +       mpc8315erdb.dtb
> 
> How will it know which one of the three to put in the FIT image ?
> Or do you want all three in the FIT image ?

It includes all of them, which is an acceptable outcome.

> In that case how do you select which one to use at boot ?

The bootloader (most likely U-Boot) is expected to know the compatible
string of the board and select the right devicetree based on it.


Best regards,
J. Neuschäfer

