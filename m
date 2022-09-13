Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DE5B6900
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRbKQ5NwZz3f80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:52:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRbHR3qddz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:50:42 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MRbF26R92zHnjF;
	Tue, 13 Sep 2022 15:48:38 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 15:50:38 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<geoff@infradead.org>, <jk@ozlabs.org>, <arnd@arndb.de>, <clg@kaod.org>,
	<aik@ozlabs.ru>, <maciej.szmigiero@oracle.com>, <seanjc@google.com>,
	<jgg@ziepe.ca>, <willy@infradead.org>, <nick.child@ibm.com>,
	<bsingharora@gmail.com>, <michael@ellerman.id.au>,
	<arnd.bergmann@de.ibm.com>, <paulus@samba.org>, <benh@kernel.crashing.org>,
	<alistair@popple.id.au>, <miltonm@bga.com>, <Geert.Uytterhoeven@sonycom.com>,
	<geoffrey.levand@am.sony.com>, <yu.liu@freescale.com>,
	<scottwood@freescale.com>, <hollisb@us.ibm.com>, <avi@redhat.com>,
	<agraf@suse.de>, <cuigaosheng1@huawei.com>
Subject: [PATCH 9/9] KVM: PPC: remove orphan declarations from kvm_ppc.h
Date: Tue, 13 Sep 2022 15:50:29 +0800
Message-ID: <20220913075029.682327-10-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913075029.682327-1-cuigaosheng1@huawei.com>
References: <20220913075029.682327-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the following orphan declarations from kvm_ppc.h:

1. kvmppc_mmu_priv_switch() has been removed since
commit dd9ebf1f9435 ("KVM: PPC: e500: Add shadow PID
support").
2. kvmppc_core_destroy_mmu() has been removed since
commit ecc0981ff07c ("KVM: ppc: cosmetic changes to mmu
hook names").
3. kvmppc_prepare_vrma() has been removed since
commit aa04b4cc5be6 ("KVM: PPC: Allocate RMAs (Real Mode
Areas) at boot for use by guests").

So remove the declarations for them from header file.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 9f625af3b65b..bfacf12784dd 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -104,7 +104,6 @@ extern void kvmppc_subarch_vcpu_uninit(struct kvm_vcpu *vcpu);
 
 extern void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 gvaddr, gpa_t gpaddr,
                            unsigned int gtlb_idx);
-extern void kvmppc_mmu_priv_switch(struct kvm_vcpu *vcpu, int usermode);
 extern void kvmppc_mmu_switch_pid(struct kvm_vcpu *vcpu, u32 pid);
 extern int kvmppc_mmu_dtlb_index(struct kvm_vcpu *vcpu, gva_t eaddr);
 extern int kvmppc_mmu_itlb_index(struct kvm_vcpu *vcpu, gva_t eaddr);
@@ -153,7 +152,6 @@ extern int kvmppc_core_check_requests(struct kvm_vcpu *vcpu);
 extern int kvmppc_booke_init(void);
 extern void kvmppc_booke_exit(void);
 
-extern void kvmppc_core_destroy_mmu(struct kvm_vcpu *vcpu);
 extern int kvmppc_kvm_pv(struct kvm_vcpu *vcpu);
 extern void kvmppc_map_magic(struct kvm_vcpu *vcpu);
 
@@ -162,8 +160,6 @@ extern void kvmppc_set_hpt(struct kvm *kvm, struct kvm_hpt_info *info);
 extern long kvmppc_alloc_reset_hpt(struct kvm *kvm, int order);
 extern void kvmppc_free_hpt(struct kvm_hpt_info *info);
 extern void kvmppc_rmap_reset(struct kvm *kvm);
-extern long kvmppc_prepare_vrma(struct kvm *kvm,
-				struct kvm_userspace_memory_region *mem);
 extern void kvmppc_map_vrma(struct kvm_vcpu *vcpu,
 			struct kvm_memory_slot *memslot, unsigned long porder);
 extern int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu);
-- 
2.25.1

