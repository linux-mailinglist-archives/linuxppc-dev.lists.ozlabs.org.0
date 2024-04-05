Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD4899C45
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 14:02:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn3Ed/BF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn3Ed/BF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9xtN5tP3z3vqT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 23:02:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn3Ed/BF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn3Ed/BF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9xpG52c3z3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 22:58:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNbIAMV3AIIh+finZC0kYCtErDA0HoO+gaZWe4mDURE=;
	b=Jn3Ed/BFsSdJZ2jFrWDfg9m4gT7KE5nLaxmOOYPdBQlCBt2jLPcNPTePdDGlUkeZKYRZWT
	2SANn5saA18wTPcpiJkDZCip6gQ1w0Nex2oE/jWMP+xhTMJj/+kSjkjDsYsaQGYFKaPvZC
	nMadEha8VgS1ZM7JJUxk5qnuprnINBg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNbIAMV3AIIh+finZC0kYCtErDA0HoO+gaZWe4mDURE=;
	b=Jn3Ed/BFsSdJZ2jFrWDfg9m4gT7KE5nLaxmOOYPdBQlCBt2jLPcNPTePdDGlUkeZKYRZWT
	2SANn5saA18wTPcpiJkDZCip6gQ1w0Nex2oE/jWMP+xhTMJj/+kSjkjDsYsaQGYFKaPvZC
	nMadEha8VgS1ZM7JJUxk5qnuprnINBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-j7EJIyIYM6OGTJqf_yp9KQ-1; Fri, 05 Apr 2024 07:58:23 -0400
X-MC-Unique: j7EJIyIYM6OGTJqf_yp9KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 584B885CF01;
	Fri,  5 Apr 2024 11:58:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D080D40C6CB5;
	Fri,  5 Apr 2024 11:58:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 4/4] mm: replace set_pte_at_notify() with just set_pte_at()
Date: Fri,  5 Apr 2024 07:58:15 -0400
Message-ID: <20240405115815.3226315-5-pbonzini@redhat.com>
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the demise of the .change_pte() MMU notifier callback, there is no
notification happening in set_pte_at_notify().  It is a synonym of
set_pte_at() and can be replaced with it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/mmu_notifier.h | 2 --
 kernel/events/uprobes.c      | 5 ++---
 mm/ksm.c                     | 4 ++--
 mm/memory.c                  | 7 +------
 mm/migrate_device.c          | 8 ++------
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 8c72bf651606..d39ebb10caeb 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -657,6 +657,4 @@ static inline void mmu_notifier_synchronize(void)
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
-#define set_pte_at_notify set_pte_at
-
 #endif /* _LINUX_MMU_NOTIFIER_H */
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index e4834d23e1d1..f4523b95c945 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -18,7 +18,6 @@
 #include <linux/sched/coredump.h>
 #include <linux/export.h>
 #include <linux/rmap.h>		/* anon_vma_prepare */
-#include <linux/mmu_notifier.h>	/* set_pte_at_notify */
 #include <linux/swap.h>		/* folio_free_swap */
 #include <linux/ptrace.h>	/* user_enable_single_step */
 #include <linux/kdebug.h>	/* notifier mechanism */
@@ -195,8 +194,8 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	flush_cache_page(vma, addr, pte_pfn(ptep_get(pvmw.pte)));
 	ptep_clear_flush(vma, addr, pvmw.pte);
 	if (new_page)
-		set_pte_at_notify(mm, addr, pvmw.pte,
-				  mk_pte(new_page, vma->vm_page_prot));
+		set_pte_at(mm, addr, pvmw.pte,
+			   mk_pte(new_page, vma->vm_page_prot));
 
 	folio_remove_rmap_pte(old_folio, old_page, vma);
 	if (!folio_mapped(old_folio))
diff --git a/mm/ksm.c b/mm/ksm.c
index 8c001819cf10..108a4d167824 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1345,7 +1345,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct page *page,
 		if (pte_write(entry))
 			entry = pte_wrprotect(entry);
 
-		set_pte_at_notify(mm, pvmw.address, pvmw.pte, entry);
+		set_pte_at(mm, pvmw.address, pvmw.pte, entry);
 	}
 	*orig_pte = entry;
 	err = 0;
@@ -1447,7 +1447,7 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
 	 * See Documentation/mm/mmu_notifier.rst
 	 */
 	ptep_clear_flush(vma, addr, ptep);
-	set_pte_at_notify(mm, addr, ptep, newpte);
+	set_pte_at(mm, addr, ptep, newpte);
 
 	folio = page_folio(page);
 	folio_remove_rmap_pte(folio, page, vma);
diff --git a/mm/memory.c b/mm/memory.c
index f2bc6dd15eb8..9a6f4d8aa379 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3327,13 +3327,8 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		ptep_clear_flush(vma, vmf->address, vmf->pte);
 		folio_add_new_anon_rmap(new_folio, vma, vmf->address);
 		folio_add_lru_vma(new_folio, vma);
-		/*
-		 * We call the notify macro here because, when using secondary
-		 * mmu page tables (such as kvm shadow page tables), we want the
-		 * new page to be mapped directly into the secondary page table.
-		 */
 		BUG_ON(unshare && pte_write(entry));
-		set_pte_at_notify(mm, vmf->address, vmf->pte, entry);
+		set_pte_at(mm, vmf->address, vmf->pte, entry);
 		update_mmu_cache_range(vmf, vma, vmf->address, vmf->pte, 1);
 		if (old_folio) {
 			/*
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index b6c27c76e1a0..66206734b1b9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -664,13 +664,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	if (flush) {
 		flush_cache_page(vma, addr, pte_pfn(orig_pte));
 		ptep_clear_flush(vma, addr, ptep);
-		set_pte_at_notify(mm, addr, ptep, entry);
-		update_mmu_cache(vma, addr, ptep);
-	} else {
-		/* No need to invalidate - it was non-present before */
-		set_pte_at(mm, addr, ptep, entry);
-		update_mmu_cache(vma, addr, ptep);
 	}
+	set_pte_at(mm, addr, ptep, entry);
+	update_mmu_cache(vma, addr, ptep);
 
 	pte_unmap_unlock(ptep, ptl);
 	*src = MIGRATE_PFN_MIGRATE;
-- 
2.43.0

