Return-Path: <linuxppc-dev+bounces-7709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B4BA90D75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 22:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdCzJ1Z3Xz3byF;
	Thu, 17 Apr 2025 06:58:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744837084;
	cv=none; b=K/RWmcpPXNcUN4MaHUAWXgmtgXeP0Jc4woHmsEwlDK4Xp6s6pASR/6ONqHKU4eXAAJF5goFAaRaf2F1jlOYZ2kQ6hVS8nDsahxrtiGWfjIN4xC+pDhGO+qhXcvmROqhKdz6MvncJsQ9SkJCeXl6mjda9BvuCjYy76P/1arq2CG+5dKUe7Y/pQGiChD+awuYr5Db++O7MIorEHYu/XkLhkdoSfYJVtLmmxQJDNqT0j556xeOykg8idNtPwkJchydeVzKDfn5KdbR/5zTOVVIMsDomEoaa56/adVVj0I+T2T2PAT2JKB5KY0IG6H+PiNVTdhC42vgo32DMm0LxU85hWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744837084; c=relaxed/relaxed;
	bh=z3OVOLyfKCMLVdglfMW9yUPuUvtMIDsNWh42JPY9zig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNHdIjoHYjaTHgkCI+thiW7a66vmu8BMW0TR5o72xdJ4OMgNNoiNeCnkQ1tqWMx503fjuYPeAv6Xz5R1QcS5y5eTmF32O5QUIzCF5mUbrNsfYq/ySyrtzxva290WTAJgHt+8w0M4POk3xMkBsOI9ksPiJLUJnHtr6F5LV2XJO8TCadPNb10xN4tBcxGFUR/Oskj4SU1LDne36VhTGxV/tQW/oldIWTXwpVHoNO93Z7eQXjQS8FrZkyvV54QMhTbNsnVtYJaJmuWWaaZAu3NvC+t6QIRj1zvhJR1PrtWYgYU+ztrXWb60bDr+sjjP7ERXtL66cI77MXAMkV6ai1cWXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U/gv/Vzs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U/gv/Vzs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdCzH0csDz3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 06:58:02 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GGOO7w028954;
	Wed, 16 Apr 2025 20:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=z3OVOLyfKCMLVdglfMW9yUPuUvtMIDsNWh42JPY9z
	ig=; b=U/gv/VzsPW3GWoZZiLHyTUL9rRdX6CX14d7eHaZoJkrVGTaAnmOr4SPzE
	QfIAoXouxADe349dU+QDubXY38njCqgGVn25a7Cs2jrus6DuAZlLE1Zily2GkV/L
	IDlGLDLgHZ+JuzF5NyEnUiwjTwz9yoNYB1T5KrwJMOdi9edl1KDJNAaa+giyJKeD
	FciS7tgKdwi/bE8UbTn7WCI3p9JV623FPyiIV8Kvpa+YGLNRhEMCTORgVl6j8j/y
	3XfSVyXf170BUjfKaGXZSlMWFeBFX16znp+6moV4e49ALKOMg467jlAVh1J1UZF7
	VR9b5Ei0ZCgonp4OsF+jBbWjvSTHQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462affbc9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 20:57:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKCWNL024882;
	Wed, 16 Apr 2025 20:57:56 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gtjmyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 20:57:56 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GKvtPL27132168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 20:57:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9714E58058;
	Wed, 16 Apr 2025 20:57:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E00858057;
	Wed, 16 Apr 2025 20:57:55 +0000 (GMT)
Received: from d.attlocal.net (unknown [9.61.183.42])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 20:57:55 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: michal.swiatkowski@linux.intel.com, horms@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 0/3] net: ibmveth: Make ibmveth use new reset function and new KUnit tests
Date: Wed, 16 Apr 2025 15:57:48 -0500
Message-ID: <20250416205751.66365-1-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
X-Proofpoint-ORIG-GUID: En7UeUUHKYq9QAiPzlK9gR7zYXjJB3Zq
X-Proofpoint-GUID: En7UeUUHKYq9QAiPzlK9gR7zYXjJB3Zq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 mlxlogscore=800 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160164
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

- Fixed struct ibmveth_adapter indentation
- Made ibmveth driver use WARN_ON with recovery rather than BUG_ON. Some
  recovery code schedules a reset through new function ibmveth_reset. Also
  removed a conflicting and unneeded forward declaration.
- Added KUnit tests for some areas changed by the WARN_ON changes.

Changes:
v3: Addressed Simon Horman's review comments
- Reworded commit message for ibmveth_reset and WARN_ON changes
- Fixed broken kernel-doc comments
- Fixed struct ibmveth_adapter as a separate patch before ibmveth_reset
  and WARN_ON changes
v2: Addressed Michal Swiatkowski's review comments
- Split into multiple patches
- Used a more descriptive label

Dave Marquardt (3):
  net: ibmveth: Indented struct ibmveth_adapter correctly
  net: ibmveth: Reset the adapter when unexpected states are detected
  net: ibmveth: added KUnit tests for some buffer pool functions

 drivers/net/ethernet/ibm/Kconfig   |  13 ++
 drivers/net/ethernet/ibm/ibmveth.c | 241 ++++++++++++++++++++++++++---
 drivers/net/ethernet/ibm/ibmveth.h |  65 ++++----
 3 files changed, 268 insertions(+), 51 deletions(-)

-- 
2.49.0


