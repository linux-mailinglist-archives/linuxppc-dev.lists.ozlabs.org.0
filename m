Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B88A65CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 10:13:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i+BL93tf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJcHD6vn6z2yt0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 18:13:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i+BL93tf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJcGV3SdVz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 18:12:34 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VJcGV3DS5z4x1P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 18:12:34 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VJcGV2vY5z4x3k; Tue, 16 Apr 2024 18:12:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i+BL93tf;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VJcGV0LV4z4x1P
	for <linuxppc-dev@ozlabs.org>; Tue, 16 Apr 2024 18:12:33 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43G82A3F016493;
	Tue, 16 Apr 2024 08:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6CTqsEb7HzMnG7XdLyQ/zZ3ZzF32qWqPGTt9LmnTKIM=;
 b=i+BL93tfuw4etYbhTT1pQdwQ2S5aIqdgtHbcs362PcZXdYWhdeYVd9vuP0wvT7np4thL
 297elBO1PW/xNtgP2oubK7RVErvSbsfPaUzRjoQ9QeU4jD71c5f+tE83IPk2OD6jaJ0K
 DwBDw9cBtvchYKhQ3/Yw3ozszd5LE0sqv1WjOLiP4no071r/7hoarmPj9Di/FUL4zfzv
 esbrTHCSbnLBzY7EtxBxeiG6ILsY9i0qk/w5lWtUx8PS7AqAgUnx0jRtRC+OWhTpszY/
 jQ674l9WAIhUC7tabZrEAbMCr4iwh9v/z+OMy1MUUzH8TUJvp/ny2E7Vk2DWHeXmtwyq Bw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xhnf9r0s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 08:12:29 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43G5jtqq023582;
	Tue, 16 Apr 2024 08:09:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5cnvwqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 08:09:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43G88tMt42533342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Apr 2024 08:08:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF7F82004D;
	Tue, 16 Apr 2024 08:08:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F193520040;
	Tue, 16 Apr 2024 08:08:51 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.85.254])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Apr 2024 08:08:51 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v9 0/3] powerpc: make fadump resilient with memory add/remove events
Date: Tue, 16 Apr 2024 13:38:45 +0530
Message-ID: <20240416080848.347602-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: smAmjlcpRsltvyfpyb3uJYqrRsdfonY8
X-Proofpoint-GUID: smAmjlcpRsltvyfpyb3uJYqrRsdfonY8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_06,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404160049
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
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

Kernel tree rebased on 6.9.0-rc3 with patch series applied:
===========================================================
https://github.com/sourabhjains/linux/tree/fadump-mem-hotplug-v9

Userspace changes:
==================
To realize this feature, one must update the kdump udev rules to prevent
fadump re-registration during memory add/remove events.

On rhel apply the following changes to file
/usr/lib/udev/rules.d/98-kexec.rules

-RUN+="/bin/sh -c '/usr/bin/systemctl is-active kdump.service || exit 0; /usr/bin/systemd-run --quiet --no-block /usr/lib/udev/kdump-udev-throttler'"
+# don't re-register fadump if the value of the node
+# /sys/kernel/fadump/hotplug_ready is 1.
+
+RUN+="/bin/sh -c '/usr/bin/systemctl is-active kdump.service || exit 0; ! test -f /sys/kernel/fadump_enabled || cat /sys/kernel/fadump_enabled | grep 0  || ! test -f /sys/kernel/fadump/hotplug_ready || cat /sys/kernel/fadump/hotplug_ready | grep 0 || exit 0; /usr/bin/systemd-run --quiet --no-block /usr/lib/udev/kdump-udev-throttler'"

Changelog:
==========
v9: 16 Apr 2024
  - Set the physical address of elfcorehdr to elfcorehdr_addr. 1/3
  - Set elfcorehdr_addr to ELFCORE_ADDR_ERR before freeing the elfcorehdr. 1/3
  - Mark the populate_elf_pt_load function as __init. 1/3
  - Rename a function from process_fadump to fadump_process. 1/3
  - Make minor changes to the commit message and a couple of comments in 1/3.
  - Update date of introduction of /sys/kernel/fadump/hotplug_ready sysfs. 2/3
  - Rebase it to 6.9-rc3.

v8: 16 Feb 2024
  https://lore.kernel.org/all/20240217072004.148293-1-sourabhjain@linux.ibm.com/
  - Move `elfcorehdr_addr` and `elfcorehdr_size` struct attributes
    from `struct fadump_crash_info_header` to `struct fw_dump`.
  - Make minor changes in commit message 1/3.
  - Rebase it to 6.8-rc4.

v7: 11 Jan 2024
  https://lore.kernel.org/all/20240111140943.297501-1-sourabhjain@linux.ibm.com/
  - Rebase it to 6.7

v6: 8 Dec 2023
  https://lore.kernel.org/all/20231208115159.82236-1-sourabhjain@linux.ibm.com/
  - Add size fields for `pt_regs` and `cpumask` in the fadump header
    structure
  - Don't process the dump if the size of `pt_regs` and `cpu_mask` is
    not same in the crashed and fadump kernel
  - Include an additional check for endianness mismatch when the magic
    number doesn't match, to print the relevant error message
  - Don't process the dump if the fadump header contains an old magic number
  - Rebased it to 6.7.0-rc4

v5: 29 Oct 2023 
  https://lore.kernel.org/all/20231029124548.12198-1-sourabhjain@linux.ibm.com/
  - Fix a comment on the first patch

v4: 21 Oct 2023
  https://lore.kernel.org/all/20231021181733.204311-1-sourabhjain@linux.ibm.com/
  - Fix a build warning about type casting

v3: 9 Oct 2023
  https://lore.kernel.org/all/20231009041953.36139-1-sourabhjain@linux.ibm.com/
  - Assign physical address of elfcorehdr to fdh->elfcorehdr_addr
  - Rename a variable, boot_mem_dest_addr -> boot_mem_dest_offset

v2: 25 Sep 2023
  https://lore.kernel.org/all/20230925051214.678957-1-sourabhjain@linux.ibm.com/
  - Fixed a few indentation issues reported by the checkpatch script.
  - Rebased it to 6.6.0-rc3

v1: 17 Sep 2023
  https://lore.kernel.org/all/20230917080225.561627-1-sourabhjain@linux.ibm.com/

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>

Sourabh Jain (3):
  powerpc: make fadump resilient with memory add/remove events
  powerpc/fadump: add hotplug_ready sysfs interface
  Documentation/powerpc: update fadump implementation details

 Documentation/ABI/testing/sysfs-kernel-fadump |  11 +
 .../arch/powerpc/firmware-assisted-dump.rst   |  91 ++---
 arch/powerpc/include/asm/fadump-internal.h    |  31 +-
 arch/powerpc/kernel/fadump.c                  | 375 ++++++++++--------
 arch/powerpc/platforms/powernv/opal-fadump.c  |  22 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c  |  34 +-
 6 files changed, 309 insertions(+), 255 deletions(-)

-- 
2.43.0

