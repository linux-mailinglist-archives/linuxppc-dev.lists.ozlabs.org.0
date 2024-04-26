Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3208B300D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 08:10:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CuHD9uHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQj4Q2FJQz3vlR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 16:09:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CuHD9uHA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQj2x4CjPz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 16:08:41 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VQj2s3Qrcz4x0y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 16:08:37 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VQj2s3N14z4x1Y; Fri, 26 Apr 2024 16:08:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CuHD9uHA;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VQj2s0yhsz4x0y
	for <linuxppc-dev@ozlabs.org>; Fri, 26 Apr 2024 16:08:36 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q5rTeP028076;
	Fri, 26 Apr 2024 06:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=fFSSZ611Z8M7Ngb7WXS3anhH1rS9XKgh5OFMP3cLz00=;
 b=CuHD9uHAzPADr85OLn2PwoaUpcLtmtlN4d/NgG6Tr2sic9MTCIJQBlo19d2SKhPwynBA
 LWk9EJIeS08jdarz57eZVnQvpNVrC/WhmoIo1a51Uq5gt0L9cCmAd78gODmTupFLF4H/
 MmaCJZF7ddqWy5Di11K3OpTRRkXGP4/+14gD7y82nuLseT3yzTUnxrKn5RyeJfPKRWXr
 CUIznRgtEmJZPbpkpE7okQCDBZLpkHScl6lLpRyGzdftDNc5Kuj+kdngFmXMdRbRw0jK
 jC6BR/QIu5ebg/kvFaIYPztpIWjo29zcDLn6R4W98qd0/nogXFMvu1YomzPnYrhBWWTV jA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xr6gdg17w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 06:07:54 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43Q67rQw019212;
	Fri, 26 Apr 2024 06:07:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xr6gdg17r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 06:07:53 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q5h1J7023043;
	Fri, 26 Apr 2024 06:07:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pe43x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 06:07:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43Q67j7449283472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 06:07:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09AEE20063;
	Fri, 26 Apr 2024 06:07:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41AE020043;
	Fri, 26 Apr 2024 06:07:35 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.111.8])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 06:07:34 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v19 0/6]powerpc/crash: Kernel handling of CPU and memory hotplug
Date: Fri, 26 Apr 2024 11:37:22 +0530
Message-ID: <20240426060728.559753-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7GnngNK8BYvmmQNGpEh98MkAGkLT-Iol
X-Proofpoint-GUID: _aEcm7z3aY8u6vYotTKZxpjCq5en2RbZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260035
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 247262756121 ("crash: add generic infrastructure for crash
hotplug support") added a generic infrastructure that allows
architectures to selectively update the kdump image component during CPU
or memory add/remove events within the kernel itself.

This patch series adds crash hotplug handler for PowerPC and enable
support to update the kdump image on CPU/Memory add/remove events.

Among the 6 patches in this series, the first two patches make changes
to the generic crash hotplug handler to assist PowerPC in adding support
for this feature. The last four patches add support for this feature.

The following section outlines the problem addressed by this patch
series, along with the current solution, its shortcomings, and the
proposed resolution.

Problem:
========
Due to CPU/Memory hotplug or online/offline events the elfcorehdr
(which describes the CPUs and memory of the crashed kernel) and FDT
(Flattened Device Tree) of kdump image becomes outdated. Consequently,
attempting dump collection with an outdated elfcorehdr or FDT can lead
to failed or inaccurate dump collection.

Going forward CPU hotplug or online/offline events are referred as
CPU/Memory add/remove events.

Existing solution and its shortcoming:
======================================
The current solution to address the above issue involves monitoring the
CPU/memory add/remove events in userspace using udev rules and whenever
there are changes in CPU and memory resources, the entire kdump image
is loaded again. The kdump image includes kernel, initrd, elfcorehdr,
FDT, purgatory. Given that only elfcorehdr and FDT get outdated due to
CPU/Memory add/remove events, reloading the entire kdump image is
inefficient. More importantly, kdump remains inactive for a substantial
amount of time until the kdump reload completes.

Proposed solution:
==================
Instead of initiating a full kdump image reload from userspace on
CPU/Memory hotplug and online/offline events, the proposed solution aims
to update only the necessary kdump image component within the kernel
itself.

Git tree for testing:
=====================
https://github.com/sourabhjains/linux/tree/kdump-in-kernel-crash-update-v19

Above tree is rebased on top of v6.9-rc5 branch.

To realize this feature, the kdump udev rule must be updated. On RHEL,
add the following two lines at the top of the
"/usr/lib/udev/rules.d/98-kexec.rules" file.

SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
SUBSYSTEM=="memory", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"

With the above change to the kdump udev rule, kdump reload is avoided
during CPU/Memory add/remove events if this feature is enabled in the
kernel.

Note: only kexec_file_load syscall will work. For kexec_load minor changes
are required in kexec tool.

Changelog:
----------
v19:
  - Fix a build warning, remove NULL check before freeing memory. 6/6
    Reported by kernel test robot <lkp@intel.com>
  - Rebase it to 6.9-rc5

v18: [No functional changes]
  - https://lore.kernel.org/all/20240326055413.186534-1-sourabhjain@linux.ibm.com/
  - Update a comment in 2/6.
  - Describe the clean-up done on x86 in patch description 2/6.
  - Fix a minor typo in the patch description of 3/6.

v17: [https://lore.kernel.org/all/20240226084118.16310-1-sourabhjain@linux.ibm.com/]
  - Rebase the patch series on top linux-next tree and below patch series
    https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/
  - Split 0003 patch from v16 into two patches
       1. Move get_crash_memory_ranges() along with other *_memory_ranges()
          functions to ranges.c and make them public.
       2. Make update_cpus_node function public and take this function
          out of file_load_64.c
  - Keep arch_crash_hotplug_support in crash.c instead of core_64.c [05/06]
  - Use CONFIG_CRASH_MAX_MEMORY_RANGES to find extra elfcorehdr size [06/06]

v16: [https://lore.kernel.org/all/20240217081452.164571-1-sourabhjain@linux.ibm.com/]
  - Remove the unused #define `crash_hotplug_cpu_support`
    and `crash_hotplug_memory_support` in `arch/x86/include/asm/kexec.h`.
  - Document why two kexec flag bits are used in
    `arch_crash_hotplug_memory_support` (x86).
  - Use a switch case to handle different hotplug operations
    in `arch_crash_handle_hotplug_event` for PowerPC.
  - Fix a typo in 4/5.

v15:
  - Remove the patch that adds a new kexec flag for FDT update.
  - Introduce a generic kexec flag bit to share hotplug support
    intent between the kexec tool and the kernel for the kexec_load
    syscall. (2/5)
  - Introduce an architecture-specific handler to process the kexec
    flag for crash hotplug support. (2/5)
  - Rename the @update_elfcorehdr member of the struct kimage to
    @hotplug_support. (2/5)
  - Use a common function to advertise hotplug support for both CPU
    and Memory. (2/5)

v14:
  - Fix build warnings by including necessary header files
  - Rebase to v6.7-rc5

v13:
  - Fix a build warning, take ranges.c out of CONFIG_KEXEC_FILE
  - Rebase to v6.7-rc4

v12:
  - A patch to add new kexec flags to support this feature on kexec_load
    system call
  - Change in the way this feature is advertise to userspace for both
    kexec_load syscall
  - Rebase to v6.6-rc7

v11:
  - Rebase to v6.4-rc6
  - The patch that introduced CONFIG_CRASH_HOTPLUG for PowerPC has been
    removed. The config is now part of common configuration:
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
  - Update the logic to find the additional space needed for hotadd CPUs
    post kexec load. Refer "[RFC v4 PATCH 4/5] powerpc/crash hp: add crash
    hotplug support for kexec_file_load" patch to know more about the
    change.
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

Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org

Sourabh Jain (6):
  crash: forward memory_notify arg to arch crash hotplug handler
  crash: add a new kexec flag for hotplug support
  powerpc/kexec: move *_memory_ranges functions to ranges.c
  PowerPC/kexec: make the update_cpus_node() function public
  powerpc/crash: add crash CPU hotplug support
  powerpc/crash: add crash memory hotplug support

 arch/powerpc/Kconfig                    |   4 +
 arch/powerpc/include/asm/kexec.h        |  15 ++
 arch/powerpc/include/asm/kexec_ranges.h |  20 +-
 arch/powerpc/kexec/Makefile             |   4 +-
 arch/powerpc/kexec/core_64.c            |  91 +++++++
 arch/powerpc/kexec/crash.c              | 195 +++++++++++++++
 arch/powerpc/kexec/elf_64.c             |   3 +-
 arch/powerpc/kexec/file_load_64.c       | 314 +++---------------------
 arch/powerpc/kexec/ranges.c             | 312 ++++++++++++++++++++++-
 arch/x86/include/asm/kexec.h            |  13 +-
 arch/x86/kernel/crash.c                 |  32 ++-
 drivers/base/cpu.c                      |   2 +-
 drivers/base/memory.c                   |   2 +-
 include/linux/crash_core.h              |  15 +-
 include/linux/kexec.h                   |  11 +-
 include/uapi/linux/kexec.h              |   1 +
 kernel/crash_core.c                     |  29 +--
 kernel/kexec.c                          |   4 +-
 kernel/kexec_file.c                     |   5 +
 19 files changed, 713 insertions(+), 359 deletions(-)

-- 
2.44.0

