Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A81B17A7F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 15:41:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YD3J4JVRzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:41:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YCwS4PWvzDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 01:35:52 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025EY4TN064441
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Mar 2020 09:35:49 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhryexbhr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 09:35:49 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 5 Mar 2020 14:35:46 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 14:35:45 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025EZiwK29818974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 14:35:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63C4EAE053;
 Thu,  5 Mar 2020 14:35:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01FDEAE051;
 Thu,  5 Mar 2020 14:35:43 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.199.53.44])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 14:35:42 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc: Suppress .eh_frame generation
Date: Thu,  5 Mar 2020 20:05:30 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <9b22a064de6eb1301d92177eb3a38559df7005d3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
References: <9b22a064de6eb1301d92177eb3a38559df7005d3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030514-0008-0000-0000-00000359A3E4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030514-0009-0000-0000-00004A7ADB77
Message-Id: <1ed7cd84a7d1a3180b30c0c60e70eed8bb8b40c3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_04:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050095
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

GCC v8 defaults to enabling -fasynchronous-unwind-tables due to
https://gcc.gnu.org/r259298, which results in .eh_frame section being
generated. This results in additional disk usage by the build, as well
as the kernel modules. Since the kernel has no use for this, this
section is discarded.

Add -fno-asynchronous-unwind-tables to KBUILD_CFLAGS to suppress
generation of .eh_frame section. Note that our VDSOs need .eh_frame, but
are not affected by this change since our VDSO code are all in assembly.

Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 89956c4f1ce3..f310c32e88a4 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -239,6 +239,9 @@ KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
 KBUILD_CFLAGS += $(call cc-option,-mno-spe)
 KBUILD_CFLAGS += $(call cc-option,-mspe=no)
 
+# Don't emit .eh_frame since we have no use for it
+KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
+
 # Never use string load/store instructions as they are
 # often slow when they are implemented at all
 KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
-- 
2.24.1

