Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B43C6588
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 23:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNxwH1tSFz3bWx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nZTC3gmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nZTC3gmm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNxvm2myyz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 07:38:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CLY69x162347; Mon, 12 Jul 2021 17:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7bzlV/hp3A1AiSAQdb8CLuXZtgsppLlM7yvqUjtaY9o=;
 b=nZTC3gmmdbFmW91xXslTiym6QurefilM+5YHmpBMsU75NcGmHBGtowuffdw6yvq4QXYt
 SuSuRgjYz+Cvwb5h1o8OZoNf9PmOJ/Mjbw72IEGll0DknKdA7WH9RBK7JEbspMmtBWi1
 cTUh6P7dhOUQ0xaxp1QHDdgQswNKoSXFjzTnmAJXxzkm+Hx1eRFgFWYDWBYZSLFHJ2dJ
 /1rns7UbtJmVYfBod/OqKNhIHRQYmkcvIBR0IWDlma9qeVD+ZZuftqCSnWrmuV0ow+7r
 feROOMnMp8tGVnqtTXOePpStKBndjZLlKCHsnZ+6qXyERjhYRBHoXi/xbRKQuIP896lB 6Q== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs2vff8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 17:35:46 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CLRFXb002891;
 Mon, 12 Jul 2021 21:35:45 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 39q36b6651-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 21:35:45 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CLZi6m22217142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 21:35:44 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 329AFAE066;
 Mon, 12 Jul 2021 21:35:44 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41C0AAE068;
 Mon, 12 Jul 2021 21:35:41 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.32.192])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 21:35:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH] KVM: PPC: BookE: Load FP and Altivec state before soft
 enabling IRQs
Date: Mon, 12 Jul 2021 18:35:37 -0300
Message-Id: <20210712213537.2204009-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _n1yD522_VIXXL4NH187qiR5rhwLwcAE
X-Proofpoint-GUID: _n1yD522_VIXXL4NH187qiR5rhwLwcAE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_11:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=700 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120146
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
Cc: mario@locati.it, balaton@eik.bme.hu, mihai.caraman@freescale.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kvmppc_fix_ee_before_entry function sets the IRQ soft mask to
IRQS_ENABLED. This function is called right before loading the guest
FP and Altivec states at kvmppc_handle_exit. This triggers a
WARN_ON(preemptible()) at enable_kernel_fp/altivec when running with
CONFIG_PREEMPT_COUNT=y:

WARNING: CPU: 1 PID: 6585 at .enable_kernel_fp+0x30/0x78
Modules linked in: r8153_ecm cdc_ether usbnet r8152 uio_pdrv_genirq uio
CPU: 1 PID: 6585 Comm: qemu-system-ppc Tainted: G        W         5.12.10_e6500 #1
NIP:  c000000000003ec0 LR: c00000000004fb00 CTR: 0000000000000004
REGS: c0000000b38ab440 TRAP: 0700   Tainted: G        W          (5.12.10_e6500)
MSR:  0000000082023002 <VEC,CE,FP,ME>  CR: 24000208  XER: 00000000
IRQMASK: 0
GPR00: c00000000004fb00 c0000000b38ab6e0 c000000001a4e300 c0000000b3878000
GPR04: 0000000000000010 0000000080000003 0000000000000000 0000000000000000
GPR08: 00000000fe662000 0000000000000001 0000000000000000 0000000000000001
GPR12: 0000000024000208 c00000003ffff8c0 c0000000b3878000 c00000000183eb60
GPR16: 0000000000000000 0000000000000000 c0000000020a8d80 0000000000000001
GPR20: 0000000000000000 c000000001ab1a70 c0000000020a8d80 c0000000020a8d80
GPR24: c00000000183ed48 c0000000017c8ec0 c00000000183eec0 c0000000000b80e0
GPR28: 0000000000000000 00000000000b80e0 0000000000000000 c0000000b3878000
NIP [c000000000003ec0] .enable_kernel_fp+0x30/0x78
LR [c00000000004fb00] .kvmppc_load_guest_fp+0x2c/0x80
Call Trace:
[c0000000b38ab6e0] [c00000000183ed48] rcu_state+0x248/0x400 (unreliable)
[c0000000b38ab750] [c00000000004fb00] .kvmppc_load_guest_fp+0x2c/0x80
[c0000000b38ab7d0] [c000000000050f48] .kvmppc_handle_exit+0x5cc/0x5d8
[c0000000b38ab870] [c000000000053e64] .kvmppc_resume_host+0xcc/0x120
Instruction dump:
7c0802a6 f8010010 f821ff91 e92d0658 81490000 39200000 2c0a0000 40c20014
892d067a 552907fe 7d290034 5529d97e <0b090000> 38602000 4bfffe79 e86d0658

I'm assuming this was an oversight while introducing the call to
kvmppc_load_guest_fp and kvmppc_load_guest_altivec functions from
kvmppc_handle_exit. So this patch moves kvmppc_fix_ee_before_entry to
be again the last thing before exiting kvmppc_handle_exit.

Compile tested only since I don't have a BookE machine.

Fixes: 3efc7da61f6c ("KVM: PPC: Book3E: Increase FPU laziness")
Fixes: 95d80a294b1e ("KVM: PPC: Book3e: Add AltiVec support")
Reported-by: <mario@locati.it>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/booke.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 551b30d84aee..38179c45eb90 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1387,9 +1387,9 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 			r = (s << 2) | RESUME_HOST | (r & RESUME_FLAG_NV);
 		else {
 			/* interrupts now hard-disabled */
-			kvmppc_fix_ee_before_entry();
 			kvmppc_load_guest_fp(vcpu);
 			kvmppc_load_guest_altivec(vcpu);
+			kvmppc_fix_ee_before_entry();
 		}
 	}
 
-- 
2.29.2

