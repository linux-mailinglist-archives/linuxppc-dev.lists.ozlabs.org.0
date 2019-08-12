Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4EF899D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 11:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Vn800QhzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 19:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="eDua6EN6"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466VkS0tfzzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 19:22:55 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id p184so49400274pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6PbBPFQneTnWRSxGV1ZGwptN/j/UovpAnCRf5tW94s=;
 b=eDua6EN6D9snB4k0r7kjlDLSzH1gchP/j6Pee+1mifWl1e6oK+JKWqq805ED4lCkyq
 qfQMyO/z4CPeX6UETEc6lk+BtXNSSbkubvIprtIW9JrxWVcVVE4DbhqIbgGm13sPTb7Z
 dLBmjBh6qiRNRgau/N0Lc4OtwEAybdkMitlqm1bqj091D1QkzlyiztZqlIz+EK2H6NwC
 Cgx9H0S+MVuRb+M3fiXDErJJw/EY3v+vIfWL0ji0s2+pWvdJrDmUHS2/aIL5upVVrQrF
 O9pji0dyTQLH6QFvg1ex6wg2J7pWHci0/xRzXz+A3RpctrG67YsAITw+fShw5zge/TYD
 7FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U6PbBPFQneTnWRSxGV1ZGwptN/j/UovpAnCRf5tW94s=;
 b=cPaijaxUvFH0TMrxFbSDQxd3+L4kUePKTgCc2c8rTxQ8pGdmrFk3VjQ7tfZrZL3LF1
 08jrOXXXCqJjJr/XjrilY//q6vK1NwHcL3CkRHBFQJYx3N7IgIfQBbKJuBi1Ji3Tb+Sz
 948o/RqsDBOchJzg0O/jElwxb5j7E6K+zAO8+nQ6rSnSbDgDBgCwMXFyHrTk960lHoWR
 vSIcnowCvmSz/VnD+eLigVCwZIx1kFwXHUrS5Pi6EEqp2xlObh35dv2IN5fGoC1soMg6
 lz+ToJvXtvuetTpkCRFFx+xcelWl2PySjpFW5yz/reXA/6HhsdE5CZdQJOIY1MUOf55A
 MuPQ==
X-Gm-Message-State: APjAAAX1vbwd0mEj71lPSBatKa+gZuV1hb+KPjyp3yzoqBqMnfuXvWnw
 AtKfL1nuuPcJlKtAD4DfnnPF4UlMAmWdkA==
X-Google-Smtp-Source: APXvYqw/iayZzWl7GAdg0pSTHSaZhH8j+y1/gw4EbFFhNuvIz8boOjfmK89tKaXpcnd2roRtKXcC2g==
X-Received: by 2002:a17:90a:342d:: with SMTP id
 o42mr8711979pjb.27.1565601772156; 
 Mon, 12 Aug 2019 02:22:52 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.75])
 by smtp.gmail.com with ESMTPSA id y188sm10543517pfb.115.2019.08.12.02.22.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 02:22:50 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/7] powerpc: implement machine check safe memcpy
Date: Mon, 12 Aug 2019 14:52:29 +0530
Message-Id: <20190812092236.16648-1-santosh@fossix.org>
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

---
Change-log:
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
Balbir Singh (2):
  powerpc/mce: Fix MCE handling for huge pages
  powerpc/memcpy: Add memcpy_mcsafe for pmem

Reza Arbab (1):
  powerpc/mce: Make machine_check_ue_event() static

Santosh Sivaraj (4):
  powerpc/mce: Schedule work from irq_work
  extable: Add function to search only kernel exception table
  powerpc/mce: Handle UE event for memcpy_mcsafe
  powerpc: add machine check safe copy_to_user

 arch/powerpc/Kconfig                 |   1 +
 arch/powerpc/include/asm/mce.h       |   6 +-
 arch/powerpc/include/asm/string.h    |   2 +
 arch/powerpc/include/asm/uaccess.h   |  14 ++
 arch/powerpc/kernel/mce.c            |  31 +++-
 arch/powerpc/kernel/mce_power.c      |  70 ++++----
 arch/powerpc/lib/Makefile            |   2 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S  | 242 +++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/ras.c |   9 +-
 include/linux/extable.h              |   2 +
 kernel/extable.c                     |  11 +-
 11 files changed, 347 insertions(+), 43 deletions(-)
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S

-- 
2.21.0

