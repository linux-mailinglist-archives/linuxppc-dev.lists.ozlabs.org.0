Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289E287172
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 11:29:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6QrZ43wGzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 20:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=p0v+6esZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Qny5GQZzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 20:27:02 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0989DdBg054554; Thu, 8 Oct 2020 05:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BjZhoUeT4Qcv0SHj+E+EgCiPRWnqRLM0QCX5QaunyDM=;
 b=p0v+6esZfkLQ9w2g+KVCAQA93iz5XZ4q9nf+OB6t+rSfv/wG61exxB9Qd0qkVyfHTVbt
 Y9fOdxFyNanSaMCITz0njFDpBhm4NYeI5SIlTa69r7lUrXJd9XqV59nphdVW/LnbaVjN
 4HCA69hB3Uyd0oYgxrd/c0lLLTLcWxoEwzNyjx2x5ELv/95yERel+bEg0OzfYnl8GQxh
 ZB31M+Qkxi8yj29gFyGjWAOtG9SzFc7sJ9YjBhc58TNA5lh69C9xQEDAcLqq01JUPqgd
 JM/RNc617Jo9X1CtlHR18ZhYpj1y/n1rCgmGjMWQm7whKvx+NYsn4gBcu/+bps6frqfF Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341yxmgb70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 05:26:53 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0989EOf5055605;
 Thu, 8 Oct 2020 05:26:53 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341yxmgb6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 05:26:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0989BLNT022913;
 Thu, 8 Oct 2020 09:26:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 341car7cw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 09:26:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0989QoFM59965936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 09:26:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC164136053;
 Thu,  8 Oct 2020 09:26:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83F21136051;
 Thu,  8 Oct 2020 09:26:45 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.112.45])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 09:26:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH] mm: Fetch the dirty bit before we reset the pte
Date: Thu,  8 Oct 2020 14:56:27 +0530
Message-Id: <20201008092627.399131-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_04:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

In copy_present_page, after we mark the pte non-writable, we should
check for previous dirty bit updates and make sure we don't lose the dirty
bit on reset.

Also, avoid marking the pte write-protected again if copy_present_page
already marked it write-protected.

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
 mm/memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index bfe202ef6244..f57b1f04d50a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -848,6 +848,9 @@ copy_present_page(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (likely(!page_maybe_dma_pinned(page)))
 		return 1;
 
+	if (pte_dirty(*src_pte))
+		pte = pte_mkdirty(pte);
+
 	/*
 	 * Uhhuh. It looks like the page might be a pinned page,
 	 * and we actually need to copy it. Now we can set the
@@ -904,6 +907,11 @@ copy_present_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		if (retval <= 0)
 			return retval;
 
+		/*
+		 * Fetch the src pte value again, copy_present_page
+		 * could modify it.
+		 */
+		pte = *src_pte;
 		get_page(page);
 		page_dup_rmap(page, false);
 		rss[mm_counter(page)]++;
-- 
2.26.2

