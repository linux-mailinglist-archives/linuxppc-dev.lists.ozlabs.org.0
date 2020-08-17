Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC54245EA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:00:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVRKg51JHzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVQtS1MJYzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:39:59 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F018D68B05; Mon, 17 Aug 2020 09:39:53 +0200 (CEST)
Date: Mon, 17 Aug 2020 09:39:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc
Message-ID: <20200817073953.GA14500@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding Linus as I forgot to add him to the patch bomb, sorry..

On Mon, Aug 17, 2020 at 09:32:01AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series removes the last set_fs() used to force a kernel address
> space for the uaccess code in the kernel read/write/splice code, and then
> stops implementing the address space overrides entirely for x86 and
> powerpc.
> 
> The file system part has been posted a few times, and the read/write side
> has been pretty much unchanced.  For splice this series drops the
> conversion of the seq_file and sysctl code to the iter ops, and thus loses
> the splice support for them.  The reasons for that is that it caused a lot
> of churn for not much use - splice for these small files really isn't much
> of a win, even if existing userspace uses it.  All callers I found do the
> proper fallback, but if this turns out to be an issue the conversion can
> be resurrected.
> 
> Besides x86 and powerpc I plan to eventually convert all other
> architectures, although this will be a slow process, starting with the
> easier ones once the infrastructure is merged.  The process to convert
> architectures is roughtly:
> 
>  - ensure there is no set_fs(KERNEL_DS) left in arch specific code
>  - implement __get_kernel_nofault and __put_kernel_nofault
>  - remove the arch specific address limitation functionality
> 
> Diffstat:
>  arch/Kconfig                           |    3 
>  arch/alpha/Kconfig                     |    1 
>  arch/arc/Kconfig                       |    1 
>  arch/arm/Kconfig                       |    1 
>  arch/arm64/Kconfig                     |    1 
>  arch/c6x/Kconfig                       |    1 
>  arch/csky/Kconfig                      |    1 
>  arch/h8300/Kconfig                     |    1 
>  arch/hexagon/Kconfig                   |    1 
>  arch/ia64/Kconfig                      |    1 
>  arch/m68k/Kconfig                      |    1 
>  arch/microblaze/Kconfig                |    1 
>  arch/mips/Kconfig                      |    1 
>  arch/nds32/Kconfig                     |    1 
>  arch/nios2/Kconfig                     |    1 
>  arch/openrisc/Kconfig                  |    1 
>  arch/parisc/Kconfig                    |    1 
>  arch/powerpc/include/asm/processor.h   |    7 -
>  arch/powerpc/include/asm/thread_info.h |    5 -
>  arch/powerpc/include/asm/uaccess.h     |   78 ++++++++-----------
>  arch/powerpc/kernel/signal.c           |    3 
>  arch/powerpc/lib/sstep.c               |    6 -
>  arch/riscv/Kconfig                     |    1 
>  arch/s390/Kconfig                      |    1 
>  arch/sh/Kconfig                        |    1 
>  arch/sparc/Kconfig                     |    1 
>  arch/um/Kconfig                        |    1 
>  arch/x86/ia32/ia32_aout.c              |    1 
>  arch/x86/include/asm/page_32_types.h   |   11 ++
>  arch/x86/include/asm/page_64_types.h   |   38 +++++++++
>  arch/x86/include/asm/processor.h       |   60 ---------------
>  arch/x86/include/asm/thread_info.h     |    2 
>  arch/x86/include/asm/uaccess.h         |   26 ------
>  arch/x86/kernel/asm-offsets.c          |    3 
>  arch/x86/lib/getuser.S                 |   28 ++++---
>  arch/x86/lib/putuser.S                 |   21 +++--
>  arch/xtensa/Kconfig                    |    1 
>  drivers/char/mem.c                     |   16 ----
>  drivers/misc/lkdtm/bugs.c              |    2 
>  drivers/misc/lkdtm/core.c              |    4 +
>  drivers/misc/lkdtm/usercopy.c          |    2 
>  fs/read_write.c                        |   69 ++++++++++-------
>  fs/splice.c                            |  130 +++------------------------------
>  include/linux/fs.h                     |    2 
>  include/linux/uaccess.h                |   18 ++++
>  lib/test_bitmap.c                      |   10 ++
>  46 files changed, 235 insertions(+), 332 deletions(-)
---end quoted text---
