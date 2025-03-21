Return-Path: <linuxppc-dev+bounces-7257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D33A6B4EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 08:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJv6z3nkKz30Tp;
	Fri, 21 Mar 2025 18:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742541787;
	cv=none; b=nBwk+uW+An9BKiq0l+Dr4aK/dExUSyncwuOnKLDxu0xhZJDWRVgCsl7mRNOrkROuKMb0VyS+4vHyhxv6+JdFFqhaW22ZftOoEsr7yBYpwFvBIgaMsgDtnlC9oupN+Grrta+Es4psJ2DBdZNfZrb5mwInma9gx0FMtxfW+DBpeuSnXcqctYhmYbIYmGaFFN9wbRg37JX89Z/rQ5g6Jz20hOXK0AeECM3EOTQy8wu1mhVlWkD/6x6OXjsPMOmy9zcYS9J7hrRS3ZVXJXfKUOeQgLTlfbXlMXUntRdbjFLz2X4RyNevnnzGylrNQj3j8uj/pzbjJmpSIl/Og649uvd6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742541787; c=relaxed/relaxed;
	bh=D4sDBNbIjRlSx0dDBIS1rco6MKjRxFuNCqZh/2twO5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A+YeZEinDrMUfzNow/H1OtvKuchli23tN8ZI/6z6uoU6W1BGqiDWrpNXn4txiEuqr2i6/PfGYGeb/gkhKAxf5Cu1y6g/jHcT8Hn1tSZiAE0z3z77Qb+phmM4PI5/K4nrQNxBKgoLPp780ai/QPcXjfDlyfdlcb05yg9amiHZclZsgo9/ETFwnastRBmtSKQfAmxad2WY77bmS+7GDHEps2GNY/zRnlsyJ8IxnNnfz76bomswdOkB+BCeu2KGlbpXjCXONMDHzl4OlIE2E4QQgYI/mnYAWbx0GNg/l1Ne6CUgIkAhGW6RH9Z7RkiSD/YlpcqzNJsdzuDdHtnpnizcgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKnOhuRc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKnOhuRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJv6y5p7Cz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 18:23:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KNjx6C026009
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=D4sDBNbIjRlSx0dDB
	IS1rco6MKjRxFuNCqZh/2twO5g=; b=iKnOhuRciv5CKV5FdYjyc38qdPKvwp6IC
	hj7WI1DODj7B/rqi5FY5NXfw1kf+CfCbOzXwypVZak7gEbGE/0LMKTEFrk5TzSxv
	LGLOGp1nc4arg4GlDDVcQsKLeDg2GrcgwDBS5xLSb78DCOFglL1KDRW4PKvLJXLV
	F7PgllOkyp4oyP7NIttZEV1o2HjKIbJqYg6W0QqAewQrQqfgpyTzfWE8HdQmSVrJ
	LSyuZ3H8Qup/owgqT96Ugn0QUeEjG/A/+ghM7bmU3POATAVLygOn9UIL/lSBdLx/
	dxmgWPHc+FpYHDA1rlAR9ngx5STeX+otQein7IWQMgqGRlUScZ7GA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gmepcgq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:23:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L6MiZi019218
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:23:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dmvpc87r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:23:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52L7MwND58851626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 07:22:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B70C20040;
	Fri, 21 Mar 2025 07:22:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD21E2004B;
	Fri, 21 Mar 2025 07:22:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.71])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 07:22:52 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V2 9/9] powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface
Date: Fri, 21 Mar 2025 12:51:52 +0530
Message-Id: <20250321072152.7414-10-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250321072152.7414-1-atrajeev@linux.ibm.com>
References: <20250321072152.7414-1-atrajeev@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jjnvFBTGAJ2QTdmNXFjcIYcWfmZW9TAp
X-Proofpoint-ORIG-GUID: jjnvFBTGAJ2QTdmNXFjcIYcWfmZW9TAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_02,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210049
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Documentation for HTM (Hardware Trace Macro) debugfs interface
and how it can be used to configure/control the HTM operations.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 Documentation/arch/powerpc/htm.rst | 104 +++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/arch/powerpc/htm.rst

diff --git a/Documentation/arch/powerpc/htm.rst b/Documentation/arch/powerpc/htm.rst
new file mode 100644
index 000000000000..fcb4eb6306b1
--- /dev/null
+++ b/Documentation/arch/powerpc/htm.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _htm:
+
+===================================
+HTM (Hardware Trace Macro)
+===================================
+
+Athira Rajeev, 2 Mar 2025
+
+.. contents::
+    :depth: 3
+
+
+Basic overview
+==============
+
+H_HTM is used as an interface for executing Hardware Trace Macro (HTM)
+functions, including setup, configuration, control and dumping of the HTM data.
+For using HTM, it is required to setup HTM buffers and HTM operations can
+be controlled using the H_HTM hcall. The hcall can be invoked for any core/chip
+of the system from within a partition itself. To use this feature, a debugfs
+folder called "htmdump" is present under /sys/kernel/debug/powerpc.
+
+
+HTM debugfs example usage
+=========================
+
+.. code-block:: sh
+
+  #  ls /sys/kernel/debug/powerpc/htmdump/
+  coreindexonchip  htmcaps  htmconfigure  htmflags  htminfo  htmsetup
+  htmstart  htmstatus  htmtype  nodalchipindex  nodeindex  trace
+
+Details on each file:
+
+* nodeindex, nodalchipindex, coreindexonchip specifies which partition to configure the HTM for.
+* htmtype: specifies the type of HTM. Supported target is hardwareTarget.
+* trace: is to read the HTM data.
+* htmconfigure: Configure/Deconfigure the HTM. Writing 1 to the file will configure the trace, writing 0 to the file will do deconfigure.
+* htmstart: start/Stop the HTM. Writing 1 to the file will start the tracing, writing 0 to the file will stop the tracing.
+* htmstatus: get the status of HTM. This is needed to understand the HTM state after each operation.
+* htmsetup: set the HTM buffer size. Size of HTM buffer is in power of 2
+* htminfo: provides the system processor configuration details. This is needed to understand the appropriate values for nodeindex, nodalchipindex, coreindexonchip.
+* htmcaps : provides the HTM capabilities like minimum/maximum buffer size, what kind of tracing the HTM supports etc.
+* htmflags : allows to pass flags to hcall. Currently supports controlling the wrapping of HTM buffer.
+
+To see the system processor configuration details:
+
+.. code-block:: sh
+
+  # cat /sys/kernel/debug/powerpc/htmdump/htminfo > htminfo_file
+
+The result can be interpreted using hexdump.
+
+To collect HTM traces for a partition represented by nodeindex as
+zero, nodalchipindex as 1 and coreindexonchip as 12
+
+.. code-block:: sh
+
+  # cd /sys/kernel/debug/powerpc/htmdump/
+  # echo 2 > htmtype
+  # echo 33 > htmsetup ( sets 8GB memory for HTM buffer, number is size in power of 2 )
+
+This requires a CEC reboot to get the HTM buffers allocated.
+
+.. code-block:: sh
+
+  # cd /sys/kernel/debug/powerpc/htmdump/
+  # echo 2 > htmtype
+  # echo 0 > nodeindex
+  # echo 1 > nodalchipindex
+  # echo 12 > coreindexonchip
+  # echo 1 > htmflags     # to set noWrap for HTM buffers
+  # echo 1 > htmconfigure # Configure the HTM
+  # echo 1 > htmstart     # Start the HTM
+  # echo 0 > htmstart     # Stop the HTM
+  # echo 0 > htmconfigure # Deconfigure the HTM
+  # cat htmstatus         # Dump the status of HTM entries as data
+
+Above will set the htmtype and core details, followed by executing respective HTM operation.
+
+Read the HTM trace data
+========================
+
+After starting the trace collection, run the workload
+of interest. Stop the trace collection after required period
+of time, and read the trace file.
+
+.. code-block:: sh
+
+  # cat /sys/kernel/debug/powerpc/htmdump/trace > trace_file
+
+This trace file will contain the relevant instruction traces
+collected during the workload execution. And can be used as
+input file for trace decoders to understand data.
+
+Benefits of using HTM debugfs interface
+=======================================
+
+It is now possible to collect traces for a particular core/chip
+from within any partition of the system and decode it. Through
+this enablement, a small partition can be dedicated to collect the
+trace data and analyze to provide important information for Performance
+analysis, Software tuning, or Hardware debug.
-- 
2.43.5


