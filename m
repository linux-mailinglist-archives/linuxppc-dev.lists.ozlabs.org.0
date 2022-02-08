Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 105434AE103
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 19:41:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtX085c6Gz3bcg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 05:41:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G2S7x10M;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JP21Chhn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G2S7x10M; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JP21Chhn; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtWzR5GfWz30LY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 05:40:35 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8DE1D1F387;
 Tue,  8 Feb 2022 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644345630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdw+TI4CIqxgVnyNgubuTkK3R4ZTBSmLHhOkGr2VwbM=;
 b=G2S7x10Mrrf2/Pa/VZkTCIlv7iL0i+FD2NbkgDsTy/GD6Vznw+so0ylyvTh9qrR6r7J93J
 04Ue5FWUdyaq6uRCuCrIoSwIjWj/LQNqtOZKyN/cL79m8zoUd2cQQSWFaHW3YME2Nsl1R1
 /O6De15sOs6wELkTrUGF3GPKQ8cJHsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644345630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdw+TI4CIqxgVnyNgubuTkK3R4ZTBSmLHhOkGr2VwbM=;
 b=JP21ChhnYhMUXNASGjs5KkXOyZc8Vg8hIeeV8nPZmnJizD+KuyALDb9msBVTnWZdZTjGOt
 xeQkzWNQ/EVRJkBA==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 236BDA3B84;
 Tue,  8 Feb 2022 18:40:30 +0000 (UTC)
Date: Tue, 8 Feb 2022 19:40:29 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v3 4/6] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Message-ID: <20220208184029.GB3113@kunlun.suse.cz>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
 <YfsbcXD74BwJ9ci2@bombadil.infradead.org>
 <228849f5-f6a4-eb45-5e1e-a9b3eccb28b3@csgroup.eu>
 <YfwyKR1xFaApWjRb@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YfwyKR1xFaApWjRb@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Aaron Tomlin <atomlin@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Feb 03, 2022 at 11:51:05AM -0800, Luis Chamberlain wrote:
> On Thu, Feb 03, 2022 at 07:05:13AM +0000, Christophe Leroy wrote:
> > Le 03/02/2022 à 01:01, Luis Chamberlain a écrit :
> > > On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote:
> > >> diff --git a/kernel/module.c b/kernel/module.c
> > >> index 11f51e17fb9f..f3758115ebaa 100644
> > >> --- a/kernel/module.c
> > >> +++ b/kernel/module.c
> > >> @@ -81,7 +81,9 @@
> > >>   /* If this is set, the section belongs in the init part of the module */
> > >>   #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
> > >>   
> > >> +#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > >>   #define	data_layout core_layout
> > >> +#endif
> > >>   
> > >>   /*
> > >>    * Mutex protects:
> > >> @@ -111,6 +113,12 @@ static struct mod_tree_root {
> > >>   #define module_addr_min mod_tree.addr_min
> > >>   #define module_addr_max mod_tree.addr_max
> > >>   
> > >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > >> +static struct mod_tree_root mod_data_tree __cacheline_aligned = {
> > >> +	.addr_min = -1UL,
> > >> +};
> > >> +#endif
> > >> +
> > >>   #ifdef CONFIG_MODULES_TREE_LOOKUP
> > >>   
> > >>   /*
> > >> @@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
> > >>   	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
> > >>   	if (mod->init_layout.size)
> > >>   		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
> > >> +
> > >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > >> +	mod->data_layout.mtn.mod = mod;
> > >> +	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
> > >> +#endif
> > > 
> > > 
> > > kernel/ directory has quite a few files, module.c is the second to
> > > largest file, and it has tons of stuff. Aaron is doing work to
> > > split things out to make code easier to read and so that its easier
> > > to review changes. See:
> > > 
> > > https://lkml.kernel.org/r/20220130213214.1042497-1-atomlin@redhat.com
> > > 
> > > I think this is a good patch example which could benefit from that work.
> > > So I'd much prefer to see that work go in first than this, so to see if
> > > we can make the below changes more compartamentalized.
> > > 
> > > Curious, how much testing has been put into this series?
> > 
> > 
> > I tested the change up to (including) patch 4 to verify it doesn't 
> > introduce regression when not using 
> > CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC,
> 
> > Then I tested with patch 5. I first tried with the 'hello world' test 
> > module. After that I loaded several important modules and checked I 
> > didn't get any regression, both with and without STRICT_MODULES_RWX and 
> > I checked the consistency in /proc/vmallocinfo
> >   /proc/modules /sys/class/modules/*
> 
> I wonder if we have a test for STRICT_MODULES_RWX.
> 
> > I also tested with a hacked module_alloc() to force branch trampolines.
> 
> So to verify that reducing these trampolines actually helps on an
> architecture? I wonder if we can generalize this somehow to let archs
> verify such strategies can help.
> 
> I was hoping for a bit more wider testing, like actually users, etc.
> It does not seem like so. So we can get to that by merging this soon
> into modules-next and having this bleed out issues with linux-next.
> We are in good time to do this now.
> 
> The kmod tree has tons of tests:
> 
> https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/
> 
> Can you use that to verify there are no regressions?

openSUSE has the testsuite packaged so it's easy to run on arbitrary
kernel but only on ppc64(le) because there is no ppc there anymore.

So yes, it does not regress Book3S/64 as far as kmod testsuite is
conderned and building s390x non-modular kernel also still worka but
that's not saying much.

Thanks

Michal
