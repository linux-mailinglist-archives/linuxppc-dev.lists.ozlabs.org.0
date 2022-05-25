Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C005340DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 17:59:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7bP70Cwyz3cj9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 01:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7bN10Shrz3blR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 01:58:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L7bMm0vPFz9tFM;
 Wed, 25 May 2022 17:58:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQ_6I0Gbe9UZ; Wed, 25 May 2022 17:58:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L7bMk5J8rz9tFN;
 Wed, 25 May 2022 17:58:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D1408B77D;
 Wed, 25 May 2022 17:58:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LUQf5xr7R8yb; Wed, 25 May 2022 17:58:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.180])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 362688B77B;
 Wed, 25 May 2022 17:58:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24PFwQ0V419136
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 17:58:26 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24PFwMYv419135;
 Wed, 25 May 2022 17:58:22 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, peterz@infradead.org,
 aik@ozlabs.ru, sv@linux.ibm.com, rostedt@goodmis.org,
 jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz
Subject: [RFC PATCH v1 0/4] Implement inline static calls on PPC32
Date: Wed, 25 May 2022 17:58:13 +0200
Message-Id: <cover.1653494186.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1653494295; l=1739; s=20211009;
 h=from:subject:message-id; bh=0xhGO3E3H3RXpaD4daFMpbbnZ1xIaAB21QBuFX2pPRY=;
 b=+mUn2iymhvQIjBKVlNw5Pq1rbKIsFcoFdHuJrXIo3yFqDb7rJiTgfLNayexLEBU9BSpxeDhVnsFU
 J0TOxwNFAZbJZv01mNkv9p9fdSBfszS6z0G4FNBnJCEF6v0N+SGK
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

This is first draft for implementing inline static calls on PPC32.

This series applies on top of the series v2 "objtool: Enable and implement --mcount option on powerpc"

For the time being only the case where functions are within 'bl' reach
is supported. Otherwise panic() is invoked.

For the other case, we'll need to use the trampoline we have at startup
before initialising inline static calls. But it seems that at the time
being once inline static calls are initialised we don't know anymore
where the trampoline was.
We'd need to keep the information somewhere (is the static_call_key ?)
We may also need to keep the information for when the trampoline itself
is out of 'bl' reach, in that case there is a trampoline setup by the
compiler and we'll need to remind the location of that trampoline. Guess
it should get saved somewhere when we initialise inline static calls ?

Christophe Leroy (4):
  Revert "objtool: Enable objtool to run only on files with ftrace
    enabled"
  objtool: Add R_REL32 macro
  static_call: Call static_call_init() from start_kernel()
  powerpc/static_call: Implement inline static calls

 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/static_call.h        |  2 +
 arch/powerpc/kernel/static_call.c             | 41 ++++++++++++-------
 init/main.c                                   |  1 +
 scripts/Makefile.build                        |  4 +-
 tools/objtool/arch/powerpc/include/arch/elf.h |  1 +
 tools/objtool/arch/x86/include/arch/elf.h     |  1 +
 tools/objtool/check.c                         | 10 ++---
 tools/objtool/orc_gen.c                       |  2 +-
 9 files changed, 41 insertions(+), 22 deletions(-)

-- 
2.35.3

