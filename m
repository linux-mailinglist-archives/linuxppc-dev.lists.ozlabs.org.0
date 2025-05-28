Return-Path: <linuxppc-dev+bounces-8964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7865AC6390
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 10:02:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6hml20F1z2xHT;
	Wed, 28 May 2025 18:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748419335;
	cv=none; b=bHbVV5LJqtn21yGWBgwJmtaSFXaBuf/YpV+3y/ucFG8l7/nVWlPymrSsBBAUHs9m67qYhLK8uiWuReNSKXuSDAIO4PZ3zcsVHcVvGVu4bcaMAxMveNuuCnQwVVfQVX3z9mLxW4OZEsKQiXl7XzcpZ9VikPJIVtSWe6bQvlihicnavEWb3svySgwr7/6ex9Vv2pqjknvWlHlM6Vxo2Bc9LsCVTxppqUMM2jo5vgwmrW24RxsNCx1vyL9yHv5SqTkGCCJ/o05ZBEuuJUhTcfHp3p480q6lv+UMgrkNJkfFWuH3q0MPUeuraHGa1VTNPVbcF61lnoLDEfvcdm7qb4Phug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748419335; c=relaxed/relaxed;
	bh=aDNoI7l2gVyFTt1uPUySpwZBuVpBknjRexryaYxPIOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iX4Twe5fwrDxef5muax7izr8au/LVIx2Q2FEDAJLrwdD2EPM3Z1oC4WLHc8accJjiqjrYoqeRk7xRCbGF8b+rh0nbxBFssy2R7+MoWD587HE1GEJXQ7p2s0UCMfRNcJBYsoIWDZ7SVJapHEnSMkAXmSIcN4x+F+JU2ooD7wvhKWXsVhq1h+K0gCEskIMCt09TobzdNLNqfMUO4jKS7sX8UTwF3QYMi6SZD8P/PSFHg+zQt26CicoibccNkMdRlOHH3IN2u9ndDYZQM/O6kduOEgD9jn5qapRjR2+UqFsGvuUc27pkdNR6axMEOChT6w4EJMdm0vRa0cQNjaIyjzD9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lzh+O3CL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lzh+O3CL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6hmk104vz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 18:02:13 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0LQnu005029;
	Wed, 28 May 2025 08:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=aDNoI7l2gVyFTt1uPUySpwZBuVpBknjRexryaYxPI
	Oo=; b=Lzh+O3CLLRbdDrVpWxvRdChTiSFRBmNUkMqrWYeFwJTCDT2PbCHVbWZ8e
	9yTQ93bkNJTDeqfsUMI3J0mP0ru4wocdlQoso1GwStpW1eKMvrc+xN9mRqVajIoD
	5xg6/rGGRC6X7wgdinPgIkmWtD0j6O/EYWWMBITf6NAlkHy5h7q+sJM0t/AkT2ei
	2vfds/cZhyBAI30OcdPRKSZp+yL9YeKao4vLUtVPCY9Rv2s9n2FDeWLqnx74nRy/
	FKtJOB+kFimgj7xL4WAqVALWb53gBgPkqoPBBurYlYyaTI23ids2A5uclK1C9NNW
	34iwae9kPvaIUUPdsXtNxrTg0dLFA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3jbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:01:59 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54S81xxi021733;
	Wed, 28 May 2025 08:01:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3jb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:01:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6FGP9021349;
	Wed, 28 May 2025 08:01:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46utnmpbp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:01:51 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54S81mq033161680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 08:01:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F31452004E;
	Wed, 28 May 2025 08:01:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C85DF2004D;
	Wed, 28 May 2025 08:01:45 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.16.188])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 08:01:45 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, arnd@arndb.de, jk@ozlabs.org,
        segher@kernel.crashing.org, mchauras@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fixing typo in comment
Date: Wed, 28 May 2025 13:30:52 +0530
Message-ID: <20250528080051.1351779-2-mchauras@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=IcmHWXqa c=1 sm=1 tr=0 ts=6836c2f7 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=8gZw5ORUxxO3s-nOcEQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA2OCBTYWx0ZWRfX6Zbl3gEU7qly HmOkeo5f68AI4NExUN+Yv37CQWrZtOc8iEdMiqIDk1FWCLA1whVwLSyiJx8PNpc8+i+VMT6rbDe tvQgkKu67yz1Sb6yCfbbE+6gRyiQaxwtIQhUq8329wEwe5TF38RZ96Pz48kYjXV4s65hphYPFv7
 HRCPnbyEG/LRsAbFxyNfVsevylJWSCbMZH7Q9vOgqTGUl+wgtii+Kl8o3oF3ZMPpIdPLnT+YSoE Y8sfh6581GN78lfT8mlWM6Jq/zewq3ss3Togzh6g5P44MIjgv9Id+NSVVBxd6pZto4dDFaR5KOO BXpjbJPoYmf6U1LvVI5bA/Yc4YJV2VNr43xDgl/zz53FMYHhZ6L4ARBNYc1+4EeJl4LZd2LQLum
 zIg8NuloAm5d3+SPwMsaFCijOaT1EF35Qo5ZLrOp5uxviNfGtkZh3ZUlaEamhAbpGU8TRwr/
X-Proofpoint-ORIG-GUID: yNZlvGQnOUJ6IprvLClb59YNjDANaIwP
X-Proofpoint-GUID: G01uFiV0ldAuktpyn0RK6Jn7Yi0IyIVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=547 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280068
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

fixing a typo where iff is supposed to be if.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b7229430ca94..53667dc7fe1a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -393,7 +393,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	.endif
 
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	/* MSR[RI] is clear iff using SRR regs */
+	/* MSR[RI] is clear if using SRR regs */
 	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	xori	r10,r10,MSR_RI
-- 
2.49.0


