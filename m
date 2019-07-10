Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C764030
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 07:00:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k6Sf4Sz9zDqDS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 15:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k6Lm458lzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 14:55:12 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6A4qV4w108430
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:55:10 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tn5n8eyp8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:55:09 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 10 Jul 2019 05:55:07 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 05:55:05 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6A4sqOL17105326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 04:54:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A75EA4059;
 Wed, 10 Jul 2019 04:55:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6A72A4040;
 Wed, 10 Jul 2019 04:55:01 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.102.1.122])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jul 2019 04:55:01 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 2/3] Powerpc64/Watchpoint: Don't ignore extraneous
 exceptions
Date: Wed, 10 Jul 2019 10:24:44 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710045445.31037-1-ravi.bangoria@linux.ibm.com>
References: <20190710045445.31037-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071004-0012-0000-0000-00000330D9C5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071004-0013-0000-0000-0000216A40EF
Message-Id: <20190710045445.31037-3-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100059
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Powerpc64, watchpoint match range is double-word granular. On
a watchpoint hit, DAR is set to the first byte of overlap between
actual access and watched range. And thus it's quite possible that
DAR does not point inside user specified range. Ex, say user creates
a watchpoint with address range 0x1004 to 0x1007. So hw would be
configured to watch from 0x1000 to 0x1007. If there is a 4 byte
access from 0x1002 to 0x1005, DAR will point to 0x1002 and thus
interrupt handler considers it as extraneous, but it's actually not,
because part of the access belongs to what user has asked. So, let
kernel pass it on to user and let user decide what to do with it
instead of silently ignoring it. The drawback is, it can generate
false positive events.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 5c876e986c18..c457d52778e3 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -204,9 +204,10 @@ int hw_breakpoint_handler(struct die_args *args)
 #ifndef CONFIG_PPC_8xx
 	int stepped = 1;
 	unsigned int instr;
+#else
+	unsigned long dar = regs->dar;
 #endif
 	struct arch_hw_breakpoint *info;
-	unsigned long dar = regs->dar;
 
 	/* Disable breakpoints during exception handling */
 	hw_breakpoint_disable();
@@ -240,14 +241,14 @@ int hw_breakpoint_handler(struct die_args *args)
 
 	/*
 	 * Verify if dar lies within the address range occupied by the symbol
-	 * being watched to filter extraneous exceptions.  If it doesn't,
-	 * we still need to single-step the instruction, but we don't
-	 * generate an event.
+	 * being watched to filter extraneous exceptions.
 	 */
 	info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
+#ifdef CONFIG_PPC_8xx
 	if (!((bp->attr.bp_addr <= dar) &&
 	      (dar - bp->attr.bp_addr < bp->attr.bp_len)))
 		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+#endif
 
 #ifndef CONFIG_PPC_8xx
 	/* Do not emulate user-space instructions, instead single-step them */
-- 
2.20.1

