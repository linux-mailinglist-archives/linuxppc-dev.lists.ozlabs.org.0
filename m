Return-Path: <linuxppc-dev+bounces-13343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCBC0EDAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwH8v1wyfz3c8W;
	Tue, 28 Oct 2025 02:14:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761578047;
	cv=none; b=Xzi+u5lvHQZWWCYr2tHj8yttt9YrgILmJnyHCIl8HcZ88axBBHtem+Ht67vmmCjwTeve4wLdc4GyNIejNsGV5kuUxxuP+mEG3SWd10U8KMvhirdykEUgmmXL8C/e9tdGmtQ9X1LTbenMB5uijHtTt/bqAZ2aEbuaDvN4AbSYDCmdAkE9vKNsbzByQ8I8D9B+Y1J+aYBDhaiRHrkpxRa5TbOQYl6Ign10X3R2ewUCN5jdb3+4Tw7AH+5uprRU4AuR0OQ9k2Y5FHxRye0BPY+7QelnIx2bW71qCjjkMby03AZEtwwX5U6CgYVnt/Fipujv+AigHJtgKYekpMQGkgaJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761578047; c=relaxed/relaxed;
	bh=rBFZUpDRAgy7faHQYYS8i1Q7o+lCCrp8x5LlLblp7zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJxbthr8KQ0LkfPYldUi/oC9Lan9U5Xxm+L7T5LxQOl/saoxpJYVGTg7bCNNEWJ4Nq/EYeqPPVsobXvnGnqEfhy+P8qi6qs3n3d3SrpZyqITm0RL2qmgTRPZ54eHwOPBW06ZwOj25J/uKmcBxYWzTPLz9I0iIFJwoFAdGYXMqPqMXBClE/v1G47aRwkFk3yrdIF487cTrECe5YRcd10flhs+eEtprpXexka5/+CYwUSb4cW9vu6YpukC+dAk2cy7avStqi0tfZJ5PqkJrMR6+Gy4DjRYGnGFDytCmgUwZhKEO5gb7IopcnFeZtuJmWtVp0DOdThOoxg+0zeVjeJX3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PKDSyBbE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PKDSyBbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwH8t3tzpz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:14:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDLCIb001054;
	Mon, 27 Oct 2025 15:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rBFZUpDRAgy7faHQY
	YS8i1Q7o+lCCrp8x5LlLblp7zM=; b=PKDSyBbEhGWfp4gjxJrxNNbIcDbGNIGCK
	uZnwSd3nuWxMvNakZDM/ZGQ/eNVH/ots4aW2rqJHcEoPR0Z2SenVNFLIWjjSlzo4
	D/YtZXm5ATT3CIQi6f2iBoiSquxqZ4KmVc40xHVesYeGHn1rmwHokskUrAHMXlmV
	/6PtFaMyiSKIuq1BwJ44T8PtjkmL/OSVxxX+DTEQ3nv+Fhsvic/aaTkX5xsNcKTJ
	/3biHHQwTv9ptSdFDjlzazU18b3MgAEn6Xna3NdIeHIy+BmuGwFjxuvCOLV3b5Ev
	KlKxbySl/KC4e4WVFs7eGed7IQybuEZlLnUsorO9u0wwto2nHYyAw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p98yek3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59REhqpV003262;
	Mon, 27 Oct 2025 15:13:58 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p98yejw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59RBg5R3030460;
	Mon, 27 Oct 2025 15:13:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a1acjp48g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59RFDrxl8847736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 15:13:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45E8A2004B;
	Mon, 27 Oct 2025 15:13:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B00820049;
	Mon, 27 Oct 2025 15:13:51 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Oct 2025 15:13:51 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 3/4] powerpc/kdump: consider high crashkernel memory if enabled
Date: Mon, 27 Oct 2025 20:43:37 +0530
Message-ID: <20251027151338.819957-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=68ff8c37 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=6SxKnrAwoGKjFlm4xfAA:9
X-Proofpoint-GUID: zDnNyTMPDN2MFZQ-cimkWefBd4uSYcCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxOSBTYWx0ZWRfX2aa66SED5VA0
 cXt/Qx2K9bGGK9UixMN0kbnx2rBjMNDB0Kz10WLtr6TVaIAdYVm5mad5hGGbN3Sai2xm2Lh6QtY
 L30XgiO3mT+zJ5qZ1DpIxuvK5YeriM8tQtiQaEt2yJ+gqUZL8RAJoz2t8CWhtJltn3zZLAolYPd
 lg1e4bdfWjiB/Ungzn1qXryjVUIzTpNwex2HAx01tIq5OiUSj7zBv6wc2BIdAU/0imO39fHUnBB
 0Izxsrg04y+vddvGJ9/kWrQiOVGauGOHbEl26zS/ZJGPK0hDydqLb32IadvoDIxzDntoZDw+puN
 Evsx0wWtlYujnmPoIP9iF31mrZPcJpvfBugW3YqVgFF1gYOG3997TMx5xTTNVo6fDgjkox3PTeJ
 o+wLB11pFyQrIOwYhKV2p7qQB2iEgQ==
X-Proofpoint-ORIG-GUID: 4KBHKyANbNoefHRNJ0VzepJFDhM7XeFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The next patch adds high crashkernel reservation support on powerpc, so
kdump setup is updated to handle high crashkernel while loading the kdump
kernel.

With high crashkernel reservation, the crashkernel is split into two
regions: low crashkernel and high crashkernel. To ensure kdump loads
properly with the split reservation, the following changes are made:

 - Load the kdump image in high memory if enabled
 - Include both low and high crashkernel regions in usable memory
   ranges for the kdump kernel
 - Exclude both low and high crashkernel regions from crashkernel memory
  to prevent them from being exported through /proc/vmcore

Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/elf_64.c       | 10 +++++++---
 arch/powerpc/kexec/file_load_64.c |  5 +++--
 arch/powerpc/kexec/ranges.c       | 24 +++++++++++++++++++++---
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 5d6d616404cf..ab84ff6d3685 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -52,9 +52,13 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (IS_ENABLED(CONFIG_CRASH_DUMP) && image->type == KEXEC_TYPE_CRASH) {
 		/* min & max buffer values for kdump case */
 		kbuf.buf_min = pbuf.buf_min = crashk_res.start;
-		kbuf.buf_max = pbuf.buf_max =
-				((crashk_res.end < ppc64_rma_size) ?
-				 crashk_res.end : (ppc64_rma_size - 1));
+
+		if (crashk_low_res.end)
+			kbuf.buf_max = pbuf.buf_max = crashk_res.end;
+		else
+			kbuf.buf_max = pbuf.buf_max =
+					((crashk_res.end < ppc64_rma_size) ?
+					crashk_res.end : (ppc64_rma_size - 1));
 	}
 
 	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e7ef8b2a2554..d45f5748e75c 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -746,6 +746,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
 	int i, nr_ranges, ret;
 
 #ifdef CONFIG_CRASH_DUMP
+	uint64_t crashk_start;
 	/*
 	 * Restrict memory usage for kdump kernel by setting up
 	 * usable memory ranges and memory reserve map.
@@ -765,8 +766,8 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
 		 * Ensure we don't touch crashed kernel's memory except the
 		 * first 64K of RAM, which will be backed up.
 		 */
-		ret = fdt_add_mem_rsv(fdt, BACKUP_SRC_END + 1,
-				      crashk_res.start - BACKUP_SRC_SIZE);
+		crashk_start = crashk_low_res.end ? crashk_low_res.start : crashk_res.start;
+		ret = fdt_add_mem_rsv(fdt, BACKUP_SRC_END + 1, crashk_start - BACKUP_SRC_SIZE);
 		if (ret) {
 			pr_err("Error reserving crash memory: %s\n",
 			       fdt_strerror(ret));
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index c61aa96f0942..53e52e1f07c8 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -524,9 +524,20 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 	 * Also, crashed kernel's memory must be added to reserve map to
 	 * avoid kdump kernel from using it.
 	 */
-	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
-	if (ret)
-		goto out;
+	if (crashk_low_res.end) {
+		ret = add_mem_range(mem_ranges, 0, crashk_low_res.end + 1);
+		if (ret)
+			goto out;
+
+		ret = add_mem_range(mem_ranges, crashk_res.start,
+				    crashk_res.end - crashk_res.start + 1);
+		if (ret)
+			goto out;
+	} else {
+		ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
+		if (ret)
+			goto out;
+	}
 
 	for (i = 0; i < crashk_cma_cnt; i++) {
 		ret = add_mem_range(mem_ranges, crashk_cma_ranges[i].start,
@@ -610,6 +621,13 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 	if (ret)
 		goto out;
 
+	if (crashk_low_res.end) {
+		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_low_res.start,
+						      crashk_low_res.end);
+		if (ret)
+			goto out;
+	}
+
 	for (i = 0; i < crashk_cma_cnt; ++i) {
 		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
 					      crashk_cma_ranges[i].end);
-- 
2.51.0


