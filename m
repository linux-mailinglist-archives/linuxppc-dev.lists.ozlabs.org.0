Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937D4E432D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 16:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNG0v3RPdz3bWb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 02:41:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNG0W5P6Mz2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 02:40:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KNG0N11Qbz9sTY;
 Tue, 22 Mar 2022 16:40:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJyfPn8qiIjw; Tue, 22 Mar 2022 16:40:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KNG0N08jSz9sTJ;
 Tue, 22 Mar 2022 16:40:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E72108B779;
 Tue, 22 Mar 2022 16:40:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gP6_4JIIv282; Tue, 22 Mar 2022 16:40:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.14])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 995098B773;
 Tue, 22 Mar 2022 16:40:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22MFeRuf1513362
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 16:40:27 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22MFeO8K1513360;
 Tue, 22 Mar 2022 16:40:24 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Date: Tue, 22 Mar 2022 16:40:17 +0100
Message-Id: <cover.1647962456.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647963619; l=1293; s=20211009;
 h=from:subject:message-id; bh=zVm3jdRSxZZDB2iHVRkd9NIm3qIwHXvhJgaUbMNYDAM=;
 b=cAZozjNy5AjYFtKZakL2xbyzBzJARaXbCmSCQcKJaWZKMTflOHOKntyWCOdCLRSi1k8Cmfq1zeNZ
 duXkISWMCFx/XGeTYRC1Pg/RYtMHvq74s6B1Mpu2lfcyZ8zfQJVv
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series reduces by 70% the time required to activate
ftrace on an 8xx with CONFIG_STRICT_KERNEL_RWX.

Measure is performed in function ftrace_replace_code() using mftb()
around the loop.

With the series,
- Without CONFIG_STRICT_KERNEL_RWX, 416000 TB ticks are measured.
- With CONFIG_STRICT_KERNEL_RWX, 546000 TB ticks are measured.

Before this series,
- Without CONFIG_STRICT_KERNEL_RWX, 427000 TB ticks are measured.
- With CONFIG_STRICT_KERNEL_RWX, 1744000 TB ticks are measured.

Before the series, CONFIG_STRICT_KERNEL_RWX multiplies the time
required for ftrace activation by more than 4.

With the series, CONFIG_STRICT_KERNEL_RWX increases the time
required for ftrace activation by only 30%

Christophe Leroy (4):
  powerpc/code-patching: Don't call is_vmalloc_or_module_addr() without
    CONFIG_MODULES
  powerpc/code-patching: Speed up page mapping/unmapping
  powerpc/code-patching: Use jump_label for testing freed initmem
  powerpc/code-patching: Use jump_label to check if poking_init() is
    done

 arch/powerpc/include/asm/code-patching.h |  2 ++
 arch/powerpc/lib/code-patching.c         | 37 +++++++++++++++---------
 arch/powerpc/mm/mem.c                    |  2 ++
 3 files changed, 28 insertions(+), 13 deletions(-)

-- 
2.35.1

