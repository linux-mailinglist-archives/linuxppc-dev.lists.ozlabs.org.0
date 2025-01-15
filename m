Return-Path: <linuxppc-dev+bounces-5292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4531A1261E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 15:36:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY7pT0tDJz305v;
	Thu, 16 Jan 2025 01:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736951761;
	cv=none; b=a73Pf2q/p3ESq9wHclCv8I76zfrLSKfxpQtxb31NxW/+/q10qubS8yaIrRokf+2dvv5mC6CMHbSGJSs5WYiUNj2mJQb5P1THZHnAJCq1MRiqMlkLrImh02Mwp9LBpj+gc4qM9nmnD5dtdwJj1unJ2DFfrfvsvUhBxhYMN2NwIBHJnTJ+hQm3B74M/LpEoPrZskmyV/UYZZrHl16NsOLouLyQrA3MR+1sdQQrGElUFZ5YScAKpX+dvtLcJKiGy7p8950wv1KVdsuglbQ1IlQ+4qYye5XRduJSxaqVHj9A0YuJ5IhIo5pW/j/n/ILGfTLBINvsmnUMo8DKN/OgE2NOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736951761; c=relaxed/relaxed;
	bh=bRv5FAA/c71hkwafkzyrYcPe3qTn1SXwuO4ZJ3gXnFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHGtbXtybovhUKfWtQL0TrW1P3iZriJ+QqidD6+aSheyinGHxhN3+/BXvX6E441ol7w6jJimmrkJ55A/IGTiHHDZ+zYC8YOgzDc/K6WQYd8kczv3j//27+AAjjAperNwM/6l1b/kkirm6mbwHu5DoV4s1RIM3N5/LXlJd51ud8DWHQgXskcu++7H2F+jDc1ZPNYtM+NysWgBuxawZpiG93MG/P+FgriHAzmAQonh1lUZJe8P9iwjD81uU4RjNFVif1PZQskYfi6siO7M4blfXdZY7D55tKQc4Qd/N7s9liQ6SWfxj3peEhmxs94AKvPe2lHFlI0tIMAnbBnDoPsrUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lnt051st; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lnt051st;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY7pS24h3z305n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 01:35:59 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F3r2BF019723;
	Wed, 15 Jan 2025 14:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=bRv5FAA/c71hkwafkzyrYcPe3qTn1SXwuO4ZJ3gXn
	Fs=; b=lnt051stOQEkG8ZoBJt5/n8CjIXyq+HSicHEU/B6nFlV9gaHQtaiC6c5E
	E4nqDy/h2gkSbjOcnOWaUVJ6EyEyswjvF+ZEk26TmYwI4d3ZEyLSVTWOqdfrSb8r
	dK2+ECShNON7vCcmfGfXU/bthUQRbbuXr00iKkNbPzk/xB1pFoZoYR95c4qqcVJh
	mFxzXIxUaANfsrsEb+FBRhZ0QHPCxG+5jVdWcuY6LUDZXBMLlBQ7lEQ9KLOnfgTk
	0bVln7Vz1o5MuzQlGEDiMxH3mxrTQ3F1zbbHLM2j0j88EgHusA8pp4AhMcY/Cbp6
	pOSwreSjlN92XdAVHe9Hzm6NryZCA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjtphq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:35:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50FEPpsu014961;
	Wed, 15 Jan 2025 14:35:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4465gjtphn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:35:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50FBKKhw017003;
	Wed, 15 Jan 2025 14:35:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fk8ppb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:35:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FEZZpv14090708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 14:35:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 399A220043;
	Wed, 15 Jan 2025 14:35:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F77E2004B;
	Wed, 15 Jan 2025 14:35:33 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Jan 2025 14:35:32 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com,
        sbhat@linux.ibm.com, ritesh.list@gmail.com
Subject: [PATCH v4] powerpc/pseries/eeh: Fix get PE state translation
Date: Wed, 15 Jan 2025 08:35:29 -0600
Message-ID: <20250115143529.136704-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-ORIG-GUID: f7jHl0UtK7lq1PMqmIhF7h3AIW_SRpaJ
X-Proofpoint-GUID: V4gWDD-ZohALAT7S-pwnZZxoxWL2Zsi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The PE Reset State "0" returned by RTAS calls
"ibm_read_slot_reset_[state|state2]" indicates that the reset is
deactivated and the PE is in a state where MMIO and DMA are allowed.
However, the current implementation of "pseries_eeh_get_state()" does
not reflect this, causing drivers to incorrectly assume that MMIO and
DMA operations cannot be resumed.

The userspace drivers as a part of EEH recovery using VFIO ioctls fail
to detect when the recovery process is complete. The VFIO_EEH_PE_GET_STATE
ioctl does not report the expected EEH_PE_STATE_NORMAL state, preventing
userspace drivers from functioning properly on pseries systems.

The patch addresses this issue by updating 'pseries_eeh_get_state()'
to include "EEH_STATE_MMIO_ENABLED" and "EEH_STATE_DMA_ENABLED" in
the result mask for PE Reset State "0". This ensures correct state
reporting to the callers, aligning the behavior with the PAPR specification
and fixing the bug in EEH recovery for VFIO user workflows.

Fixes: 00ba05a12b3c ("powerpc/pseries: Cleanup on pseries_eeh_get_state()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

---
Changelog:
V1:https://lore.kernel.org/all/20241107042027.338065-1-nnmlinux@linux.ibm.com/
--added Fixes tag for "powerpc/pseries: Cleanup on
pseries_eeh_get_state()".
V2:https://lore.kernel.org/stable/20241212075044.10563-1-nnmlinux%40linux.ibm.com
--Updated the patch description to include it in the stable kernel tree.
V3:https://lore.kernel.org/all/87v7vm8pwz.fsf@gmail.com/
--Updated commit description.
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 1893f66371fa..b12ef382fec7 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -580,8 +580,10 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
 
 	switch(rets[0]) {
 	case 0:
-		result = EEH_STATE_MMIO_ACTIVE |
-			 EEH_STATE_DMA_ACTIVE;
+		result = EEH_STATE_MMIO_ACTIVE	|
+			 EEH_STATE_DMA_ACTIVE	|
+			 EEH_STATE_MMIO_ENABLED	|
+			 EEH_STATE_DMA_ENABLED;
 		break;
 	case 1:
 		result = EEH_STATE_RESET_ACTIVE |
-- 
2.47.1


