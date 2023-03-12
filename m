Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB926B69EF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 19:14:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZSbj196Gz3cMk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 05:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dyxbw7gd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZSYh4lDbz3bT0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dyxbw7gd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PZSYg49s1z4xFQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:23 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PZSYg472Bz4xFS; Mon, 13 Mar 2023 05:12:23 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dyxbw7gd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PZSYg18bpz4xFQ
	for <linuxppc-dev@ozlabs.org>; Mon, 13 Mar 2023 05:12:22 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32CDlg3Y032398;
	Sun, 12 Mar 2023 18:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=v4+W7iLwDkENrMgS0t1GRZ5k52HErGpCeDnmSQgxtio=;
 b=Dyxbw7gdVm/Xdg+Mr3ZkipN9Svu3vTCK09J7orYv6eLvWzncHVsp9itGAn3APrLv1EyW
 IbBNa7OXTadfBYF8jiZcQGlpGmeerj2qKA7t7HbKRwaQhXHaNwJ10TuYRk4w+dRNlDDF
 Di1im9vjpXXiT/9/ZXhzeOoGG2/s4EUo1P0itMYH2YvrjGOffpe3mssYKhFzRqDMnemg
 uwsMjcBiyySHCcVyySNA+83gRtYE3amjYPhNx9j7f3Dx2auMcS8CkWtIBu71et4FxNG1
 1ELu/zQ2cnNvA4Zr9PNZFnE+M2TFmMLfiWINS4mJfkCqioAuJwCWmUPUqHbshGJjbluw eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93k208j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32CICBjm010887;
	Sun, 12 Mar 2023 18:12:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93k208hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32CAKcdg030084;
	Sun, 12 Mar 2023 18:12:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p8gwfa75t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32CIC4ej62062990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Mar 2023 18:12:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E866120049;
	Sun, 12 Mar 2023 18:12:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3E7620040;
	Sun, 12 Mar 2023 18:12:01 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.41.125])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 12 Mar 2023 18:12:01 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v9 2/6] powerpc/crash: introduce a new config option CRASH_HOTPLUG
Date: Sun, 12 Mar 2023 23:41:50 +0530
Message-Id: <20230312181154.278900-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a1Ne6HjixoT2IZu1AI6a4PU2VfTeTsFZ
X-Proofpoint-GUID: CuLrYlyat7wI0Hr0KdAlOQaEhu9xY3Xx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_04,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303120157
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to CPU/Memory hotplug events the system resources changes. A similar
change should reflect in the loaded kdump kernel image that describes
the state of the CPU and memory of the running kernel.

If the kdump kernel image is not updated after the CPU or Memory hotplug
events and it tries to collect the dump with the stale system resource
data this might lead to dump collection failure or an inaccurate dump
collection.

The current method to keep the kdump kernel up to date is by triggering
reload (i.e unload and load) the entire kdump kernel image whenever a
CPU or Memory hotplug event is observed by udev in the userspace.
Reloading the complete kdump kernel image is an expensive task. It can
be easily avoided by doing the in-kernel updates to specific kdump
kernel image components which are responsible for describing CPU and
Memory resources of the running kernel to the kdump kernel.

The kernel changes related to in-kernel update to the kdump kernel image
on CPU/Memory hotplug events are kept under the CRASH_HOTPLUG config
option.

Later in the series, a powerpc crash hotplug handler is introduced to
update the kdump kernel image on CPU/Memory hotplug events. This arch
specific handler is trigger from a generic crash handler that registers
with the CPU and memory notifiers.

The CRASH_HOTPLUG config option is enabled by default.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a6c4407d3ec83..2f45b3f5175cb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -681,6 +681,18 @@ config CRASH_DUMP
 	  The same kernel binary can be used as production kernel and dump
 	  capture kernel.
 
+config CRASH_HOTPLUG
+	bool "Update crash capture system on CPU/Memory hotplug event"
+	default y
+	depends on CRASH_DUMP && (HOTPLUG_CPU || MEMORY_HOTPLUG)
+	help
+	  In kernel update to relevant kexec segments due to change
+	  in the system configuration, rather reloading all the kexec
+	  segments again from userspace by monitoring CPU/Memory
+	  hotplug events in the userspace using udev.
+
+	  If unsure, say N.
+
 config FA_DUMP
 	bool "Firmware-assisted dump"
 	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
-- 
2.39.1

