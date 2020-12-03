Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C72CCE4C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 06:10:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmkS03w8vzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 16:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmkQ43rY0zDrJn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 16:08:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=popple.id.au header.i=@popple.id.au header.a=rsa-sha256
 header.s=202006 header.b=uYSeMX+e; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmkQ34qvDz9sVH;
 Thu,  3 Dec 2020 16:08:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=popple.id.au;
 s=202006; t=1606972123;
 bh=YvbfrmZmP42OPfCQqrzF9O+mwIM3YLveiUh8gOJtX9k=;
 h=From:To:Cc:Subject:Date:From;
 b=uYSeMX+eG1zUZnjV7x6ROv6+3/6qNWXDOo65CKlvzMZ4+dqXL+e3dIMXxUq8FO7Yt
 9bhusIt5U/rpJJa+uqNMtMBHXh5DNR9LBvYesnBnMOcawcz4WEGr4825tTlmxjWOeT
 d0fAzWtuL6L3CkodPK9Jj1hTEcr4p1OhWFzbsiWqvUjMdb1yovIuRzcwW7Hf+gH2kx
 whs+CS0rgtX1POUVpWwIFIYWylhF8muUowJTrXkT/szIfNpzxT2+uXPqAYLlFXwmwl
 fZdnA8ONmLTyJ7evKAOlOPjQfC3hqRJPUVsH63QxrtzFq/VAS7LCqrBCjJqXzFmHja
 eCpSOGk/sxaRQ==
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/book3s_hv_uvmem: Check for failed page migration
Date: Thu,  3 Dec 2020 16:08:12 +1100
Message-Id: <20201203050812.5234-1-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: Alistair Popple <alistair@popple.id.au>, bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

migrate_vma_pages() may still clear MIGRATE_PFN_MIGRATE on pages which
are not able to be migrated. Drivers may safely copy data prior to
calling migrate_vma_pages() however a remote mapping must not be
established until after migrate_vma_pages() has returned as the
migration could still fail.

UV_PAGE_IN_in both copies and maps the data page, therefore it should
only be called after checking the results of migrate_vma_pages().

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 84e5a2dc8be5..08aa6a90c525 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -762,7 +762,10 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		goto out_finalize;
 	}
 
-	if (pagein) {
+	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	migrate_vma_pages(&mig);
+
+	if ((*mig.src & MIGRATE_PFN_MIGRATE) && pagein) {
 		pfn = *mig.src >> MIGRATE_PFN_SHIFT;
 		spage = migrate_pfn_to_page(*mig.src);
 		if (spage) {
@@ -773,8 +776,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
-	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
 	return ret;
-- 
2.20.1

