Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B77C495A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:45:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JOeStWj/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51v00c3Dz3w2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JOeStWj/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kR2VwRz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:34 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5G4gH011639
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D8V3jC7t9ie15vmm7rFeqXfINU+2pKdvuNgzMNRfLIo=;
 b=JOeStWj/stDGfad+PWwBKxlTNKiiwg+Sh0W8sOES8ZED6RtCNJs/2ONHAcI4Rv7OuMc6
 XwqVX1Cea01eVvNb6P5e2IPL6wPmZdgN41am2uXeO1Kh55979j6ASmQ6a2njvGBMfoNC
 vL+yuA7Qcsd+SxQWKyiHl/qCc4kTg7ArlNPBRgMoiMEBIA/vF6JjgkV9zBHsLsxc7f5P
 iE5pA2IkYk6KalUd/Dkh5RMu8BlAJX6iqVQlYlcZDku0AyCCSVGnoa8Wonu9s8xAnE8G
 FkgV8tYfMsP8BEQ5y5zfQP7UyjLr+9NKB5hGwhRqs75xqCGqid4Pbcychqaj6l/sc98C bQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnderd08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B3Fffi000653
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5knq93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bTO547513940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A62E52004F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 356802004B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8AE3D60833;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/12] powerpc/eeh: Remove unnecessary cast
Date: Wed, 11 Oct 2023 16:37:10 +1100
Message-ID: <20231011053711.93427-12-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y7yzN8prwNI9c90jlaYDiJSc82DT_EN4
X-Proofpoint-GUID: y7yzN8prwNI9c90jlaYDiJSc82DT_EN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_02,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310110048
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports a warning when casting to an int. There is no need to
cast in the first place, so drop them.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 438568a472d0..48773d2d9be3 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -39,7 +39,7 @@ static int eeh_result_priority(enum pci_ers_result result)
 	case PCI_ERS_RESULT_NEED_RESET:
 		return 6;
 	default:
-		WARN_ONCE(1, "Unknown pci_ers_result value: %d\n", (int)result);
+		WARN_ONCE(1, "Unknown pci_ers_result value: %d\n", result);
 		return 0;
 	}
 };
@@ -60,7 +60,7 @@ static const char *pci_ers_result_name(enum pci_ers_result result)
 	case PCI_ERS_RESULT_NO_AER_DRIVER:
 		return "no AER driver";
 	default:
-		WARN_ONCE(1, "Unknown result type: %d\n", (int)result);
+		WARN_ONCE(1, "Unknown result type: %d\n", result);
 		return "unknown";
 	}
 };
-- 
2.39.2

