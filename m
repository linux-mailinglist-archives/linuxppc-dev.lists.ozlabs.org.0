Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF2E4C642A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:57:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Xlw0fNdz30QX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+qXmkrL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h+qXmkrL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6XlD0Rqkz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:56:39 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6hTG1004549; 
 Mon, 28 Feb 2022 07:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yQfcjeiaceKsLYpz64u0kTOkTtpa5ykAu1EIHUSjraw=;
 b=h+qXmkrLqwTrBQijXepAzrIn86hJ0AQ6HmPaUvMh1ghxUKRFh8WF8jBStnRRmmGKOAVX
 zm7rXUI6baKkY9dnoIwzf89b5BjiGa8atMxl8Jt+UbCWPZESliFsXYjBR3PMMm5n1kks
 jiQh/4ANFQEvuo88r6SPh6SGzIm1MDvePG/EnGlmhKuD4ot5+pyFFiEWA4DYUNxPszeA
 8ssY/LbHLQbYSXr6QGuLsqgXiSSAB0xmy6QPSfrhav1TYL9UxwcVnjqSPXwjS2WeBBby
 6BzkX6oliHT0W1irGPlMGav1UIabNXvcqbFj8v1Xe6iOP/Y09ep0J3+69rPoVcI26ia0 Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egscj1ets-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:56:36 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7BHuV008929;
 Mon, 28 Feb 2022 07:56:36 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egscj1eru-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:56:35 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7HV3e023533;
 Mon, 28 Feb 2022 07:36:21 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3efbu99uy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:36:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7aJIO23462366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:36:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13986C6063;
 Mon, 28 Feb 2022 07:36:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD0F1C605D;
 Mon, 28 Feb 2022 07:36:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:36:17 +0000 (GMT)
Message-ID: <d759aeddcff827dd298436cfb3edc4f2827219b7.camel@linux.ibm.com>
Subject: [PATCH v5 4/9] powerpc/vas: Return paste instruction failure if no
 active window
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:36:16 -0800
In-Reply-To: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
References: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0J3OUsGmrpUpX2Z4pAnAKwod2AfCvlzZ
X-Proofpoint-ORIG-GUID: uK3eypnAMghW_V9Ol-oHVMMihVQG3oDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280043
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
 arch/powerpc/platforms/book3s/vas-api.c | 55 ++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

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
index f359e7b2bf90..f3e421511ea6 100644
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
@@ -408,9 +443,27 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	}
 	mutex_unlock(&txwin->task_ref.mmap_mutex);
 
-	return VM_FAULT_SIGBUS;
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
 
+	return VM_FAULT_SIGBUS;
 }
+
 static const struct vm_operations_struct vas_vm_ops = {
 	.fault = vas_mmap_fault,
 };
-- 
2.27.0


