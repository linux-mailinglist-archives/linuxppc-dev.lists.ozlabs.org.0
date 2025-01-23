Return-Path: <linuxppc-dev+bounces-5509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB381A1A360
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:44:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydzcm4RqVz304s;
	Thu, 23 Jan 2025 22:44:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632664;
	cv=none; b=NiybcxxZQ6T889i8xD3F1dMPQRbs4HJBnA4kKhhZn9MBToKvNyZbmte0h/Y37j8T/SC5nATbweIBi67Vxmq7CKMM/9AzIxwAkkvvS21clH+O24i3C5VG6/aQkU4Ml6kzNO9eJWnNH2SBxegxiWqdsHagj/Bon0tZV6Ydj7nbZGc54Vetg1Z+prPUCxDyeCU3I8X5UaYK+bNSSzguEpL4iULgRhp8QOWLCv+2YVFDOCx3J6oIGS63MJ2z0FRfJANSBtPX2ax8Q7prnnYJlov/2AKwIqPsBz56DolbVwf5vC4UEj6PzLFXXSxVeReqp6mOA4bKig/2YBPxnjx0yI1t7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632664; c=relaxed/relaxed;
	bh=6jOfdPzFTZJ2/lzXa4HsvLrNGmNUlu6omzGEd+wEMOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDzCLzWY+yqU17oNIg2RerNF9k0GYz47reLYeqM2YquwDiNgxExUO27z2EAOtwxsXrlnSr+p/lJjfq+2eiLgtfeVsCcYWA39QZ21TCVVaQCftj3glGrbYzdHQcfLSiuGB5eoMF195xK0C1+UcHosZO+izHbHljGbyonFo3PMNVi+xW/xWlKNTYUUrLBy/JyoO9ZvNjMpXGaNVvJ20tY7Qw4er53Wb5D/yntuhs9bch65SP6oGQxSkj0VC1BXsTMLsyEZA8S2509Qsf0l9JdyfmIGZErMAQWe6Zdz1c1M9iiIwZKzhWMUk84s8ExYqHpEVrtzdlLLYLR2JYLd0PFH3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WgLgNaqE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WgLgNaqE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydzcl5bkqz304C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:44:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7Wo4Y028035;
	Thu, 23 Jan 2025 11:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6jOfdPzFTZJ2/lzXa
	4HsvLrNGmNUlu6omzGEd+wEMOM=; b=WgLgNaqEA89SVYkxZwvLJVqlOb0MDCX7e
	yE7G1BR4hDCJBdlYGGQSqg1+6N8akrKMIIquo5Qo87wsp73kqRP01FV7q6Q5TxIY
	IjslFxcQpyBQPQtUpSoo0QR0PNJIcB0vGUlKNsQKKi/a4rkyzPshZoJk0mxrum9n
	vDGly0zbOlbujkNS5gMLpa7Z36S3bPKpMQQS3AB9KppNIvv4+XlFUTDE8kkwCdUK
	6iRAmZHa+CHvV06ZAro+nf0RYY2mjLcaH1ej4Po81M1k/dB+GmZ5AlhhtKzdTPOL
	8FMsnOGVxvVkqt3NeH6qPFfx3mZGVTh7t6KsaEP+NG6/067yEmUgg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bhfph49e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:44:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NBaxT1029594;
	Thu, 23 Jan 2025 11:44:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448qmnnb6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:44:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBiBsF56885644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:44:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32F6C20043;
	Thu, 23 Jan 2025 11:44:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2699A20040;
	Thu, 23 Jan 2025 11:44:09 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:44:08 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v3 4/4] Documentation/powerpc/fadump: add additional parameter feature details
Date: Thu, 23 Jan 2025 17:12:54 +0530
Message-ID: <20250123114254.200527-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XfQwhqRmfR59cVkpnLuYSIACyHQydZBH
X-Proofpoint-ORIG-GUID: XfQwhqRmfR59cVkpnLuYSIACyHQydZBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Update the fadump document to include details about the fadump
additional parameter feature.

The document includes the following:
- Significance of the feature
- How to use it
- Feature restrictions

No functional changes are introduced.

Cc: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-kernel-fadump |  3 ++-
 .../arch/powerpc/firmware-assisted-dump.rst   | 22 +++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index 2f9daa7ca55b..b64b7622e6fc 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -55,4 +55,5 @@ Date:		May 2024
 Contact:	linuxppc-dev@lists.ozlabs.org
 Description:	read/write
 		This is a special sysfs file available to setup additional
-		parameters to be passed to capture kernel.
+		parameters to be passed to capture kernel. For HASH MMU it
+		is exported only if RMA size higher than 768MB.
diff --git a/Documentation/arch/powerpc/firmware-assisted-dump.rst b/Documentation/arch/powerpc/firmware-assisted-dump.rst
index 7e37aadd1f77..7e266e749cd5 100644
--- a/Documentation/arch/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/arch/powerpc/firmware-assisted-dump.rst
@@ -120,6 +120,28 @@ to ensure that crash data is preserved to process later.
    e.g.
      # echo 1 > /sys/firmware/opal/mpipl/release_core
 
+-- Support for Additional Kernel Arguments in Fadump
+   Fadump has a feature that allows passing additional kernel arguments
+   to the fadump kernel. This feature was primarily designed to disable
+   kernel functionalities that are not required for the fadump kernel
+   and to reduce its memory footprint while collecting the dump.
+
+  Command to Add Additional Kernel Parameters to Fadump:
+  e.g.
+  # echo "nr_cpus=16" > /sys/kernel/fadump/bootargs_append
+
+  The above command is sufficient to add additional arguments to fadump.
+  An explicit service restart is not required.
+
+  Command to Retrieve the Additional Fadump Arguments:
+  e.g.
+  # cat /sys/kernel/fadump/bootargs_append
+
+Note: Additional kernel arguments for fadump with HASH MMU is only
+      supported if the RMA size is greater than 768 MB. If the RMA
+      size is less than 768 MB, the kernel does not export the
+      /sys/kernel/fadump/bootargs_append sysfs node.
+
 Implementation details:
 -----------------------
 
-- 
2.48.1


