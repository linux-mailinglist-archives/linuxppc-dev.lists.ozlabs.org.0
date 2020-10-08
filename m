Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8C286F64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 09:29:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6NB7125WzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 18:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pVLBAI/H; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6N8P2Tf8zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 18:27:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0987BqIL194930; Thu, 8 Oct 2020 03:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J7H+d8ShsfRKu7qRh/kxrWc7aEpEQEry/zxclRw1cYM=;
 b=pVLBAI/Hakr3W8NBUGz9qq0b8KrZRCasEyi1fgAVVsszw3frriRt+AX5/JZU1Nh+rC8L
 LkZMRqckRJWEicI7zwNfFpuwZLhVskCV0OexSSKV659ZjYugKJ0K+Gc6MyjrrfeluXQy
 QwAgllb+hug6eZSHA5rYexNNNTGwII3xXOV0/OlqpHybhAUFxshBBSxUFIL7ywWDvqWc
 3CkcEmV+O7lieafYAVJi+ORFzvjCJ+2jauCbYG1F3nBTlGYP8eoPqkXDiwGMvBF/4oQ9
 j5yZVylCiQQ6AspBDGq4Lb3Lbmq3A9jKK2Z6FYCLfnd58ySkCYBqsMXF6dSsX5r86x6T jg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341wcjhhsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 03:27:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0987P19b027496;
 Thu, 8 Oct 2020 07:27:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 33xgjh529m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 07:27:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0987Rb0P33816914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 07:27:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 503DA4C044;
 Thu,  8 Oct 2020 07:27:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CC3A4C04A;
 Thu,  8 Oct 2020 07:27:35 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.242])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 07:27:35 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 1/4] powerpc/sstep: Emulate prefixed instructions only when
 CPU_FTR_ARCH_31 is set
Date: Thu,  8 Oct 2020 12:57:23 +0530
Message-Id: <20201008072726.233086-2-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
References: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_03:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=1 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=507 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080050
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
Cc: ravi.bangoria@linux.ibm.com, bala24@linux.ibm.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balamuruhan S <bala24@linux.ibm.com>

Unconditional emulation of prefixed instructions will allow
emulation of them on Power10 predecessors which might cause
issues. Restrict that.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e9dcaba9a4f8..e6242744c71b 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1346,6 +1346,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	switch (opcode) {
 #ifdef __powerpc64__
 	case 1:
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+
 		prefix_r = GET_PREFIX_R(word);
 		ra = GET_PREFIX_RA(suffix);
 		rd = (suffix >> 21) & 0x1f;
@@ -2733,6 +2736,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		}
 		break;
 	case 1: /* Prefixed instructions */
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+
 		prefix_r = GET_PREFIX_R(word);
 		ra = GET_PREFIX_RA(suffix);
 		op->update_reg = ra;
-- 
2.26.2

