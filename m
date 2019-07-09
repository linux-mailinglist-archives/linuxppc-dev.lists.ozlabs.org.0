Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB556357F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:18:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jhDy5344zDqVC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:18:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="z34+6aMU"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jh9T58SyzDqLp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 22:15:40 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id y8so5289260plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CiyFds2hmkTbH+nO+gDQbhe1+19pa5STQeUbUtVu+Y=;
 b=z34+6aMU6kAL7ftCPWUj4flw52zEEIL+4QGDgaUv98VOTAH7ebxgjGLh7eP4X1gpo0
 wdv5vu3dZpA3y/Xz/xgzx1FaNF7px/HMktc6YzYotVpesEXXMZ9PSs07OPGCphkxbV4f
 p69VTcOfvje60p2InPsiCus1wDyWhaYhCVjcej0p4Yqj+MEBgu2bSDudvW3dQDghvvP2
 LpuvGb1LOQgfSgTMdYcr9W2NhO1LhrT+iqU7v7n50acezAA+k7egbUfECEd0mFg8OU2+
 V7MjTs0dGiB+JiGdSdrVwhrYhD29uAwRPh3dXb6yFzgsLm6T9B9DlnWzA6B7i/+YKvdE
 PDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CiyFds2hmkTbH+nO+gDQbhe1+19pa5STQeUbUtVu+Y=;
 b=pC1vckMVb4An8arMwp67vzowxjVUFJe6J6mJO9Usec7EOj0IhGRhGAFFSWhlV/pj6f
 ne8COdkuRrwRc94vN8uqJlt/R9oJs8qRocUKdrkLnl2Bmw7WcJq8iTxbrAELxZ6ajSQi
 7melkGvEtyrEtVjdyMOOTWCbyVuFccZl2T3JF2ryvkJNL/Fxz0wcv+bLxyay5n+I5J2T
 90GIzIz7Ga/Zu4HZAmn4BFfXozPcKRHewP80S7RO4ygCY60BPD586EOBl9E4XAck8sx+
 u1xp+etC/XlGUO8AsOYeLA5wQZSlpeVz3Zg7pIPEQFjC0iHZqq2rMb31EIJfLeCdTE8+
 7Ytg==
X-Gm-Message-State: APjAAAUB0H+Q7ND71bu8i+DUzy6mUoqfVP9NxYtwgDqK0oaCk+FtVSPk
 YeRkmF7hMw8phsxjD+/uYUTSL1bL52MsEIqE
X-Google-Smtp-Source: APXvYqwyWnQx3ImF1JepzrC2O9Edmipx1Q/+uASotfUSlMPkMi2n4qQWbRGa0ZCmxZAdzpnv7lekUQ==
X-Received: by 2002:a17:902:7d86:: with SMTP id
 a6mr31550953plm.199.1562674538321; 
 Tue, 09 Jul 2019 05:15:38 -0700 (PDT)
Received: from santosiv.in.ibm.com ([223.186.121.175])
 by smtp.gmail.com with ESMTPSA id o15sm21243933pgj.18.2019.07.09.05.15.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 05:15:36 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v5 0/6] powerpc: implement machine check safe memcpy
Date: Tue,  9 Jul 2019 17:45:18 +0530
Message-Id: <20190709121524.18762-1-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
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
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
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
[ 7621.714118] CPU: 0 PID: 1368 Comm: mount Tainted: G   M              5.2.0-rc5-00239-g241e39004581 #50
[ 7621.714123] NIP:  c000000000088978 LR: c0000000008e16f8 CTR: 00000000000001de
[ 7621.714129] REGS: c0000000fffbfd70 TRAP: 0200   Tainted: G   M               (5.2.0-rc5-00239-g241e39004581)
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
mount: /mnt/pmem: wrong fs type, bad option, bad superblock on /dev/pmem0, missing codepage or helper program, or other error.
```

MCE is injected on a pmem address using mambo. The last patch which adds a nop
is only for testing on mambo, where r13 is not restored upon hitting vector 200.

The memcpy code can be optimised by adding VMX optimizations and GAS macros can
be used to enable code reusablity, which I will send as another series.

---
Change-log:

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

---
Balbir Singh (2):
  powerpc/mce: Fix MCE handling for huge pages
  powerpc/memcpy: Add memcpy_mcsafe for pmem

Reza Arbab (1):
  powerpc/mce: Make machine_check_ue_event() static

Santosh Sivaraj (3):
  extable: Add function to search only kernel exception table
  powerpc/mce: Handle UE event for memcpy_mcsafe
  powerpc: add machine check safe copy_to_user

 arch/powerpc/Kconfig                 |   1 +
 arch/powerpc/include/asm/mce.h       |   7 +-
 arch/powerpc/include/asm/string.h    |   2 +
 arch/powerpc/include/asm/uaccess.h   |  14 ++
 arch/powerpc/kernel/mce.c            |  16 +-
 arch/powerpc/kernel/mce_power.c      |  41 +++--
 arch/powerpc/lib/Makefile            |   2 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S  | 239 +++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/ras.c |   6 +-
 include/linux/extable.h              |   2 +
 kernel/extable.c                     |  16 +-
 11 files changed, 323 insertions(+), 23 deletions(-)
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S

-- 
2.20.1

