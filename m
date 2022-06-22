Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DEB55452D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 12:17:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfSl5BkFz3dw5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 20:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfRW5s9Mz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 20:16:07 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LSfMV2w5KzSh96;
	Wed, 22 Jun 2022 18:12:38 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 18:15:56 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 18:15:56 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH v2 0/5] objtool: Reorganize x86 arch-specific code
Date: Wed, 22 Jun 2022 18:13:39 +0800
Message-ID: <20220622101344.38002-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: x86@kernel.org, arnd@arndb.de, dave.hansen@linux.intel.com, mingo@redhat.com, hpa@zytor.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch set reorganize current x86 related code in objtool, [1-3] move
arch-specific to arch files and extract some common codes, [4] fixes a
cross-compile problem and [5] fixes a call destination search bug.

It make objtool more arch-generic, which makes other patches on different
architectures easier to be reviewed and merged.

Tested on x86 with unwind on kernel and module context.

---
v2 Change:
[5/5] objtool: use arch_jump_destination in read_intra_function_calls
---
Chen Zhongjin (3):
  objtool: Add generic symbol for relocation type
  objtool: Specify host-arch for making LIBSUBCMD
  objtool: use arch_jump_destination in read_intra_function_calls

Madhavan T. Venkataraman (2):
  objtool: Make ORC type code arch-specific
  objtool: Make ORC init and lookup code arch-generic

 arch/x86/include/asm/unwind.h                 |   5 -
 arch/x86/kernel/module.c                      |   7 +-
 arch/x86/kernel/unwind_orc.c                  | 256 +----------------
 arch/x86/kernel/vmlinux.lds.S                 |   2 +-
 .../asm => include/asm-generic}/orc_lookup.h  |  42 +++
 kernel/Makefile                               |   2 +
 kernel/orc_lookup.c                           | 261 ++++++++++++++++++
 tools/objtool/Makefile                        |   2 +-
 tools/objtool/arch/x86/Build                  |   1 +
 tools/objtool/arch/x86/include/arch/elf.h     |   5 +-
 tools/objtool/arch/x86/orc.c                  | 137 +++++++++
 tools/objtool/arch/x86/special.c              |   5 +-
 tools/objtool/check.c                         |  14 +-
 tools/objtool/include/objtool/orc.h           |  17 ++
 tools/objtool/orc_dump.c                      |  59 +---
 tools/objtool/orc_gen.c                       |  79 +-----
 16 files changed, 492 insertions(+), 402 deletions(-)
 rename {arch/x86/include/asm => include/asm-generic}/orc_lookup.h (51%)
 create mode 100644 kernel/orc_lookup.c
 create mode 100644 tools/objtool/arch/x86/orc.c
 create mode 100644 tools/objtool/include/objtool/orc.h

-- 
2.17.1

