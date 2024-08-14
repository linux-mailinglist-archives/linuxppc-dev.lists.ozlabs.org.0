Return-Path: <linuxppc-dev+bounces-79-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406A951867
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 12:10:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FknWAZTP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkPC20h24z2yGm;
	Wed, 14 Aug 2024 20:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FknWAZTP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkPC12Nz3z2y8m
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 20:10:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAACfU017275;
	Wed, 14 Aug 2024 10:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=lu+KbFnKarsiTcYYuvTxIDP/XBPfgXVNQr+hKNO
	wexc=; b=FknWAZTPVQV6AeRGUCgoSaqQNbRMFSBPHg6Od7oYZx+cS+xTCAme/9S
	RPCdvDYu1BaaoaRRXn0KDKHRgJy8R7SCYpFxhI0GljGcmtc6HiG109w/0T2CSKUI
	w372LkdnfoJi7fs7+Lc9u5dlNASUO2nHqVaC6khJ316SVI/Ug5gkPArURCYS3Ayr
	nmHL5inx0FXOEKsm2QHbxnhZWU4brBYIKHvVxIEX5GxakR4sUVlTcCc+Dhuw4X30
	wq8AtZFrNMLweBI4+CfGPvmnAaRxKzD8jDnjPrrA5PHrcipfHT2VK7YJF3KJGEVt
	GXrBzenbtHIz83HDruPUdjoEpNPM8Aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410tk6801b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:10:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47EAACMj017267;
	Wed, 14 Aug 2024 10:10:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410tk68018-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:10:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47E816XG011853;
	Wed, 14 Aug 2024 10:10:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40xjhu91gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:10:11 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47EAA5KQ50069884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 10:10:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B3FD20067;
	Wed, 14 Aug 2024 10:10:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7807620065;
	Wed, 14 Aug 2024 10:10:02 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.22.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Aug 2024 10:10:02 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: [PATCH] powerpc/xmon: Fix tmpstr length check in scanhex
Date: Wed, 14 Aug 2024 15:39:39 +0530
Message-ID: <20240814100939.647305-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UET9rWGS4oBCgh2vhoKtZUOixkXomjKW
X-Proofpoint-ORIG-GUID: 0FAWJ2EZYF_3zcv9o7WC7v2BFBdB2GXG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=724 priorityscore=1501
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140069

If a function name is greater than 63 char long, xmon command
may not find them. For example, here is a test that
executed an illegal instruction in a kernel function and one of
call stack function has name >63 char long,

cpu 0x0: Vector: 700 (Program Check) at [c00000000a6577e0]
    pc: c0000000001aacb8: check__allowed__function__name__for__symbol__r4+0x8/0x10
    lr: c00000000019c1e0: check__allowed__function__name__for__symbol__r1+0x20/0x40
    sp: c00000000a657a80
   msr: 800000000288b033
  current = 0xc00000000a439900
  paca    = 0xc000000003e90000	 irqmask: 0x03	 irq_happened: 0x01
.....
[link register   ] c00000000019c1e0 check__allowed__function__name__for__symbol__r1+0x20/0x40
[c00000000a657a80] c00000000a439900 (unreliable)
[c00000000a657aa0] c0000000001021d8 check__allowed__function__name__for__symbol__r2_resolution_symbol+0x38/0x4c
[c00000000a657ac0] c00000000019b424 power_pmu_event_init+0xa4/0xa50

and when executing a dump instruction (di) command for long function name,
xmon fails to find the function symbol

0:mon> di $check__allowed__function__name__for__symbol__r2_resolution_symbol
unknown symbol 'check__allowed__function__name__for__symbol__r2_resolution_symb'
0000000000000000  ********

This is because, in the scanhex(), tmpstr loop index is checked only for a upper bound
of 63. Proposed fix is to replace the upper bound value with "KSYM_NAME_LEN"

With fix:

0:mon> di $check__allowed__function__name__for__symbol__r2_resolution_symbol
c0000000001021a0  3c4c0249	addis   r2,r12,585
c0000000001021a4  3842ae60	addi    r2,r2,-20896
c0000000001021a8  7c0802a6	mflr    r0
c0000000001021ac  60000000	nop
.....

Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link - https://lore.kernel.org/linuxppc-dev/87ilc8ym6v.fsf@mail.lhotse/
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index bd4813bad317..2f6a61d85e22 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3543,7 +3543,7 @@ scanhex(unsigned long *vp)
 		}
 	} else if (c == '$') {
 		int i;
-		for (i=0; i<63; i++) {
+		for (i=0; i<KSYM_NAME_LEN; i++) {
 			c = inchar();
 			if (isspace(c) || c == '\0') {
 				termch = c;
-- 
2.45.2


