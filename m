Return-Path: <linuxppc-dev+bounces-9610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB16AE2F54
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 12:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ6fx5fKMz30VM;
	Sun, 22 Jun 2025 20:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750587641;
	cv=none; b=P25h6z+nPkrK4EAtZKuk81lHCfHGhYkaXLMKF5EVQ4VJRHfb6aMWv5lSbilUc/794uQMrGb+i5dUblJcl5/FAgvA8wkyIosAUZ3MioFQW/i04rNkmtpoWGN+u/+eG757BUYsKc8kNg/VljVeVQ6ffq2iI2eVHuv/yjBBOGPOT9cy1gs/boOnTX1MulOwVX1j9K1p4tCJcR1JPaLXEaFTzrpHVntLWHNvQ0PNvG+OxVMlcEhpgOQ/71QV4VJxiw/N5a8N5yaw9Wa5Nql0tubaa5tEc1VkrY9eLfDLzARCKAjlnh3RSrdDhm7iDx96wLuuGFnzFulR6Saw/jfGC83h5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750587641; c=relaxed/relaxed;
	bh=M/o8uCxnyWRqwDvT4Ppcd6cBuXvl3tzAOfkmRNNHsRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtnR/5wqTxo7gxuCmanJaAvNYoXCpFItA46/b7dwZSgGWRHQSleIB+XW3CutOQJ9AiJAbGalmv+1gvDnyad/3h1ZgXZl9lgQH8DtxgFiv9H5mpJpo7XFd0P7xpCdYVoqOdyms8KeQNQeqXl6/HHPAmg/DmhmAqBl+7PGMI2VHmiw8Vf0HiQ5tmD4NK4r+dOHe/v9zUP8vPkCpilOtZoTZNL4zUUbEUEU+Uab0s5lqkKg2YEvOJkCwBQs2jG48ZKnm3b1W+BHj0N+iARli8zAMwmW0W32pSqaFv/hnIpsE+bOuji24igp8uL+vPxpGCzo6bgQO0MT2Qzm9+RZeziLOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ6fx27T8z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 20:20:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQ62n4sxNz9sWb;
	Sun, 22 Jun 2025 11:52:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIyFw4tvJjvf; Sun, 22 Jun 2025 11:52:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQ62n3Qplz9sTD;
	Sun, 22 Jun 2025 11:52:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6704E8B765;
	Sun, 22 Jun 2025 11:52:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SWopfc0YWtyj; Sun, 22 Jun 2025 11:52:49 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A6848B763;
	Sun, 22 Jun 2025 11:52:48 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] powerpc: Implement masked user access
Date: Sun, 22 Jun 2025 11:52:38 +0200
Message-ID: <cover.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750585958; l=2465; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=HySJmJimN0Mbor6aO2XQhe3eawUJ2DpD2MDAE2rsTBw=; b=avw+yxifZez04tL6hY4uI10f64fY7knh0RlaYqBAin24xTC5w1XQBwEkR2nEsI8dapqkvp3tb 3bSsrPI4uwKB/yFAZpo4xgJKt+m/LB7sfSbDkCIdrD3prqpxjkg79xc
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Masked user access avoids the address/size verification by access_ok().
Allthough its main purpose is to skip the speculation in the
verification of user address and size hence avoid the need of spec
mitigation, it also has the advantage to reduce the amount of
instructions needed so it also benefits to platforms that don't
need speculation mitigation, especially when the size of the copy is
not know at build time.

Unlike x86_64 which masks the address to 'all bits set' when the
user address is invalid, here the address is set to an address in
the gap. It avoids relying on the zero page to catch offseted
accesses. On book3s/32 it makes sure the opening remains on user
segment. The overcost is a single instruction in the masking.

First patch adds masked_user_read_access_begin() and
masked_user_write_access_begin() to match with user_read_access_end()
and user_write_access_end().

Second patch adds speculation barrier to copy_from_user_iter() so that
the barrier in powerpc raw_copy_from_user() which is redundant with
the one in copy_from_user() can be removed.

Third patch removes the redundant barrier_nospec() in
raw_copy_from_user().

Fourth patch removes the unused size parameter when enabling/disabling
user access.

Last patch implements masked user access.

Christophe Leroy (5):
  uaccess: Add masked_user_{read/write}_access_begin
  uaccess: Add speculation barrier to copy_from_user_iter()
  powerpc: Remove unused size parametre to KUAP enabling/disabling
    functions
  powerpc: Move barrier_nospec() out of allow_read_{from/write}_user()
  powerpc: Implement masked user access

 arch/powerpc/Kconfig                         |   2 +-
 arch/powerpc/include/asm/book3s/32/kup.h     |   2 +-
 arch/powerpc/include/asm/book3s/64/kup.h     |   4 +-
 arch/powerpc/include/asm/kup.h               |  24 ++--
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |   2 +-
 arch/powerpc/include/asm/nohash/kup-booke.h  |   2 +-
 arch/powerpc/include/asm/uaccess.h           | 140 ++++++++++++++++---
 fs/select.c                                  |   2 +-
 include/linux/uaccess.h                      |   8 ++
 kernel/futex/futex.h                         |   4 +-
 lib/iov_iter.c                               |   7 +
 lib/strncpy_from_user.c                      |   2 +-
 lib/strnlen_user.c                           |   2 +-
 13 files changed, 158 insertions(+), 43 deletions(-)

-- 
2.49.0


