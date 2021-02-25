Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA03257F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 21:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmlL55n3kz3dQR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:50:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OG2GY0dt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OG2GY0dt; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmlHk0HrKz3cZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 07:48:33 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PKYrFS137177; Thu, 25 Feb 2021 15:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3IT/tt0A/Rt/I15o1zV9S8xLTjI2UhF7KfP/c0y7sbU=;
 b=OG2GY0dt1Q5m4mw7NJtQvjX8IDlaA0fGXIr6Ir56GEjDWUqc9+hIRClJX6kth8lavzrr
 jxhiEHZDpwzNtcidQzRl7kDa/Jg/vgH0Ts6WH3jMseoc2tK3Zksxjcr/IOO07QfOSWq/
 ZDTp82dzRexg2bXZDK4Swf6ZsFSub6d3knFrv1JSfwvUDTx2AJQm/zEWnVyE1UAqClC0
 +o+T76l1olx8szmb8qGULVkbaYqHJfWzygZDe8rcyBYw18u7zrdmIu4BWM8YHciHyBhf
 rjNSKI4iPQVvYnae6HqUEycNhipkUeeBVUr1kmNjbwIvXaGYSbjZ7dNziQmndi6RH3lV DA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xhw0tgeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 15:48:28 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PKmCHI003426;
 Thu, 25 Feb 2021 20:48:28 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 36tt2a1h36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 20:48:28 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PKmQVG13697598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 20:48:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D08866E050;
 Thu, 25 Feb 2021 20:48:26 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78D8F6E04E;
 Thu, 25 Feb 2021 20:48:26 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 20:48:26 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 0/5] ibmvfc: hard reset fixes
Date: Thu, 25 Feb 2021 14:48:19 -0600
Message-Id: <20210225204824.14570-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_11:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=866
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102250158
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

