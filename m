Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FE168D96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 09:23:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PhD01D29zDqnF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 19:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PhBL72ChzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 19:21:39 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01M8K8Gf052935
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 03:21:36 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb00792yt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 03:21:36 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Sat, 22 Feb 2020 08:21:34 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 22 Feb 2020 08:21:31 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01M8LUw244105840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Feb 2020 08:21:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB27911C052;
 Sat, 22 Feb 2020 08:21:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F027C11C04A;
 Sat, 22 Feb 2020 08:21:25 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.56.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 22 Feb 2020 08:21:25 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/watchpoint: Don't call dar_within_range() for Book3S
Date: Sat, 22 Feb 2020 13:50:49 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022208-0008-0000-0000-000003555D9E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022208-0009-0000-0000-00004A767210
Message-Id: <20200222082049.330435-1-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-22_02:2020-02-21,
 2020-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 impostorscore=0
 suspectscore=1 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002220073
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DAR is set to the first byte of overlap between actual access and
watched range at DSI on Book3S processor. But actual access range
might or might not be within user asked range. So for Book3S, it
must not call dar_within_range().

This revert portion of commit 39413ae00967 ("powerpc/hw_breakpoints:
Rewrite 8xx breakpoints to allow any address range size.").

Before patch:
  # ./tools/testing/selftests/powerpc/ptrace/perf-hwbreak
  ...
  TESTED: No overlap
  FAILED: Partial overlap: 0 != 2
  TESTED: Partial overlap
  TESTED: No overlap
  FAILED: Full overlap: 0 != 2
  failure: perf_hwbreak

After patch:
  TESTED: No overlap
  TESTED: Partial overlap
  TESTED: Partial overlap
  TESTED: No overlap
  TESTED: Full overlap
  success: perf_hwbreak

Fixes: 39413ae00967 ("powerpc/hw_breakpoints: Rewrite 8xx breakpoints to allow any address range size.")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 2462cd7c565c..d0854320bb50 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -331,11 +331,13 @@ int hw_breakpoint_handler(struct die_args *args)
 	}
 
 	info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
-	if (!dar_within_range(regs->dar, info))
-		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-
-	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info))
-		goto out;
+	if (IS_ENABLED(CONFIG_PPC_8xx)) {
+		if (!dar_within_range(regs->dar, info))
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+	} else {
+		if (!stepping_handler(regs, bp, info))
+			goto out;
+	}
 
 	/*
 	 * As a policy, the callback is invoked in a 'trigger-after-execute'
-- 
2.21.1

