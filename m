Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0745409B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 07:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvC7L67kmz3c7V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 17:04:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aVaYMwUe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aVaYMwUe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvC5p0NKdz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 17:03:09 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5g1be017821; 
 Wed, 17 Nov 2021 06:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=cl/iostCTncKiGz2iYJDaNEsEWVgxcXeaJRZF6nVVQU=;
 b=aVaYMwUeurnF43MU/xWtwzN4POO63lYXb7zxOHm+X9WrWIgGjv3xVwbC26MPEhZUGIZP
 yVnxjSFkBiT1y+4Zi2tHreH4y3HiuTSo1no98URbIvx8Sv6ndviMvrnqCEhIarQWvknO
 62mNwNeLJCPtCeWhBSffGQvlQOTlPeNoOCAugKegtYFmnfRh9W2MseEn1acMPmMvlmKD
 HCtwku3eqqyoi8zL2XZgoIp/7clJ0RRlMD1swLY5dqrSAuiC9conptDGJ9iWicEG8kmB
 GeH+WQS+9e68kOWgM0tIDHABL9qJX7H1COvOwKumIbTeuAoLuRm7zi8i9jR5Se0y97nM TQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccutfrb7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:03:03 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5vfMC010193;
 Wed, 17 Nov 2021 06:03:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3ca50bcfyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:03:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AH630do46399984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 06:03:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 531C27805F;
 Wed, 17 Nov 2021 06:03:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E56278063;
 Wed, 17 Nov 2021 06:03:00 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 06:03:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc/rtas: improved busy and extended delay status
 handling
Date: Wed, 17 Nov 2021 00:02:57 -0600
Message-Id: <20211117060259.957178-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UbsaAhJgAjFTXXL_uyNnWtPakJwmL0vj
X-Proofpoint-ORIG-GUID: UbsaAhJgAjFTXXL_uyNnWtPakJwmL0vj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=553
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170029
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This can be considered a successor to:

https://lore.kernel.org/linuxppc-dev/20210504030358.1715034-1-nathanl@linux.ibm.com/

which tried to address both the suboptimal delay behavior as well as API
issues. This version achieves the performance improvements and leaves major
API changes for another time.

Changes since v1:
* Drop major API changes.
* Avoid division when calculating the arguments to usleep_range() (Alexey).
* Improve kernel-doc for rtas_busy_delay(), rtas_busy_delay_time().

Nathan Lynch (2):
  powerpc/rtas: rtas_busy_delay() improvements
  powerpc/rtas: rtas_busy_delay_time() kernel-doc

 arch/powerpc/include/asm/rtas.h |  2 +-
 arch/powerpc/kernel/rtas.c      | 95 +++++++++++++++++++++++++++++----
 2 files changed, 87 insertions(+), 10 deletions(-)

-- 
2.31.1

