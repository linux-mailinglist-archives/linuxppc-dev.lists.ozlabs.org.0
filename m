Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F16888E19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:08:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s8GT4wR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31D427GVz3dXM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s8GT4wR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31BV0Dcvz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:06:57 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P2Kcvc017451;
	Mon, 25 Mar 2024 05:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aePYhkfck/269arrHJYuqUyVW+GImgUP1Xzsn7mm4J4=;
 b=s8GT4wR+TEtCxjKQAv5sbOOC+cmQYi+F/GIMb3vat54tt4P4txaMlK5KBsr9FGkrkW0g
 zwzN33mQvYJ8KDkzgg1KftVE1dyuStYrx48obw1imwIf3dFOH7UjgW7PNnZpiYkX/2Mp
 hs3GT+lAgp/GvlbY23FaRB2CEs5KHLjHQDKXo4w7uxiYdd7MAvEq2ifgOvmkVjtzq8Uz
 kRKkzkY84cQKPoJs4nIfRsaHdSQ1abvbwoEkG91G+n9dRN0vQUXdJPPEVxR/m/qds08r
 yv89OLfQYOU2doh5Ybmm94vwB0QmYu7OzxlPy9GVSkdrXzdbhnlD7wHOVVkuiGY1w3hV Sw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2hdksgpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:06:51 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P3rFGj003743;
	Mon, 25 Mar 2024 05:06:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2c42ecn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:06:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P56k8f40960314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:06:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB56C2004D;
	Mon, 25 Mar 2024 05:06:46 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CE1920040;
	Mon, 25 Mar 2024 05:06:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:06:46 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CA44560145;
	Mon, 25 Mar 2024 16:06:43 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/2] powerpc64/dexcr: Compile kernel with privileged hash instructions
Date: Mon, 25 Mar 2024 16:06:28 +1100
Message-ID: <20240325050629.832497-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YgV5MQDIlmhYXbB_Jwg8BI1CguJl7VAH
X-Proofpoint-GUID: YgV5MQDIlmhYXbB_Jwg8BI1CguJl7VAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250027
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are dedicated hashstp and hashchkp instructions that
can be inserted into a guest kernel to give it hypervisor
managed ROP protection (the hypervisor sets the secret hash
key and handles hashstp exceptions).

In testing, the kernel appears to handle the compiler generated
hash protection just fine, without any changes. This makes sense,
as any 'weird' stack interactions will normally be done in hand
written assembly. We can expect that a compiler generated function
prologue will be matched with a compiler generated function epilogue
with the stack as expected by the compiler (in some sense, the hash
value stored on the stack is just like any other local variable).

GCC requires ELF ABI v2, and Clang only works with ELF ABI v2
anyway, so add it as a dependency.

GCC will only insert these instructions if the target CPU is
specified to be Power10 (possibly a bug; the documentation says
they are inserted for Power8 or higher).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Makefile                  |  3 +++
 arch/powerpc/platforms/Kconfig.cputype | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 65261cbe5bfd..bfaa3c754ae2 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -168,6 +168,9 @@ endif
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 
+CFLAGS-$(CONFIG_PPC_KERNEL_ROP_PROTECT) += $(call cc-option,-mrop-protect)
+CFLAGS-$(CONFIG_PPC_KERNEL_ROP_PROTECT) += $(call cc-option,-mprivileged)
+
 CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index b2d8c0da2ad9..a95b11782379 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -517,6 +517,18 @@ config PPC_KUAP_DEBUG
 	  Add extra debugging for Kernel Userspace Access Protection (KUAP)
 	  If you're unsure, say N.
 
+config PPC_KERNEL_ROP_PROTECT
+	bool "Kernel ROP Protection"
+	default y
+	depends on PPC64_ELF_ABI_V2
+	depends on !CC_IS_GCC || TARGET_CPU = "power10"
+	help
+	  This tells the compiler to insert hashstp/hashckp instructions
+	  in the prologue and epilogue of every kernel function. The kernel
+	  also turns on the DEXCR[PHIE] aspect to cause an exception if the
+	  hashchkp does not agree with the hash calculated by the matching
+	  hashstp.
+
 config PPC_PKEY
 	def_bool y
 	depends on PPC_BOOK3S_64
-- 
2.44.0

