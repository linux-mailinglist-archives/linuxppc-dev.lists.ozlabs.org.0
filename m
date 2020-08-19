Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D271224A7FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 22:51:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX0Lf325tzDr09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 06:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=EDED5GsJ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX0J13yXtzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 06:49:05 +1000 (AEST)
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4559022B43;
 Wed, 19 Aug 2020 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597870143;
 bh=qGoMJNQU47bi4Lr27Xvnh0/Sq60m3eAX4xqpvHpl7z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDED5GsJw4zUuBdGb05pEvujvo8C6rUQNmDr6tFajHgKyq8u0aC1JhmrGGKixlNzr
 iJK0JwajiHl4HBTkAxVXhkjy+fJ4SSitgCYA/knE1HAPx9DykSi5zvv7ufmh3aqaBj
 /RQUWYvoEHKL6x5oDDNaW/gHGb6Yyk2UI/DMzVR8=
Date: Wed, 19 Aug 2020 23:48:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 09/17] memblock: make memblock_debug and related
 functionality private
Message-ID: <20200819204848.GX752365@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-10-rppt@kernel.org>
 <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 19, 2020 at 12:24:05PM -0700, Andrew Morton wrote:
> On Tue, 18 Aug 2020 18:16:26 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The only user of memblock_dbg() outside memblock was s390 setup code and it
> > is converted to use pr_debug() instead.
> > This allows to stop exposing memblock_debug and memblock_dbg() to the rest
> > of the kernel.
> > 
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -137,7 +137,10 @@ struct memblock_type physmem = {
> >  	     i < memblock_type->cnt;					\
> >  	     i++, rgn = &memblock_type->regions[i])
> >  
> > -int memblock_debug __initdata_memblock;
> > +#define memblock_dbg(fmt, ...) \
> > +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> > +
> 
> checkpatch doesn't like this much.
> 
> ERROR: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
> #101: FILE: mm/memblock.c:140:
> +#define memblock_dbg(fmt, ...) \
> +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> 
> WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
> #102: FILE: mm/memblock.c:141:
> +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> 
> ERROR: trailing statements should be on next line
> #102: FILE: mm/memblock.c:141:
> +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> 
> 
> The first one is significant:
> 
> 	if (foo)
> 		memblock_dbg(...);
> 	else
> 		save_the_world();
> 
> could end up inadvertently destroying the planet.

Well, it didn't till now ;-)

> This?
> 
> --- a/mm/memblock.c~memblock-make-memblock_debug-and-related-functionality-private-fix
> +++ a/mm/memblock.c
> @@ -137,8 +137,11 @@ struct memblock_type physmem = {
>  	     i < memblock_type->cnt;					\
>  	     i++, rgn = &memblock_type->regions[i])
>  
> -#define memblock_dbg(fmt, ...) \
> -	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> +#define memblock_dbg(fmt, ...)						\
> +	do {								\
> +		if (memblock_debug)					\
> +			pr_info(fmt, ##__VA_ARGS__);			\
> +	} while (0)

Sure, thanks!

>  static int memblock_debug __initdata_memblock;
>  static bool system_has_some_mirror __initdata_memblock = false;
> _
> 

-- 
Sincerely yours,
Mike.
