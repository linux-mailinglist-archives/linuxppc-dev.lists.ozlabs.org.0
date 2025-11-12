Return-Path: <linuxppc-dev+bounces-14120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E716AC51D9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 12:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d611X2nPfz2yvR;
	Wed, 12 Nov 2025 22:11:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762945888;
	cv=none; b=X1V0jBSZo9l2Z9A0DaccWAzb5G0DwuzBQTkeYLqGmhPUqTLO6axb+xmtee/7C0zqJJkT3wharFs2aeLdScFCH0FLr1g56wCbyxWY7dY4xCqtS85svs/lE+Koyr11NELLVqSRt9/cFJRy7qlxrxh3dQmeJXojqKT9eUEUjyYHLOszcmKAIzMMV23HHzy+baIsEDRUQpVbrIMU1m+h8+bUHF2bW3zIQRPqgOgioIS3GFTCEiCXX0EPDheTtIAXg23U5pGuTeuOSVdXhVA7di/7dSIqh1hUXFuZXRdw5ZJuY4LK/z1fcJTol98ZelwR2JRkDqduLKaW3Rr2TM4EBUFQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762945888; c=relaxed/relaxed;
	bh=BTqpXblR2MmWwuxnWmnvD7lHq17zUp97beScJJW/TJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnsrCQTo0fM8cETa09tiowNXrCVAvyn+naUg/1l0zMhMor0HVMCTSepLojMh3XukvV9sH+Bk4TILB7NElXvM2CaQkuyVL95ng0TZYjULhiroKFh4e9M2uuXb/0EJkrwE/uEC4z31S5v9Otai+BXB5h/nJTyKVvu1k9hu1XtNYmnZJ1RDZZjDrQrJYTy856tXnbGeW9KSqoiizD+bI2euzDfBMnXvSXnVTJJrT3kHrmOVBLkrL3kAZIh1LGpG3Z9ondmKtwNtyUbre8lALNmHF22qFx4npQkqWoxCfc+SY+byjPaJjXO7DOTKZTP6ZmcmnFxNFXCgRoCVvmu6+dMZOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TFwuHogb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TFwuHogb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d611W25dSz2yv7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 22:11:26 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC3IjJV001126;
	Wed, 12 Nov 2025 11:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=BTqpXblR2MmWwuxnWmnvD7lHq17zUp97beScJJW/T
	J8=; b=TFwuHogbpRKQAmI++jBNelUUgtu4ezVnYY3bebc4hJZQpu8yLT0wmSZh8
	1wbjzlkps5MDi3hubU/rhQQeQ1ibPI4lyUpNnMuRn34OOV8LoBnQEjZvL+5wFdvM
	CC5lG0L8WqV3OjVs1+PBiWWgxiZQpvkKHwzZxVgrSNFVKtdQdtnGiWZWzq+BZnsK
	OlBJ7PN7jbEhLJdJI6PWfoypv5jHbZgLvJH9TQFyFt/zpa8UL8MQMD+WoeJfKJJw
	RyXMCZXe3fwGXkGawPCleS3NZky8xuExjMAUULlFX5k5fheUx/NdKTfkSl2xhNYP
	6v+EvtpOZFjJ9cICQ5idPs7PDpxHQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjyn5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:11:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ACAx5pm010146;
	Wed, 12 Nov 2025 11:11:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjyn58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:11:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACA0q7M014773;
	Wed, 12 Nov 2025 11:11:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aahpk7qwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:11:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ACBB99T14221592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Nov 2025 11:11:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E59520040;
	Wed, 12 Nov 2025 11:11:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCE4420043;
	Wed, 12 Nov 2025 11:11:04 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.124.211.234])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Nov 2025 11:11:04 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH 1/2] pseries/dtl: Use counter in !native case too
Date: Wed, 12 Nov 2025 16:40:50 +0530
Message-ID: <20251112111051.826922-1-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-GUID: ib7pZsNNWkwU5Trv04yv-P-Sp-MgXuZb
X-Proofpoint-ORIG-GUID: x8VQZjiPMy92tBnSydqtSQPTAEySXqdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5OSBTYWx0ZWRfX+tYSsd+t7z9+
 dmSClN27O/TpPM3m+eluMGgCWhL4rlWc7ffpmUHStbn7iE+GLSHEyQe/QEem3RQSpA3ntFpH+U5
 8oM+SE2qfU1/MxIgd91qngWeFW3VyLqrAdMiyvpNJlcB3XgCIvRuAinjmycLlWQiUSEKaL+d3aQ
 p3juOqXJc+TDVMWTZa/aoJgaYQh9dz3hD6rtxTS7bnXzlogjHNTEM00mV/G4rXS1lZVU87twFdF
 LdAP8Ok/ceOs7Gs8SPOzZG7beAF8+3onB4rc4rNmdvYc4Uz3bu+UmE21K5FwizgioH0NM1R2qec
 TM4IAjNF0gMF0ZDdov7GyedRXyiZjE8BesiWMzLO/z4EDQnZ8QTKH3FBRISTanXIBhZx7/cnHzL
 suzHrZeTsP3BQboOXpQWVtDEfpfIvw==
X-Authority-Analysis: v=2.4 cv=V6xwEOni c=1 sm=1 tr=0 ts=69146b52 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=8Y62QmFTzL-Gdt_Yfd0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently dtl_count is only under CONFIG_VIRT_CPU_ACCOUNTING_NATIVE.
Its used to track and clear dtl_consumer callback.

Going forward will be using this counter to track if dtl is in-use across
configs. Hence adding its use in !CONFIG_VIRT_CPU_ACCOUNTING_NATIVE case
too.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dtl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index f293588b8c7b..6c95781cafb7 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -36,6 +36,8 @@ static u8 dtl_event_mask = DTL_LOG_ALL;
  * not cross a 4k boundary.
  */
 static int dtl_buf_entries = N_DISPATCH_LOG;
+static atomic_t dtl_count;
+
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 
@@ -56,8 +58,6 @@ struct dtl_ring {
 
 static DEFINE_PER_CPU(struct dtl_ring, dtl_rings);
 
-static atomic_t dtl_count;
-
 /*
  * The cpu accounting code controls the DTL ring buffer, and we get
  * given entries as they are processed.
@@ -158,7 +158,7 @@ static int dtl_start(struct dtl *dtl)
 
 	/* enable event logging */
 	lppaca_of(dtl->cpu).dtl_enable_mask = dtl_event_mask;
-
+	atomic_inc(&dtl_count);
 	return 0;
 }
 
@@ -169,6 +169,7 @@ static void dtl_stop(struct dtl *dtl)
 	lppaca_of(dtl->cpu).dtl_enable_mask = 0x0;
 
 	unregister_dtl(hwcpu);
+	atomic_dec(&dtl_count);
 }
 
 static u64 dtl_current_index(struct dtl *dtl)
-- 
2.43.7


