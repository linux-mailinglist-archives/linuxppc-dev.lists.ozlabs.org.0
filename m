Return-Path: <linuxppc-dev+bounces-2085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CAA999926
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPplp3rBVz3btY;
	Fri, 11 Oct 2024 12:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728583820;
	cv=none; b=RL7JwmUzLKOSElIJ7V0KZLHeIYdMS5YNzeiWxYcsch4BGG8TvzhNYKZBtSZ27YBmy60NjTIrJe5qVHt+ckvIsLsfcCYhxVf6YMlErHPugzo5N1f9+iktQJvT5hHQAFBFe2XDG6++gd5uSrnU6+YzUwMpxvKSXSeCKm3Q+jklVWgv3qWrUwoMfjWwh6Tj68xzHlY7+c5lCf+Y0tcmb87hC/7AfGygVCjzbpUQ3bZWlOyh+5k2KonNDdrS2eH91Y2fYf2yZseDBaeOv6swhwy3XCOQhe7zLVRhmGhGWHBx90Rt1oWoM3+JM+p8nVzaDaj4KmcukyNg3tUFlmxeb13BKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728583820; c=relaxed/relaxed;
	bh=XSLOMZeJ3NIjvSvHyn5fACz57ElPld8gpMM4NGYE+fQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsg3TbfXR6sHrcMViTWVtO3YMFzoq9OUpVyg3wMBm2nDTlR8hYrnJOWA8AdycxY3LqVftW8IIIvr+FrIIRP4y745hgcitsjO1UBRdnjNdI8ene3Rer+BCYGoswbMZ6mGgZzq6vMq+yWTq8RSy/CiLIlfMWaDh1dFUMangZ0vmMyESmnrQCobUs8JuBB90clSDms1hKqR0Ygryzu2QAwFbW52iYfyenZNHs8Bg/MpqIgh55ahpeEJ9e0p9ydijhf6qwpK96oXm/yXmKnA/vCZZdnFRR/CrLJnhYwI1Qop4OV95dQL8KFAaFTYJBJUS7YyxIbJP1CvGs7xwrgFKkWyIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a6oszWzB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a6oszWzB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPd8V4LsCz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:10:18 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AHRpRb017172;
	Thu, 10 Oct 2024 18:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:subject:message-id:mime-version:content-type; s=pp1;
	 bh=XSLOMZeJ3NIjvSvHyn5fACz57ElPld8gpMM4NGYE+fQ=; b=a6oszWzBdeAK
	kitrsRO7MvqL1rL44fcA+uvl0/JmXVrknqaBy6tb1sqlCVNi8ptDzRfUqdAdhOhm
	LP5G2zBAcLlXRuhPcmfwt0/O7M/UNbS4uDDed5ALU4Hb9LX9zMmQEobMQfyd3SZK
	gIt6uUmB8YDm+5c8kC4MkDvAUNo8ZXRpdwWLczx/qBwfC38pZMkypy6wXxptD1ol
	UmB+8oqmjRUr45DsIrZFS01uX82+2uzQl3x9QGDQq5WnSeXN4WZrME5LECh0Tt8y
	aJMrF+1smTYuSSTLIrTSiqPFwbJ94G764SB37U6K1kczRDBAXIkj/zLlcnIRoPvm
	RsT/owZPwA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426kbk05w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:10:05 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49AIA5b0008583;
	Thu, 10 Oct 2024 18:10:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426kbk05w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:10:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49AGCQRU022847;
	Thu, 10 Oct 2024 18:10:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423h9k95q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:10:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49AIA1LJ56951182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 18:10:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7F5120043;
	Thu, 10 Oct 2024 18:10:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0751220040;
	Thu, 10 Oct 2024 18:10:00 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.217.254])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 18:09:59 +0000 (GMT)
Date: Thu, 10 Oct 2024 23:39:57 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC] powerpc/kvm: Fix spinlock member access for PREEMPT_RT
Message-ID: <ZwgYXsCDDwsOBZ4a@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GYbLXmodPTVi0uE06jV43HMamGcbcAp_
X-Proofpoint-GUID: 9e-i9gm0JcRMpA1ICbCMUhySKAcZamV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_12,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=924 suspectscore=0 spamscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100117
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

While building the kernel with CONFIG_PREEMPT_RT, I encountered several
compilation errors in the PowerPC KVM code. The issues appear in
book3s_hv_rm_mmu.c where it tries to access the 'rlock' member of struct
spinlock, which doesn't exist in the RT configuration.

arch/powerpc/kvm/book3s_hv_rm_mmu.c:248:32: error: no member named 'rlock' in 'struct spinlock'
  248 |         arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
      |                         ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:164:45: note: expanded from macro 'arch_spin_lock'
  164 | #define arch_spin_lock(l)               queued_spin_lock(l)
      |                                                          ^
arch/powerpc/kvm/book3s_hv_rm_mmu.c:263:36: error: no member named 'rlock' in 'struct spinlock'
  263 |                         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
      |                                           ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
  166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
      |                                                            ^
arch/powerpc/kvm/book3s_hv_rm_mmu.c:277:34: error: no member named 'rlock' in 'struct spinlock'
  277 |         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
      |                           ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
  166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
      |                                                            ^
arch/powerpc/kvm/book3s_hv_rm_mmu.c:938:32: error: no member named 'rlock' in 'struct spinlock'
  938 |         arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
      |                         ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:164:45: note: expanded from macro 'arch_spin_lock'
  164 | #define arch_spin_lock(l)               queued_spin_lock(l)
      |                                                          ^
arch/powerpc/kvm/book3s_hv_rm_mmu.c:950:34: error: no member named 'rlock' in 'struct spinlock'
  950 |         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
      |                           ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
  166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
      |                                                            ^
arch/powerpc/kvm/book3s_hv_rm_mmu.c:966:32: error: no member named 'rlock' in 'struct spinlock'
  966 |         arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
      |                         ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:164:45: note: expanded from macro 'arch_spin_lock'
  164 | #define arch_spin_lock(l)               queued_spin_lock(l)
      |                                                          ^
arch/powerpc/kvm/book3s_hv_rm_mmu.c:981:34: error: no member named 'rlock' in 'struct spinlock'
  981 |         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
      |                           ~~~~~~~~~~~~~ ^
./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
  166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
      |                                                            ^
7 errors generated.
make[4]: *** [scripts/Makefile.build:229: arch/powerpc/kvm/book3s_hv_rm_mmu.o] Error 1
make[3]: *** [scripts/Makefile.build:478: arch/powerpc/kvm] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:478: arch/powerpc] Error 2
make[2]: *** Waiting for unfinished jobs....

Replace arch_spin_lock/unlock on kvm->mmu_lock.rlock.raw_lock with
simple spin_lock/unlock on kvm->mmu_lock to fix build errors with
CONFIG_PREEMPT_RT. The RT configuration changes the spinlock structure,
removing the rlock member.

Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 17cb75a127b04..abf1e6de85644 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -245,7 +245,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
        /* Translate to host virtual address */
        hva = __gfn_to_hva_memslot(memslot, gfn);

-       arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
+       spin_lock(&kvm->mmu_lock);
        ptep = find_kvm_host_pte(kvm, mmu_seq, hva, &hpage_shift);
        if (ptep) {
                pte_t pte;
@@ -260,7 +260,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
                 * to <= host page size, if host is using hugepage
                 */
                if (host_pte_size < psize) {
-                       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
+                       spin_unlock(&kvm->mmu_lock);
                        return H_PARAMETER;
                }
                pte = kvmppc_read_update_linux_pte(ptep, writing);
@@ -274,7 +274,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
                        pa |= gpa & ~PAGE_MASK;
                }
        }
-       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
+       spin_unlock(&kvm->mmu_lock);

        ptel &= HPTE_R_KEY | HPTE_R_PP0 | (psize-1);
        ptel |= pa;
@@ -935,7 +935,7 @@ static long kvmppc_do_h_page_init_zero(struct kvm_vcpu *vcpu,
        mmu_seq = kvm->mmu_invalidate_seq;
        smp_rmb();

-       arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
+       spin_lock(&kvm->mmu_lock);

        ret = kvmppc_get_hpa(vcpu, mmu_seq, dest, 1, &pa, &memslot);
        if (ret != H_SUCCESS)
@@ -947,7 +947,7 @@ static long kvmppc_do_h_page_init_zero(struct kvm_vcpu *vcpu,
        kvmppc_update_dirty_map(memslot, dest >> PAGE_SHIFT, PAGE_SIZE);

 out_unlock:
-       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
+       spin_unlock(&kvm->mmu_lock);
        return ret;
 }

@@ -963,7 +963,7 @@ static long kvmppc_do_h_page_init_copy(struct kvm_vcpu *vcpu,
        mmu_seq = kvm->mmu_invalidate_seq;
        smp_rmb();

-       arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
+       spin_lock(&kvm->mmu_lock);
        ret = kvmppc_get_hpa(vcpu, mmu_seq, dest, 1, &dest_pa, &dest_memslot);
        if (ret != H_SUCCESS)
                goto out_unlock;
@@ -978,7 +978,7 @@ static long kvmppc_do_h_page_init_copy(struct kvm_vcpu *vcpu,
        kvmppc_update_dirty_map(dest_memslot, dest >> PAGE_SHIFT, PAGE_SIZE);

 out_unlock:
-       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
+       spin_unlock(&kvm->mmu_lock);
        return ret;
 }

--
2.46.2


