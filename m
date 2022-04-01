Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6D4EE917
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 09:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVBZm2j3Vz3bc3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 18:27:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.26.146;
 helo=unicom146.biz-email.net; envelope-from=liubo03@inspur.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 128 seconds by postgrey-1.36 at boromir;
 Fri, 01 Apr 2022 14:18:51 AEDT
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KV53v1KsMz2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 14:18:50 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id VXR00014;
 Fri, 01 Apr 2022 11:16:14 +0800
Received: from localhost.localdomain.localdomain (58.56.96.28) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2308.21; Fri, 1 Apr 2022 11:16:15 +0800
From: Bo Liu <liubo03@inspur.com>
To: <"mpe@ellerman.id.aubenh@kernel.crashing.orgpaulus@samba.orgaik"@ozlabs.ru>
Subject: [PATCH] KVM: PPC: Book3S HV: fix the return value of kvm_age_rmapp()
Date: Thu, 31 Mar 2022 23:16:13 -0400
Message-ID: <1648782973-8929-1-git-send-email-liubo03@inspur.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [58.56.96.28]
tUid: 202240111161400f990c1bf3e26be1be4b8500e06d1ef
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Fri, 01 Apr 2022 18:27:09 +1100
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
Cc: , vger.kernel.org@lists.ozlabs.org, Bo Liu <liubo03@inspur.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The return value type defined in the function kvm_age_rmapp() is
"bool", but the return value type defined in the implementation of the
function kvm_age_rmapp() is "int".

Change the return value type to "bool".

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 0aeb51738ca9..9a83894ca743 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -879,7 +879,7 @@ static bool kvm_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	struct revmap_entry *rev = kvm->arch.hpt.rev;
 	unsigned long head, i, j;
 	__be64 *hptep;
-	int ret = 0;
+	bool ret = false;
 	unsigned long *rmapp;
 
 	rmapp = &memslot->arch.rmap[gfn - memslot->base_gfn];
@@ -887,7 +887,7 @@ static bool kvm_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	lock_rmap(rmapp);
 	if (*rmapp & KVMPPC_RMAP_REFERENCED) {
 		*rmapp &= ~KVMPPC_RMAP_REFERENCED;
-		ret = 1;
+		ret = true;
 	}
 	if (!(*rmapp & KVMPPC_RMAP_PRESENT)) {
 		unlock_rmap(rmapp);
@@ -919,7 +919,7 @@ static bool kvm_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 				rev[i].guest_rpte |= HPTE_R_R;
 				note_hpte_modification(kvm, &rev[i]);
 			}
-			ret = 1;
+			ret = true;
 		}
 		__unlock_hpte(hptep, be64_to_cpu(hptep[0]));
 	} while ((i = j) != head);
-- 
2.27.0

