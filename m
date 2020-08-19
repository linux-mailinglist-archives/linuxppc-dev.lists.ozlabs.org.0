Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6F524A6DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 21:25:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWyRv5jvJzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 05:25:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=GeI8lPtK; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWyQ30SxTzDqTM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 05:24:09 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9402E2078D;
 Wed, 19 Aug 2020 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597865047;
 bh=6hhM8PiKqrI8OznN19QgLRQ0zl2av/Rwj0VbHVeg6TI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GeI8lPtKHV2olB+n1d/AHlFuCQdtbzjHW+ZeY/rUdgLakHkOt9wUYAnS0FY5DAaBS
 I2RN/QPVX1NYA77mL4Gju2LBembz/syr0lV3QTr54MfcpA1iUpBgt41tqO0dgw0etA
 mFQuuqulIWY5wbe9fNPxiTsAazhpzTtzhltFAhpw=
Date: Wed, 19 Aug 2020 12:24:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 09/17] memblock: make memblock_debug and related
 functionality private
Message-Id: <20200819122405.88e9719e86ac7c3c44b4db32@linux-foundation.org>
In-Reply-To: <20200818151634.14343-10-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-10-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Aug 2020 18:16:26 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The only user of memblock_dbg() outside memblock was s390 setup code and it
> is converted to use pr_debug() instead.
> This allows to stop exposing memblock_debug and memblock_dbg() to the rest
> of the kernel.
> 
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -137,7 +137,10 @@ struct memblock_type physmem = {
>  	     i < memblock_type->cnt;					\
>  	     i++, rgn = &memblock_type->regions[i])
>  
> -int memblock_debug __initdata_memblock;
> +#define memblock_dbg(fmt, ...) \
> +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> +

checkpatch doesn't like this much.

ERROR: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
#101: FILE: mm/memblock.c:140:
+#define memblock_dbg(fmt, ...) \
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#102: FILE: mm/memblock.c:141:
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)

ERROR: trailing statements should be on next line
#102: FILE: mm/memblock.c:141:
+	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)


The first one is significant:

	if (foo)
		memblock_dbg(...);
	else
		save_the_world();

could end up inadvertently destroying the planet.

This?

--- a/mm/memblock.c~memblock-make-memblock_debug-and-related-functionality-private-fix
+++ a/mm/memblock.c
@@ -137,8 +137,11 @@ struct memblock_type physmem = {
 	     i < memblock_type->cnt;					\
 	     i++, rgn = &memblock_type->regions[i])
 
-#define memblock_dbg(fmt, ...) \
-	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
+#define memblock_dbg(fmt, ...)						\
+	do {								\
+		if (memblock_debug)					\
+			pr_info(fmt, ##__VA_ARGS__);			\
+	} while (0)
 
 static int memblock_debug __initdata_memblock;
 static bool system_has_some_mirror __initdata_memblock = false;
_

