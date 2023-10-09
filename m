Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B009B7BD283
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 06:21:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=exwkvSas;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3m6y5BgPz3cST
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 15:20:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=exwkvSas;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3m610fr4z3c5b
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:20:09 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4S3m5w0Rlhz4xVv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:20:04 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4S3m5w03tmz4xVt; Mon,  9 Oct 2023 15:20:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=exwkvSas;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4S3m5v3DlVz4x5J;
	Mon,  9 Oct 2023 15:20:03 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3994HP3E012395;
	Mon, 9 Oct 2023 04:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=swOf1a2hksVLvPB3ZIF+eAbOW22wScvG9JxWU17g4DQ=;
 b=exwkvSasjUK06kV957RZZIryXz8Dq8gdF4zY2Oy7tfCHaPqDCzRrTh5ubi3kb1sJvCiG
 vUAKKIWIa3QqdU9owXP1LBpol/KmZ0Xi3cUGLmhG1kPf+U/DUmBcBXGKj2xZq2AQ6OdO
 H+faQ5GZ1IXH0VTSffqO6dGyOcTwR08dNJmeWGSJqsTB4h+FLZdfw6t+JQm2bl4B8PEj
 Anc9qcfozn05CkZB9M4VNRIKDgMkosYrO3rFtoQsprOqHwq1adt5rZi7alfldOkJ2zqJ
 wGNJB4lI4reEUdkOpKVwTaQR/3M1mDGPQysWWHy08F5EcpKny+2efbrr0FXySD+X9EnF fA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmac201cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 04:20:00 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3991l83Z028182;
	Mon, 9 Oct 2023 04:19:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1xprgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 04:19:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3994JtRl23921304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 04:19:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9BC32004B;
	Mon,  9 Oct 2023 04:19:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8888C20040;
	Mon,  9 Oct 2023 04:19:54 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.43.79.177])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 04:19:54 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 0/3] powerpc: make fadump resilient with memory add/remove events
Date: Mon,  9 Oct 2023 09:49:50 +0530
Message-ID: <20231009041953.36139-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g-Vs_vAjMXG9mFTxlw1sROHdYfSJoNkI
X-Proofpoint-ORIG-GUID: g-Vs_vAjMXG9mFTxlw1sROHdYfSJoNkI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_02,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090037
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
Cc: mahesh@linux.vnet.ibm.com, adityag@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Problem:
========
Due to changes in memory resources caused by either memory hotplug or
online/offline events, the elfcorehdr, which describes the cpus and
memory of the crashed kernel to the kernel that collects the dump (known
as second/fadump kernel), becomes outdated. Consequently, attempting
dump collection with an outdated elfcorehdr can lead to failed or
inaccurate dump collection.

Memory hotplug or online/offline events is referred as memory add/remove
events in reset of the patch series.

Existing solution:
==================
Monitor memory add/remove events in userspace using udev rules, and
re-register fadump whenever there are changes in memory resources. This
leads to the creation of a new elfcorehdr with updated system memory
information.

Challenges with existing solution:
==================================
1. Performing bulk memory add/remove with udev-based fadump
   re-registration can lead to race conditions and, more importantly,
   it creates a large wide window during which fadump is inactive until
   all memory add/remove events are settled.
2. Re-registering fadump for every memory add/remove event is
   inefficient.
3. Memory for elfcorehdr is allocated based on the memblock regions
   available during first kernel early boot and it remains fixed
   thereafter. However, if the elfcorehdr is later recreated with
   additional memblock regions, its size will increase, potentially
   leading to memory corruption.

Proposed solution:
==================
Address the aforementioned challenges by shifting the creation of
elfcorehdr from the first kernel (also referred as the crashed kernel),
where it was created and frequently recreated for every memory
add/remove event, to the fadump kernel. As a result, the elfcorehdr only
needs to be created once, thus eliminating the necessity to re-register
fadump during memory add/remove events.

To know more about elfcorehdr creation in the fadump kernel, refer to
the first patch in this series.

The second patch includes a new sysfs interface that tells userspace
that fadump re-registration isn't needed for memory add/remove events. 
note that userspace changes do not need to be in sync with kernel
changes; they can roll out independently.

Since there are significant changes in the fadump implementation, the
third patch updates the fadump documentation to reflect the changes made
in this patch series.

Kernel tree rebased on 6.6-rc4 with patch series applied:
=========================================================
https://github.com/sourabhjains/linux/tree/fadump-mem-hotplug

Userspace changes:
==================
To realize this feature, one must update the kdump udev rules to prevent
fadump re-registration during memory add/remove events.

On rhel apply the following changes to file
/usr/lib/udev/rules.d/98-kexec.rules

-run+="/bin/sh -c '/usr/bin/systemctl is-active kdump.service || exit 0; /usr/bin/systemd-run --quiet --no-block /usr/lib/udev/kdump-udev-throttler'"
+# don't re-register fadump if the value of the node
+# /sys/kernel/fadump/hotplug_ready is 1.
+
+run+="/bin/sh -c '/usr/bin/systemctl is-active kdump.service || exit 0; ! test -f /sys/kernel/fadump_enabled || cat /sys/kernel/fadump_enabled | grep 0  || ! test -f /sys/kernel/fadump/hotplug_ready || cat /sys/kernel/fadump/hotplug_ready | grep 0 || exit 0; /usr/bin/systemd-run --quiet --no-block /usr/lib/udev/kdump-udev-throttler'"

Changelog:
==========
v1 -> v2
- Fixed a few indentation issues reported by the checkpatch script.
- Rebased it to 6.6.0-rc3

v2 -> v3
- Assign physical address of elfcorehdr to fdh->elfcorehdr_addr
- Rename a variable, boot_mem_dest_addr -> boot_mem_dest_offset

Sourabh Jain (3):
  powerpc: make fadump resilient with memory add/remove events
  powerpc/fadump: add hotplug_ready sysfs interface
  Documentation/powerpc: update fadump implementation details

 Documentation/ABI/testing/sysfs-kernel-fadump |  12 +
 .../powerpc/firmware-assisted-dump.rst        |  91 ++---
 arch/powerpc/include/asm/fadump-internal.h    |  24 +-
 arch/powerpc/kernel/fadump.c                  | 373 +++++++++++-------
 arch/powerpc/platforms/powernv/opal-fadump.c  |  18 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c  |  23 +-
 6 files changed, 308 insertions(+), 233 deletions(-)

-- 
2.41.0

