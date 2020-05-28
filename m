Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC01E5A60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 10:07:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XgJx45S5zDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 18:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WAsTfDuG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XgH30bVfzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 18:05:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S82kMA040411; Thu, 28 May 2020 04:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BI0HyYjfwUWgWusx5sd+COW5gsMiaMvNSZpimXeLK1M=;
 b=WAsTfDuGkk8zO7Vvo4t66922IJzfzdN0SrgGCbAHTVr3mt4a98iMDzg0QuRJDHKwSHJz
 3us+Z8HsY7vU9L1V4tl4AURzfeEzGC6GLv3inwvcfkROgQ4aOeOiX/pUXguU3a6F7zew
 2BLUthMh+KAszYK7lr+rhQMWJmQHidnxAeeevJtu9zjmnrPIeUhk4p/YrV89q942pqNg
 sjb890/YlrhBLy9VTfSkPpOK8XjbXJncgCrx5xg+8C6qQeL0OvgtHD2lJjxWiZVzuXb3
 sKLKhKeXJgNCpQuGFaqRU7skL51dTiY02MQ/IBJHO6z5Z3SO3vFAJtSAjfM0dDIvS9oJ QA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319swqt65d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 04:05:11 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04S7tJt2022760;
 Thu, 28 May 2020 08:05:10 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 316uf8v03e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 08:05:10 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04S859ZW52691258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 May 2020 08:05:09 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A82D7AE066;
 Thu, 28 May 2020 08:05:09 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA267AE05F;
 Thu, 28 May 2020 08:05:07 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.101.128])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 28 May 2020 08:05:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, paulus@ozlabs.org
Subject: [PATCH] powerpc/book3s64/kvm: Fix secondary page table walk warning
 during migration
Date: Thu, 28 May 2020 13:34:56 +0530
Message-Id: <20200528080456.87797-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_02:2020-05-28,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 cotscore=-2147483648 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005280049
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch fix the below warning reported during migration.

 find_kvm_secondary_pte called with kvm mmu_lock not held
 CPU: 23 PID: 5341 Comm: qemu-system-ppc Tainted: G        W         5.7.0-rc5-kvm-00211-g9ccf10d6d088 #432
 NIP:  c008000000fe848c LR: c008000000fe8488 CTR: 0000000000000000
 REGS: c000001e19f077e0 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-kvm-00211-g9ccf10d6d088)
 MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 42222422  XER: 20040000
 CFAR: c00000000012f5ac IRQMASK: 0
 GPR00: c008000000fe8488 c000001e19f07a70 c008000000ffe200 0000000000000039
 GPR04: 0000000000000001 c000001ffc8b4900 0000000000018840 0000000000000007
 GPR08: 0000000000000003 0000000000000001 0000000000000007 0000000000000001
 GPR12: 0000000000002000 c000001fff6d9400 000000011f884678 00007fff70b70000
 GPR16: 00007fff7137cb90 00007fff7dcb4410 0000000000000001 0000000000000000
 GPR20: 000000000ffe0000 0000000000000000 0000000000000001 0000000000000000
 GPR24: 8000000000000000 0000000000000001 c000001e1f67e600 c000001e1fd82410
 GPR28: 0000000000001000 c000001e2e410000 0000000000000fff 0000000000000ffe
 NIP [c008000000fe848c] kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
 LR [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv]
 Call Trace:
 [c000001e19f07a70] [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv] (unreliable)
 [c000001e19f07b50] [c008000000fd42e4] kvm_vm_ioctl_get_dirty_log_hv+0x33c/0x3c0 [kvm_hv]
 [c000001e19f07be0] [c008000000eea878] kvm_vm_ioctl_get_dirty_log+0x30/0x50 [kvm]
 [c000001e19f07c00] [c008000000edc818] kvm_vm_ioctl+0x2b0/0xc00 [kvm]
 [c000001e19f07d50] [c00000000046e148] ksys_ioctl+0xf8/0x150
 [c000001e19f07da0] [c00000000046e1c8] sys_ioctl+0x28/0x80
 [c000001e19f07dc0] [c00000000003652c] system_call_exception+0x16c/0x240
 [c000001e19f07e20] [c00000000000d070] system_call_common+0xf0/0x278
 Instruction dump:
 7d3a512a 4200ffd0 7ffefb78 4bfffdc4 60000000 3c820000 e8848468 3c620000
 e86384a8 38840010 4800673d e8410018 <0fe00000> 4bfffdd4 60000000 60000000

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  9 ++++++
 arch/powerpc/kvm/book3s_64_mmu_radix.c   | 35 ++++++++++++++++++++----
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index c58e64a0a74f..cd5bad08b8d3 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -635,6 +635,15 @@ extern void kvmhv_remove_nest_rmap_range(struct kvm *kvm,
 				unsigned long gpa, unsigned long hpa,
 				unsigned long nbytes);
 
+static inline pte_t *__find_kvm_secondary_pte(struct kvm *kvm, unsigned long ea,
+					      unsigned *hshift)
+{
+	pte_t *pte;
+
+	pte = __find_linux_pte(kvm->arch.pgtable, ea, NULL, hshift);
+	return pte;
+}
+
 static inline pte_t *find_kvm_secondary_pte(struct kvm *kvm, unsigned long ea,
 					    unsigned *hshift)
 {
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 271f1c3d8443..a328db6a5ef8 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1040,7 +1040,7 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
 {
 	unsigned long gfn = memslot->base_gfn + pagenum;
 	unsigned long gpa = gfn << PAGE_SHIFT;
-	pte_t *ptep;
+	pte_t *ptep, pte;
 	unsigned int shift;
 	int ret = 0;
 	unsigned long old, *rmapp;
@@ -1048,12 +1048,35 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return ret;
 
-	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
-	if (ptep && pte_present(*ptep) && pte_dirty(*ptep)) {
-		ret = 1;
-		if (shift)
-			ret = 1 << (shift - PAGE_SHIFT);
+	/*
+	 * For performance reason we don't hold kvm->mmu_lock
+	 * while walking the partition scoped table.
+	 */
+	ptep = __find_kvm_secondary_pte(kvm, gpa, &shift);
+	if (!ptep)
+		return 0;
+
+	pte = READ_ONCE(*ptep);
+	if (pte_present(pte) && pte_dirty(pte)) {
 		spin_lock(&kvm->mmu_lock);
+		/*
+		 * Recheck the pte again
+		 */
+		if (pte_val(pte) != pte_val(*ptep)) {
+			/*
+			 * We have KVM_MEM_LOG_DIRTY_PAGES enabled. Hence we
+			 * can only find PAGE_SIZE pte entries here. We can
+			 * continue to use the pte addr returned by above
+			 * page table walk.
+			 */
+			if (!pte_present(*ptep) || !pte_dirty(*ptep)) {
+				spin_unlock(&kvm->mmu_lock);
+				return 0;
+			}
+		}
+
+		ret = 1;
+		VM_BUG_ON(shift);
 		old = kvmppc_radix_update_pte(kvm, ptep, _PAGE_DIRTY, 0,
 					      gpa, shift);
 		kvmppc_radix_tlbie_page(kvm, gpa, shift, kvm->arch.lpid);
-- 
2.26.2

