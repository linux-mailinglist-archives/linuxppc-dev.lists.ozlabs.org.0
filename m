Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C23E1135
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNRD0smHz3dVn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:22:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RClxQOZo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RClxQOZo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNPy32vGz3cPN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:20:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17594IO8138456; Thu, 5 Aug 2021 05:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=z7XVCLrbiuiBbQgbpylLKxz2oxgfJBVxTkRp62gRTr8=;
 b=RClxQOZouEs39G4i1yBXYceXDKz9P6Hv1tRKlfbWRgOGPiPzzut+YlOwAb3F/13BqUBH
 4Fla9vvkRLFZwM2FSA6l6ORGaVkQ8pxRcXcjvFVbM+LYE0AgZnm6LzKkoJqsBXdvyYm9
 pmfQIYAcCQ7YriqxHj154lShaWcEMeW+TEHCBbLCzjJr/vpyQ/Mj/7iCBwtES3at1JNh
 91LWlCmUkitPfxpKnItc4c5hyzSwY8QljqE7p6OWJz2XpScSPutLHkUMiOvHFA6QYrP9
 q3Awn+ZR33HR2/kB+ystepKQv/THFCQRnKMyBvjPSc7TjWccpa2hRhY/uk3uWmJ7feI1 Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a859cu7k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:20:48 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17594LHr138810;
 Thu, 5 Aug 2021 05:20:48 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a859cu7j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:20:48 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17597dEi019563;
 Thu, 5 Aug 2021 09:20:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x592xeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:20:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1759KhkP52232682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 09:20:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21942AE05D;
 Thu,  5 Aug 2021 09:20:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BF7FAE06E;
 Thu,  5 Aug 2021 09:20:40 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.85.115.109])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 09:20:40 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 3/3] powerpc/mce: Modify the real address error logging
 messages
Date: Thu,  5 Aug 2021 14:50:25 +0530
Message-Id: <20210805092025.272871-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qf8T9NUODx1bcSeglbQv2SUi_s_STtpr
X-Proofpoint-ORIG-GUID: pyGPHTR6irn8JYfQVvtUPlisfGEA4bYz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050054
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
Cc: mikey@neuling.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid ambiguity, modify the strings in real address error
logging messages to "foreign/control memory" from "foreign",
Since the error discriptions in P9 user manual and P10 user
manual are different for same type of errors.

P9 User Manual for MCE:
DSISR:59 Host real address to foreign space during translation.
DSISR:60 Host real address to foreign space on a load or store
	 access.

P10 User Manual for MCE:
DSISR:59 D-side tablewalk used a host real address in the
	 control memory address range.
DSISR:60 D-side operand access to control memory address space.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: No changes in this patch.
---
 arch/powerpc/kernel/mce.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 47a683cd00d2..f3ef480bb739 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -388,14 +388,14 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 	static const char *mc_ra_types[] = {
 		"Indeterminate",
 		"Instruction fetch (bad)",
-		"Instruction fetch (foreign)",
+		"Instruction fetch (foreign/control memory)",
 		"Page table walk ifetch (bad)",
-		"Page table walk ifetch (foreign)",
+		"Page table walk ifetch (foreign/control memory)",
 		"Load (bad)",
 		"Store (bad)",
 		"Page table walk Load/Store (bad)",
-		"Page table walk Load/Store (foreign)",
-		"Load/Store (foreign)",
+		"Page table walk Load/Store (foreign/control memory)",
+		"Load/Store (foreign/control memory)",
 	};
 	static const char *mc_link_types[] = {
 		"Indeterminate",
-- 
2.31.1

