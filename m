Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9A1A3F73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 23:08:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KsX22ZqfzDr9j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 07:08:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KsQv64LFzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 07:03:51 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 910DEAE22;
 Fri, 30 Aug 2019 21:03:48 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 1/6] powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
Date: Fri, 30 Aug 2019 23:03:38 +0200
Message-Id: <e7d1906a3c03e72a09876a3a8da4949a950e2ed8.1567198491.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1567198491.git.msuchanek@suse.de>
References: <cover.1567198491.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Diana Craciun <diana.craciun@nxp.com>, Firoz Khan <firoz.khan@linaro.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This partially reverts commit caf6f9c8a326 ("asm-generic: Remove
unneeded __ARCH_WANT_SYS_LLSEEK macro")

When CONFIG_COMPAT is disabled on ppc64 the kernel does not build.

There is resistance to both removing the llseek syscall from the 64bit
syscall tables and building the llseek interface unconditionally.

Link: https://lore.kernel.org/lkml/20190828151552.GA16855@infradead.org/
Link: https://lore.kernel.org/lkml/20190829214319.498c7de2@naga/

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/unistd.h | 1 +
 fs/read_write.c                   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index b0720c7c3fcf..700fcdac2e3c 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -31,6 +31,7 @@
 #define __ARCH_WANT_SYS_SOCKETCALL
 #define __ARCH_WANT_SYS_FADVISE64
 #define __ARCH_WANT_SYS_GETPGRP
+#define __ARCH_WANT_SYS_LLSEEK
 #define __ARCH_WANT_SYS_NICE
 #define __ARCH_WANT_SYS_OLD_GETRLIMIT
 #define __ARCH_WANT_SYS_OLD_UNAME
diff --git a/fs/read_write.c b/fs/read_write.c
index 5bbf587f5bc1..89aa2701dbeb 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -331,7 +331,8 @@ COMPAT_SYSCALL_DEFINE3(lseek, unsigned int, fd, compat_off_t, offset, unsigned i
 }
 #endif
 
-#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
+#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT) || \
+	defined(__ARCH_WANT_SYS_LLSEEK)
 SYSCALL_DEFINE5(llseek, unsigned int, fd, unsigned long, offset_high,
 		unsigned long, offset_low, loff_t __user *, result,
 		unsigned int, whence)
-- 
2.22.0

