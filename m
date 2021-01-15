Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE42F72C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 07:18:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH9wD0dyDzDsWK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 17:18:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mR74Mn9r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH9tV4ywtzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 17:16:34 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10F62AKm076774; Fri, 15 Jan 2021 01:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=98rgnhvDfACiQJuLd/w/T6bc5DrbraZo/Iuds/YV1r8=;
 b=mR74Mn9rFdP/SD15DK7VxLnjY8Jl1Y82jt9NBUy8rxLw/juit0h0kzO9Kj0jWx32ngUK
 qWnBKxlbAsUp3GqPTogkt6cblCzblc9hssxMY9aiWenGmV8JCuPUrQULUj1QTX2vrigc
 0Nh1HLcazF7aIg9fIeyW9P3W5tV93SMqN6HI6aLlkYLHUYFPBdWclm6h42xC44Ac4iW0
 lYnDz5TnEEtpsaURqbvQMfK2eBJUoSQZxwe6s4o4RZMUwIn6FNgR/mol5mZE49PIw2iw
 4HjtpDbRiZhWEf/7LLyzLpnQoGemQrL13aeRJjLyK2lZT7eb0ZfaJLL/lv83okJD3Dkt +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3635e60dt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 01:16:29 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10F63uPi089871;
 Fri, 15 Jan 2021 01:16:29 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3635e60dsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 01:16:29 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10F69Fb7028867;
 Fri, 15 Jan 2021 06:16:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 35y448ks7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 06:16:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10F6GOfj41746892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 06:16:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6A6F4C04A;
 Fri, 15 Jan 2021 06:16:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 352244C044;
 Fri, 15 Jan 2021 06:16:22 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.41.69])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 06:16:21 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/sstep: Fix array out of bound warning
Date: Fri, 15 Jan 2021 11:46:20 +0530
Message-Id: <20210115061620.692500-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_01:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=992 impostorscore=0 clxscore=1011
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150031
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
Cc: naveen.n.rao@linux.ibm.com, ravi.bangoria@linux.ibm.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Compiling kernel with -Warray-bounds throws below warning:

  In function 'emulate_vsx_store':
  warning: array subscript is above array bounds [-Warray-bounds]
  buf.d[2] = byterev_8(reg->d[1]);
  ~~~~~^~~
  buf.d[3] = byterev_8(reg->d[0]);
  ~~~~~^~~

Fix it by converting local variable 'union vsx_reg buf' into an array.
Also consider function argument 'union vsx_reg *reg' as array instead
of pointer because callers are actually passing an array to it.

Fixes: af99da74333b ("powerpc/sstep: Support VSX vector paired storage access instructions")
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 61 ++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bf7a7d62ae8b..5b4281ade5b6 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -723,7 +723,8 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 	const unsigned char *bp;
 
 	size = GETSIZE(op->type);
-	reg->d[0] = reg->d[1] = 0;
+	reg[0].d[0] = reg[0].d[1] = 0;
+	reg[1].d[0] = reg[1].d[1] = 0;
 
 	switch (op->element_size) {
 	case 32:
@@ -742,25 +743,25 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		/* scalar loads, lxvd2x, lxvdsx */
 		read_size = (size >= 8) ? 8 : size;
 		i = IS_LE ? 8 : 8 - read_size;
-		memcpy(&reg->b[i], mem, read_size);
+		memcpy(&reg[0].b[i], mem, read_size);
 		if (rev)
-			do_byte_reverse(&reg->b[i], 8);
+			do_byte_reverse(&reg[0].b[i], 8);
 		if (size < 8) {
 			if (op->type & SIGNEXT) {
 				/* size == 4 is the only case here */
-				reg->d[IS_LE] = (signed int) reg->d[IS_LE];
+				reg[0].d[IS_LE] = (signed int)reg[0].d[IS_LE];
 			} else if (op->vsx_flags & VSX_FPCONV) {
 				preempt_disable();
-				conv_sp_to_dp(&reg->fp[1 + IS_LE],
-					      &reg->dp[IS_LE]);
+				conv_sp_to_dp(&reg[0].fp[1 + IS_LE],
+					      &reg[0].dp[IS_LE]);
 				preempt_enable();
 			}
 		} else {
 			if (size == 16) {
 				unsigned long v = *(unsigned long *)(mem + 8);
-				reg->d[IS_BE] = !rev ? v : byterev_8(v);
+				reg[0].d[IS_BE] = !rev ? v : byterev_8(v);
 			} else if (op->vsx_flags & VSX_SPLAT)
-				reg->d[IS_BE] = reg->d[IS_LE];
+				reg[0].d[IS_BE] = reg[0].d[IS_LE];
 		}
 		break;
 	case 4:
@@ -768,13 +769,13 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		wp = mem;
 		for (j = 0; j < size / 4; ++j) {
 			i = IS_LE ? 3 - j : j;
-			reg->w[i] = !rev ? *wp++ : byterev_4(*wp++);
+			reg[0].w[i] = !rev ? *wp++ : byterev_4(*wp++);
 		}
 		if (op->vsx_flags & VSX_SPLAT) {
-			u32 val = reg->w[IS_LE ? 3 : 0];
+			u32 val = reg[0].w[IS_LE ? 3 : 0];
 			for (; j < 4; ++j) {
 				i = IS_LE ? 3 - j : j;
-				reg->w[i] = val;
+				reg[0].w[i] = val;
 			}
 		}
 		break;
@@ -783,7 +784,7 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		hp = mem;
 		for (j = 0; j < size / 2; ++j) {
 			i = IS_LE ? 7 - j : j;
-			reg->h[i] = !rev ? *hp++ : byterev_2(*hp++);
+			reg[0].h[i] = !rev ? *hp++ : byterev_2(*hp++);
 		}
 		break;
 	case 1:
@@ -791,7 +792,7 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		bp = mem;
 		for (j = 0; j < size; ++j) {
 			i = IS_LE ? 15 - j : j;
-			reg->b[i] = *bp++;
+			reg[0].b[i] = *bp++;
 		}
 		break;
 	}
@@ -804,7 +805,7 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 {
 	int size, write_size;
 	int i, j;
-	union vsx_reg buf;
+	union vsx_reg buf[2];
 	unsigned int *wp;
 	unsigned short *hp;
 	unsigned char *bp;
@@ -818,11 +819,11 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 			break;
 		if (rev) {
 			/* reverse 32 bytes */
-			buf.d[0] = byterev_8(reg->d[3]);
-			buf.d[1] = byterev_8(reg->d[2]);
-			buf.d[2] = byterev_8(reg->d[1]);
-			buf.d[3] = byterev_8(reg->d[0]);
-			reg = &buf;
+			buf[0].d[0] = byterev_8(reg[1].d[1]);
+			buf[0].d[1] = byterev_8(reg[1].d[0]);
+			buf[1].d[0] = byterev_8(reg[0].d[1]);
+			buf[1].d[1] = byterev_8(reg[0].d[0]);
+			reg = buf;
 		}
 		memcpy(mem, reg, size);
 		break;
@@ -834,9 +835,9 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 			rev = !rev;
 		if (rev) {
 			/* reverse 16 bytes */
-			buf.d[0] = byterev_8(reg->d[1]);
-			buf.d[1] = byterev_8(reg->d[0]);
-			reg = &buf;
+			buf[0].d[0] = byterev_8(reg[0].d[1]);
+			buf[0].d[1] = byterev_8(reg[0].d[0]);
+			reg = buf;
 		}
 		memcpy(mem, reg, size);
 		break;
@@ -845,15 +846,15 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 		write_size = (size >= 8) ? 8 : size;
 		i = IS_LE ? 8 : 8 - write_size;
 		if (size < 8 && op->vsx_flags & VSX_FPCONV) {
-			buf.d[0] = buf.d[1] = 0;
+			buf[0].d[0] = buf[0].d[1] = 0;
 			preempt_disable();
-			conv_dp_to_sp(&reg->dp[IS_LE], &buf.fp[1 + IS_LE]);
+			conv_dp_to_sp(&reg[0].dp[IS_LE], &buf[0].fp[1 + IS_LE]);
 			preempt_enable();
-			reg = &buf;
+			reg = buf;
 		}
-		memcpy(mem, &reg->b[i], write_size);
+		memcpy(mem, &reg[0].b[i], write_size);
 		if (size == 16)
-			memcpy(mem + 8, &reg->d[IS_BE], 8);
+			memcpy(mem + 8, &reg[0].d[IS_BE], 8);
 		if (unlikely(rev)) {
 			do_byte_reverse(mem, write_size);
 			if (size == 16)
@@ -865,7 +866,7 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 		wp = mem;
 		for (j = 0; j < size / 4; ++j) {
 			i = IS_LE ? 3 - j : j;
-			*wp++ = !rev ? reg->w[i] : byterev_4(reg->w[i]);
+			*wp++ = !rev ? reg[0].w[i] : byterev_4(reg[0].w[i]);
 		}
 		break;
 	case 2:
@@ -873,7 +874,7 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 		hp = mem;
 		for (j = 0; j < size / 2; ++j) {
 			i = IS_LE ? 7 - j : j;
-			*hp++ = !rev ? reg->h[i] : byterev_2(reg->h[i]);
+			*hp++ = !rev ? reg[0].h[i] : byterev_2(reg[0].h[i]);
 		}
 		break;
 	case 1:
@@ -881,7 +882,7 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 		bp = mem;
 		for (j = 0; j < size; ++j) {
 			i = IS_LE ? 15 - j : j;
-			*bp++ = reg->b[i];
+			*bp++ = reg[0].b[i];
 		}
 		break;
 	}
-- 
2.26.2

