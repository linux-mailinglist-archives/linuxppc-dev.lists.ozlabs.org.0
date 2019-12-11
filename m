Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A7711A938
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 11:44:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xtpf564czDqnD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 21:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XtmW6G9TzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 21:42:33 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40470AD55;
 Wed, 11 Dec 2019 10:42:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 798D31E0B23; Wed, 11 Dec 2019 11:42:28 +0100 (CET)
From: Jan Kara <jack@suse.cz>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/book3s64: Fix error handling in mm_iommu_do_alloc()
Date: Wed, 11 Dec 2019 11:42:26 +0100
Message-Id: <20191211104226.20620-1-jack@suse.cz>
X-Mailer: git-send-email 2.16.4
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
Cc: Jan Kara <jack@suse.cz>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The last jump to free_exit in mm_iommu_do_alloc() happens after page
pointers in struct mm_iommu_table_group_mem_t were already converted to
physical addresses. Thus calling put_page() on these physical addresses
will likely crash. Convert physical addresses back to page pointers
during the error cleanup.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

 Beware, this is completely untested, spotted just by code audit.

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 56cc84520577..06c403381c9c 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -154,7 +154,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 				       (mem2->entries << PAGE_SHIFT)))) {
 			ret = -EINVAL;
 			mutex_unlock(&mem_list_mutex);
-			goto free_exit;
+			goto convert_exit;
 		}
 	}
 
@@ -166,6 +166,9 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 
 	return 0;
 
+convert_exit:
+	for (i = 0; i < pinned; i++)
+		mem->hpages[i] = pfn_to_page(mem->hpas[i] >> PAGE_SHIFT);
 free_exit:
 	/* free the reference taken */
 	for (i = 0; i < pinned; i++)
-- 
2.16.4

