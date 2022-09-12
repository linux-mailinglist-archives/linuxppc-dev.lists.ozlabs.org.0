Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758815B55FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR03M0nGZz3dpq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:23:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ABZc9f/h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ABZc9f/h;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR00s0vN1z3bVB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:21:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C8C14A029072;
	Mon, 12 Sep 2022 08:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wsw4tOgI+Vnvv5JO8T8kyNt3iMZGX6nG4fxB5vuz/Ug=;
 b=ABZc9f/h/cELx9oZl1QYas5as948ETrz9zHVNUhaMLFQnLggL/zLUDoi6eKYpBW7YVqG
 aE5jUNvvf0Lat55mVg3RIYHj9qs2aa3DMiShnSIQsxZ2SxIUI8g2bW0ssIucu9hwRQ9U
 RoLIf0Eo4uXuoL356IlDC5hj+vxDe7hf5qbls49rlNdSNLsaF1teeWfid1CUbMbPkTRA
 OZC0iaML9KhQS5ljWpZ90+R6W8g/dwkqGrueWSUTA6Up8B3wXrMUgynKuXZ3Qsz8dwa2
 tmWxSpefIw3Z2nyzP5TjgHwV/rTTC/G85Nzm4UlyrrhmACk+aZ+TFT0d5/4Wz9KSuk1r iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj11v87w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28C8FRhQ011097;
	Mon, 12 Sep 2022 08:20:45 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj11v87v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:45 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C86mV9015977;
	Mon, 12 Sep 2022 08:20:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3jgj79j332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8KerO32833840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:20:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D30DCA404D;
	Mon, 12 Sep 2022 08:20:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D966A4040;
	Mon, 12 Sep 2022 08:20:36 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.91.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:20:36 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
Date: Mon, 12 Sep 2022 13:50:06 +0530
Message-Id: <20220912082020.226755-3-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220912082020.226755-1-sv@linux.ibm.com>
References: <20220912082020.226755-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q--W-ovbuwMNXQolryeir3AmmstRCTcq
X-Proofpoint-ORIG-GUID: Io2CIuOPki82kllz3_kM1udJbO9bs9XZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=838 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120027
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a subsequent patch, we would want to annotate powerpc assembly functions
with SYM_FUNC_START_LOCAL macro. This macro depends on __ALIGN macro.

The default expansion of __ALIGN macro is:
        #define __ALIGN      .align 4,0x90

So, override __ALIGN and __ALIGN_STR macros to use the same alignment as
that of the existing _GLOBAL macro. Also, do not pad with 0x90, because
repeated 0x90s are not a nop or trap on powerpc.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/include/asm/linkage.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
index b71b9582e754..b88d1d2cf304 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -4,6 +4,9 @@
 
 #include <asm/types.h>
 
+#define __ALIGN		.align 2
+#define __ALIGN_STR	".align 2"
+
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 #define cond_syscall(x) \
 	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
-- 
2.31.1

