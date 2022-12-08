Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA9647607
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 20:17:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSkRZ0CzTz3bjf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 06:16:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BwypU2hN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BwypU2hN;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSkQf3NYgz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 06:16:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C3A88CE26AF;
	Thu,  8 Dec 2022 19:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99279C433D2;
	Thu,  8 Dec 2022 19:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670526965;
	bh=z+N9fxN1bumG6ozwZdWvrjtq+nRyqeqSupSvs69OVrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BwypU2hNY7NgOh1p7KJEQ4LM+yeyqspNCdMEiltGeI7JutjiOPmKB1Lb6F2Z4Eyy0
	 GO0bH9pcyBTLMLaZgiOtXyRyvdMg9SYJMaljRKLTpTcNYQwDD5TWeBr2p4wmxvsHzh
	 mSwcJAA+cYWHjnKhz6/5kCFsC0eoFgiKLiwwX4KkKmitn0LBNj2M8k4Yr18bK6VSef
	 VluN3NaRARFgB+WaS2/88qwW2YH7eam281dGEqs6XE+4/jHBmap9Ngrw9xq7Mbr0XN
	 saM9/8XN7YCiXSo2SdHxfhfacxtw6fimmqBqwfnngcr26DdrpYAY6ykM5RNj/XGmZZ
	 DNqVLy0+8yvEQ==
Received: by pali.im (Postfix)
	id CF87B97E; Thu,  8 Dec 2022 20:16:02 +0100 (CET)
Date: Thu, 8 Dec 2022 20:16:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Message-ID: <20221208191602.diywrt3g2f6zmt4s@pali>
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

With "[PATCH v1] powerpc/64: Set default CPU in Kconfig" patch from
https://lore.kernel.org/linuxppc-dev/3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu/
this change does not throw above compile error anymore.

> > 
> >>> Christophe
> >>>
> >>>
> >>>>
> >>>> Similar change was already introduced for the main powerpc Makefile in
> >>>> commit 446cda1b21d9 ("powerpc/32: Don't always pass -mcpu=powerpc to the
> >>>> compiler").
> >>>>
> >>>> Fixes: 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate
> >>>> CPU")
> >>>> Cc: stable@vger.kernel.org # 446cda1b21d9 ("powerpc/32: Don't always
> >>>> pass -mcpu=powerpc to the compiler")
> >>>> Signed-off-by: Pali Rohár <pali@kernel.org>
> >>>> ---
> >>>>    arch/powerpc/boot/Makefile | 14 ++++++++++----
> >>>>    1 file changed, 10 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> >>>> index a9cd2ea4a861..1957a3de7a1c 100644
> >>>> --- a/arch/powerpc/boot/Makefile
> >>>> +++ b/arch/powerpc/boot/Makefile
> >>>> @@ -38,13 +38,19 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes
> >>>> -Wno-trigraphs \
> >>>>             $(LINUXINCLUDE)
> >>>>    ifdef CONFIG_PPC64_BOOT_WRAPPER
> >>>> -ifdef CONFIG_CPU_LITTLE_ENDIAN
> >>>> -BOOTCFLAGS    += -m64 -mcpu=powerpc64le
> >>>> +BOOTCFLAGS    += -m64
> >>>>    else
> >>>> -BOOTCFLAGS    += -m64 -mcpu=powerpc64
> >>>> +BOOTCFLAGS    += -m32
> >>>>    endif
> >>>> +
> >>>> +ifdef CONFIG_TARGET_CPU_BOOL
> >>>> +BOOTCFLAGS    += -mcpu=$(CONFIG_TARGET_CPU)
> >>>> +else ifdef CONFIG_PPC64_BOOT_WRAPPER
> >>>> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> >>>> +BOOTCFLAGS    += -mcpu=powerpc64le
> >>>>    else
> >>>> -BOOTCFLAGS    += -m32 -mcpu=powerpc
> >>>> +BOOTCFLAGS    += -mcpu=powerpc64
> >>>> +endif
> >>>>    endif
> >>>>    BOOTCFLAGS    += -isystem $(shell $(BOOTCC) -print-file-name=include)
