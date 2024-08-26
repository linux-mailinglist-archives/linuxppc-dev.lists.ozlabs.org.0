Return-Path: <linuxppc-dev+bounces-493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCA95E932
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 08:43:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsh2C2sRnz2y8P;
	Mon, 26 Aug 2024 16:42:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724654579;
	cv=none; b=ODVJzhcpi++a7f7BmYuSUDuZg1GHysPouxqaNtlIm6XWFgYtdFDIf3n5KGabb8gjkU82KgmmRXuctdKkTiHGc/fDLDz4/TrX+NK1po/NRWcLfSM6ClhRW2PJijRzupxkp1S5362YjPr7U6CT5DGt5pTw1avqLK/hXe2jAAQinUL9/RWBCEJDvdXx/CewyT65GY8VXYfAbxxSacp7aAtyOHa7ntVmNjovarcViZ4qG4spwmsO1Cty57Yn6pYPmscl+3WfEs3WRdUnSRoOzDVSWBglO0ltLGaA5Gtg6SFuWXjgBxG7qNKqL3d+BzPnF2SaQhPAv4Y9yN/5Et1wYjAvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724654579; c=relaxed/relaxed;
	bh=3z0B1zrBMWR8LLz2sD3gOwuBnkRnEIOdGdeATNu2Tus=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:Content-Transfer-Encoding:X-Proofpoint-UnRewURL:
	 MIME-Version:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	b=QT0MuAaqZPqLlDBgxV1rPn0Nb1BOcLETRTRVeCIDo0M43EsJh/RfkFZxN98g0713sceEXseJUdxhg5E1nPbdrHwsDN8/UvW+PC33laznwPArTZab1uknqV2rg/AL2N3Jc0tP6RJCvr96aKM1X3io+EaSr+K9DSP7sHeETBbxrcMSPk7R5wBIa3UVb+OTgSb+BBI70dJK6XCxa9sqFRvYLqWFzXHJzBed6LSaGkN/mb7XtSzO7W6kw1EBIGnInBcGJXj6xZ3mKS/HrWPWLk27heNbF250YwFXbjeFQvT4vwIL/tyuBgnlHCBTwvodXLEDxdyc1az3F1uu2O7K/nGw7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=huq+UVUa; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=huq+UVUa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsh2B4lHqz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 16:42:57 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PEcnnM017901;
	Mon, 26 Aug 2024 06:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=3z0B1zrBMWR8LLz2sD3gOwuBnkRnEIOdGdeATNu
	2Tus=; b=huq+UVUaMZaoWZWZ6P7YwbuOftz5r8vrYvMBT/cw/hYwUU2oQPN3jmF
	6yEv6N9tahOGPBT5Ht5WF1jBkbFB01qjgAW1ed8kN82P7YlwcBFnSYX99xq9nzAi
	LOlSYR4J0bEIR6ZrnK2q9osFCb9y1aFFt4RS8rEtgf6Gq7TgQU/GWTCQuQTRTtXa
	10vCru4c55cv6+wS54ixQ6wSuIgVeI1WrTMcOtWyCvIvHl/HGl2i5+V1ugYJo7Ci
	kc3MhKSgrO0JR2FliCYOZKpHRB1YN9Blk2NvZ2CYlbGTm7cW2tRqP4XMi6WvAs0q
	IuDqze1gIMTHAGyVWauCAPDSmhzp3iQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417ged5a79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 06:42:48 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47Q6gmGD029889;
	Mon, 26 Aug 2024 06:42:48 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417ged5a76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 06:42:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q42e1i003114;
	Mon, 26 Aug 2024 06:42:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417tupmuk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 06:42:47 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47Q6ghQF35062340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2024 06:42:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9568A20049;
	Mon, 26 Aug 2024 06:42:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 573EF20040;
	Mon, 26 Aug 2024 06:42:41 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.52.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Aug 2024 06:42:41 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: [PATCH v3] powerpc/xmon: Fix tmpstr length check in scanhex
Date: Mon, 26 Aug 2024 12:12:17 +0530
Message-ID: <20240826064217.46658-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NWl_-h72Cml3HIDNqYDC-HN4rVGehhfy
X-Proofpoint-GUID: mS8H0td92Pu-1MbcGWA7TUEQYtWnrFbJ
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
 definitions=2024-08-26_03,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=853
 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260052

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
of 63. Proposed fix is to replace the upper bound value with "(KSYM_NAME_LEN-1)"

With fix:

0:mon> di $check__allowed__function__name__for__symbol__r2_resolution_symbol
c0000000001021a0  3c4c0249	addis   r2,r12,585
c0000000001021a4  3842ae60	addi    r2,r2,-20896
c0000000001021a8  7c0802a6	mflr    r0
c0000000001021ac  60000000	nop
.....

Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/linuxppc-dev/CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com/
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v2:
- Fixed the loop upper limit from KSYM_NAME_LEN to
  (KSYM_NAME_LEN - 1) since last index is initialized
  with zero at the end of the loop. Thanks mpe for
  pointing it out. 
- Checkpatch script was complaining about the format style 

	ERROR: spaces required around that '=' (ctx:VxV)
	#67: FILE: arch/powerpc/xmon/xmon.c:3546:
	+		for (i=0; i < (KSYM_NAME_LEN - 1); i++) {
			      ^
   so have fixed the same. 

Changelog v1:
- Updated commit message based on Miguel's review comments

 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index bd4813bad317..e6cddbb2305f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3543,7 +3543,7 @@ scanhex(unsigned long *vp)
 		}
 	} else if (c == '$') {
 		int i;
-		for (i=0; i<63; i++) {
+		for (i = 0; i < (KSYM_NAME_LEN - 1); i++) {
 			c = inchar();
 			if (isspace(c) || c == '\0') {
 				termch = c;
-- 
2.45.2


