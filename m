Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10D361A03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM6H813lpz3bxQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:48:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pC9jM8zr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathvika@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pC9jM8zr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM6GF2My3z2yYt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:47:33 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G6YOs1001431
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 02:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : in-reply-to : references
 : mime-version : content-type : content-transfer-encoding; s=pp1;
 bh=F+q3rS1fqlkokJ1fXCoKR03kR4KrGXXdrWgTYeS1ch0=;
 b=pC9jM8zrHxX8wj9AW6EUiKRaswA8bwuZHdSnMOkvYqA8lliAHaZfuOOKESqWd9TbrYGr
 IjT6Unah0g7ZcNl9wUKL827PcpEyx+8ZWUjQZoiR4mick7ykTMXd3Eq7pFctUtbDaksq
 UAZdvjXA9YIjYT/a97gZJj3kqyA4kTjJLiIpBIl/QwXn7MF+Q/VG500n2R/fFbBOc5Wb
 i/zu4LqH/dPFM9M1nlDQeeYiLsN2zq398xD1fp+OH45UOC39l2HQwFLwTZw9dIAYiG70
 t8y6xco0wo/wXz6BOJGKeRlBkGnYWrqdLwOfB4OdVblAuS5B3+wk3zwGv09leoRAHRa9 Aw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xsvafxd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 02:47:31 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G6VftJ012747
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:47:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8c9gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:47:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13G6l3Mx35455370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 06:47:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3C914203F;
 Fri, 16 Apr 2021 06:47:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29EF042041;
 Fri, 16 Apr 2021 06:47:25 +0000 (GMT)
Received: from ltc-zz14-lp7.aus.stglabs.ibm.com (unknown [9.40.195.16])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 06:47:25 +0000 (GMT)
From: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] =?UTF-8?q?powerpc/sstep:=20Add=20emulation=20support?=
 =?UTF-8?q?=20for=20=E2=80=98setb=E2=80=99=20instruction?=
Date: Fri, 16 Apr 2021 02:02:48 -0500
Message-Id: <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PASFrHdBjLqdNPMEh7pBlYWT5G-L5Uh5
X-Proofpoint-GUID: PASFrHdBjLqdNPMEh7pBlYWT5G-L5Uh5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160049
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
Cc: naveen.n.rao@linux.ibm.com,
 Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following instruction:
   * Set Boolean (setb)

Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
---
 arch/powerpc/lib/sstep.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c6aebc149d14..263c613d7490 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1964,6 +1964,18 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->val = ~(regs->gpr[rd] | regs->gpr[rb]);
 			goto logical_done;
 
+		case 128:	/* setb */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
+			ra = ra & ~0x3;
+			if ((regs->ccr) & (1 << (31 - ra)))
+				op->val = -1;
+			else if ((regs->ccr) & (1 << (30 - ra)))
+				op->val = 1;
+			else
+				op->val = 0;
+			goto compute_done;
+
 		case 154:	/* prtyw */
 			do_prty(regs, op, regs->gpr[rd], 32);
 			goto logical_done_nocc;
-- 
2.16.4

