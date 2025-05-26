Return-Path: <linuxppc-dev+bounces-8941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C91AAC41D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 16:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5dxW4ywFz2xfR;
	Tue, 27 May 2025 00:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748271071;
	cv=none; b=YSdxRnzZ7Bcq6ksqZULuaI1ZAfFQz9UjlkK/naYSJ+NuZd92U59856WcHXDeSXcPUcGYo4hx+phaUFis4JdpOhlufaGdZb/EZfhdwGAMXfqlhhxXtcVBUY2c9h7L7SymwcQkQ5yfZXuDOcs1K3nxpLQwau6NghOrf+yVLtALuOmO1MGQaiUHmsUYzFz3aTRYSPKj4Z6BQ4BU4kUkreHsVPybzqgJ+JS08jBhRewqH6ns7XC8Ry7Gk8iAKDvX5n8x5Etafm12dcdJi6mu0onGBw90+gBu6vCtjQJqMoYUygDXPC+TDW+HCBVr4VSJ405osO6Idh1M7ybmPSq5R7rkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748271071; c=relaxed/relaxed;
	bh=z1zMbJWS4TH8bmZrIMKw//pZQFS0ilbqi+ycdqO3B7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpnSQUuv9cAJtc9tBUCh/t5lHKtZ4vKo2rPfDQWA3rIT4b4q6eYku1AZnsI9J5QT7hDcCy6buRqtUZuG3GSPAkZOwcRxE3YJMK4VoNc97lRVWMsABHQxLuQtKx6YMeSEZJ/h+9/ldg8s81ocGM/aFSzmmmi4YH+fN8aq8KTUSeR+eG4vQv+Ma8yJIgzf5T6pvojCLkbuubDUUIxXRqc7yM7gZ6tZTAb+murYxhsHGlj6WIwDZ6XBYM6jWoMF+5WNQC1q2L1EFvBvnvoBhDvBK+uz4MYdgKvpxH7SLCf5ZLQH9+BbqPB1wFhzrZXulyirVdULxn9qKHTXOa0U+D5V3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X20GFcMW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X20GFcMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5dxV6LyXz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 00:51:10 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QCYdqF000346;
	Mon, 26 May 2025 14:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=z1zMbJWS4TH8bmZrI
	MKw//pZQFS0ilbqi+ycdqO3B7M=; b=X20GFcMWUfO5WVDMLqxtQ8/nKt0/f6HZV
	5bGWpDEsuLeZV8keKeE/FgjGGJOJ3P/HZLqB/gQmg9bHBUQEuSfqBo1UMJ4hLgPL
	d9ULqO35QZ5f0qUU7a6wBbAiCqyY58YLbNvSOSDlxXSc1Vao8McVuzt0LcvQFYxT
	r0CBkpK7mRxotNU+xJky7rVoEVk1yhAHTAjTAftcBtzZ5vC1FcPQXCztAp/FZAeO
	DYLgBGJsK7lrb5lI+0K9ORP7qQYcrJWclQW9MkT3j+fea22okW+xJlj0EvP93PLe
	uJGQ6udcPcmPNMtOSYKeCnamxfGMQksQmPqPG9GKA15gyNUCbQSUQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u4hn9tkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:53 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QEcxhw026243;
	Mon, 26 May 2025 14:50:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u4hn9tkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QCLp05010712;
	Mon, 26 May 2025 14:50:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru0epfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54QEom8u52167014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 14:50:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6455D20040;
	Mon, 26 May 2025 14:50:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC5852004B;
	Mon, 26 May 2025 14:50:45 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 May 2025 14:50:45 +0000 (GMT)
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
Subject: [PATCH v6 5/5] drivers/base/node: Rename __register_one_node() to register_one_node()
Date: Mon, 26 May 2025 09:50:13 -0500
Message-ID: <6a2bd4deee8a9274e0d3dafe965c0119b2191b7d.1748270306.git.donettom@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=HvB2G1TS c=1 sm=1 tr=0 ts=68347fcd cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=TOWdrs_80VijkQ5-_Q4A:9
X-Proofpoint-GUID: L9YG9Z0U6pdcl2KylbHoKxa4EPuOaSgG
X-Proofpoint-ORIG-GUID: hwYt7O5gek2eQZPs6b3DFrFhwS7BUQ0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEyNCBTYWx0ZWRfXxidBpmOfzPKB JOgse1ajFprNFvlOqFy8a4TtOPrIrzHJtwAhJaHzjbinRjcGhMkNzR4Lyka/OYbKY081hSuBUjR Qx08s3UAZ/KqWhMztya+/7By3e87Atb8Xlz3pTChB74Z+2XP4ixQotRmxOJnXzasbodG2XK6dRL
 XAGkXQVzNoyCLCBthNKINwQe7MfDGGspj/Jwn8QalMFE6CsdTjF9YqGgH44WhYaCZlndkTw+vra XjGgoHk9T5s7rZaMZla0FRmIFdLLFCh6tFCO9zOurmdL1d1s5uTIuwnTItDm9brp/QJ7N5e0jl6 u7m9/HEVsyY/PAxkUT+jnlKoQEKr7zbjq/rBaROGjX8FO36qM+v9HSe7LOsM+GhEr/udRdM+44k
 Hr22xoZtDBL+KZ4demehdOViu+WrBDXMLAo1OFkBf05SmO8iWJpowwyY3eQr52KE2r+ZZ1Fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_07,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=964 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260124
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The register_one_node() function was a simple wrapper around
__register_one_node(). To simplify the code, register_one_node()
has been removed, and __register_one_node() has been renamed to
register_one_node().

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
 drivers/base/node.c                        |  4 ++--
 include/linux/node.h                       | 13 +------------
 mm/memory_hotplug.c                        |  2 +-
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 52e2623a741d..aeb8633a3d00 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -29,7 +29,7 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 	nid = of_node_to_nid(dn);
 	if (likely((nid) >= 0)) {
 		if (!node_online(nid)) {
-			if (__register_one_node(nid)) {
+			if (register_one_node(nid)) {
 				pr_err("PCI: Failed to register node %d\n", nid);
 			} else {
 				update_numa_distance(dn);
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 9d0977fa50e3..94b8ac116aa4 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -852,7 +852,7 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
-int __register_one_node(int nid)
+int register_one_node(int nid)
 {
 	int error;
 	int cpu;
@@ -959,7 +959,7 @@ void __init node_dev_init(void)
 	 * to already created cpu devices.
 	 */
 	for_each_online_node(i) {
-		ret =  __register_one_node(i);
+		ret =  register_one_node(i);
 		if (ret)
 			panic("%s() failed to add node: %d\n", __func__, ret);
 	}
diff --git a/include/linux/node.h b/include/linux/node.h
index 75b036a100d2..88bceebcbfa5 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -128,14 +128,7 @@ extern void unregister_node(struct node *node);
 #ifdef CONFIG_NUMA
 extern void node_dev_init(void);
 /* Core of the node registration - only memory hotplug should use this */
-extern int __register_one_node(int nid);
-
-/* Registers an online node */
-static inline int register_one_node(int nid)
-{
-	return __register_one_node(nid);
-}
-
+extern int register_one_node(int nid);
 extern void unregister_one_node(int nid);
 extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
 extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
@@ -148,10 +141,6 @@ extern int register_memory_node_under_compute_node(unsigned int mem_nid,
 static inline void node_dev_init(void)
 {
 }
-static inline int __register_one_node(int nid)
-{
-	return 0;
-}
 static inline int register_one_node(int nid)
 {
 	return 0;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f734cc924b51..4dadd156f836 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1571,7 +1571,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		 * We online node here. We can't roll back from here.
 		 */
 		node_set_online(nid);
-		ret = __register_one_node(nid);
+		ret = register_one_node(nid);
 		BUG_ON(ret);
 	}
 
-- 
2.43.5


