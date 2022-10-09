Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD55F8ACD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 13:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlfQt5CjLz3bjd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 22:07:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lh6KNRlM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lh6KNRlM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlfPw6qRDz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 22:07:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05348B80C88;
	Sun,  9 Oct 2022 11:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E01C433C1;
	Sun,  9 Oct 2022 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665313615;
	bh=bDQO5nPf+lVMNKr0A9V63/VARoFUePFNmz0paVann+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lh6KNRlMUBJMDhKijORUgTjeqq0c1vtkL5x0vLvbTNwERqVEdWnCGu2FxlEkBGcn+
	 xjiiFHa+CJx9o7faJ1WRwSTfYSQ7wQsHG7b70vo1BVmv6kdMZAlOwXNzkQ0rIxMTLa
	 boh8I6USg2O6ZZFNH5rzTt7ozAbyRWsyu3UliSlaXhG6/EP9MnB/qf7XnEhZ3WrbTN
	 73iMNQ8c9V389d6Do3fGdUG8a4Lttp4rwHfOQliOAz9wyt/9bhX9AB2NM0MUv9SXPP
	 bSmnI4zfT58B0fmLz7ozMrVvAaQ7RgQy0Keyq4I1pPNbwLyYFEoIj5GveAT/nPVB7n
	 ZPcx0pvvZm0vQ==
Received: by pali.im (Postfix)
	id 52B8A7C1; Sun,  9 Oct 2022 13:06:52 +0200 (CEST)
Date: Sun, 9 Oct 2022 13:06:52 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Message-ID: <20221009110652.h7senqesk7nabxmn@pali>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20220829085451.upubyo5e7uop72lb@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220829085451.upubyo5e7uop72lb@pali>
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

On Monday 29 August 2022 10:54:51 Pali Rohár wrote:
> On Sunday 28 August 2022 17:43:53 Christophe Leroy wrote:
> > Le 28/08/2022 à 19:41, Pali Rohár a écrit :
> > > On Sunday 28 August 2022 17:39:25 Christophe Leroy wrote:
> > >> Le 28/08/2022 à 19:33, Christophe Leroy a écrit :
> > >>>
> > >>>
> > >>> Le 28/08/2022 à 11:56, Pali Rohár a écrit :
> > >>>> When CONFIG_TARGET_CPU is specified then pass its value to the compiler
> > >>>> -mcpu option. This fixes following build error when building kernel with
> > >>>> powerpc e500 SPE capable cross compilers:
> > >>>>
> > >>>>       BOOTAS  arch/powerpc/boot/crt0.o
> > >>>>     powerpc-linux-gnuspe-gcc: error: unrecognized argument in option
> > >>>> ‘-mcpu=powerpc’
> > >>>>     powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are:
> > >>>> 8540 8548 native
> > >>>>     make[1]: *** [arch/powerpc/boot/Makefile:231:
> > >>>> arch/powerpc/boot/crt0.o] Error 1
> > >>>
> > >>> corenet64_smp_defconfig :
> > >>>
> > >>>     BOOTAS  arch/powerpc/boot/crt0.o
> > >>> powerpc64-linux-gcc: error: missing argument to '-mcpu='
> > >>> make[1]: *** [arch/powerpc/boot/Makefile:237 : arch/powerpc/boot/crt0.o]
> > >>> Erreur 1
> > >>> make: *** [arch/powerpc/Makefile:253 : uImage] Erreur 2
> > >>>
> > >>>
> > >>
> > >> Seems like in fact, E5500_CPU and E6500_CPU are not taken into account
> > >> in CONFIG_TARGET_CPU, and get special treatment directly in
> > >> arch/powerpc/Makefile.
> > >>
> > >> This goes unnoticed because of CFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=
> > >> $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> > >>
> > >> I think we need to fix that prior to your patch.
> > > 
> > > It looks like that CONFIG_TARGET_CPU is broken.
> > > 
> > >    $ make ARCH=powerpc corenet64_smp_defconfig CROSS_COMPILE=powerpc64-linux-gnu-
> > >    ...
> > >    # configuration written to .config
> > > 
> > >    $ grep CONFIG_TARGET_CPU .config
> > >    CONFIG_TARGET_CPU_BOOL=y
> > > 
> > > CONFIG_TARGET_CPU_BOOL is set but CONFIG_TARGET_CPU not!
> > 
> > Yes, because there is no default value for E5500_CPU and E6500_CPU. We 
> > need to add one for each.
> 
> I see... Will you prepare this fixup for your previous patch?
> 
> And I think that following construct
> 
>   $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> 
> should be changed just to
> 
>   -mcpu=$(CONFIG_TARGET_CPU)
> 
> Because if user specified that want build for specific target CPU, it
> should not be silently ignored.

Christophe, should I do something in this area?
