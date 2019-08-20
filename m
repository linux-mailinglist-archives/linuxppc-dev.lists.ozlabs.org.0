Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB64995E52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:23:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CVM60HVQzDqGF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 22:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTxw65mrzDqww
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTxw41V2z8wPB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:05:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTxw3Fz9z9sDQ; Tue, 20 Aug 2019 22:05:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46CTxv45jdz9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:05:07 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC1sd4015212
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:05 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugekq5p7y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:05 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:05:03 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:05:01 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC50j746072004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:05:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A3494C040;
 Tue, 20 Aug 2019 12:05:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C620B4C063;
 Tue, 20 Aug 2019 12:04:58 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:04:58 +0000 (GMT)
Subject: [PATCH v5 07/31] powerpc/fadump: release all the memory above boot
 memory size
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:34:58 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0008-0000-0000-0000030B0852
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0009-0000-0000-00004A292F66
Message-Id: <156630269797.8896.13397199124372832591.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=856 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Except for reserve dump area which is permanent reserved, all memory
above boot memory size is released when the dump is invalidated. Make
this a bit more explicit in the code.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c |   34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 5f5bc37..f26ab58 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -341,6 +341,8 @@ int __init fadump_reserve_mem(void)
 	else
 		memory_boundary = memblock_end_of_DRAM();
 
+	size = get_fadump_area_size();
+	fw_dump.reserve_dump_area_size = size;
 	if (fw_dump.dump_active) {
 		pr_info("Firmware-assisted dump is active.\n");
 
@@ -366,12 +368,15 @@ int __init fadump_reserve_mem(void)
 				be64_to_cpu(fdm_active->rmr_region.destination_address) +
 				be64_to_cpu(fdm_active->rmr_region.source_len);
 		pr_debug("fadumphdr_addr = %pa\n", &fw_dump.fadumphdr_addr);
-		fw_dump.reserve_dump_area_start = base;
-		fw_dump.reserve_dump_area_size = size;
-	} else {
-		size = get_fadump_area_size();
 
 		/*
+		 * Start address of reserve dump area (permanent reservation)
+		 * for re-registering FADump after dump capture.
+		 */
+		fw_dump.reserve_dump_area_start =
+			be64_to_cpu(fdm_active->cpu_state_data.destination_address);
+	} else {
+		/*
 		 * Reserve memory at an offset closer to bottom of the RAM to
 		 * minimize the impact of memory hot-remove operation. We can't
 		 * use memblock_find_in_range() here since it doesn't allocate
@@ -397,7 +402,6 @@ int __init fadump_reserve_mem(void)
 			(unsigned long)(memblock_phys_mem_size() >> 20));
 
 		fw_dump.reserve_dump_area_start = base;
-		fw_dump.reserve_dump_area_size = size;
 		return fadump_cma_init();
 	}
 	return 1;
@@ -1139,34 +1143,16 @@ static void fadump_release_memory(unsigned long begin, unsigned long end)
 
 static void fadump_invalidate_release_mem(void)
 {
-	unsigned long reserved_area_start, reserved_area_end;
-	unsigned long destination_address;
-
 	mutex_lock(&fadump_mutex);
 	if (!fw_dump.dump_active) {
 		mutex_unlock(&fadump_mutex);
 		return;
 	}
 
-	destination_address = be64_to_cpu(fdm_active->cpu_state_data.destination_address);
 	fadump_cleanup();
 	mutex_unlock(&fadump_mutex);
 
-	/*
-	 * Save the current reserved memory bounds we will require them
-	 * later for releasing the memory for general use.
-	 */
-	reserved_area_start = fw_dump.reserve_dump_area_start;
-	reserved_area_end = reserved_area_start +
-			fw_dump.reserve_dump_area_size;
-	/*
-	 * Setup reserve_dump_area_start and its size so that we can
-	 * reuse this reserved memory for Re-registration.
-	 */
-	fw_dump.reserve_dump_area_start = destination_address;
-	fw_dump.reserve_dump_area_size = get_fadump_area_size();
-
-	fadump_release_memory(reserved_area_start, reserved_area_end);
+	fadump_release_memory(fw_dump.boot_memory_size, memblock_end_of_DRAM());
 	if (fw_dump.cpu_notes_buf) {
 		fadump_cpu_notes_buf_free(
 				(unsigned long)__va(fw_dump.cpu_notes_buf),

