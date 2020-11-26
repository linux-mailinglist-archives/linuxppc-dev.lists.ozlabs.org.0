Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220CD2C5BF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:26:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmRP0Z0NzDrdT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:26:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mX32+xrg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm542HSLzDrNW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI1WL3183169; Thu, 26 Nov 2020 13:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/6sGA9q20+X4LEX7IPcTF5RPKCu3pc4IWtBd0kJDl+8=;
 b=mX32+xrg1cxXl2nnEkhxfCEn+n0rbzxjZeFSngXscPjJ/q8aBue0TiBP9SQxHd4OEmiR
 c8rCv7Ke66uX/R5h3lmjxl+zuH+1qBiXw7h3co2CvekMMU3Mypr7qtGULKq9xPZxLVNT
 1XHkzQygn8qtLTNC88MwYl6tEJQ7rhc+XCrFp12Mb6pLjDsvCq71sZi7PonpSpWhxf7W
 jPYKl4sWWAXXU/hOpuXH6q8vGwxrCoSWPLo0TLl4VKfhGwKsL+Hxg9xC4gF6gRPuqddJ
 mZaRRFIqq1g15x0+BU//D+RE//w//6V6T6YzBQ5Vlg+TjC/49U6+JK+WUWbMzqcVUhKQ Wg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352e4pn82v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:38 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI7KOM001269;
 Thu, 26 Nov 2020 18:09:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 351vqqrxuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9Y3B2163278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A948A405C;
 Thu, 26 Nov 2020 18:09:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6610CA405B;
 Thu, 26 Nov 2020 18:09:32 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:32 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 07/14] powerpc/ftrace: Remove dead code
Date: Thu, 26 Nov 2020 23:38:44 +0530
Message-Id: <bdc3710137c4bda8393532a789558bed22507cfe.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260108
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ftrace_plt_tramps[] was intended to speed up skipping plt branches, but
the code wasn't completed. It is also not significantly better than
reading and decoding the instruction. Remove the same.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 42761ebec9f755..4fe5f373172fd2 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -332,7 +332,6 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	struct ppc_inst op;
 	unsigned long ptr;
 	struct ppc_inst instr;
-	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
 	/* Is this a known long jump tramp? */
 	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
@@ -341,13 +340,6 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 		else if (ftrace_tramps[i] == tramp)
 			return 0;
 
-	/* Is this a known plt tramp? */
-	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
-		if (!ftrace_plt_tramps[i])
-			break;
-		else if (ftrace_plt_tramps[i] == tramp)
-			return -1;
-
 	/* New trampoline -- read where this goes */
 	if (probe_kernel_read_inst(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
-- 
2.25.4

