Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB3325901
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:52:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmmjk4fsVz3dSP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 08:52:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X9pyIKGI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X9pyIKGI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmmgv03N1z3cZ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 08:51:05 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PLWqZq090842; Thu, 25 Feb 2021 16:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tudWfFa6EnAtPpUDuhWIqyt1aFdyrrhcUl3QJPvn74c=;
 b=X9pyIKGIZ0Xet26r0c8gt4SWVgWiCy/8wQ68dukokgp8euCB9nW2Ul/KAWV4vJQQ0llL
 0gRkyQ4ZZ8nuWS1VPzr2fWXP2D9Ps8k/X4Xu6ANNFyTHzPP2HRmBmb+U7cTopMZuSU1j
 nYNp6myx+4xWmJakZQqTA1EQaA8CMhlngDhepJAXb0JqG6r6CiQcqfwEtjBg70YYl9P7
 GiYqJpUq2WIKXwSkD0kYI4woD6AKitO2+4viavEWJS22j68g1PbnHBF7z1IMUjjRXph0
 UKvCOgCh86bGBt+mZLlUrNGISpaE2HzmP0iqsknLfqTDHV/iEie+olWWURxwUEa4sAJi pQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xf2v0pbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:51:01 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PLm6LJ009848;
 Thu, 25 Feb 2021 21:51:00 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 36tt29hwtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 21:51:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PLowBL6816248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 21:50:58 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE6A56E052;
 Thu, 25 Feb 2021 21:50:58 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C8276E05B;
 Thu, 25 Feb 2021 21:50:58 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 21:50:58 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 0/5] ibmvfc: hard reset fixes
Date: Thu, 25 Feb 2021 15:50:52 -0600
Message-Id: <20210225215057.23020-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_14:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=905 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250163
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series contains a minor simplification of ibmvfc_init_sub_crqs() followed
by a couple fixes for sub-CRQ handling which effect hard reset of the
client/host adapter CRQ pair.

changes in v4:
Patch 2: dropped Reviewed-by tag and moved sub-crq init to after locked region
Patch 5: moved sub-crq init to after locked region

changes in v3:
* Patch 1 & 5: moved ibmvfc_init_sub_crqs out of locked patch

changes in v2:
* added Reviewed-by tags for patches 1-3
* Patch 4: use rtas_busy_delay to test rc and delay correct amount of time
* Patch 5: (new) similar fix for LPM case where CRQ pair needs re-enablement

Tyrel Datwyler (5):
  powerpc/pseries: extract host bridge from pci_bus prior to bus removal
  ibmvfc: simplify handling of sub-CRQ initialization
  ibmvfc: fix invalid sub-CRQ handles after hard reset
  ibmvfc: treat H_CLOSED as success during sub-CRQ registration
  ibmvfc: store return code of H_FREE_SUB_CRQ during cleanup

 arch/powerpc/platforms/pseries/pci_dlpar.c |  4 +-
 drivers/scsi/ibmvscsi/ibmvfc.c             | 49 ++++++++++------------
 2 files changed, 26 insertions(+), 27 deletions(-)

-- 
2.27.0

