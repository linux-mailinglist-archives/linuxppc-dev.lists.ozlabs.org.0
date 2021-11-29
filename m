Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB60461D22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:55:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tLD22KQz3cTb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:55:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MonLDVfO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MonLDVfO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tHn358yz3dd2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:53:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHG7Np005003; 
 Mon, 29 Nov 2021 17:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=jH3wJREkB6G+7FrcqKJRjvsIpaKpNYaDNz5De/Op/yo=;
 b=MonLDVfOQXDtoUOpRFbdcozWwRfG9woYetKM+R8cFkDFi+bj8FXKJBoHNjJrkEXiYOTb
 velINfvRL2W+Xi8kSY8cLhl0nchmjuP8pKBgUswiF+1zhJun19aVrEI3WTt2gheJpMzn
 OLAQ1PQ6qagYgSnQMJzIcn7g8/zQPBddblYEuCoKpRCwmqqfMkpfUj+l1FOV79ztMmra
 t5w7dbi0ECzBV2xGnrc8UDN87va6OP5fqSstbHEcY/6ZLWGV7L2rMZnYgSpCve1yPZJq
 2pkh1gPqJzPEhjHuOGGtbmGKDKcjQDAniFck9lFx1uNFFX4W1Nu1j7UGOV9fjWz5f56V QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3458wgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:53:21 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHcFDA008706;
 Mon, 29 Nov 2021 17:53:20 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3458wg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:53:20 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhuAb007573;
 Mon, 29 Nov 2021 17:53:19 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3ckcab1tf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:53:19 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHrIxr1901058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:53:18 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 574E4B208D;
 Mon, 29 Nov 2021 17:53:18 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4869CB207F;
 Mon, 29 Nov 2021 17:53:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:53:17 +0000 (GMT)
Message-ID: <481725de02c9b37c736ce0f12757c4a21cf12cf1.camel@linux.ibm.com>
Subject: [PATCH 08/10] powerpc/vas: Return paste instruction failure if no
 active window
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:53:15 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DzoLwVPFG_F86brgq3omqbwa3Y6dD6pD
X-Proofpoint-ORIG-GUID: JivT2uNrcstpi754I5VJ8i1fEShrnSjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290082
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
index baea657bc868..30bb3c0e07f9 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -261,6 +261,8 @@
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


