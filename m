Return-Path: <linuxppc-dev+bounces-4791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDCA04C9D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 23:46:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSR3R2V8yz2yDk;
	Wed,  8 Jan 2025 09:45:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736289955;
	cv=none; b=ZMLhLfVws+KHf1wyijh3gwjt3eXF3u4foWfrDdA2cfIMzRZGxVZo3vPSfp5SEUHFNNb0ci03CdIegtnkbTWD0KR+4MVHDpZ/J4+n9+5tjsY7rR1GC5TxCSQxN5RTB4vlCMGn+SAQ4uj29q3/GHSlVmf3wUROul8KPZ7YA60oK+moytAGCbnaGgtGtD9rhVslv0yhpVnpONy0CIpSBHg1ar+vZL3Lx3yWLWRSSVDPzmcMrJl7H+qCyTyLjkvsh+mV5FkHTDpqtdqSOPNzTXt3LEAcfkev5rVioIXgaorh5SfO1bIecX0mAXMfpE4AvnynbACH87SThPSWhq/ABOou+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736289955; c=relaxed/relaxed;
	bh=8yX2WRMh1jgl1DTYfEy2ynxdF0LMsVRUcWHIneRAIvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPr4IVWVUXNQF6LB6qni4Frrnelmg4VIr2dayHWwI03SU9SzRjjX+6yXiVjZ7VoocIcmlcO5PT96i5AF+bah+UAZmdWng5shcnu2lTw9W9hI+aRItR6gJ2h6o2TtZfjaipFUeOlY7P32I/CKaJIilpUNDysY7JzrzNW4PqrnWcqHTjcIi4X54C8QoDeJTgtMaiKwova+uX2WqDvjyYBGtaBvHJTvGp8BwMVZyGo4JE1tfz+EXVfBblkvj2CWuLSk2yshuUX9ago6Ha68I5VRRc5VVXR29XD//ZvBbl+3rvWm0NJUZBP22TE27V72TIeo+JaVppR9dlz/EoGbS5nVLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=NED0+7Ze; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=NED0+7Ze;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSR3M3JP0z3fpS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 09:45:50 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5EC9C240028
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736289942; bh=0p7I6CjwprjKUPF85iarFF3/An5PH4d3rFnUVpXCKjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=NED0+7Zef0TlyRwcDOcxyomiAje/XlK64U5Isxg5aOeL8X9Liz8niSLE6ZnPkXXXt
	 y+rkSZgKeB59X49tFTC8BwOpFWgDJpcgEl8VOn19kTfSrlqmJLz8Hl05foLpILl5Gp
	 oCFXU53bh2eh5mug3HfK35IOrV4Q27i5qEEXnim1YkXzQtCjwWhM2noQXAI2Bgqr5w
	 KsFh39G/+TsFiBc6dtKKLhWzzF0MKCC/dVtRl90eoN+S4p9Q2fx8r2C9SQ1pk7vQJz
	 IkSbdZ0LscoGj4sVWTrCtx0ueYR9OKzw9ucpzYOVErxqrfVBwxHGjywToOVpxDNtLi
	 1fIjeHFpUFAjg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YSR374WRgz6tvZ;
	Tue,  7 Jan 2025 23:45:39 +0100 (CET)
Date: Tue,  7 Jan 2025 22:45:39 +0000
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
Subject: Re: [PATCH 01/19] powerpc: Generalize MPC831x platform support
Message-ID: <Z32uk8VJqhlogY50@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-1-86f78ba2a7af@posteo.net>
 <0b66e94d-7116-4916-b897-06b1199752b4@csgroup.eu>
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
In-Reply-To: <0b66e94d-7116-4916-b897-06b1199752b4@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025 at 02:50:31PM +0100, Christophe Leroy wrote:
> 
> 
> Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> > [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > The Reference Design Boards (RDB) don't have the same relevance they had
> > then the MPC831x platform was new; if any work is done today, then
> > likely based on used production boards, which are more readily available
> > than NXP's discontinued devboards.
> > 
> > To further reduce the focus on RDBs, add DT compatible strings for all
> > four MPC8314/5 variants.
> 
> Seems like this patch does more than adding DT compatible strings.

I'll move the addition of DT compatibles to a new patch.

> 
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
[...]
> > diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
> > index d355ad40995fdc0fc3b4355126c65c761c21c296..944ec44a1fa6044b03ac71c295e891cd411ce444 100644
> > --- a/arch/powerpc/platforms/83xx/Kconfig
> > +++ b/arch/powerpc/platforms/83xx/Kconfig
> > @@ -18,12 +18,12 @@ config MPC830x_RDB
> >          help
> >            This option enables support for the MPC8308 RDB and MPC8308 P1M boards.
> > 
> > -config MPC831x_RDB
> > -       bool "Freescale MPC831x RDB"
> > +config MPC831x
> 
> That looks confusing. We already have CONFIG_PPC_MPC831x

Fair enough. How about CONFIG_MPC831x_BOARDS?

> 
> > +       bool "Freescale MPC831x boards"
> >          select DEFAULT_UIMAGE
> >          select PPC_MPC831x
> >          help
> > -         This option enables support for the MPC8313 RDB and MPC8315 RDB boards.
> > +         This option enables support for all MPC831x-based boards.
> > 
> >   config MPC832x_RDB
> >          bool "Freescale MPC832x RDB"
> > diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
> > index 6fc3dba943dade4f63da090b520b0c35bb46a091..92fb0b34913e1113d3e6eac49acbb1c32fb06ab7 100644
> > --- a/arch/powerpc/platforms/83xx/Makefile
> > +++ b/arch/powerpc/platforms/83xx/Makefile
> > @@ -6,7 +6,7 @@ obj-y                           := misc.o
> >   obj-$(CONFIG_SUSPEND)          += suspend.o suspend-asm.o
> >   obj-$(CONFIG_MCU_MPC8349EMITX) += mcu_mpc8349emitx.o
> >   obj-$(CONFIG_MPC830x_RDB)      += mpc830x_rdb.o
> > -obj-$(CONFIG_MPC831x_RDB)      += mpc831x_rdb.o
> > +obj-$(CONFIG_MPC831x)          += mpc831x.o
> >   obj-$(CONFIG_MPC832x_RDB)      += mpc832x_rdb.o
> >   obj-$(CONFIG_MPC834x_ITX)      += mpc834x_itx.o
> >   obj-$(CONFIG_MPC836x_RDK)      += mpc836x_rdk.o
> > diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x.c
> > similarity index 65%
> > rename from arch/powerpc/platforms/83xx/mpc831x_rdb.c
> > rename to arch/powerpc/platforms/83xx/mpc831x.c
> > index 5c39966762e4264d2ef91b2c4ef75fdf2c2c5d65..7250fc11c7ee80b266f39d0b3aebb0deb777c129 100644
> > --- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
> > +++ b/arch/powerpc/platforms/83xx/mpc831x.c
> > @@ -1,8 +1,8 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   /*
> > - * arch/powerpc/platforms/83xx/mpc831x_rdb.c
> > + * arch/powerpc/platforms/83xx/mpc831x.c
> 
> Please remove the file name from the file.

Will do.

> >    *
> > - * Description: MPC831x RDB board specific routines.
> > + * Description: MPC831x board specific routines.
> 
> s/board/boards ?

No, the "board" in "board specific" doesn't get pluralized when there
are multiple boards. How about the following?

      * Description: MPC831x specific routines.



Best regards,
J. Neuschäfer

