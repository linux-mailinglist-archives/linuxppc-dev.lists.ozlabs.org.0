Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFD18C35F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 23:56:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k2Mz6LbBzDrRy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k2LT0Yz1zDrNk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 09:55:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JMaSuo073128; Thu, 19 Mar 2020 18:55:20 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7adv25a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 18:55:19 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02JMhSsG005508;
 Thu, 19 Mar 2020 22:55:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 2yrpw6uv8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 22:55:19 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02JMtIra54854094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 22:55:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 782D3C605A;
 Thu, 19 Mar 2020 22:55:18 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7E53C6055;
 Thu, 19 Mar 2020 22:55:15 +0000 (GMT)
Received: from farosas.linux.ibm.com.ibmuc.com (unknown [9.85.143.6])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 22:55:15 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Skip kvmppc_uvmem_free if Ultravisor is
 not supported
Date: Thu, 19 Mar 2020 19:55:10 -0300
Message-Id: <20200319225510.945603-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_09:2020-03-19,
 2020-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=3 clxscore=1011 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=486 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003190090
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_uvmem_init checks for Ultravisor support and returns early if
it is not present. Calling kvmppc_uvmem_free at module exit will cause
an Oops:

$ modprobe -r kvm-hv

  Oops: Kernel access of bad area, sig: 11 [#1]
  <snip>
  NIP:  c000000000789e90 LR: c000000000789e8c CTR: c000000000401030
  REGS: c000003fa7bab9a0 TRAP: 0300   Not tainted  (5.6.0-rc6-00033-g6c90b86a745a-dirty)
  MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24002282  XER: 00000000
  CFAR: c000000000dae880 DAR: 0000000000000008 DSISR: 40000000 IRQMASK: 1
  GPR00: c000000000789e8c c000003fa7babc30 c0000000016fe500 0000000000000000
  GPR04: 0000000000000000 0000000000000006 0000000000000000 c000003faf205c00
  GPR08: 0000000000000000 0000000000000001 000000008000002d c00800000ddde140
  GPR12: c000000000401030 c000003ffffd9080 0000000000000001 0000000000000000
  GPR16: 0000000000000000 0000000000000000 000000013aad0074 000000013aaac978
  GPR20: 000000013aad0070 0000000000000000 00007fffd1b37158 0000000000000000
  GPR24: 000000014fef0d58 0000000000000000 000000014fef0cf0 0000000000000001
  GPR28: 0000000000000000 0000000000000000 c0000000018b2a60 0000000000000000
  NIP [c000000000789e90] percpu_ref_kill_and_confirm+0x40/0x170
  LR [c000000000789e8c] percpu_ref_kill_and_confirm+0x3c/0x170
  Call Trace:
  [c000003fa7babc30] [c000003faf2064d4] 0xc000003faf2064d4 (unreliable)
  [c000003fa7babcb0] [c000000000400e8c] dev_pagemap_kill+0x6c/0x80
  [c000003fa7babcd0] [c000000000401064] memunmap_pages+0x34/0x2f0
  [c000003fa7babd50] [c00800000dddd548] kvmppc_uvmem_free+0x30/0x80 [kvm_hv]
  [c000003fa7babd80] [c00800000ddcef18] kvmppc_book3s_exit_hv+0x20/0x78 [kvm_hv]
  [c000003fa7babda0] [c0000000002084d0] sys_delete_module+0x1d0/0x2c0
  [c000003fa7babe20] [c00000000000b9d0] system_call+0x5c/0x68
  Instruction dump:
  3fc2001b fb81ffe0 fba1ffe8 fbe1fff8 7c7f1b78 7c9c2378 3bde4560 7fc3f378
  f8010010 f821ff81 486249a1 60000000 <e93f0008> 7c7d1b78 712a0002 40820084
  ---[ end trace 5774ef4dc2c98279 ]---

So this patch checks if kvmppc_uvmem_init actually allocated anything
before running kvmppc_uvmem_free.

Fixes: ca9f4942670c ("KVM: PPC: Book3S HV: Support for running secure guests")
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 79b1202b1c62..9d26614b2a77 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -806,6 +806,9 @@ int kvmppc_uvmem_init(void)
 
 void kvmppc_uvmem_free(void)
 {
+	if (!kvmppc_uvmem_bitmap)
+		return;
+
 	memunmap_pages(&kvmppc_uvmem_pgmap);
 	release_mem_region(kvmppc_uvmem_pgmap.res.start,
 			   resource_size(&kvmppc_uvmem_pgmap.res));
-- 
2.23.0

