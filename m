Return-Path: <linuxppc-dev+bounces-13693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EAEC2AD18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 10:43:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0RTb3hzyz2ygD;
	Mon,  3 Nov 2025 20:42:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762162979;
	cv=none; b=N/Y9H1+zDZmrP8mpK2MUgMbiRtzK8rhS91q44Zyd9unA/OgUqKwTp0ts15Qj8HOqavMlNt9Cb1QMCWRwTRxeaFElmyk9z5sXAAC/New7owQBtiObzJJBdRtmCTgSzYZCdikrFa5VD61W8353vs5aeFDyTCxFDi3BFcttIqOY7RjPjngAX4uHOs8yl4D/GeB0fvMt6OEDi+WXyUneRr7k6fe1xN+7PJH/0xGNEQxkdZdZkPLSEMutpRBIXwopOPM1tYZtiD5Pr9xNL15NVV1tDhF36Ysb2qhlY4Revws11gZesNDmNz04dwijVCKJ64D3e+EZgw2qFnQT+zgCFO75Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762162979; c=relaxed/relaxed;
	bh=QvIcX3YAFG7o+1VFLMGKEaZcbpwrRBOZbTrFoCXki3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PGI8/GsQEadzKfwP00J6yPS/Nqui9WpLwm2ssYizNO+UPCnRG+F5Y3kbTbgNHMz6Qt7nzeOpHaSky1/qq5rsbvlc3VsoV/Vt9973ttpmAA9Lvs2pizMl2h6osGrhzZdFzC5mgd1zkJekuURx7x5NuSI4f8tqZNk1mwo3fwXs8NGyDSnNh718Wi9Nh3L+XE5p9mdpInop8HLABb/nZ1GMFGpVwioynX/r4E6vTRTbe7+ZdSFOMmuPdSvzqPW809foSYDvAk+v2aN1G1PKmrpi0n7r3DoI3hyPFMDCplHwfGVnJDSywODnL9n9nzn2Gi2nkfPZdThmMrk3BcMZJqOokA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LodP0x8Q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LodP0x8Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0RTZ3gnqz2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 20:42:57 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2Kt0s9007542;
	Mon, 3 Nov 2025 09:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=QvIcX3YAFG7o+1VFLMGKEaZcbpwrRBOZbTrFoCXki
	3U=; b=LodP0x8Q/4bMBB/KCU5ZwzARbvrqXLTy4isbEXmvK5tYvdnOH+0XldQqg
	98tKq8mTb32lZiW1y4SL3QhABnbR4Fby3P5QE2OL6nKl1xD5hR06x9CgRZDeIrdT
	k1DAlxc3XZId9dpO+Y++8XZUFWSFTHgX5K+dSIGex49AvF7JFWICkwuv6Ix0Mknx
	cpYDIV8IhqSQWWGfbM+Lo3dy0df72oYESIHf4Fs/jg7jKpiDLJDM3dDCc1cJweK+
	rZMfm0ChqpzgPXeh+TrHdzEbWho78UzdmhBKoRJkwi81E+nWjS/5UZA3x7myN3IE
	nTD58//jAG6Wo0xApeErZv0f+oHTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vu5v4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:42:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A39gt1F024527;
	Mon, 3 Nov 2025 09:42:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vu5v4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:42:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A37Wcuc018667;
	Mon, 3 Nov 2025 09:42:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5whn4xfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:42:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A39goqH34013662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Nov 2025 09:42:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1893020043;
	Mon,  3 Nov 2025 09:42:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4D1E20040;
	Mon,  3 Nov 2025 09:42:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.78.64])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Nov 2025 09:42:48 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: maddy@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org
Cc: Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS : Add myself as reviewer for PPC KVM
Date: Mon,  3 Nov 2025 15:12:43 +0530
Message-Id: <20251103094243.57593-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
X-Proofpoint-ORIG-GUID: nMMvrVO35cp6ftXiOuCho-PDF9hF2OoG
X-Proofpoint-GUID: 2b8DNA0x1DEN-VD5dvQueVzgoZyig-wY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX37waHzcThYpx
 w9+IG7kyePN+Twb8C41xxYSlTiVjGD/nX0U7oxBmfrcTcrUiM7+VSH0Eg1t3RTKAwN2kTkEX+Kp
 dX0EEbimSosaT72DrggbHe9zaToxqZseYDs3Vgs1TMPYYv6Q6UsnqUu7gyfb6fxPwHOPl9WTnJA
 H6v3HNzJmUvOosr9/uO6Xqk2j7BL4yes8LKFrZLYwVaTzTqcS8DaYXcpmawVO9NxD5jpc4VZgw0
 dAstXywSuPChmLVfw0M79bHpYOSS0btHG8MXVmAl4bk5ggqLSv1RcE3UjdBiN1FC8acqSYedjAo
 U0Pj8u5zv5VlQN277G3+kP4Z1UXa+pz3B6J1VGns7MYKzwzaQGD/bymad16ff6P3ZzgOpPasfFK
 FMUsRuQ1J7rdxXmtip570rfEf411Gw==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=6908791f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=voM4FWlXAAAA:8 a=VwQbUJbxAAAA:8 a=yhTyijjmqU1LCZgUPtIA:9
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I have been contributing to PPC KVM for sometime now and would like to get
notified of incoming changes to help with code reviews as well.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46bd8e033042..3f2f60486222 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13701,6 +13701,7 @@ F:	arch/mips/kvm/
 KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
 M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 R:	Nicholas Piggin <npiggin@gmail.com>
+R:	Gautam Menghani <gautam@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	kvm@vger.kernel.org
 S:	Maintained (Book3S 64-bit HV)
-- 
2.51.0


