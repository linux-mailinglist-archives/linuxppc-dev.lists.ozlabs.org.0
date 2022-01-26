Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675C49D49A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 22:37:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkcW30Yjxz3bZG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:37:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F5N5X4tF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F5N5X4tF; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkcVM2tGYz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 08:36:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9659561926;
 Wed, 26 Jan 2022 21:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F23C340E8;
 Wed, 26 Jan 2022 21:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643232984;
 bh=qiDwOHAZZYgzMESTLY09sncGjaRqe3P7WUyD63U80QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5N5X4tFYnAPtsQXZdHMR/zZCc9G6WRuaXBfK+Ty5IM/QMwMOdyliX4LBQzikYCRA
 EbxPUMzlBLq5kxn2Lp0cw6skBSXxq8XEgVuf6+lujnGG1XDj3L51N6//5M6Y3QrjOh
 Qjjsvo6HAyuhIFv50e2OCI+NPAASzuQaMml82XCScDEM2tNfWJ8JjwQ0gEcih7/MNY
 JNESyI5BmHohYobkVSEHNReqMQ9KBlDKprBjI8o+gcDWHjkFEduTZaWXpcnWDLvcXp
 mXoALrN0E1bm7oyRxjSzeBe/lgpnyZM+LvvX9slVLLDeANjKEhkqhZJe9x6IunDd7F
 UbXGnOxc8kq6g==
Date: Wed, 26 Jan 2022 23:36:13 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/7] modules: Refactor within_module_core() and
 within_module_init()
Message-ID: <YfG+zVl8aV+UszoE@kernel.org>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <e5e58875bd15551d0386552d3f9fa9ee8bc183a2.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e58875bd15551d0386552d3f9fa9ee8bc183a2.1643015752.git.christophe.leroy@csgroup.eu>
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 24, 2022 at 09:22:15AM +0000, Christophe Leroy wrote:
> within_module_core() and within_module_init() are doing the exact same
> test, one on core_layout, the second on init_layout.
> 
> In preparation of increasing the complexity of that verification,
> refactor it into a single function called within_module_layout().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/module.h | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index c9f1200b2312..33b4db8f5ca5 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -565,18 +565,27 @@ bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr);
>  bool is_module_percpu_address(unsigned long addr);
>  bool is_module_text_address(unsigned long addr);
>  
> +static inline bool within_range(unsigned long addr, void *base, unsigned int size)
> +{
> +	return addr >= (unsigned long)base && addr < (unsigned long)base + size;
> +}

There's also 'within' at least in arch/x86/mm/pat/set_memory.c and surely
tons of open-coded "address within" code.

Should it live in, say, include/linux/range.h?

> +
> +static inline bool within_module_layout(unsigned long addr,
> +					const struct module_layout *layout)
> +{
> +	return within_range(addr, layout->base, layout->size);
> +}
> +
>  static inline bool within_module_core(unsigned long addr,
>  				      const struct module *mod)
>  {
> -	return (unsigned long)mod->core_layout.base <= addr &&
> -	       addr < (unsigned long)mod->core_layout.base + mod->core_layout.size;
> +	return within_module_layout(addr, &mod->core_layout);
>  }
>  
>  static inline bool within_module_init(unsigned long addr,
>  				      const struct module *mod)
>  {
> -	return (unsigned long)mod->init_layout.base <= addr &&
> -	       addr < (unsigned long)mod->init_layout.base + mod->init_layout.size;
> +	return within_module_layout(addr, &mod->init_layout);
>  }
>  
>  static inline bool within_module(unsigned long addr, const struct module *mod)
> -- 
> 2.33.1
> 

-- 
Sincerely yours,
Mike.
