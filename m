Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C01825212
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 11:34:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yx2bDYc7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fTOXazEt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T60Dx38B2z3bZK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 21:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yx2bDYc7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fTOXazEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T60D5601Bz30RS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jan 2024 21:33:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704450800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2vTzdCgrBtcA7j5NHuC5/JJylMuPL+B3tt+xvWm2XXw=;
	b=Yx2bDYc7uqQpQw7N6xzFw2DqrPE27O9Hu/XQzTvoaI9Y1OSfmEqt+FVhoN7JT0BEQ5eTI0
	633UML6sLm1ekXCHbFmmqAmF17n0Xnxx7po29gGr/Ka/tXlEaDLzvjIOsp1veV9m4VYgrj
	MG7+1rs4IfT3ZfYosiXP6RBDLpTnJYE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704450801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2vTzdCgrBtcA7j5NHuC5/JJylMuPL+B3tt+xvWm2XXw=;
	b=fTOXazEtqVMhaJHqtdAhilek9nN6KYESFOeFERCL48emys0rn7I63QaTsUSd2ftYusKt+w
	C4voQK9F+ieS+oR3ZmuLBIuWbM2WKnJsHoIzYrcWq+KHBvVq1Mh9OUVEqlbOUxFfXZxOe3
	W472ZSIx40Yjp99UDtiAoReE2Mk+Ylg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-qIBgTU_rPeSjkbO0f1WUPA-1; Fri, 05 Jan 2024 05:33:17 -0500
X-MC-Unique: qIBgTU_rPeSjkbO0f1WUPA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AF46833945;
	Fri,  5 Jan 2024 10:33:16 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78119492BC6;
	Fri,  5 Jan 2024 10:33:10 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] crash: clean up kdump related config items
Date: Fri,  5 Jan 2024 18:33:00 +0800
Message-ID: <20240105103305.557273-1-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Baoquan He <bhe@redhat.com>, arnd@arndb.de, ignat@cloudflare.com, kexec@lists.infradead.org, viro@zeniv.linux.org.uk, eric_devolder@yahoo.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, hbathini@linux.ibm.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Motivation:
=============
Previously, LKP reported a building error. When investigating, it can't
be resolved reasonablly with the present messy kdump config items.

https://lore.kernel.org/oe-kbuild-all/202312182200.Ka7MzifQ-lkp@intel.com/


The kdump (crash dumping) related config items could causes confusions:

Firstly,
---
CRASH_CORE enables codes including
 - crashkernel reservation parsing;
 - elfcorehdr updating;
 - vmcoreinfo saving;
 - crash hotplug handling;

Now fadump of powerpc, kcore dynamic debugging and kdump all selects
CRASH_CORE, while fadump 
 - fadump needs crashkernel parsing, vmcoreinfo and accessing
   global variable 'elfcorehdr_addr';
 - kcore needs saved vmcoreinfo;
 - kdump needs all of the current kernel/crash_core.c.

So only enabling PROC_CORE or FA_DUMP will enable CRASH_CORE will
confuse people that we enable the core code of kdump. Actually it's not.

Secondly,
---
It's not reasonable to allow KEXEC_CORE select CRASH_CORE.

Because KEXEC_CORE enables codes which allocate control pages, copy
kexec/kdump segments, and prepare for switching. These codes are
shared by both kexec_load and kexec_file_load, and by both kexec reboot
and kdump. We could want kexec reboot, but disable kdump. In that case,
CRASH_CORE should not be selected.

Thirdly,
---
It's not reasonable to allow CRASH_DUMP select KEXEC_CORE.

That could make KEXEC_CORE, CRASH_DUMP are enabled independently from
KEXEC or KEXEC_FILE. However, w/o KEXEC or KEXEC_FILE, the KEXEC_CORE
code built in doesn't make any sense because no kernel loading or
switching will happen to utilize the KEXEC_CORE code.

Changes:
===========
1, split CRASH_CORE codes into three parts:
    1. move the elfcorehdr upating code and crash hotplug handling code
       into kernel/kexec_core.c. Both KEXEC and KEXEC_FILE will use them.
    2. split crashkernel reservation code out into kernel/crash_reserve.c,
       add CRASH_RESERVE to control its enabling;
    3. rename the left kernel/crash_core.c to kernel/vmcore_info.c since
       only vmcoreinfo is saved in the file, and add VMCORE_INFO to
       control its enabling;
2, rename the current kernel/crash_dump.c to kernel/elfcorehdr.c because
it only defines elfcorehdr_addr and function parse_elfcorehdr() in the
file. And build it in when VMCORE_INFO is enabled.

Achievement:
===========
With above changes, I can rearrange the config items as below (the right
item depends on or is selected by the left item):

    PROC_KCORE -----------> VMCORE_INFO
    
               |----------> VMCORE_INFO
    FA_DUMP----|
               |----------> CRASH_RESERVE
    
                                                    ---->VMCORE_INFO
                                                   /
                                                   |---->CRASH_RESERVE
    KEXEC      --|                                /|
                 |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
    KEXEC_FILE --|                               \ |
                                                   \---->CRASH_HOTPLUG
    
    KEXEC      --|
                 |--> KEXEC_CORE (for kexec reboot only)
    KEXEC_FILE --|

Baoquan He (5):
  kexec_core: move kdump related codes from crash_core.c to kexec_core.c
  kexec: split crashkernel reservation code out from crash_core.c
  crash: rename crash_core to vmcore_info
  crash: remove dependency of FA_DUMP on CRASH_DUMP
  crash: clean up CRASH_DUMP

 arch/arm64/Kconfig                            |    2 +-
 .../asm/{crash_core.h => crash_reserve.h}     |    4 +-
 arch/arm64/kernel/Makefile                    |    2 +-
 .../kernel/{crash_core.c => vmcore_info.c}    |    2 +-
 arch/powerpc/Kconfig                          |    4 +-
 arch/powerpc/kernel/setup-common.c            |    2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c          |    4 +-
 arch/powerpc/platforms/powernv/opal-core.c    |    2 +-
 arch/riscv/Kconfig                            |    2 +-
 .../asm/{crash_core.h => crash_reserve.h}     |    4 +-
 arch/riscv/kernel/Makefile                    |    2 +-
 .../kernel/{crash_core.c => vmcore_info.c}    |    2 +-
 arch/x86/Kconfig                              |    2 +-
 .../asm/{crash_core.h => crash_reserve.h}     |    6 +-
 arch/x86/kernel/Makefile                      |    2 +-
 .../{crash_core_32.c => vmcore_info_32.c}     |    2 +-
 .../{crash_core_64.c => vmcore_info_64.c}     |    2 +-
 drivers/firmware/qemu_fw_cfg.c                |   14 +-
 fs/proc/Kconfig                               |    2 +-
 fs/proc/kcore.c                               |    2 +-
 include/linux/buildid.h                       |    2 +-
 include/linux/crash_reserve.h                 |   48 +
 include/linux/kexec.h                         |   27 +-
 include/linux/{crash_core.h => vmcore_info.h} |   78 +-
 kernel/Kconfig.kexec                          |   12 +-
 kernel/Makefile                               |    4 +-
 kernel/crash_core.c                           | 1065 -----------------
 kernel/crash_reserve.c                        |  453 +++++++
 kernel/{crash_dump.c => elfcorehdr.c}         |    0
 kernel/kexec_core.c                           |  408 +++++++
 kernel/kexec_internal.h                       |    2 +
 kernel/ksysfs.c                               |    6 +-
 kernel/printk/printk.c                        |    4 +-
 kernel/vmcore_info.c                          |  233 ++++
 lib/buildid.c                                 |    2 +-
 35 files changed, 1222 insertions(+), 1186 deletions(-)
 rename arch/arm64/include/asm/{crash_core.h => crash_reserve.h} (81%)
 rename arch/arm64/kernel/{crash_core.c => vmcore_info.c} (97%)
 rename arch/riscv/include/asm/{crash_core.h => crash_reserve.h} (78%)
 rename arch/riscv/kernel/{crash_core.c => vmcore_info.c} (96%)
 rename arch/x86/include/asm/{crash_core.h => crash_reserve.h} (92%)
 rename arch/x86/kernel/{crash_core_32.c => vmcore_info_32.c} (90%)
 rename arch/x86/kernel/{crash_core_64.c => vmcore_info_64.c} (94%)
 create mode 100644 include/linux/crash_reserve.h
 rename include/linux/{crash_core.h => vmcore_info.h} (59%)
 delete mode 100644 kernel/crash_core.c
 create mode 100644 kernel/crash_reserve.c
 rename kernel/{crash_dump.c => elfcorehdr.c} (100%)
 create mode 100644 kernel/vmcore_info.c

-- 
2.41.0

