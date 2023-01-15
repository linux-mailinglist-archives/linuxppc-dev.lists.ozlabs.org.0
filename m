Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B322666B1CF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 16:05:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvz3S3xFQz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 02:05:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PCGSEW2C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nvz0T1PkTz3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PCGSEW2C;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nvz0Q1Ghgz4xN6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:30 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Nvz0Q1CnSz4xwq; Mon, 16 Jan 2023 02:02:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PCGSEW2C;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Nvz0P64mgz4xN6
	for <linuxppc-dev@ozlabs.org>; Mon, 16 Jan 2023 02:02:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30FAsl0K006055;
	Sun, 15 Jan 2023 15:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ODhq6s860fFNt2uHl85E85IqHf9K6XrSxViCwNbalbY=;
 b=PCGSEW2CO7ty302TaXYXd33s5NRh3Rtm1bbgNRKnW0OkQha5cD7u4/JwShJnpEOgZHwS
 Cn3Yv/jCPZRPawnM8GxTzwmjMECRlsCzcU0gsSl0firshfgVVf7SBIdUqj5wc2Q+dO3/
 DVroWgq2GaYP7DD7XNyHEKV9lL+jB8MmwbCSuc3d4IOcqaRlA5FLrv/uSnKN2+sTFXLm
 c1FpOA8BFX7DaEJD7HDShQB+dsse+4YCeyFTfssfiNJTURNrE3RiqwcwNMXD82mZmxc3
 AkSAje56UAnxZG9GdEjKa8OV52b+7cKL3nlLIekfb/BBhlJhiLDOukUX7naTCdehmzco Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4g5bjru5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30FF2Hr1029054;
	Sun, 15 Jan 2023 15:02:17 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4g5bjrtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30F1sdg2004735;
	Sun, 15 Jan 2023 15:02:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16hd2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30FF2Bv924314536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jan 2023 15:02:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 383582004B;
	Sun, 15 Jan 2023 15:02:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EFCE20040;
	Sun, 15 Jan 2023 15:02:08 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.71.156])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jan 2023 15:02:07 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 0/8] In kernel handling of CPU hotplug events for crash kernel
Date: Sun, 15 Jan 2023 20:31:58 +0530
Message-Id: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I_yp-fRH5091w4HVEIXoLLuxgJIiT93j
X-Proofpoint-ORIG-GUID: mQT7ZHO265hu1Kt_qwNMTM5J-OB01u_8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_11,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301150116
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

This patch series implements the crash hotplug handler on PowerPC introduced
by https://lkml.org/lkml/2022/12/9/520 patch series.

The Problem:
============
Post hotplug/DLPAR events the capture kernel holds stale information about the
system. Dump collection with stale capture kernel might end up in dump capture
failure or an inaccurate dump collection.

Existing solution:
==================
The existing solution to keep the capture kernel up-to-date by monitoring
hotplug event via udev rule and trigger a full capture kernel reload for
every hotplug event.

Shortcomings:
------------------------------------------------
- Leaves a window where kernel crash might not lead to a successful dump
  collection.
- Reloading all kexec components for each hotplug is inefficient.
- udev rules are prone to races if hotplug events are frequent.

More about issues with an existing solution is posted here:
 - https://lkml.org/lkml/2020/12/14/532
 - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html

Proposed Solution:
==================
Instead of reloading all kexec segments on hotplug event, this patch series
focuses on updating only the relevant kexec segment. Once the kexec segments
are loaded in the kernel reserved area then an arch-specific hotplug handler
will update the relevant kexec segment based on hotplug event type.

---
Changelog:

v6 -> v7
  - added a new config to configure this feature
  - pass hotplug action type to arch specific handler

v5 -> v6
  - Added crash memory hotplug support

v4 -> v5:
  - Replace COFNIG_CRASH_HOTPLUG with CONFIG_HOTPLUG_CPU.
  - Move fdt segment identification for kexec_load case to load path
    instead of crash hotplug handler
  - Keep new attribute defined under kimage_arch to track FDT segment
    under CONFIG_HOTPLUG_CPU config.

v3 -> v4:
  - Update the logic to find the additional space needed for hotadd CPUs post
    kexec load. Refer "[RFC v4 PATCH 4/5] powerpc/crash hp: add crash hotplug
    support for kexec_file_load" patch to know more about the change.
  - Fix a couple of typo.
  - Replace pr_err to pr_info_once to warn user about memory hotplug
    support.
  - In crash hotplug handle exit the for loop if FDT segment is found.

v2 -> v3
  - Move fdt_index and fdt_index_vaild variables to kimage_arch struct.
  - Rebase patche on top of https://lkml.org/lkml/2022/3/3/674 [v5]
  - Fixed warning reported by checpatch script

v1 -> v2:
  - Use generic hotplug handler introduced by https://lkml.org/lkml/2022/2/9/1406, a
    significant change from v1.
---

Sourabh Jain (8):
  powerpc/kexec: turn some static helper functions public
  powerpc/crash hp: introduce a new config option CRASH_HOTPLUG
  powerpc/crash: update kimage_arch struct
  crash: add phdr for possible CPUs in elfcorehdr
  crash: pass hotplug action type to arch crash hotplug handler
  powerpc/crash: add crash CPU hotplug support
  crash: forward memory_notify args to arch crash hotplug handler
  powerpc/kexec: add crash memory hotplug support

 arch/powerpc/Kconfig                    |  12 +
 arch/powerpc/include/asm/kexec.h        |  17 ++
 arch/powerpc/include/asm/kexec_ranges.h |   1 +
 arch/powerpc/kexec/core_64.c            | 290 ++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c             |  73 +++++-
 arch/powerpc/kexec/file_load_64.c       | 179 ++-------------
 arch/powerpc/kexec/ranges.c             |  60 +++++
 arch/x86/include/asm/kexec.h            |   3 +-
 arch/x86/kernel/crash.c                 |   5 +-
 include/linux/kexec.h                   |   6 +-
 kernel/crash_core.c                     |  23 +-
 11 files changed, 491 insertions(+), 178 deletions(-)

-- 
2.39.0

