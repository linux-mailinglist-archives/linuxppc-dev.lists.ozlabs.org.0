Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7825B700C49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 17:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHtY32zvjz3fjZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 01:51:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHtWg4PnVz3fWj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 01:50:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4QHt5r4h20z9shD;
	Fri, 12 May 2023 17:31:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIDy-JiO_jv1; Fri, 12 May 2023 17:31:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4QHt5r3s9wz9sh9;
	Fri, 12 May 2023 17:31:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 732B18B78C;
	Fri, 12 May 2023 17:31:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id H1LpH-jMWSRN; Fri, 12 May 2023 17:31:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5678D8B763;
	Fri, 12 May 2023 17:31:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 34CFVRlp027559
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 17:31:27 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 34CFVQ9N027555;
	Fri, 12 May 2023 17:31:26 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 0/3] Extend KCSAN to all powerpc
Date: Fri, 12 May 2023 17:31:16 +0200
Message-Id: <cover.1683892665.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683905477; l=837; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=hPBnA5KflZMsLfBVOf1qnFl729hUS0enPhkbxf5HtTs=; b=+rCPMq09lu0PQQBWq0K3cX4hp8o3P5mr2OmgxPEWSSY2TZtz6UHhi0/tZZqKNtNMu8nfSrXT9 2/46XXMIUz7C1yYchavqsPeWJAztLAyhgUonNSsXnrmrAL0V9j9ZI1a
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series enables KCSAN on all powerpc.

To do this, a fix is required to KCSAN core.

Once that fix is done, the stubs can also be removed from xtensa.

It would be nice if patch 1 could go in v6.4 as a fix, then patches 2 and 3
could be handled separately in each architecture in next cycle.

Christophe Leroy (2):
  kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
  xtensa: Remove 64 bits atomic builtins stubs

Rohan McLure (1):
  powerpc/{32,book3e}: kcsan: Extend KCSAN Support

 arch/powerpc/Kconfig          |  2 +-
 arch/xtensa/lib/Makefile      |  2 --
 arch/xtensa/lib/kcsan-stubs.c | 54 -----------------------------------
 kernel/kcsan/core.c           |  2 ++
 4 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 arch/xtensa/lib/kcsan-stubs.c

-- 
2.40.1

