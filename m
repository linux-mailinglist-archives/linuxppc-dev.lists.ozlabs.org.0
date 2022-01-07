Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5737C4878BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 15:17:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVlfJ1pJwz3cWp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 01:17:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XjNyuiP7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XjNyuiP7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVlc21R6Qz30Ml
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 01:15:13 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207B7BPp029750; 
 Fri, 7 Jan 2022 14:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uKChRc5XdoBS3YZbQL3u1oPmAZGQt5+nnV9cRl+Zk1U=;
 b=XjNyuiP7xtOmfVi7+pA6j1Y6Bu7FPU3IucPsYTL4qYFjWwootOjNrqiPg+DRHVZrjw1L
 BVTcp/HM2ge/enUoo9DStWybLBR0OXDbcIESW73aYs/CxuKoJ2ifDjspY3dDQuB117+N
 l7ZqbJmxEfWuCSuAHqYlFAjlELLLkOZmnkH5HDyGU95WqcYAOwLnlxjxJMKqQYgb7vPi
 SNI8xkTayKgjXzpvtdSNJJITXfDFuYjzQPEkbOYlt218lUiMc1qUZltRYP8AeBFL5YxA
 WQK+JaQgplL3KR0MLVjcXrZFzKM0tvlRam9PW4xTesq52iEc4jyFnMHLT/vkh0yg2XZf 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wjacsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:08 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207DtVSM030838;
 Fri, 7 Jan 2022 14:15:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wjacs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207E7JxB001962;
 Fri, 7 Jan 2022 14:15:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3de4xbefcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207EF3lS43778448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 14:15:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10AB511C050;
 Fri,  7 Jan 2022 14:15:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8905E11C06F;
 Fri,  7 Jan 2022 14:15:00 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.110.164])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 14:14:59 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 RESEND 3/3] powerpc/mce: Modify the real address error
 logging messages
Date: Fri,  7 Jan 2022 19:44:28 +0530
Message-Id: <20220107141428.67862-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
References: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A8hlnujCosH-jwRnBqiPbMbHGUlbeDAK
X-Proofpoint-ORIG-GUID: dwuD8oBTTcgcTchVPYY03rLNRbOMwPio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_05,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070097
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
 npiggin@gmail.com, dja@axtens.net
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
index fd829f7f25a4..55ccc651d1b0 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -401,14 +401,14 @@ void machine_check_print_event_info(struct machine_check_event *evt,
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

