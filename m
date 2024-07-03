Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B7926A4C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:32:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyegTmQ/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyegTmQ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtK62GPNz3fR6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyegTmQ/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyegTmQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtG539mMz3cl9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:29:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpPwnVRxGccST937wjacfAT3ndiJzOREHKlh4Jm8zSE=;
	b=iyegTmQ/+x//h1iLh/xkzxuRmTa0+vAZP4ASN1cINCV5f2zK6uVPV8byCH2inkTtA1VVCj
	ctFCfqluv8ijojQ7RkBONQMVRCE9gvKDTICF9LQ6B2NVZQILZ5KH+wZe6KlmB/rjvgsCNc
	S05SrR0SKPfhiuPMyqzjHaWba4rDS84=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpPwnVRxGccST937wjacfAT3ndiJzOREHKlh4Jm8zSE=;
	b=iyegTmQ/+x//h1iLh/xkzxuRmTa0+vAZP4ASN1cINCV5f2zK6uVPV8byCH2inkTtA1VVCj
	ctFCfqluv8ijojQ7RkBONQMVRCE9gvKDTICF9LQ6B2NVZQILZ5KH+wZe6KlmB/rjvgsCNc
	S05SrR0SKPfhiuPMyqzjHaWba4rDS84=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-wMEhIa6QPGyfojSvJm_BuQ-1; Wed, 03 Jul 2024 17:29:29 -0400
X-MC-Unique: wMEhIa6QPGyfojSvJm_BuQ-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3d8ae3b69daso2457b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042168; x=1720646968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpPwnVRxGccST937wjacfAT3ndiJzOREHKlh4Jm8zSE=;
        b=TIomowPdbEB16cKIBZDH6h2Lna6s4fLQZkg05MY8xU31FAufR6MfVi9BduqENXQ8HU
         VUHqPcnkZ3/f9cw1ZwoXsg/SZZjCJxd5sWnNBMzNrVkx/x0Wx/zljcni3FrZlvA6LhCo
         lf1+tXsMihpjRiH/JOtIoRSygJU+Fi/do4qC2vGd+D44JKvy/s9ficV1DpHM3OkjZN8l
         cuGS97nSDam1kEBITuDcpgaBCWOLC5wUnWtWmA28Rk7y/+RULzX7U+AieKeS2tHg8Y4C
         G9n27WLVvbqvqLgvVvD1e0+4Tc96ZRYLZZRX4L6XEJzEMrq4f04SCPG3bYD2YPkok2Ed
         GgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3EDjHtzavrnPK6fE1wC3lLafYL+sPBikMQUKPqUZM2G43It7TTP8aM8J7fq6x1RpQE+c/7oWjMRca73bWfV04aPMRipLF6GJSqwwh/w==
X-Gm-Message-State: AOJu0Yz6ooI4Y0hmmWnUsn9KiegVFNAb+oT5PM8VTAs93DP5CJJTZxzb
	oZsHWrMDUQ80MZuLvKM9baS1v1TXLLZ9iTakRlsIM0NxNAcpy8V2fjBpesjRSMSssZ1iYbSGTzV
	426LwJA8I6KYgTddsgaxV7Y1+83aQ//+r/tR3QIdM/ND6VxmLdA+iNWshZPHYxHo=
X-Received: by 2002:a05:6870:f112:b0:25e:15e1:35c6 with SMTP id 586e51a60fabf-25e15e13956mr2491333fac.0.1720042168210;
        Wed, 03 Jul 2024 14:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy7qnRAv+DeYDujdDipaXvn8J32B6JV16U/qU1i2FGfDDVRUJs42vciaW1uTjUnBxFRGp+Ow==
X-Received: by 2002:a05:6870:f112:b0:25e:15e1:35c6 with SMTP id 586e51a60fabf-25e15e13956mr2491322fac.0.1720042167878;
        Wed, 03 Jul 2024 14:29:27 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465143eb1csm54337481cf.57.2024.07.03.14.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:29:27 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 3/8] mm/mprotect: Push mmu notifier to PUDs
Date: Wed,  3 Jul 2024 17:29:13 -0400
Message-ID: <20240703212918.2417843-4-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240703212918.2417843-1-peterx@redhat.com>
References: <20240703212918.2417843-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, David Rientjes <rientjes@google.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Sean Christopherson <seanjc@google.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Mel Gorman <mgorman@techsingularity.net>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mprotect() does mmu notifiers in PMD levels.  It's there since 2014 of
commit a5338093bfb4 ("mm: move mmu notifier call from change_protection to
change_pmd_range").

At that time, the issue was that NUMA balancing can be applied on a huge
range of VM memory, even if nothing was populated.  The notification can be
avoided in this case if no valid pmd detected, which includes either THP or
a PTE pgtable page.

Now to pave way for PUD handling, this isn't enough.  We need to generate
mmu notifications even on PUD entries properly.  mprotect() is currently
broken on PUD (e.g., one can easily trigger kernel error with dax 1G
mappings already), this is the start to fix it.

To fix that, this patch proposes to push such notifications to the PUD
layers.

There is risk on regressing the problem Rik wanted to resolve before, but I
think it shouldn't really happen, and I still chose this solution because
of a few reasons:

  1) Consider a large VM that should definitely contain more than GBs of
  memory, it's highly likely that PUDs are also none.  In this case there
  will have no regression.

  2) KVM has evolved a lot over the years to get rid of rmap walks, which
  might be the major cause of the previous soft-lockup.  At least TDP MMU
  already got rid of rmap as long as not nested (which should be the major
  use case, IIUC), then the TDP MMU pgtable walker will simply see empty VM
  pgtable (e.g. EPT on x86), the invalidation of a full empty region in
  most cases could be pretty fast now, comparing to 2014.

  3) KVM has explicit code paths now to even give way for mmu notifiers
  just like this one, e.g. in commit d02c357e5bfa ("KVM: x86/mmu: Retry
  fault before acquiring mmu_lock if mapping is changing").  It'll also
  avoid contentions that may also contribute to a soft-lockup.

  4) Stick with PMD layer simply don't work when PUD is there...  We need
  one way or another to fix PUD mappings on mprotect().

Pushing it to PUD should be the safest approach as of now, e.g. there's yet
no sign of huge P4D coming on any known archs.

Cc: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Rik van Riel <riel@surriel.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/mprotect.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 21172272695e..fb8bf3ff7cd9 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -363,9 +363,6 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 	pmd_t *pmd;
 	unsigned long next;
 	long pages = 0;
-	struct mmu_notifier_range range;
-
-	range.start = 0;
 
 	pmd = pmd_offset(pud, addr);
 	do {
@@ -383,14 +380,6 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 		if (pmd_none(*pmd))
 			goto next;
 
-		/* invoke the mmu notifier if the pmd is populated */
-		if (!range.start) {
-			mmu_notifier_range_init(&range,
-				MMU_NOTIFY_PROTECTION_VMA, 0,
-				vma->vm_mm, addr, end);
-			mmu_notifier_invalidate_range_start(&range);
-		}
-
 		_pmd = pmdp_get_lockless(pmd);
 		if (is_swap_pmd(_pmd) || pmd_trans_huge(_pmd) || pmd_devmap(_pmd)) {
 			if ((next - addr != HPAGE_PMD_SIZE) ||
@@ -428,9 +417,6 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 		cond_resched();
 	} while (pmd++, addr = next, addr != end);
 
-	if (range.start)
-		mmu_notifier_invalidate_range_end(&range);
-
 	return pages;
 }
 
@@ -438,10 +424,13 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
 {
+	struct mmu_notifier_range range;
 	pud_t *pud;
 	unsigned long next;
 	long pages = 0, ret;
 
+	range.start = 0;
+
 	pud = pud_offset(p4d, addr);
 	do {
 		next = pud_addr_end(addr, end);
@@ -450,10 +439,19 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 			return ret;
 		if (pud_none_or_clear_bad(pud))
 			continue;
+		if (!range.start) {
+			mmu_notifier_range_init(&range,
+						MMU_NOTIFY_PROTECTION_VMA, 0,
+						vma->vm_mm, addr, end);
+			mmu_notifier_invalidate_range_start(&range);
+		}
 		pages += change_pmd_range(tlb, vma, pud, addr, next, newprot,
 					  cp_flags);
 	} while (pud++, addr = next, addr != end);
 
+	if (range.start)
+		mmu_notifier_invalidate_range_end(&range);
+
 	return pages;
 }
 
-- 
2.45.0

