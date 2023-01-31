Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C246682286
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 04:07:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5VMq73B3z3c73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 14:07:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RqjFY4KC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5VLq2PYHz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 14:06:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RqjFY4KC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P5VLn4D6Nz4xwy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 14:06:25 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P5VLn496Pz4xwq; Tue, 31 Jan 2023 14:06:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RqjFY4KC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P5VLm6vnPz4x1h;
	Tue, 31 Jan 2023 14:06:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V2E7MY008345;
	Tue, 31 Jan 2023 03:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=O7P6zzM3RFIc9WQ/TtCEEVF/ljUnsvXunPPNYrBahQA=;
 b=RqjFY4KCOoL9wNKP6qoruyIC+jgrdu6uAMR3NxE+ZP78NY1gyPcYrnu/gEVKX2V8x3/e
 hrFPveGnGbyncWiqpX4VZOMqAWwNDXYBsRTf/DUOnvC4TBmIDSx01o/UnUJUC+MtMSrQ
 S6a8BLnQp8rtJVflkFhG6VjeX5chi9u+szFWHL3cewr5ts0sjaJ+Rpk45VZDEhe+gTNT
 XxSTPG87nyCgSXqd9WF3F9MzU6CfzSD0P9mZDHy9Hii0mtNHk80Z0NQu3BzVHVVqY25/
 zixE9EpqtV+pp31MWVsmO/9OZzwqy+HIswrUOL9I0sg024kwwo0oyCk2+StDaQo6KWz7 mg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3net14s159-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 03:06:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UL30Zu014675;
	Tue, 31 Jan 2023 03:06:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtttxd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 03:06:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V36HME47120780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 03:06:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DD6820040;
	Tue, 31 Jan 2023 03:06:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 738CA20043;
	Tue, 31 Jan 2023 03:06:16 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.6.148])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 03:06:16 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/kexec_file: account hot-pluggable memory while estimating FDT size
Date: Tue, 31 Jan 2023 08:36:15 +0530
Message-Id: <20230131030615.729894-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VgNGgMeAGofopFhzgroJrD30W733YSqC
X-Proofpoint-ORIG-GUID: VgNGgMeAGofopFhzgroJrD30W733YSqC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_19,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=840 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310026
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Systems where online memory is lesser compared to max memory, the
kexec_file_load system call may fail to load the kdump kernel with the
below errors:

    "Failed to update fdt with linux,drconf-usable-memory property"
    "Error setting up usable-memory property for kdump kernel"

This happens because the size estimation for usable memory properties
for the kdump kernel's FDT is based on the online memory whereas the
usable memory properties include max memory. In short, the hot-pluggable
memory is not accounted for while estimating the size of the usable
memory properties.

The issue is addressed by calculating usable memory property size using
max hotplug address instead of the last online memory address.

Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Since v2: rebase the patch on top of
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230130014707.541110-1-mpe@ellerman.id.au/

 arch/powerpc/kexec/file_load_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 3caee570e79bf..6af82fb53a493 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -990,7 +990,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	 * number of usable memory entries and use for FDT size estimation.
 	 */
 	if (drmem_lmb_size()) {
-		usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
+		usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
 			       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
 		extra_size = (unsigned int)(usm_entries * sizeof(u64));
 	} else
-- 
2.39.1

