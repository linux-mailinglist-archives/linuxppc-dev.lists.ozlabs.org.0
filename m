Return-Path: <linuxppc-dev+bounces-8972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8CAC6F01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 19:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6x6r28MXz2yTK;
	Thu, 29 May 2025 03:18:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748452724;
	cv=none; b=Mu/tNsrMAnlpS3Nd2Zzpkvbtfgeh7MJ3a6AcUvqQjZ71RuErURVIHVjRwm7LDjCr99YhKq6w9Kq2UOoeC45dLlK5GxA6Qrk9OpcQIudTNOGyLofciKa8srpz2ogMk0ZD9Sxv4DNNry/4d80Ro99Cu7S8foX2iBgYeivJsB9tzTvBsdKAvlKx+bCGDBAK0nDP/Uao6r6IidpDxNmik2UZyaMQJA0O+KmVW9IcJoGjr0YJBViqUBLZfNzo9LOtRv+FA49hHcloTHGiismgpS8ypZe7+PTF+XQ3RtkghHhGWm9sApP+PNhXW/BPghvSnNHTKWrYs63piG9UFjIltanEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748452724; c=relaxed/relaxed;
	bh=7GaiGUBisULFvaGBzMJz/UUQkGAzselxErFDuXifh8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ds3RMWgdsFOQaQALb+Fj5VKANn9E9DsjFWy0wiaWMgRP/UPEnszbMhSCg3glOS51IEL8Sr9q+ZE4PW9BgmuoxAS1jCDRvBy9u31zz57pOMmR+EGeLDogf0Ovm+lbNIoqg8mZN6LtvIJKB4tKc0A+CAZf12kW/h4iqPq8u2PdbZdH50XqmtcZZ60J4kGcT/ux1zVQoMVMbhzajuw/MJD4T3k3tfyVIEsR7SuK3LbOwpsctqxlKwPnQT7D8muB0L3d+jC/dLBbnG3SGvQOURvxSpDjlo2XCSvRRTlgsmDk+omQ1xvhT0EIsNjNSd1PNzsi2hVGRPPQDnT2UbPiO1KLmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PRYX2JlJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PRYX2JlJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6x6q3vmvz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 03:18:43 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE9bLI032100;
	Wed, 28 May 2025 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7GaiGU
	BisULFvaGBzMJz/UUQkGAzselxErFDuXifh8g=; b=PRYX2JlJ3MMcq/Dub6kOpr
	MeGrQAsvwlyw96I1hFOjh0y8hP6wIAc8mT2Mt+MLchfFgkmXBwaGlJJmWhSss40x
	30e/tDKoCak2nLexSq+QiTmLoqDJ9/mOBBiDjEKZLxVYT+1Ay1zn+QtxBg+jYp2k
	1nCH/CuKRu/GJQvKBCHgfQrrsBMfXYbH80vBGLfQTeUq0KUSGelRI+vLm+lRL3l/
	i9nlppFGI98270op/+as0LNPxVdJL6MS+c3IzAzOnf6lcOBo+ejTnwJwsvv0CVBb
	EPDyiaMWjOj3w91w+q+jQfadXHldH7FOtrmhVczndtEyOjU2ib1elGSUMKFJqxOQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40js0f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SGxwA5019131;
	Wed, 28 May 2025 17:18:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40js0f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFFKem026439;
	Wed, 28 May 2025 17:18:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usxn0f9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:21 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54SHIHgr27132464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 17:18:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFF3D20043;
	Wed, 28 May 2025 17:18:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 374E520040;
	Wed, 28 May 2025 17:18:15 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 17:18:15 +0000 (GMT)
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
Subject: [PATCH v7 3/5] drivers/base/node: Remove register_memory_blocks_under_node() function call from register_one_node
Date: Wed, 28 May 2025 12:18:02 -0500
Message-ID: <ecf07075b1a41015fcf58823997d5c2ed7b8c18f.1748452242.git.donettom@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=SdL3duRu c=1 sm=1 tr=0 ts=6837455f cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=GgTL7Ph3A1T1yYPAe9gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -NLu1TZzhtXLYxxOabFWxSqWl1jDu6W7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0OCBTYWx0ZWRfX9CtHJKAcy3VG X08WxKLGknH6Q2U0ghZA/r60cqUhatNAiYqcKoOOo7Ow+JCegCD4EPo/LrJRNfN2sT55ALxeHys ZNuY/52YHYVOARlvlSMA2x29Sm7NxVGpw9TrfSVERQaWPnwINGVosoGbcAOIxy+sLI+FD75QOmg
 Phk5Bvg7qCOmYhPfmitQaRiVJ8byWW3SuWXlwWx1mWQFCZye/JCD2VRcQuemHevYNC3IDKd3AZS y6sG7WyM6BLIRHJ5PwKrNTzmkO/CMnSzA20XaBIoHPi0yEcMdSupr6KqQUqbQfuJ9RZV0g8ZlBY yQn4Sa9U6UnCRaiwmOrdckfL4nmlVjYtGYPtwstdudF01R3ihQG1bUP3ybfFnKkDqXTcvhfCE0B
 B4JkFE2XuIXwVKajETjrAK3M3EckMfDqugIIsvE1qtS1sIJbKfyWqzrjlhhYklnc0CGAF6lx
X-Proofpoint-ORIG-GUID: jOU-B-mRkfRX2vmvdoQYvxMhGpIfktF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=886 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

register_one_node() is now only called via cpu_up() → __try_online_node()
during CPU hotplug operations to online a node.

At this stage, the node has not yet had any memory added. As a result,
there are no memory blocks to walk or register, so calling
register_memory_blocks_under_node() is unnecessary.

Therefore, the call to register_memory_blocks_under_node()
has been removed from register_one_node().

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---

v6 -> v7

no change

v6 - https://lore.kernel.org/all/bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com/
v5 - https://lore.kernel.org/all/d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com/
v4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
---
 include/linux/node.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/include/linux/node.h b/include/linux/node.h
index 485370f3bc17..b15de78e0408 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -134,21 +134,7 @@ extern int __register_one_node(int nid);
 /* Registers an online node */
 static inline int register_one_node(int nid)
 {
-	int error = 0;
-
-	if (node_online(nid)) {
-		struct pglist_data *pgdat = NODE_DATA(nid);
-		unsigned long start_pfn = pgdat->node_start_pfn;
-		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
-
-		error = __register_one_node(nid);
-		if (error)
-			return error;
-		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
-						  MEMINIT_EARLY);
-	}
-
-	return error;
+	return __register_one_node(nid);
 }
 
 extern void unregister_one_node(int nid);
-- 
2.43.5


