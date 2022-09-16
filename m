Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E75BABD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 12:59:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTWKV2QbGz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 20:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hCOjmJhJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hCOjmJhJ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTWJ66Gzqz2yxX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 20:57:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GAL07k012976;
	Fri, 16 Sep 2022 10:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=R/cnsHDcDwV8I69X4b/+VFcHvPKq2A9XZfNOu/ZfI4E=;
 b=hCOjmJhJtegjBW4jaCrijClTalAp37aT5KV+IE7OLWoeym2fC9cbviv798EaCocRacxf
 vbkf8VAS1Kiytwyirk2vp1zYDhaIYOHFR6MMOp5ReH90BKIWo0vZPegkQLi14q/+FDwH
 K37LwckyAwk9bgX6uefk1MTHs2o//s2JDORTDR/7GDPP9mYq929ttDya1qe7KM0oydVz
 ghnWZAXMehtPvkgIESeJLXKiJ6988frQjQec/MBRkf3zxaOnoB6Yi0RZpEvQB8UU5+hQ
 cGXGFooqyBChvt3kxFcI2z00Jf9qr12IBd4gflv+NJK1x5QtmWG25LWJcMs9eoZQLYAH JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqahgxwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:52 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GAM8Xi015633;
	Fri, 16 Sep 2022 10:57:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqahgxvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GAqeUr023579;
	Fri, 16 Sep 2022 10:57:50 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jm91p0n7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GAvl3f41681192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 10:57:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3420FA4051;
	Fri, 16 Sep 2022 10:57:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FFF0A404D;
	Fri, 16 Sep 2022 10:57:44 +0000 (GMT)
Received: from disgoel-ibm-com.ibm.com (unknown [9.43.57.26])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 10:57:43 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc/kvm: Remove unused macros from asm-offset
Date: Fri, 16 Sep 2022 16:27:35 +0530
Message-Id: <20220916105736.268153-2-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
References: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3CulkLLmH6yDUy7BTp4SqJvbSxrLq8Vy
X-Proofpoint-ORIG-GUID: _Fz4cbaOztPWIpnhy1fxZLMKh8BVQOEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160077
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

The kvm code was refactored to convert some of kvm assembly routines to C.
This includes commits which moved code path for the kvm guest entry/exit
for p7/8 from aseembly to C. As part of the code changes, usage of some of
the macros were removed. But definitions still exist in the assembly files.
Commits are listed below:

Commit 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling MMU")
Commit 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path")
Commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path")
Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore in C")

Many of the asm-offset macro definitions were missed to remove. Patch
fixes by removing the unused macros.

Signed-off-by: Disha Goel <disgoel@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/asm-offsets.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8c10f536e478..95744e7c056d 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -418,21 +418,18 @@ int main(void)
 
 	/* book3s */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	OFFSET(KVM_TLB_SETS, kvm, arch.tlb_sets);
 	OFFSET(KVM_SDR1, kvm, arch.sdr1);
 	OFFSET(KVM_HOST_LPID, kvm, arch.host_lpid);
 	OFFSET(KVM_HOST_LPCR, kvm, arch.host_lpcr);
 	OFFSET(KVM_HOST_SDR1, kvm, arch.host_sdr1);
 	OFFSET(KVM_ENABLED_HCALLS, kvm, arch.enabled_hcalls);
 	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
-	OFFSET(KVM_RADIX, kvm, arch.radix);
 	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
 	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
 	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
 	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
 	OFFSET(VCPU_VPA_DIRTY, kvm_vcpu, arch.vpa.dirty);
 	OFFSET(VCPU_HEIR, kvm_vcpu, arch.emul_inst);
-	OFFSET(VCPU_NESTED, kvm_vcpu, arch.nested);
 	OFFSET(VCPU_CPU, kvm_vcpu, cpu);
 	OFFSET(VCPU_THREAD_CPU, kvm_vcpu, arch.thread_cpu);
 #endif
@@ -449,16 +446,12 @@ int main(void)
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
@@ -486,8 +479,6 @@ int main(void)
 	OFFSET(VCPU_TCSCR, kvm_vcpu, arch.tcscr);
 	OFFSET(VCPU_ACOP, kvm_vcpu, arch.acop);
 	OFFSET(VCPU_WORT, kvm_vcpu, arch.wort);
-	OFFSET(VCPU_TID, kvm_vcpu, arch.tid);
-	OFFSET(VCPU_PSSCR, kvm_vcpu, arch.psscr);
 	OFFSET(VCPU_HFSCR, kvm_vcpu, arch.hfscr);
 	OFFSET(VCORE_ENTRY_EXIT, kvmppc_vcore, entry_exit_map);
 	OFFSET(VCORE_IN_GUEST, kvmppc_vcore, in_guest);
@@ -582,8 +573,6 @@ int main(void)
 	HSTATE_FIELD(HSTATE_HWTHREAD_STATE, hwthread_state);
 	HSTATE_FIELD(HSTATE_KVM_VCPU, kvm_vcpu);
 	HSTATE_FIELD(HSTATE_KVM_VCORE, kvm_vcore);
-	HSTATE_FIELD(HSTATE_XIVE_TIMA_PHYS, xive_tima_phys);
-	HSTATE_FIELD(HSTATE_XIVE_TIMA_VIRT, xive_tima_virt);
 	HSTATE_FIELD(HSTATE_HOST_IPI, host_ipi);
 	HSTATE_FIELD(HSTATE_PTID, ptid);
 	HSTATE_FIELD(HSTATE_FAKE_SUSPEND, fake_suspend);
@@ -594,9 +583,6 @@ int main(void)
 	HSTATE_FIELD(HSTATE_SDAR, host_mmcr[4]);
 	HSTATE_FIELD(HSTATE_MMCR2, host_mmcr[5]);
 	HSTATE_FIELD(HSTATE_SIER, host_mmcr[6]);
-	HSTATE_FIELD(HSTATE_MMCR3, host_mmcr[7]);
-	HSTATE_FIELD(HSTATE_SIER2, host_mmcr[8]);
-	HSTATE_FIELD(HSTATE_SIER3, host_mmcr[9]);
 	HSTATE_FIELD(HSTATE_PMC1, host_pmc[0]);
 	HSTATE_FIELD(HSTATE_PMC2, host_pmc[1]);
 	HSTATE_FIELD(HSTATE_PMC3, host_pmc[2]);
@@ -672,17 +658,6 @@ int main(void)
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

