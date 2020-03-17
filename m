Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B3187ACF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 09:05:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hQhx0mXVzDqPw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 19:05:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=E4P4y4Sv; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hQgC1WSPzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 19:04:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hQg246rLz9txmL;
 Tue, 17 Mar 2020 09:04:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=E4P4y4Sv; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JaSth-LZT37C; Tue, 17 Mar 2020 09:04:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hQg22zyDz9txmP;
 Tue, 17 Mar 2020 09:04:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584432254; bh=J1/jkEZLDJGbSPCZEN3IRh7IETVxKbAkXG4c7b0y1OI=;
 h=From:Subject:To:Cc:Date:From;
 b=E4P4y4SvMKj+jg4HgKfsHvmC8XZ+PnJ/LyoVRjn7xfqPS0LHi1XFIaS2H2p8Eocia
 WVfqig8akSyTDlCqzW9MRBuQ7s7nZyePdzL57soEkIyKpR4qPur7VcTbVUyo0zvQ95
 f0UxQBQ2andU/nhsHxWreezmSajXnRdDKoDK0AIE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 517788B787;
 Tue, 17 Mar 2020 09:04:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rJteXucWg9Gr; Tue, 17 Mar 2020 09:04:15 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 133908B786;
 Tue, 17 Mar 2020 09:04:15 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CE5C865599; Tue, 17 Mar 2020 08:04:14 +0000 (UTC)
Message-Id: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] mm/hugetlb: Fix build failure with HUGETLB_PAGE but not
 HUGEBTLBFS
To: Mike Kravetz <mike.kravetz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nishanth Aravamudan <nacc@us.ibm.com>, Nick Piggin <npiggin@suse.de>,
 Adam Litke <agl@us.ibm.com>, Andi Kleen <ak@suse.de>
Date: Tue, 17 Mar 2020 08:04:14 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_HUGETLB_PAGE is set but not CONFIG_HUGETLBFS, the
following build failure is encoutered:

In file included from arch/powerpc/mm/fault.c:33:0:
./include/linux/hugetlb.h: In function 'hstate_inode':
./include/linux/hugetlb.h:477:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
  return HUGETLBFS_SB(i->i_sb)->hstate;
         ^
./include/linux/hugetlb.h:477:30: error: invalid type argument of '->' (have 'int')
  return HUGETLBFS_SB(i->i_sb)->hstate;
                              ^

Gate hstate_inode() with CONFIG_HUGETLBFS instead of CONFIG_HUGETLB_PAGE.

Reported-by: kbuild test robot <lkp@intel.com>
Link: https://patchwork.ozlabs.org/patch/1255548/#2386036
Fixes: a137e1cc6d6e ("hugetlbfs: per mount huge page sizes")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 include/linux/hugetlb.h | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 1e897e4168ac..dafb3d70ff81 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -390,7 +390,10 @@ static inline bool is_file_hugepages(struct file *file)
 	return is_file_shm_hugepages(file);
 }
 
-
+static inline struct hstate *hstate_inode(struct inode *i)
+{
+	return HUGETLBFS_SB(i->i_sb)->hstate;
+}
 #else /* !CONFIG_HUGETLBFS */
 
 #define is_file_hugepages(file)			false
@@ -402,6 +405,10 @@ hugetlb_file_setup(const char *name, size_t size, vm_flags_t acctflag,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct hstate *hstate_inode(struct inode *i)
+{
+	return NULL;
+}
 #endif /* !CONFIG_HUGETLBFS */
 
 #ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
@@ -472,11 +479,6 @@ extern unsigned int default_hstate_idx;
 
 #define default_hstate (hstates[default_hstate_idx])
 
-static inline struct hstate *hstate_inode(struct inode *i)
-{
-	return HUGETLBFS_SB(i->i_sb)->hstate;
-}
-
 static inline struct hstate *hstate_file(struct file *f)
 {
 	return hstate_inode(file_inode(f));
@@ -729,11 +731,6 @@ static inline struct hstate *hstate_vma(struct vm_area_struct *vma)
 	return NULL;
 }
 
-static inline struct hstate *hstate_inode(struct inode *i)
-{
-	return NULL;
-}
-
 static inline struct hstate *page_hstate(struct page *page)
 {
 	return NULL;
-- 
2.25.0

