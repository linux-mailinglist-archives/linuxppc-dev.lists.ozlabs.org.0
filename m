Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C483B7E52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:47:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD372zMCz3bqF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:47:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BIGOtHsS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BIGOtHsS; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD1m0FWSz2yNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:33 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id f11so1022788plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S9VWd/Xyhk8wJTG60QP+6SPihVPcmznjoUAAWtbv5K0=;
 b=BIGOtHsS4/EvxMytPYVWjPSrAAQ8M3s/zLREVCd0jOeKVzblbswSEF9oDbWIsT+Gyk
 m2M/ekxeeXbIuAAUQwacgxSO126EYiJpNGKa3EuHeO2s0T/trOCiymWsS+Vll1NYeAec
 sFwwCC/LZOkLahaQElm7gXexDBApaiPiaFMI7i7HX4wZJyt1QjmkR44mc1SxOgELBsOi
 8ht1Q0V/HJte18IcXUEIRLwSwbUzO77yr5m+uOOeGMz91C0YFAB3v5XcQbLRrjeu5wSl
 iuIqVkD1ct1y7JTjDKGnqQCyEsaxqWz6DxrCX2pCK5JDf1in7G4tLe2vephm0kEkZp2X
 qkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S9VWd/Xyhk8wJTG60QP+6SPihVPcmznjoUAAWtbv5K0=;
 b=FAA8vUZZ6BfFDr/qKVNrSDkEolsm1AANe+T8e7HApUgfeCvP1TNOohuh1ZEV3BStv+
 +X9epTXM0gIg90CmgNsbwKAdwmWiJNplbySabXRy4TXCiYCrSwKYbE8ELXBsZQ05ETOO
 /sViv5EG82UFH5iJXhshBiIJVVC8UYeVSgfDewB9PMw5yOCHXPCWGW5tFIDzUu9hH+EE
 ABB638fh+ZsyfTUxrQszbrUrdZVRb9QwRwFmvIU0Q9S+1V1ua6HvjHTe0asI7JU+ohb3
 kVMQ+2m2erN7ArXWbZyLmPcAEfa8nC8YOLm/VCAd2LOBbtIMoy/3uTNmI3WV+ehkswF0
 7T5A==
X-Gm-Message-State: AOAM532BkHu5QSsFK1zU4socHjbert1uw52N5zzkVC9FBgPakT5srBZB
 bwTvvXwWkQgOBkq+Kd4lOGdRhzzPl7w=
X-Google-Smtp-Source: ABdhPJxRiUDur8PdeqZEC0UL2wyM5eawIceEWrZLxXjNS+VnjHdEm/s1xWCvsbu7bA2ZWvWbBp9CSQ==
X-Received: by 2002:a17:90b:1209:: with SMTP id
 gl9mr3192952pjb.213.1625039188599; 
 Wed, 30 Jun 2021 00:46:28 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/9] powerpc: fast interrupt exit bug and misc fixes
Date: Wed, 30 Jun 2021 17:46:12 +1000
Message-Id: <20210630074621.2109197-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a bunch of fixes for powerpc next, mostly a nasty hole in fast
interrupt exit code found by Sachin and some other bits along the way
while looking at it.

Since v2:
- Fixed 64e patch 3 to really set exit_must_hard_disable.
- Reworded some changelogs.

Since v1:
- Fixed a bisection compile error due to a fix incorrectly going to
  a later patch.
- Fixed the "add a table of implicit soft-masked addresses" patch to
  include the low scv vector range as a soft-masked table entry. scv
  was the original reason for implicit soft masking, and the previous
  version breaks it. My stress testing was using an image without
  scv glibc unfortunately.
- Fixed a bug with the same patch that would restore r12 with SRR1
  rather than HSRR1 in the case of masked hypervisor interrupts after
  searching the soft-mask table. Again unfortunately my stress testing
  was in a guest so no HV interrupts.

Thanks to Michael for noticing these issues.

- Pulled in the hash page fault interrupt handler fix into this series
  to make the dependencies clear (well it's not exactly dependent but
  assertions introduced later make the existing bug crash more often).

Thanks,
Nick

Nicholas Piggin (9):
  powerpc/64s: fix hash page fault interrupt handler
  powerpc/64e: fix CONFIG_RELOCATABLE build warnings
  powerpc/64e: remove implicit soft-masking and interrupt exit restart
    logic
  powerpc/64s: add a table of implicit soft-masked addresses
  powerpc/64s/interrupt: preserve regs->softe for NMI interrupts
  powerpc/64: enable MSR[EE] in irq replay pt_regs
  powerpc/64/interrupt: add missing kprobe annotations on interrupt exit
    symbols
  powerpc/64s/interrupt: clean up interrupt return labels
  powerpc/64s: move ret_from_fork etc above __end_soft_masked

 arch/powerpc/include/asm/interrupt.h  | 41 +++++++++---
 arch/powerpc/include/asm/ppc_asm.h    |  7 +++
 arch/powerpc/kernel/exceptions-64e.S  | 23 +++----
 arch/powerpc/kernel/exceptions-64s.S  | 64 ++++++++++++++++---
 arch/powerpc/kernel/interrupt.c       |  2 +-
 arch/powerpc/kernel/interrupt_64.S    | 90 ++++++++++++++++++---------
 arch/powerpc/kernel/irq.c             |  1 +
 arch/powerpc/kernel/vmlinux.lds.S     |  9 +++
 arch/powerpc/lib/restart_table.c      | 26 ++++++++
 arch/powerpc/mm/book3s64/hash_utils.c | 24 ++++---
 10 files changed, 212 insertions(+), 75 deletions(-)

-- 
2.23.0

