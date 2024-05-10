Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED28C1FA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 10:22:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EBtI1QRF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbMLL3NKMz3cYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 18:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EBtI1QRF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbMKf1KdTz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 18:21:25 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44A8IqFA006095;
	Fri, 10 May 2024 08:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=IPicuXcvG4YrrJxDCK3z2nbRd1si1MVme/lZEySCfeg=;
 b=EBtI1QRFwsdhwAkcuvMzIQd44w4KxKJ2yjYrLBBfn3R1K0h9l2Qo9s276FIZMAES7skf
 5J4G1rtm9820nriNlZ2VagTCSLGPMQKLgNcEeYRq3l7jIm78qel25fSvOpSIX7+kc+Ft
 EVahoHkg5Yk9ZtxZHC0BRk9A1CwpePMddDARLwgMh+Pa6jyWFH2t2KUr3aIo8eiay0bl
 M2OYBdIzvKoe1IKDgDdIQMUOuWH1x8ZvcaYM3k6w0L77g10z3WT3Q3d7XhSFDPjQJ71O
 0mBTRSvAbXnjgITctnH8YKBnqSLcN/a8UGCTHMCTlJebT+9Q5OFt/uQksn8n0ZkrnP6h 1A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1fy7004m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 08:21:21 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A7D1Uj009533;
	Fri, 10 May 2024 08:21:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xyshv02x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 08:21:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44A8LGJN51315082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 08:21:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9811920043;
	Fri, 10 May 2024 08:21:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0AC02004E;
	Fri, 10 May 2024 08:21:15 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 08:21:15 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/fadump: update documentation about bootargs_append
Date: Fri, 10 May 2024 13:51:14 +0530
Message-ID: <20240510082114.561163-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l5a8PVzqXONwQxL1Nnxg5uZeERoC3pWk
X-Proofpoint-ORIG-GUID: l5a8PVzqXONwQxL1Nnxg5uZeERoC3pWk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_06,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=783 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100059
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update ABI documentation about the introduction of the new sysfs
entry bootargs_append. This sysfs entry will be used to setup the
additional parameters to be passed to dump capture kernel.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* This patch is a follow-up of below patch series, to update corresponding
  ABI documentation:

    https://lore.kernel.org/all/20240509115755.519982-1-hbathini@linux.ibm.com/

 Documentation/ABI/testing/sysfs-kernel-fadump | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
index c586054657d6..2f9daa7ca55b 100644
--- a/Documentation/ABI/testing/sysfs-kernel-fadump
+++ b/Documentation/ABI/testing/sysfs-kernel-fadump
@@ -49,3 +49,10 @@ Description:	read only
 		memory add/remove events because elfcorehdr is now prepared in
 		the second/fadump kernel.
 User:		kexec-tools
+
+What:		/sys/kernel/fadump/bootargs_append
+Date:		May 2024
+Contact:	linuxppc-dev@lists.ozlabs.org
+Description:	read/write
+		This is a special sysfs file available to setup additional
+		parameters to be passed to capture kernel.
-- 
2.45.0

