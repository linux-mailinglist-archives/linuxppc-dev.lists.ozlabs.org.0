Return-Path: <linuxppc-dev+bounces-7820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C7A948C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 20:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zgc3d6WGkz3c97;
	Mon, 21 Apr 2025 04:10:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745172605;
	cv=none; b=VTpdUDVjNeYl7n3DTFCeyrJw3GO/Ql1eg2ISpkXA1aM6sn9sRd9Se6FSK9MYktHbySEYCMtuOOQDLt4rxlpGaD6zBjgNJ7GI+7VazFa9SSo8oOh36AIWedOpFI+5pwb7+7EpdUJWJj+aHhYYhy/pcQueRumurnZAgVdZD0vjk/F9iBDY05vqYMACHjZ7VRUZEodyK+iKWEni+SCunXTtViRkhrqZE6PFtSbSLqpj1Y9i+yyXa/7HyCulCsNT846iWwDttQACRUVAR+FBnJpWB3JdM5m8a5iweNbx8UVBvOlVZv31LW26rV6TYFYeNxtNK8/d/vxjxRU0GChGLa4EIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745172605; c=relaxed/relaxed;
	bh=CZejHi1NMTRJB6igu3M9L1XPBoU7oq0DzoyKQLULc4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nY7w4MEttPukx3hfvMOT7Qv2VRcuL5UMn3JbeI7kTO5aGDo493wAG4o1LAzipciZchbP5MpMnbOKclgb3rWSGhN4Vpb3ybt6tS/WQ5TljupgTV2bsffAFzO5JtP5fITw1EUtBo5K9NR7w9nBhksn+FIYu8jV0hTcFGujK/2hHjWRDYQpWtmT8jDNAvnqQTjqRb9CwrGQdqehUahe2/HVBSVljd5MVbJtG3i4RBZJi7BG3aIGEuc2i6rDQnjjl+wuN80PPhGK5oc2RkL4uVBmABx/16fFuJNDTIGS/7y94WbCYQdbvZiwoGi4v86obYPwbsTKHAsmOUTrWXQI0WDalA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hg+XFK45; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hg+XFK45;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgc3d0bfjz2ySp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 04:10:04 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KBhnYJ024754
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=CZejHi1NMTRJB6igu
	3M9L1XPBoU7oq0DzoyKQLULc4I=; b=hg+XFK45YCG7MtIAlHlnNfYkl93dYJuKj
	M9OiEsh9vLmyLM2ASJkWoMAVx7dN+Hqi77J1LI0LlW9CzzTqFkE07dAj6CwCcakL
	RHh8lozfrvMeDNH7aAW0lxq21pyyuGYpiKPeXv6DxeMJRCX1QO0008ZQGV56M2te
	5EGQOqbvu5jGeIfh78L9tWgGLpmOaHzm4NEHPNQQPFhANVxws45twvjvrzjiQ5UK
	qaLqo56NJSh1q+C4wI0gatGIyyDYyiPCKw1QA1wN9LVJNLSx6vf6Kf729BaxJWLx
	dDycGo2sggKCaC5e4Mc327hb+ttX92v6gHX2lfpHQ7jWWT6CR9VuQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv2ncd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:10:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53KG7MjB032691
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:10:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464phyb193-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Apr 2025 18:10:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53KI9tB656885518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 18:09:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AD1E20043;
	Sun, 20 Apr 2025 18:09:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 601C220040;
	Sun, 20 Apr 2025 18:09:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.246.217])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 18:09:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH V3 9/9] powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface
Date: Sun, 20 Apr 2025 23:38:44 +0530
Message-Id: <20250420180844.53128-10-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250420180844.53128-1-atrajeev@linux.ibm.com>
References: <20250420180844.53128-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: babYgJmxUIKt5YseH1bUkZmn-SSX4rWB
X-Proofpoint-ORIG-GUID: babYgJmxUIKt5YseH1bUkZmn-SSX4rWB
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=68053879 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=KEhSUpNQf2jbIF_WxKkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_08,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Documentation for HTM (Hardware Trace Macro) debugfs interface
and how it can be used to configure/control the HTM operations.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
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
2.43.0


