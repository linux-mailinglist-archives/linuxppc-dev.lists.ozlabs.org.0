Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE76C4264
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHfj56JJz3chS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:51:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jHHMdG6f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jHHMdG6f;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXj2fzYz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:44 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M4iYgX023488
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nzMC4f4H7utXK0Ff9BxFHdPJNhujkjWQxwODubQpp8w=;
 b=jHHMdG6ffsA4f4nXUdV3BJU0KlWJ8Q70Pz8VftlB9ETr1AvQILqcoQaDuvyAjwvfxHzJ
 JB5MZaTPUEMQfLm0kVG8MfEt2Zdc/7/8WUdyinlep5xmCKVfOBEByCHkpGH77nE8zhcp
 Q3lx7LB8KvKB/n+uaSh8Q37Z34sEFxpAG53pdPCfYL7M9Eco4/jFNutTm91WAqzn6yRf
 hW2DYLALC2BXxeLvgC7RZszjOefSDpz3QSVoMsba3sDLDJhEG6rGdomf8wipVjkFCRtv
 k6HJJlhT4+Q9DPcjRQXlwC2luxM8pd81NxKH/P37bNn9xJNt5Uq2f+m5IF62jn/QcvV3 kA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pftwt12b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:42 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M2YUkG015057
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfdftr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kcvK20972096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FEF220049
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94BE520040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8A399604AF;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/9] Documentation: Document PowerPC kernel DEXCR interface
Date: Wed, 22 Mar 2023 16:46:09 +1100
Message-Id: <20230322054612.1340573-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322054612.1340573-1-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qJz7AW-R3d0wFnwGC8bGOVTvJCoKZUNM
X-Proofpoint-GUID: qJz7AW-R3d0wFnwGC8bGOVTvJCoKZUNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=891 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220039
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

Describe the DEXCR and document how to configure it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v1:	* Remove the dynamic control docs, describe the static config
	  option

This documentation is a little bare for now, but will be expanded on
when dynamic DEXCR control is added.
---
 Documentation/powerpc/dexcr.rst | 41 +++++++++++++++++++++++++++++++++
 Documentation/powerpc/index.rst |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/powerpc/dexcr.rst

diff --git a/Documentation/powerpc/dexcr.rst b/Documentation/powerpc/dexcr.rst
new file mode 100644
index 000000000000..21cbc59e6aa4
--- /dev/null
+++ b/Documentation/powerpc/dexcr.rst
@@ -0,0 +1,41 @@
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
2.39.2

