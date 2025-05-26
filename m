Return-Path: <linuxppc-dev+bounces-8942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9BAC41D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 16:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5dxX6TFJz2xRs;
	Tue, 27 May 2025 00:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748271072;
	cv=none; b=Xga0MMEAYTYr14rUtxngz5AxE2VolIIXeMCr4x1nA0aWTyo2A14Lp5oGRU7ZP1XJ9gaD6jLN3B+q1bDMMY3oeQQvS279L+AXcCHjs7xf1JROH+bdO3k4gpL9ptpgf9RbPZ5SBMwUIgqTBGzCI10JhdMwTG4/sKdyrxvw4/gCOlDlwp9sPkf7vCtiasf/O7AfwLBpEjZRhJa/Nl1pMFsWGBkRjupEdnPGc7Lnz5TxXj1G8I00eMvQfNy6C501KoQO0/fSrgqOIDg8BM0sVJvaucar4emaj7yu6V6LzP7BQsJ281aavJC2kHof4nGGOCVrXuXXdL/c5tnjjjTiZ4vs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748271072; c=relaxed/relaxed;
	bh=mEbyvPQr2gVwbgCiESakcT+TQCA2g4GL1G0/MZDlAx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcalBBrkDp6BhBOw3xhqGQhCmuGO17lHyOp1CVktw4Dqz/03/R3ghvqST39jtmL+aHSZQjbFu9/DXZGGw76xjUZqhFVmPbXILrRiwGiIkoigmiju95YrgYtgpJmHfXd604VfxYn/E1yHXydo5+gYfo9+P1p1z5SyjgPdUYx9ffWbc4vNrxruF1aBjiCHOcF7MebIvR3Ui/ey8EaR3fhXZ+TRkzxF0g8Qir0k3428m9+4SOh+bqW3dIZeq61qV3UZ1c7euiWwgX0+SRwUErG1xfhazZ3i4y+NroJUL66lCOpXsbdC4a+XHUhF6R+zmoqg/nIFNZY9DzeQpUrCpqJOow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HW6MpTzV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HW6MpTzV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5dxX0n1Gz2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 00:51:11 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q3HW2v001284;
	Mon, 26 May 2025 14:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mEbyvPQr2gVwbgCiE
	SakcT+TQCA2g4GL1G0/MZDlAx0=; b=HW6MpTzVLt4j1oK8P9dlyto7LgE3rfNj4
	/vJZ0J792APv/Z0K/nf7gZPqFFGc6AEdk5IaUvzbiuF9CBqqzmUQShfiUDCB4GUG
	3boMY1bITC2+OdYVazroyoYqjZIeZTrenhTT3SmTVe7F/bbBdLw7y45EJ6wuIhzu
	OOuiShpnLkEkSfm8+O4DOoYofJur3rRNbxVp7Bxsg6ioZWS2wBgbmWv7SyQCQBr+
	3L4HN901s2EgSME3FoGI9syPZdobQ8Fyz/zlHHnUJ7+EviF99kzo04v6DS63Kj2V
	gcyLV2W00wudcTB6AC0yy/uOT4ra8LaLLPabGtMYqk1WNsWSCdz1A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5uchpx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QEfsqr009052;
	Mon, 26 May 2025 14:50:48 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5uchpx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QEDdlZ007940;
	Mon, 26 May 2025 14:50:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46uu52x93m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54QEoh6S30540446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 14:50:43 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B5D620043;
	Mon, 26 May 2025 14:50:43 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A18EC20040;
	Mon, 26 May 2025 14:50:40 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 May 2025 14:50:40 +0000 (GMT)
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
Subject: [PATCH v6 4/5] drivers/base/node: Rename register_memory_blocks_under_node() and remove context argument
Date: Mon, 26 May 2025 09:50:12 -0500
Message-ID: <030838b43c052079be40e036a4d0f084165e1006.1748270306.git.donettom@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XU-eQ3M37H_5J9CbBH6jpezQo86iJwvr
X-Proofpoint-GUID: TiTI2N2-MW1PZXMyGh2diXtASNGxD-k9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEyNCBTYWx0ZWRfX+p7cEPRlTyK/ z0C1hfP+cyChD48/p7qazdp2S2jWX/pnQxqmvYH3ZdyKbkVfPivg/VmafYxxSwolAYLRPwyV0bp wqdiPsnLZRWs8cdqTktoDNaV+ONOVK/Lfj0hR35XUaVZBu08ASnK3iZ0jk0T83j4wej6YXvbNr9
 Vf2dkP1wwIhF3u48EkDMbEg3E52WA+vpP8GWkQtE8qP3uGleWq6Afr+wsZRPXF3fin0xyPfTjNU 9P4ap155zKcTu9wM5TNN8ksgyWctTF0mTMFn0r4aomJ2ixftL7Hy16X8c5LDam9vXtBPnSv2DSd JSHOHnEYreNaO7ntx9endag0m2z4qzjr5Md6UEfrZ4trpXV8J6gpmUw2Zh6alTFkESu4t4C3fFU
 ds7lo84V4WRw+eYTgGw5KNASOaLWwMfXTymfZeXkBtvXriTLb/UWJgeDolGUPZ1GzMaxHezL
X-Authority-Analysis: v=2.4 cv=fJM53Yae c=1 sm=1 tr=0 ts=68347fc8 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=xjaU-GFjuEzJSOh1rDoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_07,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260124
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The function register_memory_blocks_under_node() is now only called from
the memory hotplug path, as register_memory_blocks_under_node_early()
handles registration during early boot. Therefore, the context argument
used to differentiate between early boot and hotplug is no longer needed
and was removed.

Since the function is only called from the hotplug path, we renamed
register_memory_blocks_under_node() to
register_memory_blocks_under_node_hotplug()

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v5 -> v6

No change

v5 - https://lore.kernel.org/all/d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com/
v4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
---
 drivers/base/node.c  |  5 ++---
 include/linux/node.h | 11 +++++------
 mm/memory_hotplug.c  |  5 ++---
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 71ddf2d0d1af..9d0977fa50e3 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -843,9 +843,8 @@ static void register_memory_blocks_under_nodes(void)
 	}
 }
 
-void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-				       unsigned long end_pfn,
-				       enum meminit_context context)
+void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
+					       unsigned long end_pfn)
 {
 	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
 			   (void *)&nid, register_mem_block_under_node_hotplug);
diff --git a/include/linux/node.h b/include/linux/node.h
index b15de78e0408..75b036a100d2 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -111,13 +111,12 @@ struct memory_block;
 extern struct node *node_devices[];
 
 #if defined(CONFIG_MEMORY_HOTPLUG) && defined(CONFIG_NUMA)
-void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-				       unsigned long end_pfn,
-				       enum meminit_context context);
+void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
+					       unsigned long end_pfn);
 #else
-static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-						     unsigned long end_pfn,
-						     enum meminit_context context)
+static inline void register_memory_blocks_under_node_hotplug(int nid,
+							     unsigned long start_pfn,
+							     unsigned long end_pfn)
 {
 }
 static inline void register_memory_blocks_under_nodes(void)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8305483de38b..f734cc924b51 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1575,9 +1575,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		BUG_ON(ret);
 	}
 
-	register_memory_blocks_under_node(nid, PFN_DOWN(start),
-					  PFN_UP(start + size - 1),
-					  MEMINIT_HOTPLUG);
+	register_memory_blocks_under_node_hotplug(nid, PFN_DOWN(start),
+					  PFN_UP(start + size - 1));
 
 	/* create new memmap entry */
 	if (!strcmp(res->name, "System RAM"))
-- 
2.43.5


