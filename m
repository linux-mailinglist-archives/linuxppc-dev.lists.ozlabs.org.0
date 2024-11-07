Return-Path: <linuxppc-dev+bounces-2950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF79BFD59
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 05:21:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkTQv1K23z3bjL;
	Thu,  7 Nov 2024 15:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730953271;
	cv=none; b=U/Jqy4Xqp8BPyhibWQUVg6de0IaOuB5os1KinzR33huOE6H5jB379iUsMcPyLiRwlkYD92fEEeXFZNFV8Xx3nzyCZqKUPnF4jESRrXp1LhMjF4D5EbXTbN0QDPAQlCxvj2R+053lY4msbCshsMOGVKU2SUk2ahlZMi3wJXVHL9WV4DqEXQefDMfyasbkjPfJipvb9VuJXZhnFMeZ+ZroDsza5296kjj+y6QqRTntKrQvv5axJE8XdclZqTfBZZUSyjORRcMqzrbXCVE1hyhnKNga6icAgInBg/u9fbGxL66mKpuSOK9G5zyqAWLmHb4WmjSmf/9Rkxr1EekeNW3WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730953271; c=relaxed/relaxed;
	bh=G500xfm2jOBkULiRFKYuziqZWRhAOk2Dm8/VcpPcTxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m7UZzYNsqMnQoKv38mb2hajJblGvJPPvVVbX9OP53hdkY8tfo+m4HKq5t9pjCLib7NbnF42rGCLQEn1cmGGzIUjbvBQfWk+bO4QD9gswdVp42yF5M30JQmRBE5/7U1Zc1Mlilfh2LrKtbH16/UASvEwoaAgwdecNjHnPmzsdWDS8blrOqJwyFUoFgWkTR3Ung+GdxuevuXRM8tlEPfjoEoFVLKKCg3BLBzXxWDF/Bl/sCKm4sZn9yaF22yoBFKu1Okl7iQ7TfYATQLvgf5Zi0wKnWbdP/77kqBEMVjSTno6aiISpChTuRtneD6BbKHOd8ZE1fFWHke527arCVF0MtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjXXwFec; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjXXwFec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkTQs2Swwz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 15:21:09 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A73fG4j009789;
	Thu, 7 Nov 2024 04:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=G500xfm2jOBkULiRFKYuziqZWRhAOk2Dm8/VcpPcT
	xw=; b=UjXXwFecKD+zQO2Emf58D6m3sQaMc4m/0zw/bXGKDlX2Br8zMjRwt+eNg
	an8H5xOv4tPSMMXRbh8/jebBe6PK+pCfNWNige2WCB5xvfzTB4lNInT3lRBOSbE9
	GuxIAJ1m46idlRCv9yKIjlg9B7yu6SPVTZW1o4+EX1c93NqdWTQZ9Gc9TDqpDOgk
	vc3LDdZxzN9tEAkTeWwPnyUaPBILvbepSPcgbCIfU/bGKwcJOl6yRAunY6cIDNaE
	0gkbs9qLs31N7ZXERw2mOrOap3Wdy/LcDvb1Wd4a8Cq8PdIuQ7+cdekN/CrfrT9J
	yMBl8vUhXGE0JefE3O5pFHw5N+WeA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rnudg56h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 04:20:52 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A74KpLj020832;
	Thu, 7 Nov 2024 04:20:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rnudg56e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 04:20:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A71oVlQ019096;
	Thu, 7 Nov 2024 04:20:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj7dtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 04:20:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A74Klfc57934216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2024 04:20:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 281602004B;
	Thu,  7 Nov 2024 04:20:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2867420043;
	Thu,  7 Nov 2024 04:20:45 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Nov 2024 04:20:44 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, maddy@linux.ibm.com, naveen@kernel.org,
        vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: [PATCH] powerpc/pseries/eeh: Fix get PE state translation
Date: Wed,  6 Nov 2024 22:20:27 -0600
Message-ID: <20241107042027.338065-1-nnmlinux@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: mK7DeQXtkOlVp490AQDdrD9OdMNEByH0
X-Proofpoint-GUID: g2t97kBqqIh4sRjtkjPa6LFTvW37jXDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=962 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070030
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The PE Reset State "0" obtained from RTAS calls
ibm_read_slot_reset_[state|state2] indicates that
the Reset is deactivated and the PE is not in the MMIO
Stopped or DMA Stopped state.

With PE Reset State "0", the MMIO and DMA is allowed for
the PE. The function pseries_eeh_get_state() is currently
not indicating that to the caller because of  which the
drivers are unable to resume the MMIO and DMA activity.
The patch fixes that by reflecting what is actually allowed.

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
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
2.45.2


