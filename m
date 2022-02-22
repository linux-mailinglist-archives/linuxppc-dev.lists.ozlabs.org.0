Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9E4BF5E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 11:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2wWD3V1Jz3cYR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 21:33:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2wVQ2TXdz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 21:33:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K2wVB5lsJz9sS4;
 Tue, 22 Feb 2022 11:32:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GgEn6udiCup; Tue, 22 Feb 2022 11:32:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K2wV93dcWz9sSN;
 Tue, 22 Feb 2022 11:32:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B34F8B783;
 Tue, 22 Feb 2022 11:32:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Gw8BlweLiiqu; Tue, 22 Feb 2022 11:32:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18C7A8B764;
 Tue, 22 Feb 2022 11:32:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21MAWeWM1075957
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 11:32:40 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21MAWdo71075955;
 Tue, 22 Feb 2022 11:32:39 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aaron Tomlin <atomlin@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Jessica Yu <jeyu@kernel.org>
Subject: [PATCH v4 0/6] Allocate module text and data separately
Date: Tue, 22 Feb 2022 11:32:14 +0100
Message-Id: <cover.1645525635.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645525927; l=2322; s=20211009;
 h=from:subject:message-id; bh=ylAL86OcQDmaf/79jjmRMYu8EaHsQl69CI8Wp+NgxRs=;
 b=N/0ZMxBg+GwkjabUyTrFxxthQkecVcI/2rmKrsOmpW7+8o/K+MJvyH4Y4zRqbsKdvtHrxbkRbuAl
 +TxAkjhwCMNIBYD+J51inrtMQ3qgdvYHu55ElJ/ti5hl2To48geV
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series applies on top of Aaron's series "module: core code clean up" v6, plus the 4 fixups I just sent:
- Fixup for 54f2273e5fef ("module: Move kallsyms support into a separate file")
- Fixup for e5973a14d187 ("module: Move strict rwx support to a separate file")
- Fixup for 1df95c1b9fb2 ("module: Move latched RB-tree support to a separate file")
- Fixup for 87b31159f78a ("module: Move all into module/")


This series allow architectures to request having modules data in
vmalloc area instead of module area.

This is required on powerpc book3s/32 in order to set data non
executable, because it is not possible to set executability on page
basis, this is done per 256 Mbytes segments. The module area has exec
right, vmalloc area has noexec. Without this change module data
remains executable regardless of CONFIG_STRICT_MODULES_RWX.

This can also be useful on other powerpc/32 in order to maximize the
chance of code being close enough to kernel core to avoid branch
trampolines.

Changes in v4:
- Rebased on top of Aaron's series "module: core code clean up" v6

Changes in v3:
- Fixed the tree for data_layout at one place (Thanks Miroslav)
- Moved removal of module_addr_min/module_addr_max macro out of patch 1 in a new patch at the end of the series to reduce churn.

Changes in v2:
- Dropped first two patches which are not necessary. They may be added back later as a follow-up series.
- Fixed the printks in GDB

Christophe Leroy (6):
  module: Always have struct mod_tree_root
  module: Prepare for handling several RB trees
  module: Introduce data_layout
  module: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
  module: Remove module_addr_min and module_addr_max
  powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and
    8xx

 arch/Kconfig                |   6 +++
 arch/powerpc/Kconfig        |   1 +
 include/linux/module.h      |   8 +++
 kernel/debug/kdb/kdb_main.c |  10 +++-
 kernel/module/internal.h    |  13 +++--
 kernel/module/kallsyms.c    |  18 +++----
 kernel/module/main.c        | 103 +++++++++++++++++++++++++++---------
 kernel/module/procfs.c      |   8 ++-
 kernel/module/strict_rwx.c  |  10 ++--
 kernel/module/tree_lookup.c |  28 ++++++----
 10 files changed, 149 insertions(+), 56 deletions(-)

-- 
2.34.1

