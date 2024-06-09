Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E727D90150D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2024 10:30:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=Np+fYlbG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vxp686QxDz3c1w
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2024 18:30:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=Np+fYlbG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.83; helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vxp4h10M3z30PD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jun 2024 18:29:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZwDxwbFMfkAGTj6xpSZP0MBWfEJMR+icep3KWfFQ5q4=;
  b=Np+fYlbGt3JUPSQjzXCtgXi8lRudY+xTEr+op3xX7Nwe4QAO64Nvz0am
   rZWIZtJpKcVG2lVroSwyQ3jRnIZ27KTGZbkh1lAjD+6wVfqlpHsabtPr6
   SBJ0rTMWogAnMwz6+VzZO/NGZMFvEtfSzWwmyt6IR3LdYRSo6pzF1YTOG
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,225,1712613600"; 
   d="scan'208";a="169696898"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 10:27:48 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 03/14] KVM: PPC: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Date: Sun,  9 Jun 2024 10:27:15 +0200
Message-Id: <20240609082726.32742-4-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240609082726.32742-1-Julia.Lawall@inria.fr>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "Paul E . McKenney" <paulmck@kernel.org>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since SLOB was removed, it is not necessary to use call_rcu
when the callback only performs kmem_cache_free. Use
kfree_rcu() directly.

The changes were done using the following Coccinelle semantic patch.
This semantic patch is designed to ignore cases where the callback
function is used in another way.

// <smpl>
@r@
expression e;
local idexpression e2;
identifier cb,f;
position p;
@@

(
call_rcu(...,e2)
|
call_rcu(&e->f,cb@p)
)

@r1@
type T;
identifier x,r.cb;
@@

 cb(...) {
(
   kmem_cache_free(...);
|
   T x = ...;
   kmem_cache_free(...,x);
|
   T x;
   x = ...;
   kmem_cache_free(...,x);
)
 }

@s depends on r1@
position p != r.p;
identifier r.cb;
@@

 cb@p

@script:ocaml@
cb << r.cb;
p << s.p;
@@

Printf.eprintf "Other use of %s at %s:%d\n"
   cb (List.hd p).file (List.hd p).line

@depends on r1 && !s@
expression e;
identifier r.cb,f;
position r.p;
@@

- call_rcu(&e->f,cb@p)
+ kfree_rcu(e,f)

@r1a depends on !s@
type T;
identifier x,r.cb;
@@

- cb(...) {
(
-  kmem_cache_free(...);
|
-  T x = ...;
-  kmem_cache_free(...,x);
|
-  T x;
-  x = ...;
-  kmem_cache_free(...,x);
)
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

---
 arch/powerpc/kvm/book3s_mmu_hpte.c |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_mmu_hpte.c b/arch/powerpc/kvm/book3s_mmu_hpte.c
index ce79ac33e8d3..d904e13e069b 100644
--- a/arch/powerpc/kvm/book3s_mmu_hpte.c
+++ b/arch/powerpc/kvm/book3s_mmu_hpte.c
@@ -92,12 +92,6 @@ void kvmppc_mmu_hpte_cache_map(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
 	spin_unlock(&vcpu3s->mmu_lock);
 }
 
-static void free_pte_rcu(struct rcu_head *head)
-{
-	struct hpte_cache *pte = container_of(head, struct hpte_cache, rcu_head);
-	kmem_cache_free(hpte_cache, pte);
-}
-
 static void invalidate_pte(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
 {
 	struct kvmppc_vcpu_book3s *vcpu3s = to_book3s(vcpu);
@@ -126,7 +120,7 @@ static void invalidate_pte(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
 
 	spin_unlock(&vcpu3s->mmu_lock);
 
-	call_rcu(&pte->rcu_head, free_pte_rcu);
+	kfree_rcu(pte, rcu_head);
 }
 
 static void kvmppc_mmu_pte_flush_all(struct kvm_vcpu *vcpu)

