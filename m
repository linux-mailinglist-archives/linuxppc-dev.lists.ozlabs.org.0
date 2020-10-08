Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D328716C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 11:27:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Qpk4x2wzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 20:27:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OXf2kh89; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Qmw6Ct8zDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 20:26:08 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09892j6D133757; Thu, 8 Oct 2020 05:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=H5ujSFFLvFTfZOqN4N01nIzgOkdLLij7jTCD7y9DIFY=;
 b=OXf2kh89YB9KmwPNnbMxTQxptzhuio8QGyeMKMTd59gf4q9R6gQThZpt8ccjXWI2Oif4
 9+O/NC7Qx0UZxwVFQBzyzfSvKUmbXiLxAKnjGgA0juOGEbqYCM5ccLAXedCUGZ0yK7Ak
 uOPWV4Aww9hXkSGZ/UkYHvv0y6lbOpytajKXuSnScGvmzvJW/36E5aFadLach6d6CA58
 NY0a6eYbkbdKZ3mp1bTEadjrs4oiWaUernNGGzNLzrxUxLnWHMQP0xCypREGMPJ+jtKf
 ZJKfTa9bvE1cTFtVEaJA8P5wfZ/ExhmzjhSwX1gWoD2xd+vZJj00GwB2N70Cb/2BjGtZ oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341wwrcc9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 05:25:59 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 098948Px139634;
 Thu, 8 Oct 2020 05:25:58 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341wwrcc93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 05:25:58 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0989CLkx008572;
 Thu, 8 Oct 2020 09:25:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 33xgx95tu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 09:25:57 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0989PuWt38076816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 09:25:56 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8946913604F;
 Thu,  8 Oct 2020 09:25:56 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B84913605D;
 Thu,  8 Oct 2020 09:25:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.112.45])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 09:25:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] mm: Avoid using set_pte_at when updating a present pte
Date: Thu,  8 Oct 2020 14:55:41 +0530
Message-Id: <20201008092541.398079-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_04:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=735 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080064
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com,
 John Hubbard <jhubbard@nvidia.com>, Kirill Shutemov <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This avoids the below warning

WARNING: CPU: 0 PID: 30613 at arch/powerpc/mm/pgtable.c:185 set_pte_at+0x2a8/0x3a0 arch/powerpc/mm/pgtable.c:185
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 30613 Comm: syz-executor.0 Not tainted 5.9.0-rc8-syzkaller-00156-gc85fb28b6f99 #0
Call Trace:
 [c0000000001cd1f0] panic+0x29c/0x75c kernel/panic.c:231
 [c0000000001cce24] __warn+0x104/0x1b8 kernel/panic.c:600
 [c000000000d829e4] report_bug+0x1d4/0x380 lib/bug.c:198
 [c000000000036800] program_check_exception+0x4e0/0x750 arch/powerpc/kernel/traps.c:1508
 [c0000000000098a8] program_check_common_virt+0x308/0x360
--- interrupt: 700 at set_pte_at+0x2a8/0x3a0 arch/powerpc/mm/pgtable.c:185
    LR = set_pte_at+0x2a4/0x3a0 arch/powerpc/mm/pgtable.c:185
 [c0000000005d2a7c] copy_present_page mm/memory.c:857 [inline]
 [c0000000005d2a7c] copy_present_pte mm/memory.c:899 [inline]
 [c0000000005d2a7c] copy_pte_range mm/memory.c:1014 [inline]
 [c0000000005d2a7c] copy_pmd_range mm/memory.c:1092 [inline]
 [c0000000005d2a7c] copy_pud_range mm/memory.c:1127 [inline]
 [c0000000005d2a7c] copy_p4d_range mm/memory.c:1150 [inline]
 [c0000000005d2a7c] copy_page_range+0x1f6c/0x2cc0 mm/memory.c:1212
 [c0000000001c63cc] dup_mmap kernel/fork.c:592 [inline]
 [c0000000001c63cc] dup_mm+0x77c/0xab0 kernel/fork.c:1355
 [c0000000001c8f70] copy_mm kernel/fork.c:1411 [inline]
 [c0000000001c8f70] copy_process+0x1f00/0x2740 kernel/fork.c:2070
 [c0000000001c9b54] _do_fork+0xc4/0x10b0 kernel/fork.c:2429
 [c0000000001caf54] __do_sys_clone3+0x1d4/0x2b0 kernel/fork.c:27

Architecture like ppc64 expects set_pte_at to be not used for updating a
valid pte. This is further explained in
commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating _PAGE_NUMA bit")

Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Kirill Shutemov <kirill@shutemov.name>
Cc: Hugh Dickins <hughd@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index fcfc4ca36eba..bfe202ef6244 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -854,7 +854,7 @@ copy_present_page(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	 * source pte back to being writable.
 	 */
 	if (pte_write(pte))
-		set_pte_at(src_mm, addr, src_pte, pte);
+		ptep_set_access_flags(vma, addr, src_pte, pte, 1);
 
 	new_page = *prealloc;
 	if (!new_page)
-- 
2.26.2

