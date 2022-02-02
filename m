Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DF4A7BDE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 00:49:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpz6k0ZCbz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 10:49:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GlERCyG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=GlERCyG3; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpz652VWVz30Pf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 10:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dcnAz8tCoaicOwm8UwBmt1xaDF3i1/7+mqYajUH4SfM=; b=GlERCyG3JxZhciig/yUUTOOt7N
 qDoQxeWCdsfxJmVQC80mVru0TdX48Bwquf6XlXLN6cKFPd0tqQEtcIZ0guQ8UznK2bwgiK+aX9QyM
 tg0vhEoUE314QlaB3x2ldubznkAfUFvaqRGlBG/QV8ADLL/bR5YQyNFHFs74NZqoflXmUEB1yzFcd
 YNQmFeDMhVGvUY3iXOvG302NzsrFECQ0ifrcpwzlnD8zntWf+rWtUqZ7OHGjqOBoNDXrcjiOimMhe
 qlvny4kHhR/csemsRaASlE9jSggbTVPgM++bWyxk/ytynA8TPgRCaxKOJNPv7nsTZBYyjju9Y1DWt
 ly8Ba3tQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPMu-00H5lz-Mt; Wed, 02 Feb 2022 23:48:56 +0000
Date: Wed, 2 Feb 2022 15:48:56 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 3/6] modules: Introduce data_layout
Message-ID: <YfsYaDyqrFyVypkv@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <230bfd896f24ca7a9281783aaa8c0ebfebd0bc7e.1643475473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <230bfd896f24ca7a9281783aaa8c0ebfebd0bc7e.1643475473.git.christophe.leroy@csgroup.eu>
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
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 05:02:07PM +0000, Christophe Leroy wrote:
> diff --git a/kernel/module.c b/kernel/module.c
> index 163e32e39064..11f51e17fb9f 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -81,6 +81,8 @@
>  /* If this is set, the section belongs in the init part of the module */
>  #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
>  
> +#define	data_layout core_layout
> +
>  /*
>   * Mutex protects:
>   * 1) List of modules (also safely readable with preempt_disable),
> @@ -2451,7 +2454,10 @@ static void layout_sections(struct module *mod, struct load_info *info)
>  			    || s->sh_entsize != ~0UL
>  			    || module_init_layout_section(sname))
>  				continue;
> -			s->sh_entsize = get_offset(mod, &mod->core_layout.size, s, i);
> +			if (m)
> +				s->sh_entsize = get_offset(mod, &mod->data_layout.size, s, i);
> +			else
> +				s->sh_entsize = get_offset(mod, &mod->core_layout.size, s, i);
>  			pr_debug("\t%s\n", sname);

Huh why is this branching here, given you just used mod->data_layout in
all other areas?

> @@ -3468,6 +3474,8 @@ static int move_module(struct module *mod, struct load_info *info)
>  		if (shdr->sh_entsize & INIT_OFFSET_MASK)
>  			dest = mod->init_layout.base
>  				+ (shdr->sh_entsize & ~INIT_OFFSET_MASK);
> +		else if (!(shdr->sh_flags & SHF_EXECINSTR))
> +			dest = mod->data_layout.base + shdr->sh_entsize;
>  		else
>  			dest = mod->core_layout.base + shdr->sh_entsize;
>  

Likewise here.

  Luis
