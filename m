Return-Path: <linuxppc-dev+bounces-8226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7FAA6449
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 21:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpPlw6Dmlz2ySg;
	Fri,  2 May 2025 05:50:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746129001;
	cv=none; b=O+HA7oblN9OpMMxRXdYqDRwAV0NTCXnZ3ev8vpJwEvJgrKTw/m/kHFhYBO4wzfPTJZO+KRbQQZqgY9ItqBJjnGFBi/zolYC3u3HmP1hkXvLlKeyZwMBLKXaru2XTKhmcLPUitnKxQ75S1NOvO5xyvSrlo/2NUBQbmxT+lA5hbuiSw4eth+6I8I0RM0Fd4m/s03xbEX/xv1nzSTv4p8D6MqSWfW6ITUaycKZ1tWPwVJy/oWUg4XAMg2iYb1UeMEpwNkjAofa1rzCpeXviShPkkpUQn9CkNUNdDm/iokNAUgN5HUCDem6CXrWaUmNZwkq8/M8SIvPM0n6aitaNBwWmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746129001; c=relaxed/relaxed;
	bh=caAEH/TApAN1wAmC7MoCNocKcJ8+CeKGQvII9Fl5qnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G8DTYflpyl/8t3OeynglX1Uk2Ismq4Er1qBuTLmo8+ZER7X4Nj94Fcw6aBsMw5LJlQ8qKFYk8nuh1Mj9EDeZb0j3WRj7X149UAJCzePUuqF3mCPbN+bIk3BL1/AX4F+34PliR8CdAJu2wOmbnrCU7Rp3ZK9vlI+2KlOl7cqg4PcbUJBfhZJr92tTjVf9CP0yGWEGb3gV9Kgvym3NVeJctQGh5V0gg3XjcflL42V3GftLLK2w6dtytlZ/c1JhF+9GgIWuUGPY3diIBdFlP6vefAyT4AY10nZ9SEj9mwNqvXN0m9TMjaJt/KY6h976toDvfvphpSde6Emoj8YtCgEgpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pwCOh3bX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pwCOh3bX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpPlr546pz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 05:49:58 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541BpNPs027699;
	Thu, 1 May 2025 19:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=caAEH/TApAN1wAmC7MoCNocKcJ8+CeKGQvII9Fl5q
	nQ=; b=pwCOh3bXV3o1uYDfCCLh0oWw5ayRFAHwAf3ek/s5n+kfDAq0KIyq7dCBp
	RrSC2fn716641Z8944BtgicdFaLcKvIoAy70sylcb2So+ujtXLgRNMOuF/QQNJzd
	ZfeL4Hx3t7JXfRCx1WOCQjaMenaiFF9QRnFSNUwHDvhQ1v17wXMZPUwWXe338P1n
	BoAB7OpEEohB94jURtNelW2L298xMC8VwWqiv5ibbKXLOSKSykC4ydxoC3FRDcp2
	aBwl1SeulwfWG/hWfW8Ol2cHYTQLBRlDId2yYSekPJgLVDDHzwvIe2pVZ6ZApoaq
	ITrK8/RygMIi0eDKvxq2/IKlgQUqQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46buy950h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:49:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541IIAeT024679;
	Thu, 1 May 2025 19:49:52 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1medtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:49:52 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541JnpLW24904240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 19:49:51 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CB1758043;
	Thu,  1 May 2025 19:49:51 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D86AA58053;
	Thu,  1 May 2025 19:49:50 +0000 (GMT)
Received: from d.austin.ibm.com (unknown [9.41.102.181])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 19:49:50 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, michal.swiatkowski@linux.intel.com,
        horms@kernel.org, kuba@kernel.org,
        Dave Marquardt <davemarq@linux.ibm.com>
Subject: [PATCH v4 0/3] net: ibmveth: Make ibmveth use new reset function and new KUnit testsg
Date: Thu,  1 May 2025 14:49:41 -0500
Message-ID: <20250501194944.283729-1-davemarq@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE1MCBTYWx0ZWRfX+2nbv6hhe1zA aADjqyvmvAnO/zQhl4vWZl85rwixTmuYyRHoVOWKXoljYxn/Yt+mKfDwLYi0iBwCFLbrLflmJb0 P/dMLqOWPUgLKhbgAjPB94QQFb93T1EwlAZTF+Hin7NWfX19ca0c6gI82Q3EEWZAUwo/b2CRlZ+
 X2/ZIiwQbcIkhs5yJn82WJN3hrMYngRP1Eww3rihT9bC0KiO7Y2AdHeG3Rvcf9WIIE1wRLl7Rr7 kZZgJ35gTdbEjWUgu4uIG57robAnls1DMlzW1MZQUEC5bRjgBwKrYZ4+tFa9dBp6vFaaxGD4Tm/ cAjSo933Uno+FwYtiEDtvx+zfoJ+qD5jwifOJSwq2PIiy8HtseZwjrjact6YX6FArBn6g6kJ55k
 wIWLNaPQNKvWklJ9LN+XfwYgpp4DGWcdsqlkUZcuJPLZ6L4v8CYy45Ge88dUOY4zF9HmCXeD
X-Authority-Analysis: v=2.4 cv=FOYbx/os c=1 sm=1 tr=0 ts=6813d061 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=AIdBDbJpuyt8KpZaaOoA:9
X-Proofpoint-ORIG-GUID: WQfDCzc2fTcks667WTA62ir9d1O1aYZm
X-Proofpoint-GUID: WQfDCzc2fTcks667WTA62ir9d1O1aYZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=705 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010150
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
v4: Addressed Jakub Kicinski's review comment: added missing work
queue cancel in ibmveth_remove
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
 drivers/net/ethernet/ibm/ibmveth.c | 247 ++++++++++++++++++++++++++---
 drivers/net/ethernet/ibm/ibmveth.h |  65 ++++----
 3 files changed, 274 insertions(+), 51 deletions(-)

-- 
2.49.0


