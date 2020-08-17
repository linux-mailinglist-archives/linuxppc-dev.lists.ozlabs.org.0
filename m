Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74813245E52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 09:48:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVR4G25BlzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:48:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1cabf852a0fb828109f5+6203+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=NaImMJ3i; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVQjl1lvmzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:32:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=OPJcXMqpysBuqDGOTGaYk1epWV2KcEsfmdZAVSvmYqU=; b=NaImMJ3i2Uk22oxf8yKOBOEZHz
 4ZW+M65EJDfIjwkIsQcQebMiAsuAI4XOwCL1zSV2MvjYuAwcdRyvhuYqdQt5MXDmUnc8eJ5ylhH7T
 BGEzpwqYG/B8LWEkKZisZa8LemWQFt1VVQw7fLnS3WDE2WesZe+YogShzLVxHfU3/GnL5eiljRyTP
 KhV/i3ahgENq2QTAYk+JreMRiY7QeCxZKrjWnFxghtJFoHgj95bsqjqDhSDiwRhUhiGo6RcXXrgJf
 H8IqTDUygHhgQRZRKAQIk9QmcACRpU1gPJC9aJNgHDCD92ocjGquN1mUT7Cdod2vK37kEu9fKQ3r4
 yvnEyHMw==;
Received: from [2001:4bb8:188:3918:4550:cdf7:3d45:afb9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zcr-0000uo-6f; Mon, 17 Aug 2020 07:32:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: remove the last set_fs() in common code,
 and remove it for x86 and powerpc
Date: Mon, 17 Aug 2020 09:32:01 +0200
Message-Id: <20200817073212.830069-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series removes the last set_fs() used to force a kernel address
space for the uaccess code in the kernel read/write/splice code, and then
stops implementing the address space overrides entirely for x86 and
powerpc.

The file system part has been posted a few times, and the read/write side
has been pretty much unchanced.  For splice this series drops the
conversion of the seq_file and sysctl code to the iter ops, and thus loses
the splice support for them.  The reasons for that is that it caused a lot
of churn for not much use - splice for these small files really isn't much
of a win, even if existing userspace uses it.  All callers I found do the
proper fallback, but if this turns out to be an issue the conversion can
be resurrected.

Besides x86 and powerpc I plan to eventually convert all other
architectures, although this will be a slow process, starting with the
easier ones once the infrastructure is merged.  The process to convert
architectures is roughtly:

 - ensure there is no set_fs(KERNEL_DS) left in arch specific code
 - implement __get_kernel_nofault and __put_kernel_nofault
 - remove the arch specific address limitation functionality

Diffstat:
 arch/Kconfig                           |    3 
 arch/alpha/Kconfig                     |    1 
 arch/arc/Kconfig                       |    1 
 arch/arm/Kconfig                       |    1 
 arch/arm64/Kconfig                     |    1 
 arch/c6x/Kconfig                       |    1 
 arch/csky/Kconfig                      |    1 
 arch/h8300/Kconfig                     |    1 
 arch/hexagon/Kconfig                   |    1 
 arch/ia64/Kconfig                      |    1 
 arch/m68k/Kconfig                      |    1 
 arch/microblaze/Kconfig                |    1 
 arch/mips/Kconfig                      |    1 
 arch/nds32/Kconfig                     |    1 
 arch/nios2/Kconfig                     |    1 
 arch/openrisc/Kconfig                  |    1 
 arch/parisc/Kconfig                    |    1 
 arch/powerpc/include/asm/processor.h   |    7 -
 arch/powerpc/include/asm/thread_info.h |    5 -
 arch/powerpc/include/asm/uaccess.h     |   78 ++++++++-----------
 arch/powerpc/kernel/signal.c           |    3 
 arch/powerpc/lib/sstep.c               |    6 -
 arch/riscv/Kconfig                     |    1 
 arch/s390/Kconfig                      |    1 
 arch/sh/Kconfig                        |    1 
 arch/sparc/Kconfig                     |    1 
 arch/um/Kconfig                        |    1 
 arch/x86/ia32/ia32_aout.c              |    1 
 arch/x86/include/asm/page_32_types.h   |   11 ++
 arch/x86/include/asm/page_64_types.h   |   38 +++++++++
 arch/x86/include/asm/processor.h       |   60 ---------------
 arch/x86/include/asm/thread_info.h     |    2 
 arch/x86/include/asm/uaccess.h         |   26 ------
 arch/x86/kernel/asm-offsets.c          |    3 
 arch/x86/lib/getuser.S                 |   28 ++++---
 arch/x86/lib/putuser.S                 |   21 +++--
 arch/xtensa/Kconfig                    |    1 
 drivers/char/mem.c                     |   16 ----
 drivers/misc/lkdtm/bugs.c              |    2 
 drivers/misc/lkdtm/core.c              |    4 +
 drivers/misc/lkdtm/usercopy.c          |    2 
 fs/read_write.c                        |   69 ++++++++++-------
 fs/splice.c                            |  130 +++------------------------------
 include/linux/fs.h                     |    2 
 include/linux/uaccess.h                |   18 ++++
 lib/test_bitmap.c                      |   10 ++
 46 files changed, 235 insertions(+), 332 deletions(-)
