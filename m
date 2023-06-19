Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE816734A66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 04:54:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sagGRciX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkvVx5BKtz3btp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:54:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sagGRciX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkvQM1V7cz30fr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:50:35 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QkvQK5lx9z4x0B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:50:33 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QkvQK5hWsz4x0G; Mon, 19 Jun 2023 12:50:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sagGRciX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QkvQK2nRrz4x0B
	for <linuxppc-dev@ozlabs.org>; Mon, 19 Jun 2023 12:50:33 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J2kFFP008921;
	Mon, 19 Jun 2023 02:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=i0pleWiUr9wJnF3pY/32Ej+SzvLvPwsiY8m4QrgyhUk=;
 b=sagGRciX8vGsrOE7apatfxZR77Zk8Xjdltb3seRXekqKaMayx2frKFw+9K1zt6jcss0E
 jevnaTuQzACG7OZRjlWUaZAR3RB0b1uVgw8Qng6JZMC4tqi+UPXv1v6zd4PINutqwwZs
 Mj/fyCoPSOn2m+Ou/u3F1uA5Kd4jldB6rfB3KtYONx8X4cMERUI1hn2ICSdU6qHM+3pg
 ufpKev9GFCwm7Zcsy1M2A94ELuhXi0FYWLPUwRLE3JILOwARPMDIY2+W8yggTWfK15kL
 +akkPwgSjNUU7oEj3NpMhxO7JWavnOujcbcw/kfS2gsy87o9fauNLmmyQltYYnnFb+Ba 7w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3raehcr1d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 02:49:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35J2bHjo014362;
	Mon, 19 Jun 2023 02:49:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r94f513bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 02:49:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35J2nb9H34341314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 02:49:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 438F720043;
	Mon, 19 Jun 2023 02:49:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A97C520040;
	Mon, 19 Jun 2023 02:49:35 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.70.141])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Jun 2023 02:49:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v11 0/4] PowerPC: In-kernel handling of CPU/Memory hotplug/online/offline events for kdump kernel
Date: Mon, 19 Jun 2023 08:19:30 +0530
Message-Id: <20230619024934.567046-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0TB_lTfk9ZkZtCn4Z9Pt4ZQXh6tD-nDm
X-Proofpoint-ORIG-GUID: 0TB_lTfk9ZkZtCn4Z9Pt4ZQXh6tD-nDm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-18_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190022
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
Cc: mahesh@linux.vnet.ibm.com, ldufour@linux.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Problem:
============
Post CPU/Memory hot plug/unplug and online/offline events occur, the
kdump kernel often retains outdated system information. This presents
a significant challenge when attempting to perform a dump collection
using an outdated or stale kdump kernel. In such situations, there
are two potential outcomes that pose risks: either the dump collection
fails to capture the required data entirely, leading to a failed dump,
or the collected dump data is inaccurate, thereby compromising its
reliability for analysis and troubleshooting purposes

Existing solution:
==================
The existing solution to keep the kdump kernel up-to-date involves
monitoring CPU/Memory hotplug/online/offline events via a udev rule.
This approach triggers a full kdump kernel reload for each hotplug event,
ensuring that the kdump kernel is always synchronized with the latest
system resource changes.

Shortcomings of existing solution:
==================================
- Leaves a window where kernel crash might not lead to a successful dump
  collection.
- Reloading all kexec segments for each hotplug is inefficient.
- udev rules are prone to races if hotplug events are frequent.

Further information regarding the problems associated with a current
solution can be found here.
 - https://lore.kernel.org/lkml/b04ed259-dc5f-7f30-6661-c26f92d9096a@oracle.com/
 - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html

Proposed Solution:
==================
To address the limitations of the current approach, a proposed solution
focuses on implementing a more targeted update strategy. Instead of
performing a full reload of all kexec segments for every CPU/Memory hot
plug/unplug and online/offline events, the proposed solution aims to update
only the relevant kexec segment. After loading the kexec segments into the
reserved area, a newly introduced hotplug handler will be responsible for
updating the specific kexec segment based on the type of hotplug event.
This selective update approach enhances overall efficiency by minimizing
unnecessary overhead and significantly reduces the chances of a kernel
crash leading to a failed or inaccurate dump collection.

Series Dependencies:
====================
The implementation of the crash hotplug handler on PowerPC is included in
this patch series. The introduction of the generic crash hotplug handler
is done through the patch series available at
https://lore.kernel.org/all/20230612210712.683175-1-eric.devolder@oracle.com/

Git tree for testing:
=====================
The following Git tree incorporates this patch series applied on top of
the dependent patch series.
https://github.com/sourabhjains/linux/tree/e23-s11-with-kexec-config

In order to enable this feature, it is necessary to disable the udev rule
responsible for reloading the kdump service. To do this, you can make the
following additions to the file "/usr/lib/udev/rules.d/98-kexec.rules" on RHEL:

Add the following two lines at top:

   SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
   SUBSYSTEM=="memory", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"

The changes mentioned above ensure that the kdump reload process is skipped
for CPU/Memory hot plug/unplug events when the path
"/sys/devices/system/[cpu|memory]/crash_hotplug" exists.

Note: only kexec_file_load syscall will work. For kexec_load minor changes are
required in kexec tool.

---
Changelog:

v11:
  - Rebase to v6.4-rc6
  - The patch that introduced CONFIG_CRASH_HOTPLUG for PowerPC has been removed.
    The config is now part of common configuration:
    https://lore.kernel.org/all/87ilbpflsk.fsf@mail.lhotse/

v10:
  - Drop the patch that adds fdt_index attribute to struct kimage_arch
    Find the fdt segment index when needed.
  - Added more details into commits messages.
  - Rebased onto 6.3.0-rc5

v9:
  - Removed patch to prepare elfcorehdr crash notes for possible CPUs.
    The patch is moved to generic patch series that introduces generic
    infrastructure for in kernel crash update.
  - Removed patch to pass the hotplug action type to the arch crash
    hotplug handler function. The generic patch series has introduced
    the hotplug action type in kimage struct.
  - Add detail commit message for better understanding.

v8:
  - Restrict fdt_index initialization to machine_kexec_post_load
    it work for both kexec_load and kexec_file_load.[3/8] Laurent Dufour

  - Updated the logic to find the number of offline core. [6/8]

  - Changed the logic to find the elfcore program header to accommodate
    future memory ranges due memory hotplug events. [8/8]

v7
  - added a new config to configure this feature
  - pass hotplug action type to arch specific handler

v6
  - Added crash memory hotplug support

v5:
  - Replace COFNIG_CRASH_HOTPLUG with CONFIG_HOTPLUG_CPU.
  - Move fdt segment identification for kexec_load case to load path
    instead of crash hotplug handler
  - Keep new attribute defined under kimage_arch to track FDT segment
    under CONFIG_HOTPLUG_CPU config.

v4:
  - Update the logic to find the additional space needed for hotadd CPUs post
    kexec load. Refer "[RFC v4 PATCH 4/5] powerpc/crash hp: add crash hotplug
    support for kexec_file_load" patch to know more about the change.
  - Fix a couple of typo.
  - Replace pr_err to pr_info_once to warn user about memory hotplug
    support.
  - In crash hotplug handle exit the for loop if FDT segment is found.

v3
  - Move fdt_index and fdt_index_vaild variables to kimage_arch struct.
  - Rebase patche on top of
    https://lore.kernel.org/lkml/20220303162725.49640-1-eric.devolder@oracle.com/
  - Fixed warning reported by checpatch script

v2:
  - Use generic hotplug handler introduced by
    https://lore.kernel.org/lkml/20220209195706.51522-1-eric.devolder@oracle.com/
    a significant change from v1.

Sourabh Jain (4):
  powerpc/kexec: turn some static helper functions public
  powerpc/crash: add crash CPU hotplug support
  crash: forward memory_notify args to arch crash hotplug handler
  powerpc/crash: add crash memory hotplug support

 arch/powerpc/Kconfig                    |   3 +
 arch/powerpc/include/asm/kexec.h        |  22 ++
 arch/powerpc/include/asm/kexec_ranges.h |   1 +
 arch/powerpc/kexec/core_64.c            | 301 ++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c             |  12 +-
 arch/powerpc/kexec/file_load_64.c       | 212 ++++-------------
 arch/powerpc/kexec/ranges.c             |  85 +++++++
 arch/x86/include/asm/kexec.h            |   2 +-
 arch/x86/kernel/crash.c                 |   5 +-
 include/linux/kexec.h                   |   2 +-
 kernel/crash_core.c                     |  14 +-
 11 files changed, 483 insertions(+), 176 deletions(-)

-- 
2.40.1

