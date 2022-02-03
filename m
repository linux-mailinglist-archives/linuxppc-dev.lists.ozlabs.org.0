Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F84A7C33
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 01:02:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpzPW0XGsz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 11:02:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQZ8uehu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=TQZ8uehu; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpzP30Y6Jz30RT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 11:01:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yI1c1Z9vXRpl2FDXC3ecyHJ59PiRNE8pG+XB1IRwy/4=; b=TQZ8uehuc4i6CSbxxV4Hj0ILbQ
 uw3bCU6M7RsrnOZIOmmsp709oeCm+Z3nSsimNrWc3/oRZyW22osgVtdoOaTvrbfscuQGVFuMM60Ii
 6qOHhYip+BMTiTYm2hdkuT5e6WmD1I6Q0CLllhHc+vnOoIpcY/XqjE574FMPPOtKGugT46xA16OnN
 0EsxAWAEGTMJknLtKflVSgCGEncWI+ZgffS/Wfsr3V0a8q5rD3jwnQXAiKHiLKoBFi35OGfjjXoBF
 bQ/GbSwbWC5tgN0wkF0k0e5TXQoD60mH38j7QsTCYxZke4Fk4ICP+k1NFqJrS6vX6yNuGjtW1W6VN
 J1Z+D4Gg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPZR-00H7Rx-NH; Thu, 03 Feb 2022 00:01:53 +0000
Date: Wed, 2 Feb 2022 16:01:53 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Aaron Tomlin <atomlin@redhat.com>
Subject: Re: [PATCH v3 4/6] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Message-ID: <YfsbcXD74BwJ9ci2@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
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
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote:
> diff --git a/kernel/module.c b/kernel/module.c
> index 11f51e17fb9f..f3758115ebaa 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -81,7 +81,9 @@
>  /* If this is set, the section belongs in the init part of the module */
>  #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
>  
> +#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
>  #define	data_layout core_layout
> +#endif
>  
>  /*
>   * Mutex protects:
> @@ -111,6 +113,12 @@ static struct mod_tree_root {
>  #define module_addr_min mod_tree.addr_min
>  #define module_addr_max mod_tree.addr_max
>  
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +static struct mod_tree_root mod_data_tree __cacheline_aligned = {
> +	.addr_min = -1UL,
> +};
> +#endif
> +
>  #ifdef CONFIG_MODULES_TREE_LOOKUP
>  
>  /*
> @@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
>  	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
>  	if (mod->init_layout.size)
>  		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
> +
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +	mod->data_layout.mtn.mod = mod;
> +	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
> +#endif


kernel/ directory has quite a few files, module.c is the second to
largest file, and it has tons of stuff. Aaron is doing work to
split things out to make code easier to read and so that its easier
to review changes. See:

https://lkml.kernel.org/r/20220130213214.1042497-1-atomlin@redhat.com

I think this is a good patch example which could benefit from that work.
So I'd much prefer to see that work go in first than this, so to see if
we can make the below changes more compartamentalized.

Curious, how much testing has been put into this series?

  Luis
