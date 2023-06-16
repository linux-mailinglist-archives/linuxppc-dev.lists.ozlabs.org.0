Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3A73260C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:57:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WvjUMe7u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj52s6C0Vz3bw3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:57:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WvjUMe7u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4t44RmGz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:48 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3SsDV019369;
	Fri, 16 Jun 2023 03:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+s0j3aa80jgbjkGKftkQL2ZlwYjZbthAqQUqzTtJaH8=;
 b=WvjUMe7u2tLJ1FLB0U30EMWkRXzitfTJrPR2JHv4ggFU9yq7gyLmT/DFkvK+3Pl+fznu
 vbB2GqpgzsITFy59xIc17pvVu8sI0Vedv4f7p2PxejCFuS0e1pagyuUwSHGolKWMC3uO
 tdocVt/ZbAxdN074EncitnaNOFZg2124KCaNgeDo8PucLQgCzXH2Kw1OpfjEW8wtajUi
 FM8I2wCOtphK7+w4i1GcGGAST0tQL6MXPriiKVAVc3zaD0U6KRBjRFHKnHMNJOhsxhXZ
 dLMut1iufeLExIDPit+xt0hR82dDW2JWJ6+qNuDaKZfoQfISBlTNUPEoqYaVPiZXUfY8 uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fvbgbs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:44 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3Tm55022027;
	Fri, 16 Jun 2023 03:49:44 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fvbgbrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:43 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G1YwKX016668;
	Fri, 16 Jun 2023 03:49:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r4gt530su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3ndAV63701470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EE1820043;
	Fri, 16 Jun 2023 03:49:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 530E320040;
	Fri, 16 Jun 2023 03:49:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:38 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 57AA5603DA;
	Fri, 16 Jun 2023 13:49:34 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/11] Documentation: Document PowerPC kernel DEXCR interface
Date: Fri, 16 Jun 2023 13:48:43 +1000
Message-Id: <20230616034846.311705-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vPAUXY0Gb4UjwuqvYaglpbGYDXwZMZrn
X-Proofpoint-ORIG-GUID: yidENBsg_7uCzf5DCAOyJ6-rxBHaM7FC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=658
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160032
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

---

v3:	* Revise (H)DEXCR width to 64 bits
	* Revise configuration section
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
index 000000000000..615a631f51fa
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
+Configuration
+=============
+
+The DEXCR is currently unconfigurable. All threads are run with the
+NPHIE aspect enabled.
+
+
+coredump and ptrace
+===================
+
+The userspace values of the DEXCR and HDEXCR (in this order) are exposed under
+``NT_PPC_DEXCR``. These are each 64 bits and readonly, and are intended to
+assist with core dumps. The DEXCR may be made writable in future. The top 32
+bits of both registers (corresponding to the non-userspace bits) are masked off.
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

