Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92B38B1D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 16:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmC3y37JKz3btR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 00:36:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QNuwyBDw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QNuwyBDw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmC3T4dWYz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 00:36:20 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KEXbTN035980; Thu, 20 May 2021 10:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=nuLOFIW0ZgH1MdRoEUO4Io5hfLyFdRZM9KQvQxVeXI8=;
 b=QNuwyBDwLet0NAdqo1tfd/F1kE4UlpRFu13qOc6IqzLoYxqwEDFLh4Omw5CLsejeZnUi
 EOIJ/7hQTOedXqTd3NyvHNzL/0paqTMfGzev+EJYXmEMO7imBuyPtYyU6d2IAjGJY0tl
 xeae3X44CpZPMbZNf2yX5rjDSW/UGjf4FGOTW4CixwrVJ23NajGYei6NGH8beCeHfcfq
 VhQgFcEjKwANXUN3KajuoAQQ+/6+kh9L1uv9CQpQGuVQyjhpxEim9Y1IYw1d75JMK0pT
 799tmlIJFwA3PMuxcI8SofvFLQzCxMv90ehpNh0Ofn+F7TjtB8oJF63Lt2JS+U2SghYH nQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nsh38cet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 10:36:12 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KEHe4a022720;
 Thu, 20 May 2021 14:36:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 38j5x8apjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 14:36:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KEa0TX38076820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 14:36:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D98B84C044;
 Thu, 20 May 2021 14:36:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B49A4C050;
 Thu, 20 May 2021 14:35:59 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.187.215])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 14:35:59 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] selftests/powerpc: Fix "no_handler" EBB selftest for ISA v3.1
Date: Thu, 20 May 2021 10:35:58 -0400
Message-Id: <1621521358-1904-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2yKqrecKY7qo2I-fFTxwRJj7B_AlXhv8
X-Proofpoint-GUID: 2yKqrecKY7qo2I-fFTxwRJj7B_AlXhv8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=641 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200101
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
Cc: nasastry@in.ibm.com, shirisha.ganta1@ibm.com, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "no_handler_test" in ebb selftests attempts to read the PMU
registers after closing of the event via helper function
"dump_ebb_state". With the MMCR0 control bit (PMCCEXT) in ISA v3.1,
read access to group B registers is restricted when MMCR0 PMCC=0b00.
Hence the call to dump_ebb_state after closing of event will generate
a SIGILL, which is expected.

Test has below in logs:

<<>>
!! child died by signal 4
failure: no_handler_test
<<>>

In other platforms (like power9), the older behaviour works where
group B PMU SPRs are readable. Patch fixes the selftest to handle
the sigill for ISA v3.1.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Shirisha Ganta <shirisha.ganta1@ibm.com>
---
 tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c b/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c
index fc5bf48..5f57a9d 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c
@@ -50,7 +50,17 @@ static int no_handler_test(void)
 
 	event_close(&event);
 
-	dump_ebb_state();
+	/*
+	 * For ISA v3.1, verify the test takes a SIGILL when reading
+	 * PMU regs after the event is closed. With the control bit
+	 * in MMCR0 (PMCCEXT) restricting access to group B PMU regs,
+	 * sigill is expected.
+	 */
+
+	if (have_hwcap2(PPC_FEATURE2_ARCH_3_1))
+		FAIL_IF(catch_sigill(dump_ebb_state));
+	else
+		dump_ebb_state();
 
 	/* The real test is that we never took an EBB at 0x0 */
 
-- 
1.8.3.1

