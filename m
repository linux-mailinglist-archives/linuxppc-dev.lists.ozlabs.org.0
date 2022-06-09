Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00325448F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 12:34:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJgSh41WTz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 20:34:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JFxcjDXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JFxcjDXl;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJgS254KMz3bll
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 20:33:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2598hWn5028389;
	Thu, 9 Jun 2022 10:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aw/B5klr7ijqtIU4+lA2AmVyo6mgkMt5M8K3+MR+grs=;
 b=JFxcjDXltTFDYWhxBF+LTyUy8io9YuY6sQHmrc7e4yKYzJ+fOKemupoZo8coedWk5Hxf
 jVxvzKAXLjerwCr6lSBvwTN7l3YqLaEmptA2eMTzNHM1zKJSDh2/5F59a87OYE7ugFWe
 oDyzK0G9S9QigT/v9UdpIkTPd/F3+qjcTe+3XE8rJj+p1uHbGeXS1KkVFcB+0tDphGbi
 PR9+bTQhewFeO6BvD5ZoWxtm7lU2pjXxqFnS0evaqQakHrCY6OxUHjQSD5GXUxyt3LOH
 /+YU+V1jcDDNzywCplE5D5/JAf6u0AFbJXgZZPCirT5CHApgb55gHRLMwfGiXXfmOpGL iA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkdkq9yw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 10:33:47 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 259ALqUI010270;
	Thu, 9 Jun 2022 10:33:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3gfy19es48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 10:33:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 259AXg1G20578712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jun 2022 10:33:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 919D5A405F;
	Thu,  9 Jun 2022 10:33:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96CC3A406B;
	Thu,  9 Jun 2022 10:33:41 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.114.46])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jun 2022 10:33:41 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Enable execve syscall exit tracepoint
Date: Thu,  9 Jun 2022 16:03:28 +0530
Message-Id: <20220609103328.41306-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xC-T8E5EHA8_mae6HpUhB-Yfl0JgBbfp
X-Proofpoint-ORIG-GUID: xC-T8E5EHA8_mae6HpUhB-Yfl0JgBbfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_08,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=841
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090040
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On execve[at], we are zero'ing out most of the thread register state
including gpr[0], which contains the syscall number. Due to this, we
fail to trigger the syscall exit tracepoint properly. Fix this by
retaining gpr[0] in the thread register state.

Before this patch:
  # tail /sys/kernel/debug/tracing/trace
	       cat-123     [000] .....    61.449351: sys_execve(filename:
  7fffa6b23448, argv: 7fffa6b233e0, envp: 7fffa6b233f8)
	       cat-124     [000] .....    62.428481: sys_execve(filename:
  7fffa6b23448, argv: 7fffa6b233e0, envp: 7fffa6b233f8)
	      echo-125     [000] .....    65.813702: sys_execve(filename:
  7fffa6b23378, argv: 7fffa6b233a0, envp: 7fffa6b233b0)
	      echo-125     [000] .....    65.822214: sys_execveat(fd: 0,
  filename: 1009ac48, argv: 7ffff65d0c98, envp: 7ffff65d0ca8, flags: 0)

After this patch:
  # tail /sys/kernel/debug/tracing/trace
	       cat-127     [000] .....   100.416262: sys_execve(filename:
  7fffa41b3448, argv: 7fffa41b33e0, envp: 7fffa41b33f8)
	       cat-127     [000] .....   100.418203: sys_execve -> 0x0
	      echo-128     [000] .....   103.873968: sys_execve(filename:
  7fffa41b3378, argv: 7fffa41b33a0, envp: 7fffa41b33b0)
	      echo-128     [000] .....   103.875102: sys_execve -> 0x0
	      echo-128     [000] .....   103.882097: sys_execveat(fd: 0,
  filename: 1009ac48, argv: 7fffd10d2148, envp: 7fffd10d2158, flags: 0)
	      echo-128     [000] .....   103.883225: sys_execveat -> 0x0

Cc: stable@vger.kernel.org
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index d00b20c6596671..bb4da23ecdd7c2 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1854,7 +1854,7 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 		tm_reclaim_current(0);
 #endif
 
-	memset(regs->gpr, 0, sizeof(regs->gpr));
+	memset(&regs->gpr[1], 0, sizeof(regs->gpr) - sizeof(regs->gpr[0]));
 	regs->ctr = 0;
 	regs->link = 0;
 	regs->xer = 0;

base-commit: 16332b7fbbe46581ddac80c6d32834c1269bc450
-- 
2.36.1

