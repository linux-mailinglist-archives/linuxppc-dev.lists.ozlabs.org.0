Return-Path: <linuxppc-dev+bounces-7327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB7A704F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 16:25:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMYdj2tgDz2ygn;
	Wed, 26 Mar 2025 02:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742916329;
	cv=none; b=k/TxzzC1ddZhAmY4bNS3n4pANyMTBTPwed7FnTCBFsrHErVVRknqDu+inCdinhDKdqpsQ9aLG6WVF/zrOmJQyDq7MXiO9kl39LeAfwlF+5+mTPjCQ+my/z8xSPXSzuRSesSw1PuiXyhzrDJyAO47IHb15Hl/7O7dLye7NdKsYuwSJuI9wm7tQCq9Mjf2in7rYc6u0LJj//oDAGfqVeF9tMat2AL3tnSHxLIMdQuaKKfOKrg40nz0jyGBf4KZy4S/qu77HbXa8EY+ZKPG1kvqUfetTpxceMYXZ0RBRM65unnI+z2FLTo4XzyrxJ4rXcrqs6nWVjG14szrl9AnjkGrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742916329; c=relaxed/relaxed;
	bh=DekOHVItqBqELoUTN744py+oUiPjvzWGJ/Ap1nj5o1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jUIlxEIHOgc1fA48WKaMOwtsV25hp88ao5YtDrBiC9VqMzN7Rhc21P6qPFv0wuuaLjCAA91EmLSUktRxIq80HYwZabgVR0MBhqS5n/cpRzwY4BqU+4TesW/LYU3VjRx5XjNTwwyjQknq9fFFkKeYyV6xSDvqT0vgzKIQIozjMZPvfL7Ppz/2s6D+mI+nqF/6tGBuCq4eOAX2xw7RSAdew2G5gXNmVpEcO9tG+qjzR5aRkrfOFLC1H9rT+AL9fS4VMcUsO2io9OYuksemY/wNKsTGjRmwCdxM4R3S/luaVhSXQZIIyJhoxSkJ0A6EItK0q4FoNn/B42s4k6Ln+Pc1gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qs3qYkkF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qs3qYkkF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMYdh0Tklz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 02:25:26 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PE3GTR026302;
	Tue, 25 Mar 2025 15:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DekOHVItqBqELoUTN744py+oUiPjvzWGJ/Ap1nj5o
	1s=; b=qs3qYkkFhvG+QpRnPQqr7y3mwRNzzJ8sVzCFEcTs3Cc/eC1Pd3uziDPCw
	5/nLDl0KaI0HUq7ifznhfrgIr96ZPvA4HL18IynaKMjFqdXvGFQOlRjIOOoGMGRk
	Qjq8xVPEgMnV+w6dJVqXPW05F6ttNtZJORxF8sRS2QFVZ5IigVzOQLL4LWjmsLZO
	eLqb8ybLYEHy51bO3hrdaPRGmxXc8gjA7HvdGZgFygZVJz1WiO6u255dQ4+OpOaL
	sTZGUfbsO27AmD/KP44mHgeqPq8QNxu7uPh8tmW0bzCb03QroBMNsCN8opq3BRl2
	8eQpLh2clN3/CdmCE2WPMAuvAcg5w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kwwq8ete-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:25:16 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52PFOfPq011335;
	Tue, 25 Mar 2025 15:25:16 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kwwq8eta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:25:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDsvvV009737;
	Tue, 25 Mar 2025 15:25:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j9rkksta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 15:25:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52PFPBu846596442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 15:25:11 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6C1F2004B;
	Tue, 25 Mar 2025 15:25:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97B0420043;
	Tue, 25 Mar 2025 15:25:11 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Mar 2025 15:25:11 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 2B6F5E055E; Tue, 25 Mar 2025 16:25:11 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/1] powerpc/64s: Do not re-activate batched TLB flush
Date: Tue, 25 Mar 2025 16:25:10 +0100
Message-ID: <cover.1742915600.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
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
X-Proofpoint-GUID: ME-RZcMcqTXsd7q_uAVOV5FXHh7koUGO
X-Proofpoint-ORIG-GUID: OELmDwiUVEGhwIwWIOnx7pu9D6zS72mK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=478 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503250105
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

I have no means to test the patch, it only passes a compile check.

Thanks!

Alexander Gordeev (1):
  powerpc/64s: Do not re-activate batched TLB flush

 arch/powerpc/include/asm/thread_info.h |  2 --
 arch/powerpc/kernel/process.c          | 25 -------------------------
 2 files changed, 27 deletions(-)

-- 
2.45.2


