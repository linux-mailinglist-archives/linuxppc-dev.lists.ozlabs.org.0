Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id AFE318D1730
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 11:21:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpRgT1ZYdz79f9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 19:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 926 seconds by postgrey-1.37 at boromir; Tue, 28 May 2024 19:14:53 AEST
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpRg13w9Hz3vjT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 19:14:49 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VpRF22XpZz2CjFS;
	Tue, 28 May 2024 16:55:50 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 8CFA7180066;
	Tue, 28 May 2024 16:59:24 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 16:59:22 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: [PATCH v12 3/6] mm/hwpoison: return -EFAULT when copy fail in copy_mc_[user]_highpage()
Date: Tue, 28 May 2024 16:59:12 +0800
Message-ID: <20240528085915.1955987-4-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240528085915.1955987-1-tongtiangen@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If hardware errors are encountered during page copying, returning the bytes
not copied is not meaningful, and the caller cannot do any processing on
the remaining data. Returning -EFAULT is more reasonable, which represents
a hardware error encountered during the copying.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 include/linux/highmem.h | 8 ++++----
 mm/khugepaged.c         | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 00341b56d291..64a567d5ad6f 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -335,8 +335,8 @@ static inline void copy_highpage(struct page *to, struct page *from)
 /*
  * If architecture supports machine check exception handling, define the
  * #MC versions of copy_user_highpage and copy_highpage. They copy a memory
- * page with #MC in source page (@from) handled, and return the number
- * of bytes not copied if there was a #MC, otherwise 0 for success.
+ * page with #MC in source page (@from) handled, and return -EFAULT if there
+ * was a #MC, otherwise 0 for success.
  */
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 					unsigned long vaddr, struct vm_area_struct *vma)
@@ -352,7 +352,7 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 	kunmap_local(vto);
 	kunmap_local(vfrom);
 
-	return ret;
+	return ret ? -EFAULT : 0;
 }
 
 static inline int copy_mc_highpage(struct page *to, struct page *from)
@@ -368,7 +368,7 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
 	kunmap_local(vto);
 	kunmap_local(vfrom);
 
-	return ret;
+	return ret ? -EFAULT : 0;
 }
 #else
 static inline int copy_mc_user_highpage(struct page *to, struct page *from,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 774a97e6e2da..cce838e85967 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -798,7 +798,7 @@ static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
 			continue;
 		}
 		src_page = pte_page(pteval);
-		if (copy_mc_user_highpage(page, src_page, src_addr, vma) > 0) {
+		if (copy_mc_user_highpage(page, src_page, src_addr, vma)) {
 			result = SCAN_COPY_MC;
 			break;
 		}
@@ -2042,7 +2042,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 			index++;
 			dst++;
 		}
-		if (copy_mc_highpage(dst, folio_page(folio, 0)) > 0) {
+		if (copy_mc_highpage(dst, folio_page(folio, 0))) {
 			result = SCAN_COPY_MC;
 			goto rollback;
 		}
-- 
2.25.1

