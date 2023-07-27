Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05069764DC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 10:39:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bAHaVFhm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBPMg6W0nz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 18:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bAHaVFhm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBPLq5CCFz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 18:38:59 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R8cCw1005419;
	Thu, 27 Jul 2023 08:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gY00gaF9F3v55zO8suQ4Uq0pj+76FmgM+3B5bjw5DX0=;
 b=bAHaVFhmZftT0Z4LBXirJ86aPVGZ95l/8xamtuovbI3VkKQZbC7xSZ7KpV4YY2ceVJmS
 fLe/+KZY6vfxiJ+/IqqCmexTOqGNkODQwFxSFdRy96Pj2vyfqe1za8nIK5Wkl5hD4rkM
 QtUkFuTPHIaoFjP/pN/PNwGmpRWSErciBkETunKb4eVrQdS6hCYyIfh0eob+RgJqyHY8
 uEP8Q23t+nmgF4e6xQqMKbWYp7F34rLAe6xrpWVxDoij6AgMk8khASZ2S8LEYTFVT/T4
 oJPuILGneVkDaXbhKmhY6nyw3dLXVH1mhgzT0L+Bt0ysyI0udE6GvuZs/4tWKYiH9CIi 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3mw1ghsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:38:41 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R8cNCC007206;
	Thu, 27 Jul 2023 08:38:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3mw1ghe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:38:33 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7H6LC001858;
	Thu, 27 Jul 2023 08:03:16 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0unjue52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 08:03:16 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R83FYM20251132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 08:03:15 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5807358065;
	Thu, 27 Jul 2023 08:03:15 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 673D158063;
	Thu, 27 Jul 2023 08:03:11 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 08:03:11 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 7/7] mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
Date: Thu, 27 Jul 2023 13:32:32 +0530
Message-ID: <20230727080232.667439-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tyUklHxVR2BzqjOm5IcYH-ZWaFrEDcJ9
X-Proofpoint-GUID: tQzp6q3lAURwcBBMcChfngT81804v6cb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=656 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307270075
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory_hotplug.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index aa8724bd1d53..7c877756b363 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -89,7 +89,12 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
 		else
 			mode = MEMMAP_ON_MEMORY_DISABLE;
 	}
+	/*
+	 * Avoid changing memmap mode during hotplug.
+	 */
+	get_online_mems();
 	*((int *)kp->arg) = mode;
+	put_online_mems();
 	if (mode == MEMMAP_ON_MEMORY_FORCE) {
 		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
 
@@ -110,7 +115,7 @@ static const struct kernel_param_ops memmap_mode_ops = {
 	.set = set_memmap_mode,
 	.get = get_memmap_mode,
 };
-module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
 MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
 		 "With value \"force\" it could result in memory wastage due "
 		 "to memmap size limitations (Y/N/force)");
@@ -2172,22 +2177,20 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
 	 * the same granularity it was added - a single memory block.
 	 */
-	if (mhp_memmap_on_memory()) {
-		ret = walk_memory_blocks(start, size, &mem, test_has_altmap_cb);
-		if (ret) {
-			if (size != memory_block_size_bytes()) {
-				pr_warn("Refuse to remove %#llx - %#llx,"
-					"wrong granularity\n",
-					start, start + size);
-				return -EINVAL;
-			}
-			altmap = mem->altmap;
-			/*
-			 * Mark altmap NULL so that we can add a debug
-			 * check on memblock free.
-			 */
-			mem->altmap = NULL;
+	ret = walk_memory_blocks(start, size, &mem, test_has_altmap_cb);
+	if (ret) {
+		if (size != memory_block_size_bytes()) {
+			pr_warn("Refuse to remove %#llx - %#llx,"
+				"wrong granularity\n",
+				start, start + size);
+			return -EINVAL;
 		}
+		altmap = mem->altmap;
+		/*
+		 * Mark altmap NULL so that we can add a debug
+		 * check on memblock free.
+		 */
+		mem->altmap = NULL;
 	}
 
 	/* remove memmap entry */
-- 
2.41.0

