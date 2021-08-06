Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BADA3E2B48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 15:24:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh5mG25M2z3bWW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 23:24:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c0DVOEsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c0DVOEsk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh5lN0gwzz30GG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 23:23:27 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176DLmuA095108; Fri, 6 Aug 2021 09:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Pq2drv4KiCQnZVLjPw80q1hcqnImOtSD7JUGfOGfnV4=;
 b=c0DVOEskwx/FpG+g5VAPDK3XS+riQbyIplHdcXWvnmG/Pzm865+M8ag/oQST4bh7p2Gt
 8dWTNT41MRahMX5ayhO727s98z/cr3zfKAtsMM6SWhVVresTG4uTyFueye5SWzw0Re22
 CMhGo/L8+BQbe4ISjFeCjgxSNFWiFo7rTzMny3a2KEqiOQ5zC24BMWApAVnmdJU4IKre
 mhG20R5p43caMly2E+graMc1+REAZpPFB22gon+FTxx1binwFL5ZVGrJX4cTjWeUFCA5
 OSBLaUKuLTaUTstiTROzUAPlZT84S2Em8GxnDPQIDFi7gmM00U3baRS7soKewH1eb1VT 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8ww85uy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 09:23:19 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 176DM1Kl096365;
 Fri, 6 Aug 2021 09:23:19 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8ww85uwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 09:23:18 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 176DE7SL030338;
 Fri, 6 Aug 2021 13:23:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58kuut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 13:23:16 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 176DKDnK54395288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 13:20:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A2EF11C052;
 Fri,  6 Aug 2021 13:23:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28CC511C069;
 Fri,  6 Aug 2021 13:23:11 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.102.0.30]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Aug 2021 13:23:10 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mce: check if event info is valid
Date: Fri,  6 Aug 2021 18:53:07 +0530
Message-Id: <20210806132307.367688-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AUNKD5xVua2XgBi-m7OBEBRHxpGh9ElS
X-Proofpoint-ORIG-GUID: T9joGONwtERWG1U3s2d7ZIEOqA3rWeb8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_04:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=915 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108060092
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Check if the event info is valid before printing the
event information. When a fwnmi enabled nested kvm guest
hits a machine check exception L0 and L2 would generate
machine check event info, But L1 would not generate any
machine check event info as it won't go through 0x200
vector and prints some unwanted message.

To fix this, 'in_use' variable in machine check event info is
no more in use, rename it to 'valid' and check if the event
information is valid before logging the event information.

without this patch L1 would print following message for
exceptions encountered in L2, as event structure will be
empty in L1.

"Machine Check Exception, Unknown event version 0".

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/mce.h | 2 +-
 arch/powerpc/kernel/mce.c      | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 331d944280b8..3646f53f228f 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -113,7 +113,7 @@ enum MCE_LinkErrorType {
 
 struct machine_check_event {
 	enum MCE_Version	version:8;
-	u8			in_use;
+	u8			valid;
 	enum MCE_Severity	severity:8;
 	enum MCE_Initiator	initiator:8;
 	enum MCE_ErrorType	error_type:8;
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 47a683cd00d2..b778394a06b5 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -114,7 +114,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	mce->srr0 = nip;
 	mce->srr1 = regs->msr;
 	mce->gpr3 = regs->gpr[3];
-	mce->in_use = 1;
+	mce->valid = 1;
 	mce->cpu = get_paca()->paca_index;
 
 	/* Mark it recovered if we have handled it and MSR(RI=1). */
@@ -202,7 +202,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 		if (mce)
 			*mce = *mc_evt;
 		if (release)
-			mc_evt->in_use = 0;
+			mc_evt->valid = 0;
 		ret = 1;
 	}
 	/* Decrement the count to free the slot. */
@@ -413,6 +413,9 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 		"Probable Software error (some chance of hardware cause)",
 	};
 
+	if (!evt->valid)
+		return;
+
 	/* Print things out */
 	if (evt->version != MCE_V1) {
 		pr_err("Machine Check Exception, Unknown event version %d !\n",
-- 
2.31.1

