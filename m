Return-Path: <linuxppc-dev+bounces-2173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F799BB62
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 22:18:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRWrk6kfpz2yNf;
	Mon, 14 Oct 2024 07:18:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728850694;
	cv=none; b=B15xESFfJwDXixAujUiOjf+7jgdC/f5W1YghpivVjE49Ek/buYkG1JygXXBP9yJcQ+rvHzYRyzB7Qd86SLyGcqBEn3vVcG7Uf3Z+IEqrx0rbd8PHI/3XKHu9ouv4sYOE1j27awLHcFjL9ljRrNJmZ54kU1znvkYLJptJm97rYmGxemZq1LmeeXpRzzWMFM9fP0jJjZz2ML680w9BYWl7O4MbnF/4F0fvII5PMM9F1tDwJlWOf0rvy6yc0k8J4WseRw32nL7TC5QSu1T+sLM9DE199KMta/e6pSaok3WvEMUCuTl4iJQLchgTByIVJx/nsdSBprcQZCH+4RoWw7NcSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728850694; c=relaxed/relaxed;
	bh=fZBINeODAqFt0yXVx70sf+neXSqrWQCexwg4fqNcrVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KoX81QuuOo31xm6L+NjUYYhqi+iwcG3W1aT8jbmyPF8qORJ+BPpOkdyJLTDrVTdpn1sKMItaga5krJLhnXqmH0OYyCcYk5YYx8EbzENZC1ba78SO3xzJfvAjW+S/93qHqDN6sbv8ZQfOd9m3pkF06U0zxco+PdXc+H8nmoW1R1fwxLEnQt7Zi3Vu/5Wu9gikjVB8cbK0izvJz7KCALqGTnagBJoTYGp8xnH3wG7K9U0yNRC4eivd3IL6GGNh9zKQGQcEC/GpjE3/ebNL8hMr1rtc/8236XfLDjJdnOpX5mmhaz3Lu9crjwCvUMfKrlOr3UT3XqJNmDArxOTnwlGOIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr; dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=BjEE0w0C; dkim-atps=neutral; spf=pass (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org) smtp.mailfrom=inria.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=BjEE0w0C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRWrj3F8dz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 07:18:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fZBINeODAqFt0yXVx70sf+neXSqrWQCexwg4fqNcrVs=;
  b=BjEE0w0C1UE0dff3FmRZ6xajer7q+nb21CHSMK9f8c1lLjt6/yeyZjHH
   y+SLuXnqlDQOC0O12siE/8WDEQJqwj9UaNUDRNxSAyTKbwIpMuHXfi68y
   bJivpTd3/YtK8ocBUBIcJq0vIm0c7B9a8VxSkF9QSHoQZvo6PMh0Bp+WJ
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,201,1725314400"; 
   d="scan'208";a="98968288"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 22:18:01 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: kernel-janitors@vger.kernel.org,
	vbabka@suse.cz,
	paulmck@kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/17] KVM: PPC: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Date: Sun, 13 Oct 2024 22:17:00 +0200
Message-Id: <20241013201704.49576-14-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since SLOB was removed and since
commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
it is not necessary to use call_rcu when the callback only performs
kmem_cache_free. Use kfree_rcu() directly.

The changes were made using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

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


