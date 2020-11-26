Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9C2C5C00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:27:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmTG1FhjzDrc1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:27:46 +1100 (AEDT)
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
 header.s=pp1 header.b=f5rWRdJS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm546ccxzDrNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI1Vvl183104; Thu, 26 Nov 2020 13:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SSuusB1sxDxyC6UEEiJZrnyaS7GB8UZWMFieTiW72vE=;
 b=f5rWRdJSnLV9cQFHE8RK9C87Of7q4xl5XPqFJ3sjob1x/17ijRI36YeD31z9jo/uSFmM
 lLy8lA/zvfdKEruCv/1iOulaDwZLQKHPmzgBx7tP7QR9kNx3mwtb495GtWxyIWiaWAu/
 U1OsVgkaOlBp4ufWshepxAA0OPUYQ0SlBHdYj7YCzJVcFY4UDmmxjQuM6vJouNlSV9p9
 6+S77VsqjF+GFif7l2H6I95NnoN3B9VWB82vH94z1QJJZykM18fvjdaWrJ7wrqUOXSJV
 Px4d39HR+vWIbfDB7y2nsQLUNdD452zHSlZGUdu+MjxU4rCfTptSQ4iQaBHnHhH+mnsX ug== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352e4pn845-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:41 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI9PP1002176;
 Thu, 26 Nov 2020 18:09:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 352ata06n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQI9b7Q60490130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BA82A4060;
 Thu, 26 Nov 2020 18:09:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F473A4054;
 Thu, 26 Nov 2020 18:09:35 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:34 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 08/14] powerpc/ftrace: Use FTRACE_REGS_ADDR to identify
 the correct ftrace trampoline
Date: Thu, 26 Nov 2020 23:38:45 +0530
Message-Id: <136410660b5b6ff6ceb63d683496b6517103c01c.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
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
 impostorscore=0 priorityscore=1501 mlxlogscore=915 clxscore=1015
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

Use FTRACE_REGS_ADDR instead of keying off
CONFIG_DYNAMIC_FTRACE_WITH_REGS to identify the proper ftrace trampoline
address to use.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 4fe5f373172fd2..14b39f7797d455 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -361,11 +361,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	}
 
 	/* Let's re-write the tramp to go to ftrace_[regs_]caller */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	ptr = ppc_global_function_entry((void *)ftrace_regs_caller);
-#else
-	ptr = ppc_global_function_entry((void *)ftrace_caller);
-#endif
+	ptr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 	if (create_branch(&instr, (void *)tramp, ptr, 0)) {
 		pr_debug("%ps is not reachable from existing mcount tramp\n",
 				(void *)ptr);
@@ -885,11 +881,7 @@ int __init ftrace_dyn_arch_init(void)
 		0x7d8903a6,		/* mtctr   r12			*/
 		0x4e800420,		/* bctr				*/
 	};
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	unsigned long addr = ppc_global_function_entry((void *)ftrace_regs_caller);
-#else
-	unsigned long addr = ppc_global_function_entry((void *)ftrace_caller);
-#endif
+	unsigned long addr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 	long reladdr = addr - kernel_toc_addr();
 
 	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-- 
2.25.4

