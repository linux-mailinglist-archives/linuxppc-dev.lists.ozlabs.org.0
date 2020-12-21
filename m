Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891B2DF807
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 04:29:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzlMl32sZzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 14:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=nixiaoming@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzlL26lJhzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 14:28:20 +1100 (AEDT)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CzlJx58Vhz7HpS;
 Mon, 21 Dec 2020 11:27:29 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 11:28:01 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <linux-kernel@vger.kernel.org>, <benh@kernel.crashing.org>,
 <mpe@ellerman.id.au>, <paulus@samba.org>, <linuxppc-dev@lists.ozlabs.org>,
 <yanaijie@huawei.com>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
 <ravi.bangoria@linux.ibm.com>, <mikey@neuling.org>,
 <aneesh.kumar@linux.ibm.com>, <haren@linux.ibm.com>
Subject: [PATCH] powerpc:Don't print raw EIP/LR hex values in dump_stack() and
 show_regs()
Date: Mon, 21 Dec 2020 11:27:58 +0800
Message-ID: <20201221032758.12143-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
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
Cc: wangle6@huawei.com, nixiaoming@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the commit 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR
infrastructure"), the powerpc system is ready to support KASLR.
To reduces the risk of invalidating address randomization, don't print the
EIP/LR hex values in dump_stack() and show_regs().

This patch follows x86 and arm64's lead:
    commit a25ffd3a6302a6 ("arm64: traps: Don't print stack or raw
     PC/LR values in backtraces")
    commit bb5e5ce545f203 ("x86/dumpstack: Remove kernel text
     addresses from stack dump")

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 arch/powerpc/kernel/process.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a66f435dabbf..913cf1ea702e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1455,8 +1455,8 @@ static void __show_regs(struct pt_regs *regs)
 {
 	int i, trap;
 
-	printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
-	       regs->nip, regs->link, regs->ctr);
+	printk("NIP: %pS LR: %pS CTR: "REG"\n",
+	       (void *)regs->nip, (void *)regs->link, regs->ctr);
 	printk("REGS: %px TRAP: %04lx   %s  (%s)\n",
 	       regs, regs->trap, print_tainted(), init_utsname()->release);
 	printk("MSR:  "REG" ", regs->msr);
@@ -1493,8 +1493,8 @@ static void __show_regs(struct pt_regs *regs)
 	 * above info out without failing
 	 */
 	if (IS_ENABLED(CONFIG_KALLSYMS)) {
-		printk("NIP ["REG"] %pS\n", regs->nip, (void *)regs->nip);
-		printk("LR ["REG"] %pS\n", regs->link, (void *)regs->link);
+		printk("NIP %pS\n", (void *)regs->nip);
+		printk("LR %pS\n", (void *)regs->link);
 	}
 }
 
@@ -2160,8 +2160,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
 		newsp = stack[0];
 		ip = stack[STACK_FRAME_LR_SAVE];
 		if (!firstframe || ip != lr) {
-			printk("%s["REG"] ["REG"] %pS",
-				loglvl, sp, ip, (void *)ip);
+			printk("%s ["REG"] %pS",
+				loglvl, sp, (void *)ip);
 			ret_addr = ftrace_graph_ret_addr(current,
 						&ftrace_idx, ip, stack);
 			if (ret_addr != ip)
-- 
2.27.0

