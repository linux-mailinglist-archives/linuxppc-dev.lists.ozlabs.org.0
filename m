Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6E1D8C5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 02:35:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qxjn0px8zDqN8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 10:35:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QxgS0WKHzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 10:33:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QxgR2Q0Xz9sSc;
 Tue, 19 May 2020 10:33:07 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/7] Base support for POWER10
Date: Tue, 19 May 2020 10:31:50 +1000
Message-Id: <20200519003157.31946-1-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mikey@neuling.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series brings together several previously posted patches required for
POWER10 support and introduces a new patch enabling POWER10 architected
mode to enable booting as a POWER10 pseries guest.

It includes support for enabling facilities related to MMA and prefix
instructions.

Changes from v1:
  - Two bug-fixes to enable prefix and MMA on pseries
  - Minor updates to commit message wording
  - Fixes a build error when CONFIG_KVM_BOOK3S_64_HV is enabled

Alistair Popple (7):
  powerpc: Add new HWCAP bits
  powerpc: Add support for ISA v3.1
  powerpc/dt_cpu_ftrs: Advertise support for ISA v3.1 if selected
  powerpc/dt_cpu_ftrs: Set current thread fscr bits
  powerpc/dt_cpu_ftrs: Enable Prefixed Instructions
  powerpc/dt_cpu_ftrs: Add MMA feature
  powerpc: Add POWER10 architected mode

 arch/powerpc/include/asm/cputable.h      | 16 +++++++++++--
 arch/powerpc/include/asm/mmu.h           |  1 +
 arch/powerpc/include/asm/prom.h          |  1 +
 arch/powerpc/include/asm/reg.h           |  6 +++--
 arch/powerpc/include/uapi/asm/cputable.h |  2 ++
 arch/powerpc/kernel/cpu_setup_power.S    | 20 ++++++++++++++--
 arch/powerpc/kernel/cputable.c           | 30 ++++++++++++++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c        | 26 +++++++++++++++++++-
 arch/powerpc/kernel/prom_init.c          | 12 ++++++++--
 arch/powerpc/kvm/book3s_hv.c             |  3 ---
 10 files changed, 105 insertions(+), 12 deletions(-)

-- 
2.20.1

