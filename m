Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 252165C95B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:34:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dDxT4qC7zDqT6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:34:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="AH6Fsa/N"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCGq1bCVzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:19:46 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id cl9so8485902plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0aZ6g6EuDWhr0BMOav6WHGMdq8Q3/5r5IkvfXqvrw0=;
 b=AH6Fsa/NdZzQLzkWZ60h6JXPUrfk4fdYi6KN+hX0jmCtdaWIyBuuhppbsZhgj6/eqv
 80uJr12oEzlYfweL8TipeWyjZIS+YiPIIUSH13WiSNCNr2OY4RD3HqXrPQK2frUF/yiC
 eq7QmpXqR7bwNfc3osE3FRLeYUZkrwCNotD5jeAdocznn8Sf10XuUrv/Zn63XlTanswM
 vdFgV8ls5h4QG4bQKQXMbl/IP8rk+D3A1MpuFYh70SOcIdtm9Mrol6WqgcO4PlO/jx3N
 uKcXVKFNQIGb4ViQjL3jEZOjvrXs4fMIjJxU/8pHUmmwSNIK8UqPv4AhvGyuor9sjGRo
 bj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0aZ6g6EuDWhr0BMOav6WHGMdq8Q3/5r5IkvfXqvrw0=;
 b=Zi5HqoB+C1upsdlkV+dnQGxhs7qAM0NmSnweHdh5U4vK2G1KIJdoUeLM4CBHWjwdE/
 ovK/EGZSwPVOI+4uootAfZBv8TDTzjPbUNCKGbWisVf4P4a1jL2HJOwrrE8pWxJU5tez
 +axO56/6oAg1dF/atWTpVIwMGF7X5iICyll7O6eQqUBl9WiMmBB/NpR/Yp700QR8KAxu
 fpPg++MXCZu8sSZluG0G4VNT7ZKuYMNbccwOGMBPmrd8zolRFLcoggEsecFOvAA0mI8M
 gHDXT9aocA47RdziMWmEVDk7J47j6pbZnfUqJBKMqueTeEPQetI2O/LV1c+GDivt30qV
 CTTw==
X-Gm-Message-State: APjAAAW2xHcIacfkCKVxuiuTeJAGm9pgbbpNjnEKRtu6ZfLfSQoWQ5wq
 OqJTMu02Zld46kBq+obCUyIdBoMwAmQ=
X-Google-Smtp-Source: APXvYqxmnmi87u1jct6f3+ZVWCoGdVavCyC1zpiusu8gR5SPIcj7Kv6pSGpjiw20nu5TJDHuFirVdg==
X-Received: by 2002:a17:902:a516:: with SMTP id
 s22mr32392461plq.178.1562044782736; 
 Mon, 01 Jul 2019 22:19:42 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:19:42 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 00/12] powerpc: implement machine check safe memcpy
Date: Tue,  2 Jul 2019 10:49:20 +0530
Message-Id: <20190702051932.511-1-santosh@fossix.org>
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

MCE is injected on a pmem address using mambo. The last patch which restores r13 is only for testing
on mambo, where r13 is not restored upon hittin vector 200.

The memcpy code can be optimised by adding VMX optimizations and GAS macros can be used to enable code
reusablity, which I will send as another series.

--
Balbir Singh (2):
  powerpc/mce: Bug fixes for MCE handling in kernel space
  powerpc/memcpy: Add memcpy_mcsafe for pmem

Reza Arbab (8):
  powerpc/mce: Make machine_check_ue_event() static
  powerpc/mce: Add MCE notification chain
  powerpc/mce: Move machine_check_ue_event() call
  powerpc/mce: Allow notifier callback to handle MCE
  powerpc/mce: Add fixup address to UE events
  powerpc/mce: Handle memcpy_mcsafe()
  powerpc/mce: Enable MCE notifiers in external modules
  powerpc/64s: Save r13 in machine_check_common_early

Santosh Sivaraj (2):
  powerpc/memcpy_mcsafe: return remaining bytes
  powerpc: add machine check safe copy_to_user

 arch/powerpc/Kconfig                      |   1 +
 arch/powerpc/include/asm/asm-prototypes.h |   1 +
 arch/powerpc/include/asm/mce.h            |  13 +-
 arch/powerpc/include/asm/string.h         |   2 +
 arch/powerpc/include/asm/uaccess.h        |  12 ++
 arch/powerpc/kernel/exceptions-64s.S      |  14 ++
 arch/powerpc/kernel/mce.c                 | 102 +++++++++-
 arch/powerpc/kernel/mce_power.c           |  26 ++-
 arch/powerpc/lib/Makefile                 |   2 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S       | 226 ++++++++++++++++++++++
 arch/powerpc/platforms/pseries/ras.c      |   6 +-
 11 files changed, 386 insertions(+), 19 deletions(-)
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S

-- 
2.20.1

