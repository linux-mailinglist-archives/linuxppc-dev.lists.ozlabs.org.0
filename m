Return-Path: <linuxppc-dev+bounces-8971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B31AC6F00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 19:18:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6x6f1H8Lz2yMw;
	Thu, 29 May 2025 03:18:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748452714;
	cv=none; b=FLAZ2DGkRszN5qNm9LCO6ihjXKA4bvsU2/Ei2W0wkZWaO0DdrtgSycQ7YUTaCPfjx6Rdolo441xSDvWCEwD7pkchfYFRZTwaT/dp1uB4RPBedqQZtJ9D7ktUWHmKBekqpXvcAT1utpY/95/wphuv6bWecATpBzQ0XNz/syh4haj1NEAK4xkV5JxNDsSdcE+srY6yuMkdmrmKEzrjWYFxw1DF0ar8thiVaXGTdMP7rtGj72rBONywf+NObBGRERcw8dWq/ud5avbCwmf6rLCUowhA9fLwrIyIpHHDAWN5dESq/V4zFMqjXh8BYUZw+EZXY2BTaHQJYPv4pbU1EKcasw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748452714; c=relaxed/relaxed;
	bh=N5K5p0VjhAP7YJNH/SnN5nmpnOcH5N7QZnizcysO0oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f49fXsJ+AwxTjpisoEicFQE14HP95fxvHQUTluvyoHUWPHRzOUCYW404ts6VxZfhtTezmiDBG7iDTRDMcFWPLo6+AiEqJGSt5cnysON0wmExDYEHUDcxvxbFl6Mo70an+VrD7fEjKfPa5VASag5791wDzB6EcgHz6svDEkzULQEQ2xLT2LybIw+TSoY87T7UF+4EndY8di091tRl45p7egukfOvRAkEHwXJ20+YxpyD1I+k3d3AKAhh7E3e8pGHo5hL0vft2KABNrt0TbIppkfdiH7BB62nQu2WVEzSR+UMVHtLiBP2LcjnBCyGGPEc42wtGTooS3DFA4AdQVIEZ+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qAdjCwRt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qAdjCwRt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6x6d2rHmz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 03:18:33 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE9Puc017574;
	Wed, 28 May 2025 17:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=N5K5p0VjhAP7YJNH/
	SnN5nmpnOcH5N7QZnizcysO0oc=; b=qAdjCwRtYBzgLIS7oXLXsAGoC43OjeoFV
	5OTJnYfE8MI+/CPJTTc/GygoTSpi85zvrF2cUcEtzCu72tzcOgaJCoToDA0IPWNK
	gGkTaxyHxi2kxI9Jj6veoauJpe6lo86gZ3bd7X01+6LZkOohB/KBr866HtIxJLGl
	l0b7sYQFWqaMVpZQRR+GZngMkOKwNjBtkHg3wpnyKPZCFZoqYSTvo3XVdCP9Ymuz
	WNDX8VWWxsZUM1eR2xVGegjaXJYd8kKpnpux6CXHVCSdRr89CAsw9oEM6JRQYVrU
	7e3JWJ9YRO9jdoVS//nfmEiptpbmSDPjP3VQJ9itYW8x5RJMVfKkw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40gh0k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:19 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SHIIhb015185;
	Wed, 28 May 2025 17:18:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40gh0jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SEtGtn016184;
	Wed, 28 May 2025 17:18:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru0rmrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54SHIDwD28902134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 17:18:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC68220043;
	Wed, 28 May 2025 17:18:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FA8A20040;
	Wed, 28 May 2025 17:18:11 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 17:18:10 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nilay Shroff <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v7 2/5] drivers/base/node: remove register_mem_block_under_node_early()
Date: Wed, 28 May 2025 12:18:01 -0500
Message-ID: <22e0c5d20f1d33a91d0436ad22d96628cf084d1b.1748452242.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=avmyCTZV c=1 sm=1 tr=0 ts=6837455b cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=xjaU-GFjuEzJSOh1rDoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0OCBTYWx0ZWRfX9qwGHjwd9tbj Xma6QZomCVHM01LgXTGcnXW5rUCCD8Ksv2oz8P8xPKXMf6fDx+Vr969ZoywtQ33lztfcmYCHMc2 3j+s3w16j9tek9iftKNrVd61i5J1oq7fTM+aIAFNQ0rd1PF8Qyg3gPzoSNg0Pcv6Ar+sj5D2M7f
 SbqetR9aoPKX+N47jWrykBBWOHQHwNi5214NMCSp33L7ZesNf9rU5eGbVCa/YFnY1GPcSzZHi+G GAgIszhP52sZ0S1hMzDT6ZHU6Sje/qx2X9a2JiQ/DVMhwFTH5OLmwoxu7eL5pzFxwt/Y6oREK4x rmWshoQGGjYbN4buMF3yJ4zxb21gz33z7tQUpJLvTTJrm5YgzUQuxuQLLRj6U5Qrn0gc/jMR6/t
 L5VnYZ4SQkn2L55dBGEe6VBiEWoYBR0TprvG13Sy84jACJC3wEskRLSDVt4qMWsQOyQCe/58
X-Proofpoint-GUID: li96mBrukrhVEWnuKee7JbsM1Pct8zGX
X-Proofpoint-ORIG-GUID: JVwYoWwpCVysdMEpQFlI2e4y-dIzSZmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The function register_mem_block_under_node_early() is no longer used,
as register_memory_blocks_under_node_early() now handles memory block
registration during early boot.

Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
the latter was only used by the former.

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v6 -> v7

No change

v6 - https://lore.kernel.org/all/bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com/
v5 - https://lore.kernel.org/all/d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com/
v4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
---
 drivers/base/node.c | 58 +--------------------------------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index b229dee13632..16ad99abeea6 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, unsigned int nid)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-static int __ref get_nid_for_pfn(unsigned long pfn)
-{
-#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
-	if (system_state < SYSTEM_RUNNING)
-		return early_pfn_to_nid(pfn);
-#endif
-	return pfn_to_nid(pfn);
-}
-
 static void do_register_memory_block_under_node(int nid,
 						struct memory_block *mem_blk,
 						enum meminit_context context)
@@ -783,46 +774,6 @@ static void do_register_memory_block_under_node(int nid,
 				    ret);
 }
 
-/* register memory section under specified node if it spans that node */
-static int register_mem_block_under_node_early(struct memory_block *mem_blk,
-					       void *arg)
-{
-	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
-	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
-	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
-	int nid = *(int *)arg;
-	unsigned long pfn;
-
-	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
-		int page_nid;
-
-		/*
-		 * memory block could have several absent sections from start.
-		 * skip pfn range from absent section
-		 */
-		if (!pfn_in_present_section(pfn)) {
-			pfn = round_down(pfn + PAGES_PER_SECTION,
-					 PAGES_PER_SECTION) - 1;
-			continue;
-		}
-
-		/*
-		 * We need to check if page belongs to nid only at the boot
-		 * case because node's ranges can be interleaved.
-		 */
-		page_nid = get_nid_for_pfn(pfn);
-		if (page_nid < 0)
-			continue;
-		if (page_nid != nid)
-			continue;
-
-		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
-		return 0;
-	}
-	/* mem section does not span the specified node */
-	return 0;
-}
-
 /*
  * During hotplug we know that all pages in the memory block belong to the same
  * node.
@@ -883,15 +834,8 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 				       unsigned long end_pfn,
 				       enum meminit_context context)
 {
-	walk_memory_blocks_func_t func;
-
-	if (context == MEMINIT_HOTPLUG)
-		func = register_mem_block_under_node_hotplug;
-	else
-		func = register_mem_block_under_node_early;
-
 	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
-			   (void *)&nid, func);
+			   (void *)&nid, register_mem_block_under_node_hotplug);
 	return;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
-- 
2.43.5


