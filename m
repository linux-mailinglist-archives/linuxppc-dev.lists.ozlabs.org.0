Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D96CFB07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 07:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnCNS31cCz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 16:56:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BYCMFBiy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BYCMFBiy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnCG13FXBz3chw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:51:04 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U57rWX006934;
	Thu, 30 Mar 2023 05:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uq6RcVORkA1ogMUjEFV64vPHR19zQU/BAeUC277wY6s=;
 b=BYCMFBiydGH+WrUtiFmJwc1Ac6TmYuToKojCRh3aaYEZ3dFWQOz3HHK5CLr0I4uApuJq
 MXACaPe68JMfLKG4IqlBQtocgyFyezj3SlM5bJOZCrSP3tqk0EBWVrqrqQNavhwU4JfZ
 QG55QStsvRAR1CgBrJ0nPv0JUfQZXBomef6EXtGyUcs+VpZUyfAZf3gspjZbyiAz1tp8
 nEzGDw6xZqi0lk7arG1wZVWCd/OMi3c5aHLOrz06yOxiLF9fw3djKkas+EIlzajcvjyD
 2Ybz7xpVvnZBDLvAgGjS9LkR70hvrr1kCQr4nZZTCTzfpO9CSoTFD8eAMioCC2GryGl7 /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmp2xp5ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:51:00 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U5f8bS008624;
	Thu, 30 Mar 2023 05:51:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmp2xp5gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:51:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TLlYKu019418;
	Thu, 30 Mar 2023 05:50:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6nkf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U5otoO66257346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 05:50:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 257EA20049;
	Thu, 30 Mar 2023 05:50:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 254F820040;
	Thu, 30 Mar 2023 05:50:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 05:50:54 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 524CB6067F;
	Thu, 30 Mar 2023 16:50:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/12] Documentation: Document PowerPC kernel DEXCR interface
Date: Thu, 30 Mar 2023 16:50:37 +1100
Message-Id: <20230330055040.434133-10-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330055040.434133-1-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UvS0YlhdAsnAcliV10y0u5v4DSwRsJAV
X-Proofpoint-GUID: Vdx0ZcQ0hte_1jj_Bwr51ecFZSCK_c3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_01,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=927
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300043
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
Cc: npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Describe the DEXCR and document how to configure it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---
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
2.39.2

