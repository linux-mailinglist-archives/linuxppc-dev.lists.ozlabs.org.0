Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AC9308653
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 08:19:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRpd33hHzzDsTQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 18:19:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hyQtaTtD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRpb01LlXzDsGJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 18:18:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10T725Yh094179; Fri, 29 Jan 2021 02:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=I3dtRnZBTCw9snT/6Hmh3n1qri6YelXpcQ7H4Cjw2q8=;
 b=hyQtaTtDGM8V2SfLqTJNFbKmHLvXmnNcjJeOblba9jJeJx1Om0GoIOQX3Dsiq1ZrzcEu
 q0axYqfqx28McxW4P49XzrnWH0/OmKulRTOJkk6NCHTV5m1wcclW6lSF/sSORly2lfyb
 6xcFxIUugWKQNb3GO8kmtvqFEPwf1RJXTMDNsdJBq1U0jmpCKzubaEM3iShUghWu5cuv
 xddZsRlkCzQ6Y2l1R5ClBh8Dt2y2lBPAlgfOurfUtbp/iY0x2ZSsfyhOeIDPjhlD3lgL
 GhWkr3RRG0vtWcXELpssoymHAJ+z3Q+JCUWN1uQZCb5jJyTgcMXTsqQGqHYKR72cZSx6 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36cc0r2j0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 02:17:56 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10T7HtmY006355;
 Fri, 29 Jan 2021 02:17:55 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36cc0r2hyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 02:17:55 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10T7HIjp012671;
 Fri, 29 Jan 2021 07:17:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 368b2h5jvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 07:17:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10T7Hg4p35127772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 07:17:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D925A4067;
 Fri, 29 Jan 2021 07:17:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74270A4064;
 Fri, 29 Jan 2021 07:17:47 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.35.112])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jan 2021 07:17:47 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/sstep: Fix array out of bound warning
Date: Fri, 29 Jan 2021 12:47:45 +0530
Message-Id: <20210129071745.111466-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-29_02:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290034
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

Fix it by using temporary array variable 'union vsx_reg buf32[]' in
that code block. Also, with element_size = 32, 'union vsx_reg *reg'
is an array of size 2. So, use 'reg' as an array instead of pointer
in the same code block.

Fixes: af99da74333b ("powerpc/sstep: Support VSX vector paired storage access instructions")
Suggested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
v1: http://lore.kernel.org/r/20210115061620.692500-1-ravi.bangoria@linux.ibm.com
v1->v2:
  - Change code only in the affected block

 arch/powerpc/lib/sstep.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bf7a7d62ae8b..ede093e96234 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -818,13 +818,15 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 			break;
 		if (rev) {
 			/* reverse 32 bytes */
-			buf.d[0] = byterev_8(reg->d[3]);
-			buf.d[1] = byterev_8(reg->d[2]);
-			buf.d[2] = byterev_8(reg->d[1]);
-			buf.d[3] = byterev_8(reg->d[0]);
-			reg = &buf;
+			union vsx_reg buf32[2];
+			buf32[0].d[0] = byterev_8(reg[1].d[1]);
+			buf32[0].d[1] = byterev_8(reg[1].d[0]);
+			buf32[1].d[0] = byterev_8(reg[0].d[1]);
+			buf32[1].d[1] = byterev_8(reg[0].d[0]);
+			memcpy(mem, buf32, size);
+		} else {
+			memcpy(mem, reg, size);
 		}
-		memcpy(mem, reg, size);
 		break;
 	case 16:
 		/* stxv, stxvx, stxvl, stxvll */
-- 
2.26.2

