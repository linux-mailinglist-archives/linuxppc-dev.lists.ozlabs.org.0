Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE964D7DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 09:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXlyN4xgYz2xkD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 19:39:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MFLRvKtL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXlxL6hWcz3bM7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 19:38:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MFLRvKtL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NXlxL3nqvz4xND
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 19:38:14 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NXlxL3kkhz4xN4; Thu, 15 Dec 2022 19:38:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MFLRvKtL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NXlxL1PLBz4xGP;
	Thu, 15 Dec 2022 19:38:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF8Uk4H011122;
	Thu, 15 Dec 2022 08:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Kp7C12VdMwEkgQ7GsMfQI4D7dI2SqpHBL4V9v97/TM8=;
 b=MFLRvKtLmFSNPDXgxD5vNkMkYpuiX7NTMx1TRoTP01MwUmtt8WaRqK937rB+asaNC0VT
 gaZ76bt+GHqeYlik7Kp1yPB9/kMEqEHeTIIwSoGeXYKTzhXFBUap1gni5pDl6rwhGo5u
 g0yLr/fvIkr77FyazKaRwdufgcG2dxeY364V7GOYMw5tunhOITvFIizje6f1c/TVstMC
 ELgi3vOiNQlaS9Btbda7UUptc5BrhTihxWhCBF3Oz2WQoVouq+53G843QAMb4bHKjNUt
 4QCGahqWNBnvxSE7GTegoyjwxTFa9tsjJtbDSAY3F23RnqFS/+iwoXuf7/uQPfwSpz5O ig== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg04vr5dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 08:38:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF0b572028694;
	Thu, 15 Dec 2022 08:38:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mfs5ygffk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 08:38:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BF8c4dF22937990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Dec 2022 08:38:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19CE920043;
	Thu, 15 Dec 2022 08:38:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D81DB20040;
	Thu, 15 Dec 2022 08:38:02 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.58.62])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Dec 2022 08:38:02 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/kexec_file: account hot-pluggable memory while estimating FDT size
Date: Thu, 15 Dec 2022 14:08:01 +0530
Message-Id: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nYjz3IYQFrZwCN0B6l0chH_0DPFe2eEL
X-Proofpoint-ORIG-GUID: nYjz3IYQFrZwCN0B6l0chH_0DPFe2eEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_03,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150068
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
 arch/powerpc/kexec/file_load_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 349a781cea0b3..2c3fd6fe6bc94 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -947,7 +947,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	 * linux,drconf-usable-memory properties. Get an approximate on the
 	 * number of usable memory entries and use for FDT size estimation.
 	 */
-	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
+	usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
 		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
 	return (unsigned int)(usm_entries * sizeof(u64));
 }
-- 
2.38.1

