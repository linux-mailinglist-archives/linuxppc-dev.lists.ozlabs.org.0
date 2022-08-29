Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE55A458A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 10:55:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGPR947dxz3c6y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 18:55:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CyMJlWd7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CyMJlWd7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGPQW3nZvz2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 18:54:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4A8360EB2;
	Mon, 29 Aug 2022 08:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CD8C433C1;
	Mon, 29 Aug 2022 08:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661763294;
	bh=cpD20IECoAEsU5QWrTpmUWeRwStSRURBU0+JaQT7J7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyMJlWd73MEePoYJ/WtOSAwPovn50mfbBDP2m/BfY4rZ401xhXc+8J/nfG7ZeLzOy
	 ZRL57h+IkrKMMKPzp4hoDWiEaFgXFfUXYnPKoF6yrNCunBKkdw7wTN3hjoHevTn765
	 byeu7aLXBA1k+PPgl1DYl1aJQjFkoAF2fqqVXLaVicqIVcKjL1DJatNBBXp6+/+HTB
	 qOT6M33x0PVS2efbyDCyWPCd+VbB30nRHiCMqqEUb9Ub9G/sAaNWYeR+UtTz8VPXNh
	 sYbXcEagfnm2+qbsgASS9ZI28oEseXeebL1QqBoUTPvtY2zG0rKTMDJpL6M7lTcQYA
	 QzJGmHeNWxprg==
Received: by pali.im (Postfix)
	id 4AF797DE; Mon, 29 Aug 2022 10:54:51 +0200 (CEST)
Date: Mon, 29 Aug 2022 10:54:51 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Message-ID: <20220829085451.upubyo5e7uop72lb@pali>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sunday 28 August 2022 17:43:53 Christophe Leroy wrote:
> Le 28/08/2022 à 19:41, Pali Rohár a écrit :
> > On Sunday 28 August 2022 17:39:25 Christophe Leroy wrote:
> >> Le 28/08/2022 à 19:33, Christophe Leroy a écrit :
> >>>
> >>>
> >>> Le 28/08/2022 à 11:56, Pali Rohár a écrit :
> >>>> When CONFIG_TARGET_CPU is specified then pass its value to the compiler
> >>>> -mcpu option. This fixes following build error when building kernel with
> >>>> powerpc e500 SPE capable cross compilers:
> >>>>
> >>>>       BOOTAS  arch/powerpc/boot/crt0.o
> >>>>     powerpc-linux-gnuspe-gcc: error: unrecognized argument in option
> >>>> ‘-mcpu=powerpc’
> >>>>     powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are:
> >>>> 8540 8548 native
> >>>>     make[1]: *** [arch/powerpc/boot/Makefile:231:
> >>>> arch/powerpc/boot/crt0.o] Error 1
> >>>
> >>> corenet64_smp_defconfig :
> >>>
> >>>     BOOTAS  arch/powerpc/boot/crt0.o
> >>> powerpc64-linux-gcc: error: missing argument to '-mcpu='
> >>> make[1]: *** [arch/powerpc/boot/Makefile:237 : arch/powerpc/boot/crt0.o]
> >>> Erreur 1
> >>> make: *** [arch/powerpc/Makefile:253 : uImage] Erreur 2
> >>>
> >>>
> >>
> >> Seems like in fact, E5500_CPU and E6500_CPU are not taken into account
> >> in CONFIG_TARGET_CPU, and get special treatment directly in
> >> arch/powerpc/Makefile.
> >>
> >> This goes unnoticed because of CFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=
> >> $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> >>
> >> I think we need to fix that prior to your patch.
> > 
> > It looks like that CONFIG_TARGET_CPU is broken.
> > 
> >    $ make ARCH=powerpc corenet64_smp_defconfig CROSS_COMPILE=powerpc64-linux-gnu-
> >    ...
> >    # configuration written to .config
> > 
> >    $ grep CONFIG_TARGET_CPU .config
> >    CONFIG_TARGET_CPU_BOOL=y
> > 
> > CONFIG_TARGET_CPU_BOOL is set but CONFIG_TARGET_CPU not!
> 
> Yes, because there is no default value for E5500_CPU and E6500_CPU. We 
> need to add one for each.

I see... Will you prepare this fixup for your previous patch?

And I think that following construct

  $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))

should be changed just to

  -mcpu=$(CONFIG_TARGET_CPU)

Because if user specified that want build for specific target CPU, it
should not be silently ignored.
