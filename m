Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B65164FFF91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 21:46:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdtPL5b9Wz3blK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 05:45:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iLgPXiVB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iLgPXiVB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdtNh2CJPz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 05:45:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DJg61V030058; 
 Wed, 13 Apr 2022 19:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=u4bOfC9HpKm6ELdhBSI/96dVlBnElElxfU/x6TM1RJk=;
 b=iLgPXiVB/OxUSCTENNljwsQYgW7NhkpHSJeFojueJG4kyVzEergn+oSr7cWjOl+QmTYI
 7kO2G3weLiOHiIwPfUeub7DwrnM+nHngUkYTl+z8s1vFXOtMZQHww1cKH/tzdwgX7zkc
 7qi4GSyWXXraOnH40RD66RaiHujxMkylCIM8Z2oz+GRfjlMs/aHeBVmVP0yUOfG8Vc1A
 TVbVXmWQXl/CPmsLpAeeCBnCx01biraANwW1bCmC3Eis6y9wGyQ9yabam+E0mYNJfEMS
 LCrrRXCBfWNj9XEx3DK35mHHLgwERpwfg+yZCcMmZnMRGCMN+rgrJvPhf7xADieGCZUp eQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fe4wa81pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 19:45:19 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DJg590028127;
 Wed, 13 Apr 2022 19:45:18 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3fb1sa2bpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 19:45:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23DJjHrp34865552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 19:45:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E1378069;
 Wed, 13 Apr 2022 19:45:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D516F78067;
 Wed, 13 Apr 2022 19:45:16 +0000 (GMT)
Received: from suka-w540.ibmuc.com (unknown [9.65.203.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 Apr 2022 19:45:16 +0000 (GMT)
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] powerpc: Update MAINTAINERS for ibmvnic and VAS
Date: Wed, 13 Apr 2022 12:45:15 -0700
Message-Id: <20220413194515.93139-1-sukadev@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G4n-56vLH-3FaNwneL8CvwfVd7wO4lo_
X-Proofpoint-ORIG-GUID: G4n-56vLH-3FaNwneL8CvwfVd7wO4lo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_03,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 mlxlogscore=824 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130094
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
Cc: Dany Madden <drt@linux.ibm.com>, netdev@vger.kernel.org,
 Brian King <brking@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61d9f114c37f..cf96ac858cc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9336,14 +9336,12 @@ F:	drivers/pci/hotplug/rpaphp*
 
 IBM Power SRIOV Virtual NIC Device Driver
 M:	Dany Madden <drt@linux.ibm.com>
-M:	Sukadev Bhattiprolu <sukadev@linux.ibm.com>
 R:	Thomas Falcon <tlfalcon@linux.ibm.com>
 L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/ethernet/ibm/ibmvnic.*
 
 IBM Power Virtual Accelerator Switchboard
-M:	Sukadev Bhattiprolu <sukadev@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 F:	arch/powerpc/include/asm/vas.h
-- 
2.27.0

