Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F09593A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:16:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CNt51X8MzDqxL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="grzhu++i"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CNqJ02pyzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:14:03 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l21so2778620pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=adRZsMF9zHMSwTdN+diNbvjafx5Y2Za9210VsEROQfI=;
 b=grzhu++ipBtfB8PpbNHt2l0gveHJeGm0l9Jo7ZTnEDpUODRMG1DTloCsug9uKOG5un
 gXACDvXS0KNmIPzcYXGDCy1blauRazcAVYb6UswazYwA8bFp+qnR4I5/sPiuFlv1gh4m
 OOwxvuRDuufT1AtvKyXV4ZqExLuMOSb8t9F+270w+T8XhKH3aaLDJUa3KiWpmG2C1l3M
 VOf0uqeGExF1JVK1geahqlBIuV71BMkqcgT5dolcObbjvRbCr9RO0I+omA1IxmbMJmDI
 /NHTcr6Ra7qnvUFH+/fTh1Ji3qWZmtq3Sae7RUcoSh934a3QdTZIUubizkbbh+PauEFo
 wZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=adRZsMF9zHMSwTdN+diNbvjafx5Y2Za9210VsEROQfI=;
 b=ci5Gp4rCr/enheGxjmQNlDl2VCT5IiMAjm7r9PLmQcb2TIxDHJ/ewW5NnA7FDAnNXU
 SwL6iQ8rYfEB2Zbd3dyWAoqTTEbf++Ga5FilW+tCYQT1IMTD0x9jYUjbz8LBuAi/DQFU
 DZ7PVQ0kMFwEYTLpWzx6zvNAgnRtIKLomav5dTpBiLUcDvpST6gG9RdFI+L9EKS32usn
 Uo/x4p5LNo/gHh8ETlfErKQKYMJS7pSFvGvWHjcqlQLLUf8w50T2nvzwosSqciAQKLE+
 uJf7IjZ9D0ZsDrEggWgpRHlKLiQW0vwo+Z7c0QEVg/T8uLF6obyYBaqztojjgI2SqE/x
 NNag==
X-Gm-Message-State: APjAAAVvwtFWeTjWUa9AkgndLSLgLT2deSvtYwlPYCt4Vbx/XvremlXd
 2pgHaCb31X3LvAfNbigQAP/nhHJFvJ0=
X-Google-Smtp-Source: APXvYqw2DZbWQme02e9Xm/dLPVL0GhInOKsAEHDmmdCdk5AO2C1A+aJMjF754ynO1z+cmmetBlxTAA==
X-Received: by 2002:aa7:9e4f:: with SMTP id z15mr27790527pfq.89.1566288840171; 
 Tue, 20 Aug 2019 01:14:00 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.78])
 by smtp.gmail.com with ESMTPSA id b14sm18949265pfo.15.2019.08.20.01.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:13:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 0/7] powerpc: implement machine check safe memcpy
Date: Tue, 20 Aug 2019 13:43:45 +0530
Message-Id: <20190820081352.8641-1-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During a memcpy from a pmem device, if a machine check exception is
generated we end up in a panic. In case of fsdax read, this should
only result in a -EIO. Avoid MCE by implementing memcpy_mcsafe.

Before this patch series:

```
bash-4.4# mount -o dax /dev/pmem0 /mnt/pmem/
[ 7621.714094] Disabling lock debugging due to kernel taint
[ 7621.714099] MCE: CPU0: machine check (Severe) Host UE Load/Store [Not recovered]
[ 7621.714104] MCE: CPU0: NIP: [c000000000088978] memcpy_power7+0x418/0x7e0
[ 7621.714107] MCE: CPU0: Hardware error
[ 7621.714112] opal: Hardware platform error: Unrecoverable Machine Check exception
[ 7621.714118] CPU: 0 PID: 1368 Comm: mount Tainted: G   M              5.2.0-rc5-00239-g241e39004581
#50
[ 7621.714123] NIP:  c000000000088978 LR: c0000000008e16f8 CTR: 00000000000001de
[ 7621.714129] REGS: c0000000fffbfd70 TRAP: 0200   Tainted: G   M              
(5.2.0-rc5-00239-g241e39004581)
[ 7621.714131] MSR:  9000000002209033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 24428840  XER: 00040000
[ 7621.714160] CFAR: c0000000000889a8 DAR: deadbeefdeadbeef DSISR: 00008000 IRQMASK: 0
[ 7621.714171] GPR00: 000000000e000000 c0000000f0b8b1e0 c0000000012cf100 c0000000ed8e1100 
[ 7621.714186] GPR04: c000020000001100 0000000000010000 0000000000000200 03fffffff1272000 
[ 7621.714201] GPR08: 0000000080000000 0000000000000010 0000000000000020 0000000000000030 
[ 7621.714216] GPR12: 0000000000000040 00007fffb8c6d390 0000000000000050 0000000000000060 
[ 7621.714232] GPR16: 0000000000000070 0000000000000000 0000000000000001 c0000000f0b8b960 
[ 7621.714247] GPR20: 0000000000000001 c0000000f0b8b940 0000000000000001 0000000000010000 
[ 7621.714262] GPR24: c000000001382560 c00c0000003b6380 c00c0000003b6380 0000000000010000 
[ 7621.714277] GPR28: 0000000000000000 0000000000010000 c000020000000000 0000000000010000 
[ 7621.714294] NIP [c000000000088978] memcpy_power7+0x418/0x7e0
[ 7621.714298] LR [c0000000008e16f8] pmem_do_bvec+0xf8/0x430
... <snip> ...
```

After this patch series:

```
bash-4.4# mount -o dax /dev/pmem0 /mnt/pmem/
[25302.883978] Buffer I/O error on dev pmem0, logical block 0, async page read
[25303.020816] EXT4-fs (pmem0): DAX enabled. Warning: EXPERIMENTAL, use at your own risk
[25303.021236] EXT4-fs (pmem0): Can't read superblock on 2nd try
[25303.152515] EXT4-fs (pmem0): DAX enabled. Warning: EXPERIMENTAL, use at your own risk
[25303.284031] EXT4-fs (pmem0): DAX enabled. Warning: EXPERIMENTAL, use at your own risk
[25304.084100] UDF-fs: bad mount option "dax" or missing value
mount: /mnt/pmem: wrong fs type, bad option, bad superblock on /dev/pmem0, missing codepage or helper
program, or other error.
```

MCE is injected on a pmem address using mambo. The last patch which adds a
nop is only for testing on mambo, where r13 is not restored upon hitting
vector 200.

The memcpy code can be optimised by adding VMX optimizations and GAS macros
can be used to enable code reusablity, which I will send as another series.

--
v11:
* Move back to returning pfn instead of physical address [nick]
* Move patch "Handle UE event" up in the order
* Add reviewed-bys

v10: Fix authorship; add reviewed-bys and acks.

v9:
* Add a new IRQ work for UE events [mahesh]
* Reorder patches, and copy stable

v8:
* While ignoring UE events, return was used instead of continue.
* Checkpatch fixups for commit log

v7:
* Move schedule_work to be called from irq_work.

v6:
* Don't return pfn, all callees are expecting physical address anyway [nick]
* Patch re-ordering: move exception table patch before memcpy_mcsafe patch [nick]
* Reword commit log for search_exception_tables patch [nick]

v5:
* Don't use search_exception_tables since it searches for module exception tables
  also [Nicholas]
* Fix commit message for patch 2 [Nicholas]

v4:
* Squash return remaining bytes patch to memcpy_mcsafe implemtation patch [christophe]
* Access ok should be checked for copy_to_user_mcsafe() [christophe]

v3:
* Drop patch which enables DR/IR for external modules
* Drop notifier call chain, we don't want to do that in real mode
* Return remaining bytes from memcpy_mcsafe correctly
* We no longer restore r13 for simulator tests, rather use a nop at 
  vector 0x200 [workaround for simulator; not to be merged]

v2:
* Don't set RI bit explicitly [mahesh]
* Re-ordered series to get r13 workaround as the last patch

--
Balbir Singh (3):
  powerpc/mce: Fix MCE handling for huge pages
  powerpc/mce: Handle UE event for memcpy_mcsafe
  powerpc/memcpy: Add memcpy_mcsafe for pmem

Reza Arbab (1):
  powerpc/mce: Make machine_check_ue_event() static

Santosh Sivaraj (3):
  powerpc/mce: Schedule work from irq_work
  extable: Add function to search only kernel exception table
  powerpc: add machine check safe copy_to_user

 arch/powerpc/Kconfig                |   1 +
 arch/powerpc/include/asm/mce.h      |   4 +-
 arch/powerpc/include/asm/string.h   |   2 +
 arch/powerpc/include/asm/uaccess.h  |  14 ++
 arch/powerpc/kernel/mce.c           |  31 +++-
 arch/powerpc/kernel/mce_power.c     |  34 +++-
 arch/powerpc/lib/Makefile           |   2 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S | 242 ++++++++++++++++++++++++++++
 include/linux/extable.h             |   2 +
 kernel/extable.c                    |  11 +-
 10 files changed, 328 insertions(+), 15 deletions(-)
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S

-- 
2.21.0

