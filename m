Return-Path: <linuxppc-dev+bounces-98-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B117E9528B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 07:03:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dpu+/F8U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WktL02KYgz2yTy;
	Thu, 15 Aug 2024 15:03:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dpu+/F8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WktKz1f8Hz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 15:03:02 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EHt1vT006881;
	Thu, 15 Aug 2024 05:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=+8whbVrBQex9KuznLAIf4NjWcdpRoYptfIdO+NG
	Fp6k=; b=Dpu+/F8UJnuaQJUo+YbHkp9Bw6QUw2N3bI3wI60bazejdwHRBDbVggY
	B4bYwha9LSxSErXDlDzhQ+k5pH3tpqn5vQ9TSqjmGBCuzs+sily61HjZkDZPgqbs
	CSQFLxtZAXiPEmOcJwLz6q+37E9xWfORutkijOM3F0jWZlsMHnGtgINf3tAtlsUL
	TdlLhdXr9+c1zJaEhuh0rt1B7KlMmmqwtWptezSsYK7R5liWF9kmGjERtqJbVjCR
	kxEbDbZuZx61SdXlJGWVq4nFdsFCNcvBUq1jyTjKJ4qNow2cQ1iPgyVARFFDI77Q
	PACt+OavUguLnuxasq6orDxCZLnNHtg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111d6a1pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 05:02:53 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47F52qKD032278;
	Thu, 15 Aug 2024 05:02:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111d6a1ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 05:02:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47F24dY0015282;
	Thu, 15 Aug 2024 05:02:36 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xm1mw0m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 05:02:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47F52T6s28049764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 05:02:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E37A20043;
	Thu, 15 Aug 2024 05:02:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C583120040;
	Thu, 15 Aug 2024 05:02:26 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.12.16])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Aug 2024 05:02:26 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: [PATCH v2] powerpc/xmon: Fix tmpstr length check in scanhex
Date: Thu, 15 Aug 2024 10:32:22 +0530
Message-ID: <20240815050222.801289-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: krpJ5zg2hViUEewBWU7ulv0QIh49CIqy
X-Proofpoint-GUID: TvzGv7MDnQXWlTEhDxGxUj_sII_EyJoZ
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
 definitions=2024-08-14_22,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=882 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150034

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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/linuxppc-dev/CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com/
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Updated commit message based on Miguel's review comments

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


