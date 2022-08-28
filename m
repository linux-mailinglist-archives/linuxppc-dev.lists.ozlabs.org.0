Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967285A3EF1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 19:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MG19M3qcWz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 03:42:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VXZAU+Wy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VXZAU+Wy;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MG18m0FBgz2xHH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 03:41:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 380F2B80B88;
	Sun, 28 Aug 2022 17:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98891C433C1;
	Sun, 28 Aug 2022 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661708498;
	bh=oWbacq76FiLZIfuBUsffJq7HQY/+kQwKoxWKLOvIweY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXZAU+Wy9SFqAjZJxRg6k8LSAoVRE3YdgjF/vMFnCwkXO12n80gFY5mjZKWKPVCVA
	 zRwslSfMZr8BsoDOEtOrdYNhyHqML7MIgo0SNRCBsjBCV9NUgWOdMhMyh0sU2j7gbA
	 SXVAhkKvHDYSxuen3IgJA0CZXCcL+vTDD41q63f1wo0OLUTFJO0xSeXsY8P8DBDIEO
	 r8oeaHv5y9E6p/SgQMD9p5lILG3Y3RrDZfi6JMstUAnSZVkkpaiatOvYKSe49N9Um1
	 WyuIzrNjTGJ82sUCoVfMhfRNeAWczzY3wZVA7e/xl5oksAvX3TxsOkZX0t27Ckg6gf
	 UgVHabu3abC8Q==
Received: by pali.im (Postfix)
	id BDF7C7B3; Sun, 28 Aug 2022 19:41:35 +0200 (CEST)
Date: Sun, 28 Aug 2022 19:41:35 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Message-ID: <20220828174135.rcql4uiunqbnn5gh@pali>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
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

On Sunday 28 August 2022 17:39:25 Christophe Leroy wrote:
> Le 28/08/2022 à 19:33, Christophe Leroy a écrit :
> > 
> > 
> > Le 28/08/2022 à 11:56, Pali Rohár a écrit :
> >> When CONFIG_TARGET_CPU is specified then pass its value to the compiler
> >> -mcpu option. This fixes following build error when building kernel with
> >> powerpc e500 SPE capable cross compilers:
> >>
> >>      BOOTAS  arch/powerpc/boot/crt0.o
> >>    powerpc-linux-gnuspe-gcc: error: unrecognized argument in option 
> >> ‘-mcpu=powerpc’
> >>    powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are: 
> >> 8540 8548 native
> >>    make[1]: *** [arch/powerpc/boot/Makefile:231: 
> >> arch/powerpc/boot/crt0.o] Error 1
> > 
> > corenet64_smp_defconfig :
> > 
> >    BOOTAS  arch/powerpc/boot/crt0.o
> > powerpc64-linux-gcc: error: missing argument to '-mcpu='
> > make[1]: *** [arch/powerpc/boot/Makefile:237 : arch/powerpc/boot/crt0.o] 
> > Erreur 1
> > make: *** [arch/powerpc/Makefile:253 : uImage] Erreur 2
> > 
> > 
> 
> Seems like in fact, E5500_CPU and E6500_CPU are not taken into account 
> in CONFIG_TARGET_CPU, and get special treatment directly in 
> arch/powerpc/Makefile.
> 
> This goes unnoticed because of CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += 
> $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> 
> I think we need to fix that prior to your patch.

It looks like that CONFIG_TARGET_CPU is broken.

  $ make ARCH=powerpc corenet64_smp_defconfig CROSS_COMPILE=powerpc64-linux-gnu-
  ...
  # configuration written to .config

  $ grep CONFIG_TARGET_CPU .config
  CONFIG_TARGET_CPU_BOOL=y

CONFIG_TARGET_CPU_BOOL is set but CONFIG_TARGET_CPU not!

> > Christophe
> > 
> > 
> >>
> >> Similar change was already introduced for the main powerpc Makefile in
> >> commit 446cda1b21d9 ("powerpc/32: Don't always pass -mcpu=powerpc to the
> >> compiler").
> >>
> >> Fixes: 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate 
> >> CPU")
> >> Cc: stable@vger.kernel.org # 446cda1b21d9 ("powerpc/32: Don't always 
> >> pass -mcpu=powerpc to the compiler")
> >> Signed-off-by: Pali Rohár <pali@kernel.org>
> >> ---
> >>   arch/powerpc/boot/Makefile | 14 ++++++++++----
> >>   1 file changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> >> index a9cd2ea4a861..1957a3de7a1c 100644
> >> --- a/arch/powerpc/boot/Makefile
> >> +++ b/arch/powerpc/boot/Makefile
> >> @@ -38,13 +38,19 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes 
> >> -Wno-trigraphs \
> >>            $(LINUXINCLUDE)
> >>   ifdef CONFIG_PPC64_BOOT_WRAPPER
> >> -ifdef CONFIG_CPU_LITTLE_ENDIAN
> >> -BOOTCFLAGS    += -m64 -mcpu=powerpc64le
> >> +BOOTCFLAGS    += -m64
> >>   else
> >> -BOOTCFLAGS    += -m64 -mcpu=powerpc64
> >> +BOOTCFLAGS    += -m32
> >>   endif
> >> +
> >> +ifdef CONFIG_TARGET_CPU_BOOL
> >> +BOOTCFLAGS    += -mcpu=$(CONFIG_TARGET_CPU)
> >> +else ifdef CONFIG_PPC64_BOOT_WRAPPER
> >> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> >> +BOOTCFLAGS    += -mcpu=powerpc64le
> >>   else
> >> -BOOTCFLAGS    += -m32 -mcpu=powerpc
> >> +BOOTCFLAGS    += -mcpu=powerpc64
> >> +endif
> >>   endif
> >>   BOOTCFLAGS    += -isystem $(shell $(BOOTCC) -print-file-name=include)
