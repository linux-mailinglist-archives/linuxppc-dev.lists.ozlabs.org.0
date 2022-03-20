Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD64E1921
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 01:20:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLdg32Wp6z3bWb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 11:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=G9YOGXFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out2-smtp.messagingengine.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=G9YOGXFF; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLdfL259Nz2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 11:19:20 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A08AD5C0132;
 Sat, 19 Mar 2022 20:19:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 19 Mar 2022 20:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1KWw8iPmqC/RJ7lj8
 bikVFsFdvOQq5BykeGEYNahjAI=; b=G9YOGXFFD8rH6m7jJU0rxRQo0xm5DaVIA
 T6efpmRDOU5869ufb8ywrQFme0UEpieNsl3QPn8SX5u44bdlSxYRy/k1KEURKDTJ
 3h3TJpkw2OQYsUJnQsy27kj3mpIBTHlDb6LUCcLbUzZEO4MItyuI+2azCXbcu7kk
 PaGwejMms6f600QpBvod5yOXcsAvuSbaPGRV6qdmyw7MKT80XOD3uZ4UO/khQEb1
 5bbW0qMmQLsiiOACI56fnzxkJII9DZobUSqWaEYtcstRdcPI5I7yNC3+/OYFYNm4
 CN/yT/LitBc/4bMWKqTJpR0FkNkT0In54cXP8pvEfC9y3vMOGNWLA==
X-ME-Sender: <xms:A3M2Yr-ebUyA8OjINorHIN3nQzkUVA0AfV84FBQ0zAByoC3ihX1u5g>
 <xme:A3M2YntNVknNTmOOdSKjZgXiv69mhIkPRdKalFcJdY0vryoQZWXBQ5OISCUfWvb8i
 nsC1SKkv6PfUkHPLs8>
X-ME-Received: <xmr:A3M2YpDXH9In7taJaLAEHemSmJUPpQ4osXun08WDcEio01l489B9UVtI2rUXnBEZHJg2ahKLm5rEh1nPH1_ZNcYfttY86hlzwSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefledgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:A3M2YneU3fAvXjnjYmbxX5bjLpcZyt2sozfcMySxRf4Q5XonDuRWZQ>
 <xmx:A3M2YgPlsu13AOCVdXtj-Sd_oPkc648STdzKjDkeMXhjZLgfguWwtA>
 <xmx:A3M2YpnQliiUAP_BXm7sTOMymqpIb7aUo57YuqW55oPAdZWTq4HGWA>
 <xmx:BHM2YlpQxfnBibhvu3ibT5ZUEeFIdB5tH1t2qrLdVQkArqFvmnsxAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Mar 2022 20:19:12 -0400 (EDT)
Date: Sun, 20 Mar 2022 11:19:18 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
In-Reply-To: <CAMuHMdVLCX0uPOCQos=cd5Z5pbm-++uVyV-fzMGyPi6oD3+SZw@mail.gmail.com>
Message-ID: <64b6d65-5d5d-23d2-dc8a-c31fc5853349@linux-m68k.org>
References: <cb1828050f8c9ef801b2bdf79eccd6c52afed26b.1647663509.git.fthain@linux-m68k.org>
 <CAMuHMdVLCX0uPOCQos=cd5Z5pbm-++uVyV-fzMGyPi6oD3+SZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 19 Mar 2022, Geert Uytterhoeven wrote:

> On Sat, Mar 19, 2022 at 5:23 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
> > via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
> > via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
> > via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
> > via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
> > drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init':
> > via-pmu-event.c:(.init.text+0x20): undefined reference to `input_allocate_device'
> > via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_register_device'
> > via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_free_device'
> > make[1]: *** [Makefile:1155: vmlinux] Error 1
> > make: *** [Makefile:350: __build_one_by_one] Error 2
> >
> > Don't call into the input subsystem unless CONFIG_INPUT is built-in.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> 
> Thanks for your patch!
> 

Thanks for your review.

> > --- a/drivers/macintosh/Makefile
> > +++ b/drivers/macintosh/Makefile
> > @@ -12,7 +12,10 @@ obj-$(CONFIG_MAC_EMUMOUSEBTN)        += mac_hid.o
> >  obj-$(CONFIG_INPUT_ADBHID)     += adbhid.o
> >  obj-$(CONFIG_ANSLCD)           += ans-lcd.o
> >
> > -obj-$(CONFIG_ADB_PMU)          += via-pmu.o via-pmu-event.o
> > +obj-$(CONFIG_ADB_PMU)          += via-pmu.o
> > +ifeq ($(CONFIG_INPUT), y)
> > +obj-$(CONFIG_ADB_PMU)          += via-pmu-event.o
> > +endif
> 
> Alternatively, you can introduce an invisible Kconfig symbol that
> is y if ADB_PMU && INPUT, to control the build of via-pmu.o.
> 

There is some precent for that (DVB_AV7110_IR, PINCTRL_FALCON, 
DVB_AV7110_IR) in recent code but it's a bit of a stretch.

Adding the new Kconfig symbol would add complexity and it would only get 
used in two places.

I appreciate the general preference for declarative style over imperative. 
But is there a stronger argument against conditionals in Makefiles?

> >  obj-$(CONFIG_ADB_PMU_LED)      += via-pmu-led.o
> >  obj-$(CONFIG_PMAC_BACKLIGHT)   += via-pmu-backlight.o
> >  obj-$(CONFIG_ADB_CUDA)         += via-cuda.o
> > diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
> > index 4b98bc26a94b..55afa6dfa263 100644
> > --- a/drivers/macintosh/via-pmu.c
> > +++ b/drivers/macintosh/via-pmu.c
> > @@ -1457,12 +1457,14 @@ pmu_handle_data(unsigned char *data, int len)
> >                 if (pmu_battery_count)
> >                         query_battery_state();
> >                 pmu_pass_intr(data, len);
> > +#ifdef CONFIG_INPUT
> >                 /* len == 6 is probably a bad check. But how do I
> >                  * know what PMU versions send what events here? */
> >                 if (len == 6) {
> >                         via_pmu_event(PMU_EVT_POWER, !!(data[1]&8));
> >                         via_pmu_event(PMU_EVT_LID, data[1]&1);
> >                 }
> > +#endif
> 
> Additionally, if that new symbol is not enabled, a dummy via_pmu_event()
> can be provided, so you don't need to add an #ifdef to the driver anymore.
> 

Adding a dummy function to be used in only one place seems questionable to 
me. I'm not expecting new call sites to appear outside of that ifdef.

Some of the arguments against ifdefs (reduced test and checker coverage, 
readability harm) don't really apply in this case.
