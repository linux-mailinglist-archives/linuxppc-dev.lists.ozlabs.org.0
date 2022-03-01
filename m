Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601D4C8038
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:14:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zmX3lKLz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:14:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDloaZz1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XDloaZz1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zlY0tP1z3c42
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:13:28 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2210mTPX011476; 
 Tue, 1 Mar 2022 01:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=MVGTrXHTZU5ipamPHzc+P9vzPB0eo6kv2SFOAZAuOvE=;
 b=XDloaZz16KXkXkL1xjkkYtAJiBhunNE7ucIhmQiR+K46j4iXlofPtYkg54XoQ0gYKQM8
 fk6cbvSYRkZ+lXEM7QqmbdAZuYW8/TcUwvB2IbhQT+t1e7EJLPTeT/APjFK4cFX11RPh
 tTJ6MjMDSms4Rj5RSCZ0QsqfddEgU8LUoJ/3VuYESVgsoyA+W6660ZOPlFELpSGzBJLO
 lbsT2gKiA2jLm0ZJwlGlFP+QXlsujAHLbNTJMwsPwBqzPe4BHpcS2f48ZXtOyCYTR6ZL
 hWKytdYzqmlO5qnqKtZzBMQIqm1VlXeQZGJmh25foLy4Z51VtiJ6HqUH3+YZfUwkXjcW CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh996geb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:13:23 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22110nuR018540;
 Tue, 1 Mar 2022 01:13:23 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh996geau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:13:23 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2210vKvh013547;
 Tue, 1 Mar 2022 01:13:22 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3efbua6ubx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:13:22 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2211DJWG34210194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 01:13:19 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9EFE13605D;
 Tue,  1 Mar 2022 01:13:18 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56F06136059;
 Tue,  1 Mar 2022 01:13:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 01:13:17 +0000 (GMT)
Message-ID: <492b9aefd593061d51dda67ee4d2fc449c000dce.camel@linux.ibm.com>
Subject: [PATCH v6 4/9] powerpc/vas: Return paste instruction failure if no
 active window
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 28 Feb 2022 17:13:15 -0800
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WqG-Y0bw0XplbGK85iY-o0wPBe1hDfi_
X-Proofpoint-ORIG-GUID: p9qPInpNqmin8HsxCC-DBY4nZjhy5byi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010004
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


The VAS window may not be active if the system looses credits and
the NX generates page fault when it receives request on unmap
paste address.

The kernel handles the fault by remap new paste address if the
window is active again, Otherwise return the paste instruction
failure if the executed instruction that caused the fault was
a paste.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h   |  2 +
 arch/powerpc/platforms/book3s/vas-api.c | 54 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 9675303b724e..82f1f0041c6f 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -262,6 +262,8 @@
 #define PPC_INST_MFSPR_PVR		0x7c1f42a6
 #define PPC_INST_MFSPR_PVR_MASK		0xfc1ffffe
 #define PPC_INST_MTMSRD			0x7c000164
+#define PPC_INST_PASTE			0x7c20070d
+#define PPC_INST_PASTE_MASK		0xfc2007ff
 #define PPC_INST_POPCNTB		0x7c0000f4
 #define PPC_INST_POPCNTB_MASK		0xfc0007fe
 #define PPC_INST_RFEBB			0x4c000124
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 217b4a624d09..82f32781c5d2 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -351,6 +351,41 @@ static int coproc_release(struct inode *inode, struct file *fp)
 	return 0;
 }
 
+/*
+ * If the executed instruction that caused the fault was a paste, then
+ * clear regs CR0[EQ], advance NIP, and return 0. Else return error code.
+ */
+static int do_fail_paste(void)
+{
+	struct pt_regs *regs = current->thread.regs;
+	u32 instword;
+
+	if (WARN_ON_ONCE(!regs))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(!user_mode(regs)))
+		return -EINVAL;
+
+	/*
+	 * If we couldn't translate the instruction, the driver should
+	 * return success without handling the fault, it will be retried
+	 * or the instruction fetch will fault.
+	 */
+	if (get_user(instword, (u32 __user *)(regs->nip)))
+		return -EAGAIN;
+
+	/*
+	 * Not a paste instruction, driver may fail the fault.
+	 */
+	if ((instword & PPC_INST_PASTE_MASK) != PPC_INST_PASTE)
+		return -ENOENT;
+
+	regs->ccr &= ~0xe0000000;	/* Clear CR0[0-2] to fail paste */
+	regs_add_return_ip(regs, 4);	/* Emulate the paste */
+
+	return 0;
+}
+
 /*
  * This fault handler is invoked when the core generates page fault on
  * the paste address. Happens if the kernel closes window in hypervisor
@@ -364,6 +399,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	struct vas_window *txwin;
 	vm_fault_t fault;
 	u64 paste_addr;
+	int ret;
 
 	/*
 	 * window is not opened. Shouldn't expect this error.
@@ -408,6 +444,24 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	}
 	mutex_unlock(&txwin->task_ref.mmap_mutex);
 
+	/*
+	 * Received this fault due to closing the actual window.
+	 * It can happen during migration or lost credits.
+	 * Since no mapping, return the paste instruction failure
+	 * to the user space.
+	 */
+	ret = do_fail_paste();
+	/*
+	 * The user space can retry several times until success (needed
+	 * for migration) or should fallback to SW compression or
+	 * manage with the existing open windows if available.
+	 * Looking at sysfs interface, it can determine whether these
+	 * failures are coming during migration or core removal:
+	 * nr_used_credits > nr_total_credits when lost credits
+	 */
+	if (!ret || (ret == -EAGAIN))
+		return VM_FAULT_NOPAGE;
+
 	return VM_FAULT_SIGBUS;
 }
 
-- 
2.27.0


