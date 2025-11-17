Return-Path: <linuxppc-dev+bounces-14220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6DC653ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 17:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJm0bl7z30WF;
	Tue, 18 Nov 2025 03:50:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763398247;
	cv=none; b=MroFgDrl+UpGiGnOwFM9EiY9WEXKb76Jt6HUbSXCiEzk45TvzhbakenOHvFSWiGAxffiYV50pt9QTNVk72mO0emC5w0KU7AATUFH0iEwP1xAbmubEmi5iQ6nPLjKgh7xXZFg7YXRMMuuUpbCTLCALuq+SKUUzN5yIFLE2/gUd0ai2G70Fpzd9jLxqJsTOaDpXOtne2Cw3Z8RNZ1v96dpp9cje+FLMjWAGhlsDT6vvg0rgI8NqO3Vejji67hCuUPCbO62R4twDrL+8fU6UStaApnHkX5Fv7p5d9aTDfXCecREriVJfx5fqumR/iUxXIthuc8n0O5zwq+JAFG2G9kOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763398247; c=relaxed/relaxed;
	bh=nLV3NkOOmHkUOe90AKSsOXWOaezG1qkJDx/FKsmIshM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZLUjR5/V4sBq4nI78JbF25h7pHMt6zWrgabR95lQSbF144Dbm1XcnBbb3QxDw/GJdiA3+oLXCgns5kHyfogVJXUJriiOD+GI2vLOqocPDCJQM1ZL8yi92jb6D00QrPEYiMZrAG9UBrqpGqT4zD0cP8jLhYi16aY0i0La5fddKPn0R3fFFhtxG5QTYbIWxG5IaBTx7Fa3JwouEPse+A+aO0Omb2feJyUxRFJzCVsGDbqt8ZqZgBR8TTCKeiNyg17677ZCaQlpNJ+6xN1tHWg4ELaOutEAWF1J55AzX669F+9VWX8v1KXRc/gJ13qfy5hnYj+aCuHq4US7r5gPvHgVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJl1gZ2z2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 03:50:47 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9D953HZVz9sSK;
	Mon, 17 Nov 2025 17:44:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWUAGZWJZEEK; Mon, 17 Nov 2025 17:44:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9D952NXHz9sS8;
	Mon, 17 Nov 2025 17:44:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CC7E8B769;
	Mon, 17 Nov 2025 17:44:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TzQbKMy7QXZa; Mon, 17 Nov 2025 17:44:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C93EF8B763;
	Mon, 17 Nov 2025 17:44:07 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nichlas Piggin <npiggin@gmail.com>,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/4] uaccess: Prepare for masked user access on powerpc
Date: Mon, 17 Nov 2025 17:43:40 +0100
Message-ID: <cover.1763396724.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3522; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=WGqKFA3mz9XHJ6cj5G5VuhtGqL7z2AHwH/JWwrDAKcU=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRKB+x//GA1v1ClgdYODW2ZTXLbzU/ZRjV/eKQu6mewe ZpfUUFuRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZjIrP2MDE+3/HiwSHXz054e sW9T6m8y2UyYrVbctHBZQWh6hr3ILzlGhs8i3SbnnRO3ckQYW04rkjo930th+7PFh0R8ehe170m JYAEA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is v5 of the series "powerpc: Implement masked user access". This
version only includes the preparatory patches to enable merging of
powerpc architecture patches that depend on them on next cycle.

It applies on top of commit 6ec821f050e2 (tag: core-scoped-uaccess)
from tip tree.

Thomas, Peter, could you please take those preparatory patches
in tip tree for v6.19, then Maddy will take powerpc patches
into powerpc-next for v6.20.

Masked user access avoids the address/size verification by access_ok().
Allthough its main purpose is to skip the speculation in the
verification of user address and size hence avoid the need of spec
mitigation, it also has the advantage to reduce the amount of
instructions needed so it also benefits to platforms that don't
need speculation mitigation, especially when the size of the copy is
not know at build time.

Patches 1 and 2 are preparing to clean-up some redundant barrier_nospec()
introduced by commit 74e19ef0ff80 ("uaccess: Add speculation barrier
to copy_from_user()"). To do that, a speculation barrier is added to
copy_from_user_iter() so that the barrier in powerpc raw_copy_from_user()
which is redundant with the one in copy_from_user() can be removed. To
avoid impacting x86, copy_from_user_iter() is first converted to using
masked user access.

Patch 3 convert put_cmsg() to scoped user access.

Patch 4 replaces remaining wrong calls to masked_user_access_begin()
with calls to masked_user_read_access_begin() and
masked_user_write_access_begin() to match with user_read_access_end()
and user_write_access_end().

Entire series is availiable at https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux branch masked-uaccess

Changes in v5:
- Taken comments from tglx
- Only include core preparatory patches, powerpc patches are kept for following kernel development cycle
- Reworded patch 1 to make it more explicit it needs to come before patch 2
- Added patch 3 to convert put_cmsg() to scoped user access instead of just fixing the direction of the uacess
- Renamed patch 4 as it now only handles fonctions from lib/strn*.c

Changes in v4:
- Rebased on top of commit 6ec821f050e2 (tag: core-scoped-uaccess) from tip tree
- Patch 3: Simplified as masked_user_read_access_begin() and masked_user_write_access_begin() are already there.
- Patch 10: Simplified mask_user_address_simple() as suggested by Gabriel.

Changes in v3:
- Rebased on top of v6.18-rc1
- Patch 3: Impact on recently modified net/core/scm.c
- Patch 10: Rewrite mask_user_address_simple() for a smaller result on powerpc64, suggested by Gabriel

Changes in v2:
- Converted copy_from_user_iter() to using masked user access.
- Cleaned up powerpc uaccess function to minimise code duplication
when adding masked user access
- Automated TASK_SIZE calculation to minimise use of BUILD_BUG_ON()
- Tried to make some commit messages more clean based on feedback from
version 1 of the series.

Christophe Leroy (4):
  iov_iter: Convert copy_from_user_iter() to masked user access
  iov_iter: Add missing speculation barrier to copy_from_user_iter()
  scm: Convert put_cmsg() to scoped user access
  lib/strn*,uaccess: Use masked_user_{read/write}_access_begin when
    required

 lib/iov_iter.c          | 22 +++++++++++++++++-----
 lib/strncpy_from_user.c |  2 +-
 lib/strnlen_user.c      |  2 +-
 net/core/scm.c          | 20 +++++++-------------
 4 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.49.0


