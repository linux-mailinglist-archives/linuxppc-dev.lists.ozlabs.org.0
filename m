Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CD58D7B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 12:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M292m24J8z3bxt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 20:55:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LYCsgC35;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LYCsgC35;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M29264WgJz2xrj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 20:54:54 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2799n57X006961;
	Tue, 9 Aug 2022 10:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=s5py0VOxkJhieJvjg+0N4M86Hbe80Fz0yzH2YnDVxY0=;
 b=LYCsgC35LAm1u5N90y1ACov4AVR+/E2PaDR5jDPHi4UgT0aockh6K8kPfoN33KkPJQKm
 fIdZ9LiydRTSwDDDJpOEG+46MuNlO+SNtoiXEb9KUY/HzOqwkf44VxUOUvGyGhZ0UvdC
 xBHgXq1zuO7x7mumB2hmERg/pWyIkNdkpvCxmMHrQvNuhy0FowpBybvnm5ezWgsVBppt
 VOjojowYeDoMZQkB2QTGinpO5NwvulpAWXyyZuHvrrV1fHZR36LRx48/eD0uCzCjcDC1
 6n5r+13+J71lNh/s+jBNavrnATwilkGrImL2vr/r5LDUHxy/w56YLRsUyA6JPthDuQtD Vg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hun9jhp6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 10:54:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 279AoaCN008406;
	Tue, 9 Aug 2022 10:54:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3hsfx8ub7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 10:54:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 279AsddZ32637350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Aug 2022 10:54:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E180AA4040;
	Tue,  9 Aug 2022 10:54:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D385A404D;
	Tue,  9 Aug 2022 10:54:38 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.41.164])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Aug 2022 10:54:38 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/ftrace: Ignore weak functions
Date: Tue,  9 Aug 2022 16:24:25 +0530
Message-Id: <20220809105425.424045-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XPRoN4Hn8WSfGqT4xGuDcpSIX-VK8xWp
X-Proofpoint-ORIG-GUID: XPRoN4Hn8WSfGqT4xGuDcpSIX-VK8xWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208090045
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
Cc: linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extend commit b39181f7c6907d ("ftrace: Add FTRACE_MCOUNT_MAX_OFFSET to
avoid adding weak function") to ppc32 and ppc64 -mprofile-kernel by
defining FTRACE_MCOUNT_MAX_OFFSET.

For ppc64 -mprofile-kernel ABI, we can have two instructions at function
entry for TOC setup followed by 'mflr r0' and 'bl _mcount'. So, the
mcount location is at most the 4th instruction in a function. For ppc32,
mcount location is always the 3rd instruction in a function, preceded by
'mflr r0' and 'stw r0,4(r1)'.

With this patch, and with ppc64le_guest_defconfig and some ftrace/bpf
config items enabled:
  # grep __ftrace_invalid_address available_filter_functions | wc -l
  79

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ftrace.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 3cee7115441b41..ade406dc6504e3 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -10,6 +10,13 @@
 
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
+/* Ignore unused weak functions which will have larger offsets */
+#ifdef CONFIG_MPROFILE_KERNEL
+#define FTRACE_MCOUNT_MAX_OFFSET	12
+#elif defined(CONFIG_PPC32)
+#define FTRACE_MCOUNT_MAX_OFFSET	8
+#endif
+
 #ifndef __ASSEMBLY__
 extern void _mcount(void);
 

base-commit: ff1ed171e05c971652a0ede3d716997de8ee41c9
-- 
2.37.1

