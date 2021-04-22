Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA73368315
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR1951FhVz301j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:11:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=kvleFWx7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.43; helo=pv50p00im-hyfv10011601.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=kvleFWx7; dkim-atps=neutral
Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com
 [17.58.6.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR18h0v4sz2yZK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 01:11:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1619104273; bh=M+0qUtqyvLH8bRJU+2RUGsxt0cH8oZQEevTYM/PgVkE=;
 h=From:To:Subject:Date:Message-Id;
 b=kvleFWx7KDAgkBt6ASs8Z9UYSczMSzxbloJ7M+GXxsamVOplCgq4BMmrUcWeiF5sC
 iL4Z8GngBaIDg/t7+AxTUYnh/7lUuG/4u8XGob1nzHvd35Qgnkoxl0ZNd39Grh99f2
 6raCzyDrhb09bTWa3afiWZR76p5jO/yAl+6Tw7GCr/u9qjsIYqEy9FH60x+yN4hQJr
 dS2GmbIHV7hlfCLGuZvA6oto50JHiXZ9MRCzm1/uDA/qZfI35H4csQ/lGrR9oD3Vga
 T0gNOVnanAbmANQp4n0uWEQh63+TQzaIFj51hqgNMdu/xQmB/dNqY646s56EhOe6gD
 92yLAtzAOh3fQ==
Received: from localhost.localdomain (unknown [120.245.2.61])
 by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id 235EE380263;
 Thu, 22 Apr 2021 15:11:08 +0000 (UTC)
From: Xiongwei Song <sxwjean@me.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@csgroup.eu, npiggin@gmail.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, aneesh.kumar@linux.ibm.com,
 0x7f454c46@gmail.com
Subject: [PATCH 1/2] powerpc: Make the code in __show_regs nice-looking
Date: Thu, 22 Apr 2021 23:10:21 +0800
Message-Id: <20210422151022.17868-1-sxwjean@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_06:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=794 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2104220120
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

Create a new function named interrupt_detail_printable to judge which
interrupts can print esr/dsisr register.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/kernel/process.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..5c3830837f3a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1453,9 +1453,23 @@ static void print_msr_bits(unsigned long val)
 #define REGS_PER_LINE	8
 #endif
 
+static bool interrupt_detail_printable(int trap)
+{
+	switch (trap) {
+	case INTERRUPT_MACHINE_CHECK:
+	case INTERRUPT_DATA_STORAGE:
+	case INTERRUPT_ALIGNMENT:
+		return true;
+	default:
+		return false;
+	}
+
+	return false;
+}
+
 static void __show_regs(struct pt_regs *regs)
 {
-	int i, trap;
+	int i;
 
 	printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
 	       regs->nip, regs->link, regs->ctr);
@@ -1464,12 +1478,9 @@ static void __show_regs(struct pt_regs *regs)
 	printk("MSR:  "REG" ", regs->msr);
 	print_msr_bits(regs->msr);
 	pr_cont("  CR: %08lx  XER: %08lx\n", regs->ccr, regs->xer);
-	trap = TRAP(regs);
 	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
-	if (trap == INTERRUPT_MACHINE_CHECK ||
-	    trap == INTERRUPT_DATA_STORAGE ||
-	    trap == INTERRUPT_ALIGNMENT) {
+	if (interrupt_detail_printable(TRAP(regs))) {
 		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
 			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
 		else
-- 
2.17.1

