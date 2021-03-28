Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C234BB43
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 08:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7Qpj3PLXz30Gv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 17:31:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZ3ei7zB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TZ3ei7zB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7QpJ5M2pz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 17:31:20 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A43E36197C;
 Sun, 28 Mar 2021 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913076;
 bh=fIYmtiiVahTZKgHaQD+jDuMxYY5AvOy62Q+boojOK1E=;
 h=From:To:Cc:Subject:Date:From;
 b=TZ3ei7zBeAgVBpKeSMgUIfT7cFEsCeH1gjJAc1Xka+xh1tEnN6M+Juhcxj4cMHSJ6
 WmILreZnGkimmxPtbMXMLKfedRa/wD37UVBmGCsKO3FB75rnREvgypwcEkfIe51j4u
 /lAcvsk3EEHh9Hg1GmHcvDQb7ilTxctp3FsxA13LHoejLlR7k2ECSFxo9LF+OTle7G
 sS1dndQX+pK0CxgW0gsgWvaFbWNF+lH/vurb0mQGAd1dG3eq4gg6flYOpQa4HmQrua
 0CR5asMfgeWZ1rL4qzvhyivvy1moujsSCNT4SCYn4sfSp0zU71oleIAtjphFxp9yb1
 MVZVtA9yLHxfA==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH v5 0/7] riscv: Add qspinlock/qrwlock
Date: Sun, 28 Mar 2021 06:30:21 +0000
Message-Id: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv is still using baby spinlock implementation. It'll cause
fairness and cache line bouncing problems. Many people are involved
and pay the efforts to improve it:

 - The first version of patch was made in 2019.1:
   https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r

 - The second version was made in 2020.11:
   https://lore.kernel.org/linux-riscv/1606225437-22948-2-git-send-email-guoren@kernel.org/

 - A good discussion at Platform HSC.2021-03-08:
   https://drive.google.com/drive/folders/1ooqdnIsYx7XKor5O1XTtM6D1CHp4hc0p

Hope your comments and Tested-by or Co-developed-by or Reviewed-by ...

Let's kick the qspinlock into riscv right now (Also for the
architecture which hasn't xchg16 atomic instruction.)

Change V5:
 - Fixup #endif comment typo by Waiman
 - Remove cmpxchg coding convention patches which will get into a
   separate patchset later by Arnd's advice
 - Try to involve more architectures in the discussion

Change V4:
 - Remove custom sub-word xchg implementation
 - Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in locking/qspinlock

Change V3:
 - Coding convention by Peter Zijlstra's advices

Change V2:
 - Coding convention in cmpxchg.h
 - Re-implement short xchg
 - Remove char & cmpxchg implementations

Guo Ren (6):
  locking/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  csky: Convert custom spinlock/rwlock to generic qspinlock/qrwlock
  powerpc/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  openrisc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  sparc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  xtensa: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32

Michael Clark (1):
  riscv: Convert custom spinlock/rwlock to generic qspinlock/qrwlock

 arch/csky/Kconfig                       |   2 +
 arch/csky/include/asm/Kbuild            |   2 +
 arch/csky/include/asm/spinlock.h        |  82 +--------------
 arch/csky/include/asm/spinlock_types.h  |  16 +--
 arch/openrisc/Kconfig                   |   1 +
 arch/powerpc/Kconfig                    |   1 +
 arch/riscv/Kconfig                      |   3 +
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/spinlock.h       | 126 +-----------------------
 arch/riscv/include/asm/spinlock_types.h |  15 +--
 arch/sparc/Kconfig                      |   1 +
 arch/xtensa/Kconfig                     |   1 +
 kernel/Kconfig.locks                    |   3 +
 kernel/locking/qspinlock.c              |  46 +++++----
 14 files changed, 49 insertions(+), 253 deletions(-)

-- 
2.17.1

