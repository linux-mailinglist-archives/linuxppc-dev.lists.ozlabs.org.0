Return-Path: <linuxppc-dev+bounces-7487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA5A7E388
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 17:11:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWXjs4YcVz2yr2;
	Tue,  8 Apr 2025 01:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744038705;
	cv=none; b=hKs0ckq5sSyl1XzIhURnwi3lQb6oNI+jcuASNpE736smVRyJafxWjDV6C1Hkf1gvVp7GcBZFtYVzpCS2TVguB13x4AwpcwVRa/wzfbQSXFP92at+cImB4XlGjK6cyoRG/NZ2rjxeEh/D1o4qk8pEBq/G71q63NdnLi9Zc8SG5uNacorRbWbAhsp+UoC/BGeGQEOmrHmaaWKELHbPrBA6+izd/7xvzZ46BA3O2nLnqZdYeEGJ2LEhdQ2z/GU1t1UeaXD6O2wR5T6U6c0Xs4QaSPU0g+Qv3j3PVQ1BZXvmd1bYdlsXYoBUw5AGyrSI8kFURWEvaPj+bP1d8ylLPNVbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744038705; c=relaxed/relaxed;
	bh=JAdRtQpYpJ83Wan/qay54BErF461aFj9Lbn233V6/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaOge5N4jHVIDKH/kxWUTgIMbb0FBZvn1k8j8JXjOGdjACU72g3ThcaUeb1CA4e3GzLrypmuo8Y2a560DQ/87Nnu0gbofAtkSzuj/kuDZKy1TIy+KCZTZvS4zoyPDDw+AneK5XgQ/vQyS+nHJ2UgjxiUWgcpfN/l2uYmYhhYmFxGkDjjQFs9XWzzYsCI9CMWKPCaaWxyec9wJNu8agnofQn3KSMJmQ8Jz2W502YprNTQlNHPeNpE7QPcEUxmRHVQsZX6dMPrAUrR3imTXlG2fJiHx/RvXBzZzwafkvEBGROk78ZvUmo0uZborhgNNrgJrfzIKHCZNbyLVpXPqNd1eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKe6NKPK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKe6NKPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWXjq3nFPz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 01:11:42 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537En0ZD029644;
	Mon, 7 Apr 2025 15:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JAdRtQpYpJ83Wan/q
	ay54BErF461aFj9Lbn233V6/Vo=; b=IKe6NKPK0RQuaHMhk18ftPiOYYmCBCWNo
	B9AMFWR/OSyAEWP+S886dEpJeibdEmZl36pABv5K+wup8TiyL8NG8ViK9od6oBRM
	3hfWr3Nzyj+cpTRWraAtGGyrEizF/IwgeyvpxnuqLvo0iHgyxm7f3x2y4rrF4BuZ
	8DVbuOci3sgrMA9QHMuCtrLrrnIMC0eF9Lq4xmJACPC8mwWkrruApDLDO3y+TF6K
	EKoPhfmZsym89+7c65PcFL6w5iov3VKT/uGxaF9PJzGWmz4HwXohtM7m83O2AHTx
	G4AzXPBlc8+L56yqeI1A9XrdpDtpRX+WW/G2StWfINFf09T/NbHTA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswvt33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:34 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537FBXTb013844;
	Mon, 7 Apr 2025 15:11:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswvt2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537F2iM6018432;
	Mon, 7 Apr 2025 15:11:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2ke5ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:11:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537FBVQW33751652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 15:11:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E82452004B;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3F6E20049;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 7F795E10FC; Mon, 07 Apr 2025 17:11:30 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [PATCH v1 1/4] kasan: Avoid sleepable page allocation from atomic context
Date: Mon,  7 Apr 2025 17:11:27 +0200
Message-ID: <ad1b313b6e3e1a84d2df6f686680ad78ae99710c.1744037648.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: noh5DKX9Jwz7KQQbR0xgtrf0Cnrok7JA
X-Proofpoint-ORIG-GUID: B9e39pOuvk43sXxp1B5Vd8FFaIlzYizr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070104
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

apply_to_page_range() enters lazy MMU mode and then invokes
kasan_populate_vmalloc_pte() callback on each page table walk
iteration. The lazy MMU mode may only be entered only under
protection of the page table lock. However, the callback can
go into sleep when trying to allocate a single page.

Change __get_free_page() allocation mode from GFP_KERNEL to
GFP_ATOMIC to avoid scheduling out while in atomic context.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/kasan/shadow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 88d1c9dcb507..edfa77959474 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(!pte_none(ptep_get(ptep))))
 		return 0;
 
-	page = __get_free_page(GFP_KERNEL);
+	page = __get_free_page(GFP_ATOMIC);
 	if (!page)
 		return -ENOMEM;
 
-- 
2.45.2


