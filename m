Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FDB1E9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 15:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VGNX1GHZzF44V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 23:15:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VG064JkvzF5VP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 22:58:14 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 716FCAFB6;
 Fri, 13 Sep 2019 12:58:11 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 4/8] powerpc/perf: consolidate valid_user_sp
Date: Fri, 13 Sep 2019 14:57:58 +0200
Message-Id: <6429623dfb3f92e45c9d403194e16943eb51da79.1568319275.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568319275.git.msuchanek@suse.de>
References: <cover.1568319275.git.msuchanek@suse.de>
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

Merge the 32bit and 64bit version.

Halve the check constants on 32bit.

Use STACK_TOP since it is defined.

This removes a page from the valid 32bit area on 64bit:
 #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
 #define STACK_TOP_USER32 TASK_SIZE_USER32

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v8: new patch
---
 arch/powerpc/perf/callchain.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index d86bdbffda9e..7863ee0a0e69 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -102,6 +102,20 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	}
 }
 
+static inline int valid_user_sp(unsigned long sp, int is_64)
+{
+	unsigned long stack_top;
+
+	if (IS_ENABLED(CONFIG_PPC32))
+		stack_top = STACK_TOP;
+	else    /* STACK_TOP uses is_32bit_task() but we want is_64 */
+		stack_top = is_64 ? STACK_TOP_USER64 : STACK_TOP_USER32;
+
+	if (!sp || (sp & (is_64 ? 7 : 3)) || sp > stack_top - (is_64 ? 32 : 16))
+		return 0;
+	return 1;
+}
+
 #ifdef CONFIG_PPC64
 /*
  * On 64-bit we don't want to invoke hash_page on user addresses from
@@ -165,13 +179,6 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
 	return read_user_stack_slow(ptr, ret, 8);
 }
 
-static inline int valid_user_sp(unsigned long sp, int is_64)
-{
-	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
-		return 0;
-	return 1;
-}
-
 /*
  * 64-bit user processes use the same stack frame for RT and non-RT signals.
  */
@@ -294,13 +301,6 @@ static inline int current_is_64bit(void)
 	return 0;
 }
 
-static inline int valid_user_sp(unsigned long sp, int is_64)
-{
-	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
-		return 0;
-	return 1;
-}
-
 #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
 #define sigcontext32		sigcontext
 #define mcontext32		mcontext
-- 
2.23.0

