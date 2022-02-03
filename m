Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D523E4A8CBD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 20:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqTp74ZwHz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 06:51:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EERLXhvv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=EERLXhvv; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqTnR0Mlkz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 06:51:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=ft7cClkc6vBpNUXHJ0m3xjhOU7udO/ZG3yRM4g1vYT4=; b=EERLXhvvt+cUvphZ6I2kMdQwAc
 gjUUegQLCgS6JEACSczf7sBm1sx0ciVihEcBEg6gWVwkeuOFzmzWE1IIcpdMUUXszGrQuqLXGzihh
 LeMchQTAwicUQZfUfwK2iMpfkQkiMsn3DWsB1QiR74LXTelFtBWOg1RxqQpd9mrtJf6TSXko8SokG
 LDqGoCCTv/a3N84VLojdahz+Az++nC/dlh+pCXF7cvWQr73/CSO//N38EjPDx8WMmQQ8IX57cCbyh
 eJKVSWYNzH5Z7YDCP3hNbckQeEzhtIKKnUKhBOPdzT69CFjUx+fIyWUbbataKpfPiqQS+5XJN4joB
 +evkUpRQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFi8H-002dkz-Se; Thu, 03 Feb 2022 19:51:05 +0000
Date: Thu, 3 Feb 2022 11:51:05 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Aaron Tomlin <atomlin@redhat.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v3 4/6] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Message-ID: <YfwyKR1xFaApWjRb@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
 <YfsbcXD74BwJ9ci2@bombadil.infradead.org>
 <228849f5-f6a4-eb45-5e1e-a9b3eccb28b3@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <228849f5-f6a4-eb45-5e1e-a9b3eccb28b3@csgroup.eu>
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
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Aaron Tomlin <atomlin@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 03, 2022 at 07:05:13AM +0000, Christophe Leroy wrote:
> 
> 
> Le 03/02/2022 à 01:01, Luis Chamberlain a écrit :
> > On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote:
> >> diff --git a/kernel/module.c b/kernel/module.c
> >> index 11f51e17fb9f..f3758115ebaa 100644
> >> --- a/kernel/module.c
> >> +++ b/kernel/module.c
> >> @@ -81,7 +81,9 @@
> >>   /* If this is set, the section belongs in the init part of the module */
> >>   #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
> >>   
> >> +#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> >>   #define	data_layout core_layout
> >> +#endif
> >>   
> >>   /*
> >>    * Mutex protects:
> >> @@ -111,6 +113,12 @@ static struct mod_tree_root {
> >>   #define module_addr_min mod_tree.addr_min
> >>   #define module_addr_max mod_tree.addr_max
> >>   
> >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> >> +static struct mod_tree_root mod_data_tree __cacheline_aligned = {
> >> +	.addr_min = -1UL,
> >> +};
> >> +#endif
> >> +
> >>   #ifdef CONFIG_MODULES_TREE_LOOKUP
> >>   
> >>   /*
> >> @@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
> >>   	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
> >>   	if (mod->init_layout.size)
> >>   		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
> >> +
> >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> >> +	mod->data_layout.mtn.mod = mod;
> >> +	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
> >> +#endif
> > 
> > 
> > kernel/ directory has quite a few files, module.c is the second to
> > largest file, and it has tons of stuff. Aaron is doing work to
> > split things out to make code easier to read and so that its easier
> > to review changes. See:
> > 
> > https://lkml.kernel.org/r/20220130213214.1042497-1-atomlin@redhat.com
> > 
> > I think this is a good patch example which could benefit from that work.
> > So I'd much prefer to see that work go in first than this, so to see if
> > we can make the below changes more compartamentalized.
> > 
> > Curious, how much testing has been put into this series?
> 
> 
> I tested the change up to (including) patch 4 to verify it doesn't 
> introduce regression when not using 
> CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC,

> Then I tested with patch 5. I first tried with the 'hello world' test 
> module. After that I loaded several important modules and checked I 
> didn't get any regression, both with and without STRICT_MODULES_RWX and 
> I checked the consistency in /proc/vmallocinfo
>   /proc/modules /sys/class/modules/*

I wonder if we have a test for STRICT_MODULES_RWX.

> I also tested with a hacked module_alloc() to force branch trampolines.

So to verify that reducing these trampolines actually helps on an
architecture? I wonder if we can generalize this somehow to let archs
verify such strategies can help.

I was hoping for a bit more wider testing, like actually users, etc.
It does not seem like so. So we can get to that by merging this soon
into modules-next and having this bleed out issues with linux-next.
We are in good time to do this now.

The kmod tree has tons of tests:

https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/

Can you use that to verify there are no regressions?

Aaron, Michal, if you can do the same that'd be appreciated.


  Luis
