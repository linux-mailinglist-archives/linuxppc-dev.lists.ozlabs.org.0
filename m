Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE54761045
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:08:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QElIOO9R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CRD6kcdz3d9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QElIOO9R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CMP0Pz4z3cg3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:05:20 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P97otW017483;
	Tue, 25 Jul 2023 10:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qsU83/eOe5kjugOv8M+CXiuvNzVVJM8wGItDRM9Ulbo=;
 b=QElIOO9R1cijdKArOb+/7MCXxstibU/v0zTCAk1EYsZx70DW26j2sv4u4NeBYNkpi23Q
 NRjpUGcvZmPpwf+7TPpaJsgYjn0ML+w07xILY2XB5BQa3si3kQ75XBJDUTmEo7umTyTU
 RTzwRmDOhBDSGrTmX50TETQ+4HIJwwfHVyMvBWEDn9rcEh5O8qtzFI3O9S3SlhSjm0pT
 PI/GSmoJsnvFZtP6ukFn+mz1TcPgq+MwpwOMnLelZMYx8UymbAQ+YBCkyHrchYaHnfx8
 x5pHGL//nnMAe+rB9P3GTOHcUYwwPQRmO2FE3+KkweY6MiV9/2PeXUC/EGjhoLHPG2qj YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s20jtf5j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:05:06 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36PA0SC2030029;
	Tue, 25 Jul 2023 10:04:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s20jtf4b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:04:42 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P8da4t003714;
	Tue, 25 Jul 2023 10:02:54 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txjtusc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:54 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PA2pRd2884346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 10:02:51 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56A215805F;
	Tue, 25 Jul 2023 10:02:51 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F148E58051;
	Tue, 25 Jul 2023 10:02:47 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jul 2023 10:02:47 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 7/7] mm/hotplug: Enable runtime update of memmap_on_memory parameter
Date: Tue, 25 Jul 2023 15:32:12 +0530
Message-ID: <20230725100212.531277-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fXFt-EK2vDamQt_gvKn28gyP6SRS3QRX
X-Proofpoint-GUID: _Ks0d0ClKFtg6SwX-t9KGdVTXczUJ7Za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_04,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=743 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307250087
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
 mm/memory_hotplug.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 96e794f39313..6cb6eac1aee5 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -95,7 +95,12 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
 		mode =  MEMMAP_ON_MEMORY_DISABLE;
 
 matched:
+	/*
+	 * Avoid changing memmap mode during hotplug.
+	 */
+	get_online_mems();
 	*((int *)kp->arg) =  mode;
+	put_online_mems();
 	if (mode == MEMMAP_ON_MEMORY_FORCE) {
 		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
 
@@ -116,7 +121,7 @@ static const struct kernel_param_ops memmap_mode_ops = {
 	.set = set_memmap_mode,
 	.get = get_memmap_mode,
 };
-module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
 MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
 		 "With value \"force\" it could result in memory wastage due "
 		 "to memmap size limitations (Y/N/force)");
@@ -2175,18 +2180,16 @@ static int __ref try_remove_memory(u64 start, u64 size)
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

