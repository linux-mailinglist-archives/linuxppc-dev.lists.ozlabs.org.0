Return-Path: <linuxppc-dev+bounces-9035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206EAC910B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 16:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84lH0782z2y3b;
	Sat, 31 May 2025 00:05:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748613946;
	cv=none; b=UmB9ottVxoO/ugIBObUWXlcEENVOyUgUGjNuFlKMrnid2gPVQKpscv0HMsUeV6eMmUgvcQyLp8lbjpd8JkUl5tVeGtYF3f5zbZpIJ2OACUBHKMM/PedRQm880ItOnavE/CY0JUMhTpIc5blGtblvD1D1yOBd9h23FzLq9J/FC37lvwZu8Np69scofO2bPflwbdU26B9/vnTIWQq+qHqdOCpb5eJivRDqtU61WUiHKHa/TR6AtWzPYSSx08LEqg66SKmilACESdAulHa5jbEzgdRiqRX7Lh87QAVhZ4/rqQx1pxyfjJc2dOgZEfPq/W3wXDdcoGmCJ8SFfxeiPxlaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748613946; c=relaxed/relaxed;
	bh=VxJ879xfWVw2euMHLsyZ78IytOrwh9H1JRyt75VdXa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmUN0co4dAzKbtT7WZU5pbF17FD/eOPESbUZHzBYRBh2GQ1KeDnr1y/XXQuNoZt5HIjcP/96K+t49DXBffTnA00nNxzTWm9ubssiPtpI8xDSLh00y11hnEP9lMgrYuiuwrB7jkQBSo9YSxN7XDSn4oV5OcpVZkwepCZoqcggkKDyNB/luW6ROwMshzDoeXSExYearrkhUZ7BH6s6zFo2wSSK3IHLsYEGOmxm0a3Yx4+PsQRu9PMMzonrTncjhHy6I1JlMMQjsG77KjM+dy50gTjrfwtaKbxc4NGN/1xW91OkInEabhPmFMye0fkir0enl6tqhdAppHPPJFbGxSuEEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84lG3DTHz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 00:05:46 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23F3F2247;
	Fri, 30 May 2025 07:04:59 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DD213F673;
	Fri, 30 May 2025 07:05:10 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 2/6] mm: Fix pte update and tlb maintenance ordering in migrate_vma_collect_pmd()
Date: Fri, 30 May 2025 15:04:40 +0100
Message-ID: <20250530140446.2387131-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

migrate_vma_collect_pmd() was previously modifying ptes while in lazy
mmu mode, then performing tlb maintenance for the modified ptes, then
leaving lazy mmu mode. But any pte modifications during lazy mmu mode
may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
ordering between pte modificaiton and tlb maintenance.

Let's fix that by leaving mmu mode (forcing all the pte updates to be
actioned) before doing the tlb maintenance.

This is a theorectical bug discovered during code review.

Fixes: 60bae7370896 ("mm/migrate_device.c: flush TLB while holding PTL")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/migrate_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 3158afe7eb23..fc73a940c112 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -283,11 +283,12 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		migrate->src[migrate->npages++] = mpfn;
 	}
 
+	arch_leave_lazy_mmu_mode();
+
 	/* Only flush the TLB if we actually modified any entries */
 	if (unmapped)
 		flush_tlb_range(walk->vma, start, end);
 
-	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(ptep - 1, ptl);
 
 	return 0;
-- 
2.43.0


