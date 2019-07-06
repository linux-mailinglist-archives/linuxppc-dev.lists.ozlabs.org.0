Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCB60FAA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 11:49:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gn3l08ZKzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 19:49:07 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="lC7aIym2"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gn1M0rgbzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:47:02 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g15so5319808pgi.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SD1HO9bA5bz7qXyxlfc0od+HuDhwW47hZC2wcYEnJgM=;
 b=lC7aIym2BpLHAXIEZDuZBkPSWQlN8pdAa5nPc3/v3qVRdClqD0MDbP+Yb+Y7O0FHOn
 50zz6VweP4hyFq9RXIblFBAPlHIdHhjek2mTG+uzBjlhv8wzSvJWBSU6ky+Xe+HJeY3I
 mVhiJHm+Jp4Udu1HYWrmdpyVBgX/dI/hQoNCXYQNHPaGtICGptqClGA7Yw3T/92cAyiQ
 McefuKeNsQhos1grGnL20aS/zc4PaIJ30rCP7PHrGeXFasI3r7mQHDxdf4KkNoD1VGXY
 +RaRGvlNEgT/ULjeS3iS3qo8C4XJqds4prkeMKOAFh67RyMuZs9QqsyPQ4aq1xRa4jjM
 BU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SD1HO9bA5bz7qXyxlfc0od+HuDhwW47hZC2wcYEnJgM=;
 b=qasq0F134QnLafyU7gngCk1cE17T5uIJ6886t0xf7DlkYRSuTX9f051T9/2+N/Cyxv
 WSUyi3ovtVrzsPn4QuFEWeBhWwxsGM4d6PtnzgYkzdcRlL4yInIMHHgaKw6oZIhkOLEz
 qQ/Re3Pi4EfO9Odq3F9lAI+KpZ5EJ//zh9VflZ0pxzdrJv3LaiZZzDGKX04Mv9j3Gxdl
 sgyrgSRYvRbHrduWTSMwB/B5M1T0NaRbHU6o9xoJQt1Rjt3cLaro9Zh6HbzsGEpEFg2n
 tdZzhuzbNJsC3Hkr/MSvWiAZt/o6pSNjT6j9g75crSkFRaKgoq9MOe5uPRjH36vV19zY
 ApcQ==
X-Gm-Message-State: APjAAAVnb9SkN0C3+YHOqIPQENkXwIymFZ4r2L2AGkaoOEW28hGFiLgF
 RZyoC/UcQhNpHzMm+hvYBZ9Eyw/2fZU87Q==
X-Google-Smtp-Source: APXvYqw0vZgiPZU0gDoisDzX/jpxi3Uf2Zx4XBUvysvbz3mktM6AA1LJzwHs8EFXi8vzG5oE4GY7zw==
X-Received: by 2002:a63:6cc9:: with SMTP id
 h192mr10054753pgc.339.1562406419023; 
 Sat, 06 Jul 2019 02:46:59 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id p23sm13493091pfn.10.2019.07.06.02.46.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:46:57 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v4 0/6] powerpc: implement machine check safe memcpy
Date: Sat,  6 Jul 2019 15:16:41 +0530
Message-Id: <20190706094647.15427-1-santosh@fossix.org>
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
  powerpc/mce: Bug fixes for MCE handling in kernel space
  powerpc/memcpy: Add memcpy_mcsafe for pmem

Reza Arbab (2):
  powerpc/mce: Make machine_check_ue_event() static
  powerpc/64s: save r13 in MCE handler (simulator workaroud)

Santosh Sivaraj (2):
  powerpc/mce: Handle UE event for memcpy_mcsafe
  powerpc: add machine check safe copy_to_user

 arch/powerpc/Kconfig                 |   1 +
 arch/powerpc/include/asm/mce.h       |   7 +-
 arch/powerpc/include/asm/string.h    |   2 +
 arch/powerpc/include/asm/uaccess.h   |  14 ++
 arch/powerpc/kernel/exceptions-64s.S |   1 +
 arch/powerpc/kernel/mce.c            |  11 +-
 arch/powerpc/kernel/mce_power.c      |  41 +++--
 arch/powerpc/lib/Makefile            |   2 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S  | 239 +++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/ras.c |   6 +-
 10 files changed, 304 insertions(+), 20 deletions(-)
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S

-- 
2.20.1

