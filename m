Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9467C28D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:46:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NpS0CWDz3fDM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:46:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QrUq5ATj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QrUq5ATj;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NnW12Lwz3bbc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:45:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC90AB819AD;
	Thu, 26 Jan 2023 01:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32671C433D2;
	Thu, 26 Jan 2023 01:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1674697514;
	bh=7RpoJrPZS6SJcilZwJlgfOcy8VI5bDbkm1rwJIiWgGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QrUq5ATjY2oqR+jEAeForg1RvYMYo+bDZxJkpPvGEAQMtF9Wex3AsF6pj45qmjarD
	 FkXgKw35BmzCytgE7GIRGvCG25LoCH1q8w/sqjuafA+hP0s/EWoOXsqZwbktTsZyRq
	 n3OCsv9RwqATlbboWAh4Ya/cfUooerJ2jtkrgbTo=
Date: Wed, 25 Jan 2023 17:45:12 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 3/3] mm, arch: add generic implementation of pfn_valid()
 for FLATMEM
Message-Id: <20230125174512.ce5aed444cc8b8870825d8c2@linux-foundation.org>
In-Reply-To: <20230125190757.22555-4-rppt@kernel.org>
References: <20230125190757.22555-1-rppt@kernel.org>
	<20230125190757.22555-4-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux--csky@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thom
 as Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Jan 2023 21:07:57 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Every architecture that supports FLATMEM memory model defines its own
> version of pfn_valid() that essentially compares a pfn to max_mapnr.
> 
> Use mips/powerpc version implemented as static inline as a generic
> implementation of pfn_valid() and drop its per-architecture definitions

arm allnoconfig:

./include/asm-generic/memory_model.h:23:19: error: static declaration of 'pfn_valid' follows non-static declaration
   23 | static inline int pfn_valid(unsigned long pfn)
      |                   ^~~~~~~~~
./arch/arm/include/asm/page.h:160:12: note: previous declaration of 'pfn_valid' with type 'int(long unsigned int)'
  160 | extern int pfn_valid(unsigned long);
      |            ^~~~~~~~~


I thought of doing

--- a/arch/arm/include/asm/page.h~mm-arch-add-generic-implementation-of-pfn_valid-for-flatmem-fix
+++ a/arch/arm/include/asm/page.h
@@ -156,10 +156,6 @@ extern void copy_page(void *to, const vo
 
 typedef struct page *pgtable_t;
 
-#ifdef CONFIG_HAVE_ARCH_PFN_VALID
-extern int pfn_valid(unsigned long);
-#endif
-
 #include <asm/memory.h>
 
 #endif /* !__ASSEMBLY__ */
_

but I'm seeing a pfn_valid declaration in arch/arc/include/asm/page.h
which might be a problem.

v2, please ;)
