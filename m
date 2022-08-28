Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2265A3CFC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 11:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFp2H1s5Xz3c6j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 19:20:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j2EfubT1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j2EfubT1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFp1d15v1z2xHH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 19:19:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0C1FEB80B19;
	Sun, 28 Aug 2022 09:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24059C433C1;
	Sun, 28 Aug 2022 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661678383;
	bh=oApmKSX4H6cNKM8J5+LxhC/SD9XsY8VAQGSgWRshmjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2EfubT14d2tQirJD51qcr7B8rN1N5ma334NSUuBaQT71y5jHn1Ay08mSElUyivGf
	 ejFhWoyKFdrm+vVCVKb89HcChOb5eBxXI0i5psHH+spnce4KlyOtfH4Ts9KemJrbpl
	 tILZXhHImyRL9+fCnbgDIuvt9ejo1LrIdEC1Rt3tgj7ZJCafx4u7MAkJ7erXXoMJGp
	 dPNE+xWoSCy1BJyqAP2Zij4256NCTh931GOnZ/4IaHAORzMGYNBwogxhj/USFFfRHl
	 UtdTactv5OZxVUvYmAWJp7lD5lAR3mwHkouYs+gmo1tXJLKNsnMEGtBWjFs490wCe4
	 1oNGdu4fTyR8w==
Received: by pali.im (Postfix)
	id C00817B3; Sun, 28 Aug 2022 11:19:39 +0200 (CEST)
Date: Sun, 28 Aug 2022 11:19:39 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Message-ID: <20220828091939.b2ntaaoxg7h2gcuf@pali>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220827133900.16634-1-pali@kernel.org>
 <63f4bce4-7965-9bc6-2104-42e26acd0208@csgroup.eu>
 <20220827173610.7bdp7zychwu2u5i6@pali>
 <1da78077-a050-a391-a002-9e25eabc89d1@csgroup.eu>
 <20220827183608.ezljs2houkd32764@pali>
 <20220827190013.c3odakqxqnqgkzxm@pali>
 <6bf326c6-0c48-fb53-bb5a-3a4c4f45f6d0@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bf326c6-0c48-fb53-bb5a-3a4c4f45f6d0@csgroup.eu>
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

On Sunday 28 August 2022 07:23:39 Christophe Leroy wrote:
> Le 27/08/2022 à 21:00, Pali Rohár a écrit :
> > On Saturday 27 August 2022 20:36:08 Pali Rohár wrote:
> >> On Saturday 27 August 2022 18:32:42 Christophe Leroy wrote:
> >>> Le 27/08/2022 à 19:36, Pali Rohár a écrit :
> >>>> On Saturday 27 August 2022 17:31:10 Christophe Leroy wrote:
> >>>>> Le 27/08/2022 à 15:39, Pali Rohár a écrit :
> >>>>>> For 32-bit uImage try to use CONFIG_TARGET_CPU option for -mcpu. This fixes
> >>>>>> following compiler error when building kernel with powerpc e500 SPE capable
> >>>>>> cross compilers:
> >>>>>>
> >>>>>>        BOOTAS  arch/powerpc/boot/crt0.o
> >>>>>>      powerpc-linux-gnuspe-gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
> >>>>>>      powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> >>>>>>      make[1]: *** [arch/powerpc/boot/Makefile:231: arch/powerpc/boot/crt0.o] Error 1
> >>>>>>
> >>>>>> For 64-bit uImage and 64-bit kernels with 32-bit uImage wrapper there is no
> >>>>>> change.
> >>>>>>
> >>>>>> Similar change was already introduced for the main powerpc Makefile in
> >>>>>> commit 446cda1b21d9 ("powerpc/32: Don't always pass -mcpu=powerpc to the
> >>>>>> compiler").
> >>>>>>
> >>>>>> Fixes: 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate CPU")
> >>>>>> Cc: stable@vger.kernel.org
> >>>>>> Signed-off-by: Pali Rohár <pali@kernel.org>
> >>>>>> ---
> >>>>>>     arch/powerpc/boot/Makefile | 8 ++++++++
> >>>>>>     1 file changed, 8 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> >>>>>> index a9cd2ea4a861..f56a5f90a5d8 100644
> >>>>>> --- a/arch/powerpc/boot/Makefile
> >>>>>> +++ b/arch/powerpc/boot/Makefile
> >>>>>> @@ -44,8 +44,16 @@ else
> >>>>>>     BOOTCFLAGS	+= -m64 -mcpu=powerpc64
> >>>>>>     endif
> >>>>>>     else
> >>>>>> +ifdef CONFIG_PPC32
> >>>>>> +ifdef CONFIG_TARGET_CPU_BOOL
> >>>>>> +BOOTCFLAGS	+= -m32 -mcpu=$(CONFIG_TARGET_CPU)
> >>>>>> +else
> >>>>>> +BOOTCFLAGS	+= -m32 -mcpu=powerpc
> >>>>>
> >>>>> You can't do that. You get here only if user has selected
> >>>>> TOOLCHAIN_DEFAULT_CPU, in which case you don't want to for -mcpu=powerpc.
> >>>>
> >>>> So do I understand it correctly that in this branch I should omit -mcpu=powerpc?
> >>>
> >>> Correct.
> >>
> >> Ok, I will fix it in v3.
> >>
> >>>>
> >>>>> -mcpu=powerpc is set when user selects CONFIG_POWERPC_CPU, in which case
> >>>>> CONFIG_TARGET_CPU_BOOL is set as well.
> >>>>>
> >>>>>> +endif
> >>>>>> +else
> >>>>>>     BOOTCFLAGS	+= -m32 -mcpu=powerpc
> >>>>>
> >>>>> Same, for PPC64 I think you don't want that either, unless the
> >>>>> CONFIG_GENERIC_CPU has been selected in which case
> >>>>> CONFIG_TARGET_CPU_BOOL is not set.
> >>>>>
> >>>>> When CONFIG_TARGET_CPU_BOOL is set for PPC64 you also want
> >>>>> -mcpu=$(CONFIG_TARGET_CPU)
> >>>>
> >>>> I understand that this branch is called for PPC64 build with 32-bit
> >>>> uImage wrapper. So in this case should not be used TARGET_CPU as it
> >>>> would be 64-bit and not 32-bit as requited for 32-bit uImage wrapper.
> >>>
> >>> Why ?
> >>>
> >>> -mcpu=e6500 -m32 works as far as I can see.
> >>
> >> Hm... I did not know that. Ok, if you want I will put it into
> >> -m32 -mcpu=$(CONFIG_TARGET_CPU) branch too.
> > 
> > And when CONFIG_TARGET_CPU_BOOL is not set but CONFIG_PPC64_BOOT_WRAPPER
> > is, should be -mcpu=powerpc64le or -mcpu=powerpc64 still passed?
> 
> Not sure, so keep it like that, will change later if needed.

Ok! Will prepare new version.

> > 
> >>>>
> >>>> Anyway, in this change I'm touching only PPC32 build, so all PPC64 stay
> >>>> as it was before.
> >>>>
> >>>>>>     endif
> >>>>>> +endif
> >>>>>>     
> >>>>>>     BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
> >>>>>>     
