Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F6F3DBE4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 20:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbwmT605tz3d85
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 04:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+9p7KpP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F+9p7KpP; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gbwly45FKz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 04:24:29 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UIMX2I180365; Fri, 30 Jul 2021 14:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D6/MohSKkzIUyUpZ6c8/jFPUemFrIIoEn0DhLaN5meA=;
 b=F+9p7KpPNF8DbB+Dt2Wm8+Dg5/jXPjUn6JDwU6HC0DneNNcG9pymmKD6JI3V68Gix6lq
 WINWtmcw85qiSiksI0oq8wRoh8tJ03X+dDvfRlJf65I70+f1oGNHsLLbiYZqdNhXnWap
 zkkiNtq/0CVlzo79H5wNWl4Ue1KhEmZbRiBbP2QLzPDBhWCDQsqi3cVsWtK6cAn6MT+G
 q9zfH3e9+/7+3q7Izr8+BRHe8R3yAHheSJSx6wPZWf/VGBUE54jCztOd9tz4QNavL1l2
 0yxaPcRfHYGmhqXff1Tqzis459ougIDI9j3msWVUx/9F5OgDFhm2a6BsDk7y9FIPaW7W 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a4pn9g160-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:24:22 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UINPLH182880;
 Fri, 30 Jul 2021 14:24:22 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a4pn9g15h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:24:22 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16UINE7t029219;
 Fri, 30 Jul 2021 18:24:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3a235kknpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 18:24:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16UIOHOI26018154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 18:24:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1DF0A4051;
 Fri, 30 Jul 2021 18:24:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5F1AA4040;
 Fri, 30 Jul 2021 18:24:14 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.199.33.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Jul 2021 18:24:14 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/mce: Modify the real address error logging
 messages
Date: Fri, 30 Jul 2021 23:53:49 +0530
Message-Id: <20210730182349.625819-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730182349.625819-1-ganeshgr@linux.ibm.com>
References: <20210730182349.625819-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WQaSjqRX3QGDBLMPZN0_5_cnnzLOWLim
X-Proofpoint-GUID: m-gU05EZFlN0X2vZUs2FjYiDsIC7Ri5y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_11:2021-07-30,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2107300121
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

