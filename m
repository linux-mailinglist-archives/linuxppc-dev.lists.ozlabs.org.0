Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4589D0D9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 05:16:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDL9/zEL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDB255dKnz3dWh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 13:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDL9/zEL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDB1L0hcjz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 13:15:49 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 439386Hr005531;
	Tue, 9 Apr 2024 03:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3hR7/b+Lcmm0h+bCz7ikScFKg0g90gZUtEoSlyOaUGQ=;
 b=QDL9/zELLwJNTA0AlRX0XMVL5usITKhIqI7llCZqCy7N8HGs3rxRV/D0UwmrLLuGzbjM
 yvDYC37VQftNtPjImysV3fWO2/YqdG7hjBeE5aEhfVcM856SZKQSJ0dPtP6pccEaVKIE
 lq9/hxwzsYTliDoyEkFdEN58SBsV978NCM1absBAfDovsIrF7QDk+A5yGdY4wTpdceLj
 9V/9ZgafeMs8F4P7mVfMI641SZ22vli5o/+VNGzL9DhpltKtJMKgkC6XQ//3bYmlk6iV
 p/gVyxDRbS/1KrgswfW5PQCbioAkZt1yzu7b1BpxwI4JcpfAM5W7/m2zTXafHmMwgnT/ tQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcv1gg43b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 03:15:45 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4390vlJA013550;
	Tue, 9 Apr 2024 03:15:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbgqtc1ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 03:15:44 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4393Ff1F27656924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Apr 2024 03:15:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E28E2004B;
	Tue,  9 Apr 2024 03:15:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC77F20040;
	Tue,  9 Apr 2024 03:15:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Apr 2024 03:15:40 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 481A76016D;
	Tue,  9 Apr 2024 13:15:37 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: Make cxlflash obsolete
Date: Tue,  9 Apr 2024 13:10:26 +1000
Message-ID: <20240409031027.41587-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MjqIFWIQGX14MH6cBX1Ov2X8XbAeNIZ5
X-Proofpoint-ORIG-GUID: MjqIFWIQGX14MH6cBX1Ov2X8XbAeNIZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=703 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404090018
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
Cc: fbarrat@linux.ibm.com, ukrishn@linux.ibm.com, manoj@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The cxlflash driver is no longer actively maintained and we intend to
remove it in a future kernel release. Change its status to obsolete.

While we're here, Matthew Ochs no longer works at IBM and is no longer in
a position to access cxlflash hardware, so remove him from the maintainers
list.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aea47e04c3a5..34f605498873 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5780,10 +5780,9 @@ F:	include/uapi/misc/cxl.h
 
 CXLFLASH (IBM Coherent Accelerator Processor Interface CAPI Flash) SCSI DRIVER
 M:	Manoj N. Kumar <manoj@linux.ibm.com>
-M:	Matthew R. Ochs <mrochs@linux.ibm.com>
 M:	Uma Krishnan <ukrishn@linux.ibm.com>
 L:	linux-scsi@vger.kernel.org
-S:	Supported
+S:	Obsolete
 F:	Documentation/arch/powerpc/cxlflash.rst
 F:	drivers/scsi/cxlflash/
 F:	include/uapi/scsi/cxlflash_ioctl.h
-- 
2.44.0

