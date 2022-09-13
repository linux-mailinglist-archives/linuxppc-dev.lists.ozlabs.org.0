Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED2B5B68D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:43:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRb6m5CVTz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:43:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TEPG3cUe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TEPG3cUe;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRb3w3PmQz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:40:44 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D7VQhV025624;
	Tue, 13 Sep 2022 07:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Yxp4XX1gZa8WIJgwfcJosRL1p/mEbcbdnNXRIi1SCdk=;
 b=TEPG3cUepqQJcc6dDAeZQJrI5jOwLuAIIGdgdfGvPl6VgGH6JXQZB7fINT91mGR3RCJx
 2Tg4L5MTlXclOUcfF59cVT7/ekccI25vE/0VrCB6mRBk0GAR9CrxsUD7aaflzYfurc5r
 tIUg5jYwVNH1e0Ae/r6bUSnG9DEy7tdGhgOaW9g7Ab5zN22+OoKA+GAfmIpZA53y310D
 7SmTWELFDqBYacPBR0wJTalagmW+HOl7McrH7/Rp4RHJW6+u+M9FYdzmBocnIKntBNWy
 MtxPdH1lsioH9wHeb7C5O1SGco0c/+UpW6f+UOZVkYMkR4gFwDTw7D9KuTT/aNBetgBZ Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjkrjmax7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:40 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28D5UCje030350;
	Tue, 13 Sep 2022 07:40:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjkrjmawd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D7Z4wA002747;
	Tue, 13 Sep 2022 07:40:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3jgj79kepg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D7eYu230802194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 07:40:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3785BAE045;
	Tue, 13 Sep 2022 07:40:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB5F3AE053;
	Tue, 13 Sep 2022 07:40:32 +0000 (GMT)
Received: from disgoel-ibm-com.in.ibm.com (unknown [9.199.154.114])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 07:40:32 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/4] powerpc/kvm: Remove unused macros from asm-offset
Date: Tue, 13 Sep 2022 13:10:24 +0530
Message-Id: <20220913074025.132160-4-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
References: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WTBya4UHnTnUZ45zvJ-Mpo2VYk2ijjdW
X-Proofpoint-GUID: A9PwWiB_qV-A7Mp9MacrAoyZX4EY9NAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1
support from P7/8 path") moved code path for the kvm guest entry/exit
for p7/8 from aseembly to C. But the patch missed to remove the
asm-offset macro definitions which were used in the assembly files
and now they are un-used. Patch fixes by removing those.

Fixes: fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path")
Signed-off-by: Disha Goel <disgoel@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/asm-offsets.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 88a329d74d23..90235288cc1a 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -430,7 +430,6 @@ int main(void)
 	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
 	OFFSET(VCPU_VPA_DIRTY, kvm_vcpu, arch.vpa.dirty);
 	OFFSET(VCPU_HEIR, kvm_vcpu, arch.emul_inst);
-	OFFSET(VCPU_NESTED, kvm_vcpu, arch.nested);
 	OFFSET(VCPU_CPU, kvm_vcpu, cpu);
 	OFFSET(VCPU_THREAD_CPU, kvm_vcpu, arch.thread_cpu);
 #endif
@@ -447,16 +446,12 @@ int main(void)
 	OFFSET(VCPU_DABRX, kvm_vcpu, arch.dabrx);
 	OFFSET(VCPU_DAWR0, kvm_vcpu, arch.dawr0);
 	OFFSET(VCPU_DAWRX0, kvm_vcpu, arch.dawrx0);
-	OFFSET(VCPU_DAWR1, kvm_vcpu, arch.dawr1);
-	OFFSET(VCPU_DAWRX1, kvm_vcpu, arch.dawrx1);
 	OFFSET(VCPU_CIABR, kvm_vcpu, arch.ciabr);
 	OFFSET(VCPU_HFLAGS, kvm_vcpu, arch.hflags);
 	OFFSET(VCPU_DEC_EXPIRES, kvm_vcpu, arch.dec_expires);
 	OFFSET(VCPU_PENDING_EXC, kvm_vcpu, arch.pending_exceptions);
 	OFFSET(VCPU_CEDED, kvm_vcpu, arch.ceded);
 	OFFSET(VCPU_PRODDED, kvm_vcpu, arch.prodded);
-	OFFSET(VCPU_IRQ_PENDING, kvm_vcpu, arch.irq_pending);
-	OFFSET(VCPU_DBELL_REQ, kvm_vcpu, arch.doorbell_request);
 	OFFSET(VCPU_MMCR, kvm_vcpu, arch.mmcr);
 	OFFSET(VCPU_MMCRA, kvm_vcpu, arch.mmcra);
 	OFFSET(VCPU_MMCRS, kvm_vcpu, arch.mmcrs);
@@ -484,8 +479,6 @@ int main(void)
 	OFFSET(VCPU_TCSCR, kvm_vcpu, arch.tcscr);
 	OFFSET(VCPU_ACOP, kvm_vcpu, arch.acop);
 	OFFSET(VCPU_WORT, kvm_vcpu, arch.wort);
-	OFFSET(VCPU_TID, kvm_vcpu, arch.tid);
-	OFFSET(VCPU_PSSCR, kvm_vcpu, arch.psscr);
 	OFFSET(VCPU_HFSCR, kvm_vcpu, arch.hfscr);
 	OFFSET(VCORE_ENTRY_EXIT, kvmppc_vcore, entry_exit_map);
 	OFFSET(VCORE_IN_GUEST, kvmppc_vcore, in_guest);
@@ -580,8 +573,6 @@ int main(void)
 	HSTATE_FIELD(HSTATE_HWTHREAD_STATE, hwthread_state);
 	HSTATE_FIELD(HSTATE_KVM_VCPU, kvm_vcpu);
 	HSTATE_FIELD(HSTATE_KVM_VCORE, kvm_vcore);
-	HSTATE_FIELD(HSTATE_XIVE_TIMA_PHYS, xive_tima_phys);
-	HSTATE_FIELD(HSTATE_XIVE_TIMA_VIRT, xive_tima_virt);
 	HSTATE_FIELD(HSTATE_HOST_IPI, host_ipi);
 	HSTATE_FIELD(HSTATE_PTID, ptid);
 	HSTATE_FIELD(HSTATE_FAKE_SUSPEND, fake_suspend);
@@ -670,17 +661,6 @@ int main(void)
 	OFFSET(VCPU_HOST_MAS6, kvm_vcpu, arch.host_mas6);
 #endif
 
-#ifdef CONFIG_KVM_XICS
-	DEFINE(VCPU_XIVE_SAVED_STATE, offsetof(struct kvm_vcpu,
-					       arch.xive_saved_state));
-	DEFINE(VCPU_XIVE_CAM_WORD, offsetof(struct kvm_vcpu,
-					    arch.xive_cam_word));
-	DEFINE(VCPU_XIVE_PUSHED, offsetof(struct kvm_vcpu, arch.xive_pushed));
-	DEFINE(VCPU_XIVE_ESC_ON, offsetof(struct kvm_vcpu, arch.xive_esc_on));
-	DEFINE(VCPU_XIVE_ESC_RADDR, offsetof(struct kvm_vcpu, arch.xive_esc_raddr));
-	DEFINE(VCPU_XIVE_ESC_VADDR, offsetof(struct kvm_vcpu, arch.xive_esc_vaddr));
-#endif
-
 #ifdef CONFIG_KVM_EXIT_TIMING
 	OFFSET(VCPU_TIMING_EXIT_TBU, kvm_vcpu, arch.timing_exit.tv32.tbu);
 	OFFSET(VCPU_TIMING_EXIT_TBL, kvm_vcpu, arch.timing_exit.tv32.tbl);
-- 
2.31.1

