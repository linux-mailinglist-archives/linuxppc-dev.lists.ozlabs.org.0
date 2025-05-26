Return-Path: <linuxppc-dev+bounces-8940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4781AC41CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 16:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5dxS3rqYz2xZV;
	Tue, 27 May 2025 00:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748271068;
	cv=none; b=BxWP0mu0tNlTt4JBnedflhO5c4M2icbTRxP27hr3tbiUDbtmjc36YX42eXcS092Mri+minFBAgrFBf6GdkLj+kU0E3Ud1GgigdY+b/sRPCfunnTTTsHz2nvRKAZYTYxl6OWtOcrRFK9VvK6UXaVYajylZkzcgD978JW/yp2fstyw7sVUgP2wiNRKiwXwweMVbErCWe+j6k9yA5svyBOOvJq+m8LOVeLIlBncaAz5bLXUAma3aPoaNXsMw5dEqOgJ7nK41pwHVFBDHrpflg+t1uXVB0xROX9LWNO1mwvrbsidAfBMGU3bgRfb1EQa75umC1jcKRXX5SfvSvn7gqj6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748271068; c=relaxed/relaxed;
	bh=tvGyAy54i/2oCzy/VEdvBC3lrQOzBGc6f1nrzXP/QBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4XG/K0RxII2Te98fvQcC37I32DlxTyA89GWoAglr8+Uiyr8C8B+EYKHQK5zlVNWhExGETCa9y5tH0qORKQVGX1BkFirjgCbrU6Vg+hKkWgPsCI4ZpuOJgOIxDmoW6EftdWhihLKcv9T4QXPu3Som6QjBVzkkY1Hjem/xje/NS4GfX0jw7p7PZMzzzxbGN3RsM//4GuxaiE+tv2cGckweecfKGHFvqgnBVHvJZlcGCkZH/4SeNUdTfnLX9Ao+EplrTGcTNtGkz8AOo9hHtByYweCEp6KUwsa4hL6FquKrj2tiXuGqgcVkK2fHpgOeMKsCHT726drVlihyFAhDLSceQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eNGfF3NY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eNGfF3NY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5dxR5h89z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 00:51:07 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QBpFTF015395;
	Mon, 26 May 2025 14:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tvGyAy
	54i/2oCzy/VEdvBC3lrQOzBGc6f1nrzXP/QBQ=; b=eNGfF3NYF0aqHMEKTXtDUe
	zsyycU+ZsBBfUzQS4bMYG9pHTBXAe3YEef4RTjwkZRzKFZ4iMAYFWTaxmqp0xG2n
	LL5TDxVIQcaFofjUdNAghA9WCaidtj/B8f6H6eMcq/DSTtAKEV71rRjyOIMqxHxd
	CsbV3eMDLMEyxDD20ePryQGU0pZBAhy9nKJyEEeZG0t8lDBjsdmt1jJSNgE450nL
	IzV6tZSscjMHbfv020QhD++U7+Ka76BcOHdcUqUuIZtd82L/vDgI1PgZ+Qbzn5ph
	ti9/rI4qhAnvAxmGVnUPH4saljddhlHH0tVPGDyqmfXRxz2D6eqKCey6wAUrReDg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5uchpwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:44 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QEgDjm010122;
	Mon, 26 May 2025 14:50:44 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5uchpwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:44 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QCSS3E010626;
	Mon, 26 May 2025 14:50:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46useppk17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54QEocdf57672014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 14:50:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6F9B2004E;
	Mon, 26 May 2025 14:50:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28A4F20040;
	Mon, 26 May 2025 14:50:36 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 May 2025 14:50:36 +0000 (GMT)
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
Subject: [PATCH v6 3/5] drivers/base/node: Remove register_memory_blocks_under_node() function call from register_one_node
Date: Mon, 26 May 2025 09:50:11 -0500
Message-ID: <bdcf6b6c31fb44c8578e0df635dae6314f7c5580.1748270306.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
References: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 1J93RGkM7Jwebocgv-s7KTQbKH3LXzoB
X-Proofpoint-GUID: FxQaY-MeNApqNt7tlnV2kZtyD79wsf1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEyNCBTYWx0ZWRfXy6PQp56SKwYN Ff3XEd/jSx+3d7yXligv0ej4CSiInwXNqFky+vbHGPtonUzskhO7U4EHXoEPDMOmP42xa0eClTI zc8oi83p7zi01X5XOuaD7fjngaPCSzSk9TNLYM8sLKfuAvwCYJd1ylSp/O4R8Oox7RK8Bbp+y4V
 HN2LQbDfapZLeH7KANuy2AApKhHOt7zw6ytI6xX3ZCVrIQ8psHCQvm1abuSgv+EBq4Fvyd2J5BB zyvVySM7QS8MUMl17Hl5zIABQIXyGSO8jwr5EwjC5t9bDn/8wcJDPp1UmZbFWB1Is9+MQql5b1h B8s0Rne6EnYnWWCXWkgDbLvbytvhXdCu7v4kUdxoCAMXyz7tqDzW/wRWXcr4B270FcXrVIQZbzV
 UCFQPSuDCZ5vxe6oVFHA8CQFsDjZehJ2rnnX6Ef3JexH67dWzu90c4dUkP/vI35fGuJzl8lz
X-Authority-Analysis: v=2.4 cv=fJM53Yae c=1 sm=1 tr=0 ts=68347fc4 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=GgTL7Ph3A1T1yYPAe9gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_07,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=844 suspectscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260124
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

v5 -> v6

Removed node_online() check.

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


