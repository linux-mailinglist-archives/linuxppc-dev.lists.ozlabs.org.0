Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A130E37A639
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 14:03:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffc5Q4pGHz2yyx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 22:03:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h1W6b/FU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathvika@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h1W6b/FU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffc4t2vVcz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 22:03:09 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BBZ93N188176; Tue, 11 May 2021 08:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : in-reply-to : references
 : mime-version : content-type : content-transfer-encoding; s=pp1;
 bh=uY/J987TwY8wgTsn1d3iIW/OAJTv2vsPVTofWKyUlXM=;
 b=h1W6b/FU4zlycbhogRioLUs0/j3NGtvQYJ9tqK36MujcOdqnQAfqyrwBjaGPruIQ0+sY
 zrfZ6mQejawbO9jTP0hxCXe45HdFl34fIFdbdgWrNlfM5NWaDUDxxogUAhBSnEmEQPvP
 Y5TA8FjpzQ1xyqBmLVZDO6D51egXnlhgV0kbI1lCLdjTQtVpb0ldHYN5Vb8CECQPZa6p
 skTSNXnwyTuNQAxCpUWcbh9bNLrCscIJ+xnsxXheQ4h1AqbIzD8CZpLju61X84vm/7mN
 5pIo98iGlhGLn+GdhR4m+zco3kFH5AOwW2jc+XHN7ApoMugptbXg84ldFQi3hz8Nqc5k Cw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38fnxhergx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 08:02:58 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14BC2Ckp009268;
 Tue, 11 May 2021 12:02:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 38dhwh9nbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 12:02:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14BC2sQ739453080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 12:02:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9D744C044;
 Tue, 11 May 2021 12:02:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEF0E4C040;
 Tue, 11 May 2021 12:02:52 +0000 (GMT)
Received: from ltc-zz14-lp7.aus.stglabs.ibm.com (unknown [9.40.195.16])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 12:02:52 +0000 (GMT)
From: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] =?UTF-8?q?powerpc/sstep:=20Add=20emulation=20suppo?=
 =?UTF-8?q?rt=20for=20=E2=80=98setb=E2=80=99=20instruction?=
Date: Tue, 11 May 2021 07:18:32 -0500
Message-Id: <7b735b0c898da0db2af8628a64df2f5114596f22.1620727160.git.sathvika@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: REn8zZJZ3IzC4HlCJzbdPr3Bi-M_Lbwz
X-Proofpoint-GUID: REn8zZJZ3IzC4HlCJzbdPr3Bi-M_Lbwz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_02:2021-05-11,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105110090
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
Cc: sathvika@linux.vnet.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following instruction:
   * Set Boolean (setb)

Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
---
 arch/powerpc/lib/sstep.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 45bda2520755..aee42bcc775b 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1700,6 +1700,28 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->val = regs->ccr & imm;
 			goto compute_done;
 
+		case 128:	/* setb */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
+			/*
+			 * 'ra' encodes the CR field number (bfa) in the top 3 bits.
+			 * Since each CR field is 4 bits,
+			 * we can simply mask off the bottom two bits (bfa * 4)
+			 * to yield the first bit in the CR field.
+			 */
+			ra = ra & ~0x3;
+			/* 'val' stores bits of the CR field (bfa) */
+			val = regs->ccr >> (CR0_SHIFT - ra);
+			/* checks if the LT bit of CR field (bfa) is set */
+			if (val & 8)
+				op->val = -1;
+			/* checks if the GT bit of CR field (bfa) is set */
+			else if (val & 4)
+				op->val = 1;
+			else
+				op->val = 0;
+			goto compute_done;
+
 		case 144:	/* mtcrf */
 			op->type = COMPUTE + SETCC;
 			imm = 0xf0000000UL;
-- 
2.16.4

