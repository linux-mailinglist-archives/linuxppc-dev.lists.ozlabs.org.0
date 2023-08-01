Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E876A802
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 06:47:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i/eH++Dq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFMzb56PSz3bTV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 14:47:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i/eH++Dq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFMsM0Lzyz30PN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 14:42:14 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3714ccm7021169;
	Tue, 1 Aug 2023 04:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oxfA5s3BbsfEvB+GXdpsGxOafzNerlD20Vg9rQpRQNo=;
 b=i/eH++DqWGGL62USmGXPllA1qLQk11nHbKe4H/z1/faYtKxCoEbhHhodWfVG6BLsNGOY
 L+1+ohncn047l/obMZjmPJjyrrfY7Sd5EwktyzNMEoTnMJbQ9DcypO9rkek3mmx706kr
 y5RPiqd5yWlosjZo0DS1mmp66W4enOGBeMjlg/E917Ju9ga/kKECRGXftlZFDizA8IBL
 VfIwAV4sKKDGM2y+tK9Ur/H4agxvQ8CpKG8ZDuZ/g3XrgHjmesLaBLp/DipboAi0DbSI
 lMxYzyAu9XHDGAarp4D4f3it4Zl4pLTgF4Kt+0VZfWVzYl33ecCopNEtk12tZnL6nsma 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tnaru89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:42:03 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3714dl5I026102;
	Tue, 1 Aug 2023 04:42:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tnaru00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:42:02 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 371301lC017196;
	Tue, 1 Aug 2023 04:41:55 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5fajgcwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:55 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3714ft8T6554248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 04:41:55 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2187E5805C;
	Tue,  1 Aug 2023 04:41:55 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62AF858054;
	Tue,  1 Aug 2023 04:41:51 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 04:41:51 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
Date: Tue,  1 Aug 2023 10:11:16 +0530
Message-ID: <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WGXZDHGdRA2kb64X88E9qAtZDIt4EUxL
X-Proofpoint-ORIG-GUID: ahDusJLMANXsnXaqu97Vr64TddtMY6Ke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_02,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=638 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010041
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

Allow updating memmap_on_memory mode after the kernel boot. Memory
hotplug done after the mode update will use the new mmemap_on_memory
value.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory_hotplug.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 1ce8ad04a980..d282664f558e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -89,7 +89,10 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
 		else
 			mode = MEMMAP_ON_MEMORY_DISABLE;
 	}
+	/* Avoid changing memmap mode during hotplug. */
+	get_online_mems();
 	*((int *)kp->arg) = mode;
+	put_online_mems();
 	if (mode == MEMMAP_ON_MEMORY_FORCE) {
 		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
 
@@ -110,7 +113,7 @@ static const struct kernel_param_ops memmap_mode_ops = {
 	.set = set_memmap_mode,
 	.get = get_memmap_mode,
 };
-module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
 MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
 		 "With value \"force\" it could result in memory wastage due "
 		 "to memmap size limitations (Y/N/force)");
@@ -2172,22 +2175,20 @@ static int __ref try_remove_memory(u64 start, u64 size)
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

