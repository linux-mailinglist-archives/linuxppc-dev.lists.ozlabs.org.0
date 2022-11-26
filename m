Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D384639741
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 17:31:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKHLJ3DjXz3f39
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 03:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sntzhLoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sntzhLoR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKHKR0VlQz3cFZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 03:30:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89AA2B81D02;
	Sat, 26 Nov 2022 16:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EEDC433C1;
	Sat, 26 Nov 2022 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669480247;
	bh=sqWiSF6NV8JR3VK6MeFWU8zmYfc8R/be4+Aqh8Ncm7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sntzhLoR9edtnKVKDY2Jxy6dRAIsHpUDdxDgN9obWtnnLG2rw0+R9yfZxNr0fiqNC
	 G85wexaMJdTHn8LHvfeBILKgILG6CojyUKecsu0TN7rDRCQpTwPbzKoTYi5FcMbKeF
	 6EXZ9XUPSSkUrJAPkWUB57IXsxX8aHlx8+W0XBnbbnhsCyhIcp8rMtKfTC8eibqNSR
	 ZP6AY8XJPjf7fba6qDQZSEqbLZDJw9sjuWzeJUMXpMRK7fkzSRg7p/4eaY/itLsb0K
	 lfWE+rlHTHVMoycRc9YRF+kWd27+KsB8msGsE4ebLkV47pX/gdTkDQ7xaan051RQe2
	 UFa5hoViCpfMA==
Received: by pali.im (Postfix)
	id B22537B2; Sat, 26 Nov 2022 17:30:44 +0100 (CET)
Date: Sat, 26 Nov 2022 17:30:44 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Message-ID: <20221126163044.cnoccovve4a74a7l@pali>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20220829085451.upubyo5e7uop72lb@pali>
 <20221009110652.h7senqesk7nabxmn@pali>
 <20221101221255.gwaem6w7upv545fw@pali>
 <00398948-d06c-3894-5be3-acb6cc09ff6b@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00398948-d06c-3894-5be3-acb6cc09ff6b@csgroup.eu>
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

On Wednesday 02 November 2022 14:05:35 Christophe Leroy wrote:
> Le 01/11/2022 à 23:12, Pali Rohár a écrit :
> > On Sunday 09 October 2022 13:06:52 Pali Rohár wrote:
> >> On Monday 29 August 2022 10:54:51 Pali Rohár wrote:
> >>> On Sunday 28 August 2022 17:43:53 Christophe Leroy wrote:
> >>>> Le 28/08/2022 à 19:41, Pali Rohár a écrit :
> >>>>> On Sunday 28 August 2022 17:39:25 Christophe Leroy wrote:
> >>>>>> Le 28/08/2022 à 19:33, Christophe Leroy a écrit :
> >>>>>>>
> >>>>>>>
> >>>>>>> Le 28/08/2022 à 11:56, Pali Rohár a écrit :
> >>>>>>>> When CONFIG_TARGET_CPU is specified then pass its value to the compiler
> >>>>>>>> -mcpu option. This fixes following build error when building kernel with
> >>>>>>>> powerpc e500 SPE capable cross compilers:
> >>>>>>>>
> >>>>>>>>        BOOTAS  arch/powerpc/boot/crt0.o
> >>>>>>>>      powerpc-linux-gnuspe-gcc: error: unrecognized argument in option
> >>>>>>>> ‘-mcpu=powerpc’
> >>>>>>>>      powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are:
> >>>>>>>> 8540 8548 native
> >>>>>>>>      make[1]: *** [arch/powerpc/boot/Makefile:231:
> >>>>>>>> arch/powerpc/boot/crt0.o] Error 1
> >>>>>>>
> >>>>>>> corenet64_smp_defconfig :
> >>>>>>>
> >>>>>>>      BOOTAS  arch/powerpc/boot/crt0.o
> >>>>>>> powerpc64-linux-gcc: error: missing argument to '-mcpu='
> >>>>>>> make[1]: *** [arch/powerpc/boot/Makefile:237 : arch/powerpc/boot/crt0.o]
> >>>>>>> Erreur 1
> >>>>>>> make: *** [arch/powerpc/Makefile:253 : uImage] Erreur 2
> >>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>> Seems like in fact, E5500_CPU and E6500_CPU are not taken into account
> >>>>>> in CONFIG_TARGET_CPU, and get special treatment directly in
> >>>>>> arch/powerpc/Makefile.
> >>>>>>
> >>>>>> This goes unnoticed because of CFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=
> >>>>>> $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> >>>>>>
> >>>>>> I think we need to fix that prior to your patch.
> >>>>>
> >>>>> It looks like that CONFIG_TARGET_CPU is broken.
> >>>>>
> >>>>>     $ make ARCH=powerpc corenet64_smp_defconfig CROSS_COMPILE=powerpc64-linux-gnu-
> >>>>>     ...
> >>>>>     # configuration written to .config
> >>>>>
> >>>>>     $ grep CONFIG_TARGET_CPU .config
> >>>>>     CONFIG_TARGET_CPU_BOOL=y
> >>>>>
> >>>>> CONFIG_TARGET_CPU_BOOL is set but CONFIG_TARGET_CPU not!
> >>>>
> >>>> Yes, because there is no default value for E5500_CPU and E6500_CPU. We
> >>>> need to add one for each.
> >>>
> >>> I see... Will you prepare this fixup for your previous patch?
> >>>
> >>> And I think that following construct
> >>>
> >>>    $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> >>>
> >>> should be changed just to
> >>>
> >>>    -mcpu=$(CONFIG_TARGET_CPU)
> >>>
> >>> Because if user specified that want build for specific target CPU, it
> >>> should not be silently ignored.
> >>
> >> Christophe, should I do something in this area?
> > 
> > Christophe, any input from your side?
> 
> Hi, sorry I was on holiday until today. I'll try to have a look in the 
> coming days.

Ok, Did you have a time to look at it?
