Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEE75C794
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:21:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IozPQREW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6qv61nWFz3c2y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 23:21:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IozPQREW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6qtB54tmz3brp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 23:20:18 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36LDBcSK009397;
	Fri, 21 Jul 2023 13:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Uwgcxc2z4kEB6P/RRcGFv0aRyWeiXf6BgQRzfUhra7U=;
 b=IozPQREWBVQ8R4llhfgkW2Ge4zvEaaEzrprrayQDIfGv4fewwS30VymNYEiB+8/dE5gQ
 2RpFgr9T1Ne2vTR6iIOKU6rr8e32YJhwnFgI8avdJQKsXIAYY9T4Z19SvOxNFLgTkltJ
 sI6Q35z7HbKEoMehBajSBljLPISLKwyTgphX2QrV1sYBMJXP41M+Carse/eDn6REe0YG
 QjGXCieOe7zbGnmmcTkqtCKi1/kPAnh+bb+/m/uu64mnF1nR1jSaCMQPls/87mRP54Z+
 iA4akZTWNCYWXuk8D+wD6yUJnAcvjdp9CrQukD8h3KR2vIATTN8fLSfUEnCPbxBCg6DY zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rye3fs837-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 13:20:05 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36LCk8in018128;
	Fri, 21 Jul 2023 13:20:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rye3fs82n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 13:20:04 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36LDBR6c030678;
	Fri, 21 Jul 2023 13:20:03 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv79k4cxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 13:20:03 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36LDK2kX2949654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jul 2023 13:20:03 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7905958066;
	Fri, 21 Jul 2023 13:20:02 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F161258063;
	Fri, 21 Jul 2023 13:19:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.117.127])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Jul 2023 13:19:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH] mm/hotplug: Enable runtime update of memmap_on_memory parameter
Date: Fri, 21 Jul 2023 18:49:50 +0530
Message-ID: <20230721131951.306706-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qEnX3fKJR7mUZ59B9XPaEQihZtq3JnNP
X-Proofpoint-ORIG-GUID: -NtmF2eRzS3wEFAGjxRA23-0mB_NPtaB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_08,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=673 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210118
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

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
This is dependent on patches posted at
https://lore.kernel.org/linux-mm/20230718024409.95742-1-aneesh.kumar@linux.ibm.com/

 mm/memory_hotplug.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 6a8adbe030f9..21a5113fe9be 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -86,7 +86,12 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
 		mode =  MEMMAP_ON_MEMORY_DISABLE;
 
 matched:
+	/*
+	 * Avoid changing memmap mode during hotplug.
+	 */
+	get_online_mems();
 	*((int *)kp->arg) =  mode;
+	put_online_mems();
 	if (mode == MEMMAP_ON_MEMORY_FORCE) {
 		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
 			memory_block_align_base(memory_block_size_bytes()));
@@ -108,7 +113,7 @@ static const struct kernel_param_ops memmap_mode_ops = {
 	.set = set_memmap_mode,
 	.get = get_memmap_mode,
 };
-module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
 MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
 	"With value \"force\" it could result in memory wastage due to memmap size limitations \n"
 	"For example, if the memmap for a memory block requires 1 MiB, but the pageblock \n"
@@ -2162,18 +2167,16 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
 	 * the same granularity it was added - a single memory block.
 	 */
-	if (mhp_memmap_on_memory()) {
-		ret = walk_memory_blocks(start, size, &mhp_altmap,
-					 get_vmemmap_altmap_cb);
-		if (ret) {
-			if (size != memory_block_size_bytes()) {
-				pr_warn("Refuse to remove %#llx - %#llx,"
-					"wrong granularity\n",
-					start, start + size);
-				return -EINVAL;
-			}
-			altmap = &mhp_altmap;
+	ret = walk_memory_blocks(start, size, &mhp_altmap,
+				 get_vmemmap_altmap_cb);
+	if (ret) {
+		if (size != memory_block_size_bytes()) {
+			pr_warn("Refuse to remove %#llx - %#llx,"
+				"wrong granularity\n",
+				start, start + size);
+			return -EINVAL;
 		}
+		altmap = &mhp_altmap;
 	}
 
 	/* remove memmap entry */
-- 
2.41.0

