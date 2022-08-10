Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F458E5F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 06:06:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2bvx0gctz3bl3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 14:06:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSfCg5K3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSfCg5K3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2bvD1Dd1z2xGm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 14:05:27 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A356OZ000720;
	Wed, 10 Aug 2022 04:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=b/0x+vtc+PAomxtWwcGIN6XtrIx0lxxdlS1LSwKS22Y=;
 b=ZSfCg5K3zbXpCFKYuExcDgJrcE6zxh27gurY/AjjwaT25VySavcWKwdpFK+pCB4dR4Si
 PTWYm5eMtnahzYFI5ffoZCiaALs5OuJdu49apGP9oiJtB8Vc92tiHvCcKK0vrgaAjgZ6
 qt73No+8aYreLc6tq+4Hn0c2gcfOfoJGfXsDTtRK5M9PfCpaxdtfZ4QPgG12VK/tK2tV
 DO6VNZS85IWTIVsJrs4V76faStZ1ksFL3sqFCflhoVmbZXjLF0lsvD+DLPR3FY1YB6YW
 VYnfqtaRFOpvdIosYEOwgdPajl0xFFtEvCAaH95Mc4xTFUkQ51CdaGhHtPMIP1scaSRX Fg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv4521gp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 04:05:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27A3oIda003583;
	Wed, 10 Aug 2022 04:03:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3huww0rbdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 04:03:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27A41GjP33030622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 04:01:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC71911C050;
	Wed, 10 Aug 2022 04:03:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9687C11C04A;
	Wed, 10 Aug 2022 04:03:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 10 Aug 2022 04:03:45 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 483A9600E5;
	Wed, 10 Aug 2022 14:03:42 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] docs: powerpc: add POWER9 and POWER10 to CPU families
Date: Wed, 10 Aug 2022 04:03:21 +0000
Message-Id: <20220810040321.375396-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QN6wec0EHcAbD8viDe4quZUC22qD8kbu
X-Proofpoint-GUID: QN6wec0EHcAbD8viDe4quZUC22qD8kbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_01,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=916 clxscore=1011 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100011
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add POWER9 and POWER10 to CPU families and list Radix MMU.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 Documentation/powerpc/cpu_families.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/powerpc/cpu_families.rst b/Documentation/powerpc/cpu_families.rst
index 9b84e045e713..eb7e60649b43 100644
--- a/Documentation/powerpc/cpu_families.rst
+++ b/Documentation/powerpc/cpu_families.rst
@@ -10,6 +10,7 @@ Book3S (aka sPAPR)
 ------------------
 
 - Hash MMU (except 603 and e300)
+- Radix MMU (POWER9 and later)
 - Software loaded TLB (603 and e300)
 - Selectable Software loaded TLB in addition to hash MMU (755, 7450, e600)
 - Mix of 32 & 64 bit::
@@ -100,6 +101,18 @@ Book3S (aka sPAPR)
           v
    +--------------+
    |    POWER8    |
+   +--------------+
+          |
+          |
+          v
+   +--------------+
+   |    POWER9    |
+   +--------------+
+          |
+          |
+          v
+   +--------------+
+   |   POWER10    |
    +--------------+
 
 
-- 
2.34.1

