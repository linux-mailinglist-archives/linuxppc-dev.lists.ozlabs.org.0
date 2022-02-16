Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9B4B91C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 20:51:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzT9v2K2Yz3cCJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 06:51:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=91.221.196.228; helo=mx2.smtp.larsendata.com;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzT9T1gCBz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 06:51:22 +1100 (AEDT)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 36dbd7e5-8f57-11ec-b2df-0050568cd888;
 Wed, 16 Feb 2022 18:35:28 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 10F5F194B3E;
 Wed, 16 Feb 2022 19:35:03 +0100 (CET)
Date: Wed, 16 Feb 2022 19:34:59 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 15/18] sparc64: remove CONFIG_SET_FS support
Message-ID: <Yg1D08+olCSGmnYU@ravnborg.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-16-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-16-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 ardb@kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, shorne@gmail.com, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net, green.hu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd.

On Wed, Feb 16, 2022 at 02:13:29PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> sparc64 uses address space identifiers to differentiate between kernel
> and user space, using ASI_P for kernel threads but ASI_AIUS for normal
> user space, with the option of changing between them.
> 
> As nothing really changes the ASI any more, just hardcode ASI_AIUS
> everywhere. Kernel threads are not allowed to access __user pointers
> anyway.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/sparc/include/asm/processor_64.h   |  4 ----
>  arch/sparc/include/asm/switch_to_64.h   |  4 +---
>  arch/sparc/include/asm/thread_info_64.h |  4 +---
>  arch/sparc/include/asm/uaccess_64.h     | 20 +-------------------
>  arch/sparc/kernel/process_64.c          | 12 ------------
>  arch/sparc/kernel/traps_64.c            |  2 --
>  arch/sparc/lib/NGmemcpy.S               |  3 +--
>  arch/sparc/mm/init_64.c                 |  7 ++++---
>  8 files changed, 8 insertions(+), 48 deletions(-)

I think you somehow missed the Kconfig change, and also the related
sparc32 change which continue to have set_fs() after this patch.


I did not manage to review the patch - as I am too unfamiliar with the
code paths and the set_fs() removal changes.

	Sam
