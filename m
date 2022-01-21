Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F21AE49661F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:00:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVc468hKz3cZ2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 07:00:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FthgYfFu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FthgYfFu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVbK6GkBz30hh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:59:57 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LIIBOX009503; 
 Fri, 21 Jan 2022 19:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=hWHOZu/76pOJWu3VE42BxRBc886SA0+xDkXcIs7V24I=;
 b=FthgYfFuzgY8WguUfRaQ3umlK3/EIgPMJzIJZN+XHRUib0sETnBmB/4V4a4kv7K89MZ9
 8EbjvpI9DV8r2FR3mihWfX9l7hSk5xtR8wy+KUH+iHYMtovWdg4dfYDYr7vuuDcoBRQc
 f9SjjMzcBOgubaxLu5IRURNAREWpiLPN9xtYFFucCGe7WxzEOyMOX13TOL6gcR8NNk/F
 wLUSg75fjXHnOIgA1HWHZyRul3Ut8C8b/72Crsdy/p5QeaMXlObe5UhkyO9QYwZE5VDa
 zz9kiRvvbTZEcIVZiC1sfwfJCuqj6wAgi/7ABM5RgRsYTRZYwUpsX+WYUbJh/VK4Oq1z Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr2001tp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:59:52 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJj9l8009599;
 Fri, 21 Jan 2022 19:59:52 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr2001tnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:59:51 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJq8kg010024;
 Fri, 21 Jan 2022 19:59:51 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3dqj1fa5aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:59:51 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJxorV18415888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:59:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48A7CAC066;
 Fri, 21 Jan 2022 19:59:50 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D163AC05F;
 Fri, 21 Jan 2022 19:59:49 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:59:48 +0000 (GMT)
Message-ID: <854cd12884080c6ac0d21f24502fffed0fae4e8e.camel@linux.ibm.com>
Subject: [PATCH v3 08/10] powerpc/vas: Return paste instruction failure if
 no active window
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:59:46 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y6MZQA_53albvmtllr42Xffr5PjTy0UD
X-Proofpoint-ORIG-GUID: XEvDl2zq4KGY4jfXa76XpAIEMMQ3da3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210127
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
 arch/powerpc/include/asm/ppc-opcode.h   |  2 ++
 arch/powerpc/platforms/book3s/vas-api.c | 47 ++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index efad07081cc0..fe2a69206588 100644
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
index 5ceba75c13eb..2ffd34bc4032 100644
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
+	regs_add_return_ip(regs, 4);	/* Skip the paste */
+
+	return 0;
+}
+
 /*
  * This fault handler is invoked when the VAS/NX generates page fault on
  * the paste address. Happens if the kernel closes window in hypervisor
@@ -403,9 +438,19 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
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
+	if (!ret)
+		return VM_FAULT_NOPAGE;
 
+	return VM_FAULT_SIGBUS;
 }
+
 static const struct vm_operations_struct vas_vm_ops = {
 	.fault = vas_mmap_fault,
 };
-- 
2.27.0


