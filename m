Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315922AD1E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:55:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVhX91GffzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:55:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=115.236.127.1; helo=mail-m1271.qiye.163.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from mail-m1271.qiye.163.com (mail-m1271.qiye.163.com
 [115.236.127.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVhVH0GWbzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:53:41 +1100 (AEDT)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by mail-m1271.qiye.163.com (Hmail) with ESMTPA id 974C2582141;
 Tue, 10 Nov 2020 16:53:36 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>, Wang Qing <wangqing@vivo.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3] sched/rt, powerpc: Prepare for PREEMPT_RT
Date: Tue, 10 Nov 2020 16:53:30 +0800
Message-Id: <1604998411-16116-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHkIYShlOHR1NSU1JVkpNS09CQkNPSkxKQ09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6LBw5Lz8dKxAaHD85PxxL
 LCIwFD1VSlVKTUtPQkJDT0pMTUtDVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFJTEhMNwY+
X-HM-Tid: 0a75b15c4aa298b6kuuu974c2582141
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PREEMPT_RT is a separate preemption model, CONFIG_PREEMPT will
 be disabled when CONFIG_PREEMPT_RT is enabled,  so we need
to add CONFIG_PREEMPT_RT output to __die().

Signed-off-by: Wang Qing <wangqing@vivo.com>

Changes in v3:
 - Fix typo issue.

Changes in v2:
 - Modify as Christophe suggested.
---
 arch/powerpc/kernel/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 5006dcb..dec7b81
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -262,10 +262,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
 {
 	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
 
-	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
+	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
 	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : "",
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
-- 
2.7.4

