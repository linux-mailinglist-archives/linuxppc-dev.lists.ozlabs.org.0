Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EABBB4DFE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 06:59:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRLl6tNczDqRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 14:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="OrAjnaEk"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGf1tW6zDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:06 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v9so2714090pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qg8UhsoVSfuWV7y2nog+O9sN0KQmKkH97UijV2y2wE=;
 b=OrAjnaEkq0VujjXdD3u1YGU8ARgsKzrzqWTMzUOa+58vAkI0/hq0+RfrOJc/5JFojn
 Hm0COh3fvL01htn5FiG4nqB27jFx2CALadNct7+oJ4g6C+p+pQADEzERDO0cj3aZCwIf
 RVrgRwHe0HsciH0KItEQqGx2TwJZjrFYsIpf+av3WMgR5F/BuKl5U0jZut5TCPWP5qv/
 kWL2z0iwp5eaeJ8Xq97BjHKQBfxcuvrFI1Mq5fdZg6QIvSts7/eqe/G0OUD5hiaBUCu9
 ny2Krr29rOIk2/1dCmiHbW8zQWqEFBZio4DGwn3swqFogWHVmy3nzg/THpb+b1edLE8Y
 KJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qg8UhsoVSfuWV7y2nog+O9sN0KQmKkH97UijV2y2wE=;
 b=oVuN2VQej39ft8EAFh6yr2we18RgaNAUH1syjuCSZ8SCbTLsix8tXndYgUvWLUX9CQ
 sQ5gdvYJWVh5FcGGAowIJCz3EoTcSLO29MzaaB0IuMMPSBefyYfqoaeglhgQ3xkXhTyz
 9f1FN/YvImuLXv5vGNjjGNz2Ad8wTl+/Yh0GI2oU2aDCVZiIxdUcg6UmafpdhJPvbdqr
 9kxYpXpPd1gyC7nvb0OezMLIe/0y6BZqpEggOpwCNvdyNMNS8al4ZDmx1MHN6aeorJb5
 MZIj8KpZlDTvbpqE1sowCkvcOKYXMKMTYivftJ1EZ5pyhI9/KfcYvmMWQMMHgDMmsnFl
 m/jA==
X-Gm-Message-State: APjAAAV3Gyx/4QEwzUOFsrGfwZhvKaiO8j/ukYug5hTp6uCgyopPrNIZ
 z7MjWbpRU066Y0BzRHRdcxRbLv9GJIx4bA==
X-Google-Smtp-Source: APXvYqwRX2e1+ny2gwraRiYUIHwD+UBgfS6p3V2w14bFEq5ExAoFyh9Uqx1Vm6Gj8pLJP2Z/8phb+A==
X-Received: by 2002:a63:4d4a:: with SMTP id n10mr10946113pgl.396.1561092963253; 
 Thu, 20 Jun 2019 21:56:03 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:02 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 00/13] powerpc: implement machine check safe memcpy
Date: Fri, 21 Jun 2019 10:25:42 +0530
Message-Id: <cover.1561020760.git.santosh@fossix.org>
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

MCE is injected on a pmem address using mambo.
---

Balbir Singh (2):
  powerpc/mce: Bug fixes for MCE handling in kernel space
  powerpc/memcpy: Add memcpy_mcsafe for pmem

Reza Arbab (9):
  powerpc/mce: Make machine_check_ue_event() static
  powerpc/mce: Add MCE notification chain
  powerpc/mce: Move machine_check_ue_event() call
  powerpc/mce: Allow notifier callback to handle MCE
  powerpc/mce: Do not process notifier-handled UE events
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

