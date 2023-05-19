Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0A708F25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMvv864gvz3ffR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:06:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oJoCyiN4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oJoCyiN4;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvqQ4Q2pz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:02:58 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4p70Z011633;
	Fri, 19 May 2023 05:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d6J3crhCTndIEnm85hOfUR1ExK9YQtRK9yPjQgXsJ8g=;
 b=oJoCyiN4nFOIIfaQz6z4FQ6Bx8FPvU07F1wtels45x+4ToJrNxuFHithkfB21Rn/wt6b
 H/Cdav2SARGfP4CfexrYDAFvFVf9D6BVSA+DD8cknDd0HZJ8rQuNejziRVv8UiyyEnxH
 m4imW06X8nXSDx6iJn4Jmu5oFkdGf4Drw5QX+KIjOcMcgABZT7G1h2K0dcrGq1XSsGrZ
 VWumx8tuN02Rs59YTuqaeGwtvP1Zv6X64M+OPLm32U5/Ejj9d+CumuHKO7zs4ZgTLP3u
 mnaiQX4KlcHnNLhuHstGqG4rvGn/O5K7CP79/i/YiEtxCccU+pl60/az4Ln6+EUCDgyc fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2ewg7nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:55 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J4pNlH012511;
	Fri, 19 May 2023 05:02:55 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2ewg7ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:55 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4bn2N020295;
	Fri, 19 May 2023 05:02:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qj264tfq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52o1b17433134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:51 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFC232004E;
	Fri, 19 May 2023 05:02:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E57972004B;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8F29C6063C;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/12] Documentation: Document PowerPC kernel DEXCR interface
Date: Fri, 19 May 2023 15:02:33 +1000
Message-Id: <20230519050236.144847-10-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519050236.144847-1-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mHgIHqS1vyc4vrSvdvsI1Rr2pYh0BSv7
X-Proofpoint-ORIG-GUID: pRzzvu7ZBsmJRrAjs-e0j7lJoAGNAf-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=941 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305190038
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Describe the DEXCR and document how to configure it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Add ruscur reviewed-by
v2:	* Document coredump & ptrace support
v1:	* Remove the dynamic control docs, describe the static config
	  option

This documentation is a little bare for now, but will be expanded on
when dynamic DEXCR control is added.
---
 Documentation/powerpc/dexcr.rst | 58 +++++++++++++++++++++++++++++++++
 Documentation/powerpc/index.rst |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/powerpc/dexcr.rst

diff --git a/Documentation/powerpc/dexcr.rst b/Documentation/powerpc/dexcr.rst
new file mode 100644
index 000000000000..75f1efaa8dc5
--- /dev/null
+++ b/Documentation/powerpc/dexcr.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================================
+DEXCR (Dynamic Execution Control Register)
+==========================================
+
+Overview
+========
+
+The DEXCR is a privileged special purpose register (SPR) introduced in
+PowerPC ISA 3.1B (Power10) that allows per-cpu control over several dynamic
+execution behaviours. These behaviours include speculation (e.g., indirect
+branch target prediction) and enabling return-oriented programming (ROP)
+protection instructions.
+
+The execution control is exposed in hardware as up to 32 bits ('aspects') in
+the DEXCR. Each aspect controls a certain behaviour, and can be set or cleared
+to enable/disable the aspect. There are several variants of the DEXCR for
+different purposes:
+
+DEXCR
+    A privileged SPR that can control aspects for userspace and kernel space
+HDEXCR
+    A hypervisor-privileged SPR that can control aspects for the hypervisor and
+    enforce aspects for the kernel and userspace.
+UDEXCR
+    An optional ultravisor-privileged SPR that can control aspects for the ultravisor.
+
+Userspace can examine the current DEXCR state using a dedicated SPR that
+provides a non-privileged read-only view of the userspace DEXCR aspects.
+There is also an SPR that provides a read-only view of the hypervisor enforced
+aspects, which ORed with the userspace DEXCR view gives the effective DEXCR
+state for a process.
+
+
+Kernel Config
+=============
+
+The kernel supports a static default DEXCR value determined at config time.
+Set the ``PPC_DEXCR_DEFAULT`` config to the value you want all processes to
+use.
+
+
+coredump and ptrace
+===================
+
+The userspace values of the DEXCR and HDEXCR (in this order) are exposed under
+``NT_PPC_DEXCR``. These are each 32 bits and readonly, and are intended to
+assist with core dumps. The DEXCR may be made writable in future.
+
+If the kernel config ``CONFIG_CHECKPOINT_RESTORE`` is enabled, then
+``NT_PPC_HASHKEYR`` is available and exposes the HASHKEYR value of the process
+for reading and writing. This is a tradeoff between increased security and
+checkpoint/restore support: a process should normally have no need to know its
+secret key, but restoring a process requires setting its original key. The key
+therefore appears in core dumps, and an attacker may be able to retrieve it from
+a coredump and effectively bypass ROP protection on any threads that share this
+key (potentially all threads from the same parent that have not run ``exec()``).
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 85e80e30160b..d33b554ca7ba 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -15,6 +15,7 @@ powerpc
     cxl
     cxlflash
     dawr-power9
+    dexcr
     dscr
     eeh-pci-error-recovery
     elf_hwcaps
-- 
2.40.1

