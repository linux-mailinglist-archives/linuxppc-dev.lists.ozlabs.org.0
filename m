Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A184000
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 03:37:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463DdC6cDGzDr6q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 11:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=john.hubbard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g67RvuXx"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463DZc4rKfzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 11:34:48 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n9so36321705pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30MQZ7ywyXKAPoZ0MqYExKYsjkeLdKEHUByfnmRZCb0=;
 b=g67RvuXxl/7UgwJ5Nsn5m7mCWAd1eJK19OdXPfHISavNg0/hlxqTRWRiZsiObbIxd1
 z7nTlGaqHPYV4ywgcbsmss6gPc+YHifTLpOQY0K91PQUhyOYukJschqLsfaVLze8bLh+
 aV53NaTAotE5e+jR4GjhaqKTLNaydraqrAumktndCtlF4SiNrqRjpIehSehjFa47DX/L
 ADmdLxhsKJt3PHVHlUoQeH6o3x8T/NrnTA5b/OM8c9NkahQxV1Hajc7XXSthUzvuQiX4
 tXYs8SD3Ckew9oHpIJy9DZatkhmnngs/Je/q+s3mKD0DprEGB/SuCd9kYNKpjjLfUk8q
 m4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30MQZ7ywyXKAPoZ0MqYExKYsjkeLdKEHUByfnmRZCb0=;
 b=JyCHOUetGvho26miKDV6W8ax50rXBZpIwcxnXGporgi8vqKQvyTpHkEkKXZywr9EnH
 ZUWjiQhSNxJysc7Mck/nfsj9T+Mbj0S3IKJ3M3in3P7Xw0YV7piiGbjwmDQ9gcQTd5uH
 EAH3y4rUNqysYoM/N6A/DWyAsBn3BJOWYdBujslnZL+brmMr0NSiJvPS77vEBZZYTckf
 4t/a5/AeHz3M3hPH+h5AocnUcBvQjx1+LUqdDKRgSSW0DcikATkdEyS/Istk3VnPp3Yo
 gJ1gOtzgV2SoeanCA42eGGduX23HFrqr+8p+MOVJ72iTeZjafbb6uuuVBZBZZlPBwyKh
 AW6Q==
X-Gm-Message-State: APjAAAWIWn7hkgPaedHnxLJ7UCRUkWoBoXnC+N7SRG+y4ou7O4Ay95At
 f4UfK6z1gD2TzX0ukurcCmA=
X-Google-Smtp-Source: APXvYqw4IyvxT+a447mG7S7T32nq/0vx/OylsLzm55tU7UOjf2NCx+Dmal9oDg9eNuXVr0J1x2ZUyQ==
X-Received: by 2002:a63:36cc:: with SMTP id d195mr5452828pga.157.1565141685421; 
 Tue, 06 Aug 2019 18:34:45 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 38/41] powerpc: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:37 -0700
Message-Id: <20190807013340.9706-39-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: John Hubbard <jhubbard@nvidia.com>

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page() or
release_pages().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

Note that this effectively changes the code's behavior in
mm_iommu_unpin(): it now ultimately calls set_page_dirty_lock(),
instead of set_page_dirty(). This is probably more accurate.

As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
dealing with a file backed page where we have reference on the inode it
hangs off." [1]

[1] https://lore.kernel.org/r/20190723153640.GB720@lst.de

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  4 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 19 ++++++++++++++-----
 arch/powerpc/kvm/e500_mmu.c            |  3 +--
 arch/powerpc/mm/book3s64/iommu_api.c   | 11 +++++------
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 9a75f0e1933b..18646b738ce1 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -731,7 +731,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		 * we have to drop the reference on the correct tail
 		 * page to match the get inside gup()
 		 */
-		put_page(pages[0]);
+		put_user_page(pages[0]);
 	}
 	return ret;
 
@@ -1206,7 +1206,7 @@ void kvmppc_unpin_guest_page(struct kvm *kvm, void *va, unsigned long gpa,
 	unsigned long gfn;
 	int srcu_idx;
 
-	put_page(page);
+	put_user_page(page);
 
 	if (!dirty)
 		return;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 2d415c36a61d..f53273fbfa2d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -821,8 +821,12 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	 */
 	if (!ptep) {
 		local_irq_enable();
-		if (page)
-			put_page(page);
+		if (page) {
+			if (upgrade_write)
+				put_user_page(page);
+			else
+				put_page(page);
+		}
 		return RESUME_GUEST;
 	}
 	pte = *ptep;
@@ -870,9 +874,14 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 		*levelp = level;
 
 	if (page) {
-		if (!ret && (pte_val(pte) & _PAGE_WRITE))
-			set_page_dirty_lock(page);
-		put_page(page);
+		bool dirty = !ret && (pte_val(pte) & _PAGE_WRITE);
+		if (upgrade_write)
+			put_user_pages_dirty_lock(&page, 1, dirty);
+		else {
+			if (dirty)
+				set_page_dirty_lock(page);
+			put_page(page);
+		}
 	}
 
 	/* Increment number of large pages if we (successfully) inserted one */
diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
index 2d910b87e441..67bb8d59d4b1 100644
--- a/arch/powerpc/kvm/e500_mmu.c
+++ b/arch/powerpc/kvm/e500_mmu.c
@@ -850,8 +850,7 @@ int kvm_vcpu_ioctl_config_tlb(struct kvm_vcpu *vcpu,
  free_privs_first:
 	kfree(privs[0]);
  put_pages:
-	for (i = 0; i < num_pages; i++)
-		put_page(pages[i]);
+	put_user_pages(pages, num_pages);
  free_pages:
 	kfree(pages);
 	return ret;
diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index b056cae3388b..e126193ba295 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -170,9 +170,8 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	return 0;
 
 free_exit:
-	/* free the reference taken */
-	for (i = 0; i < pinned; i++)
-		put_page(mem->hpages[i]);
+	/* free the references taken */
+	put_user_pages(mem->hpages, pinned);
 
 	vfree(mem->hpas);
 	kfree(mem);
@@ -203,6 +202,7 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
 {
 	long i;
 	struct page *page = NULL;
+	bool dirty = false;
 
 	if (!mem->hpas)
 		return;
@@ -215,10 +215,9 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
 		if (!page)
 			continue;
 
-		if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
-			SetPageDirty(page);
+		dirty = mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY;
 
-		put_page(page);
+		put_user_pages_dirty_lock(&page, 1, dirty);
 		mem->hpas[i] = 0;
 	}
 }
-- 
2.22.0

