Return-Path: <linuxppc-dev+bounces-14222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD52C65402
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 17:51:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJw3GP8z3bdW;
	Tue, 18 Nov 2025 03:50:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763398256;
	cv=none; b=mpO8zBiFfIPjEHBS5ZTTsg4cUrtwahMyKluA9UnoKy+HLyPKwGAOqr1iZ1fUN3PO1LHXBufZm8v3msEdc+bRcyBMGn2+XRd7ex+jTuChj9mDikEXrMkHO2eEGLBv37U+Mq9mZ8L3Mf1h9jLbYNUcRaHH6yCNIo0UXxSVZ66K/4K3AIo2V5HMsO/h+U5EvMhDpzIkGM+rLVIKjjD0u/c4KGlmGYzWNPKeGu+JgsTltQ1DZup+GFecPNrcY+aCNpw2vHukLBnjJouO31tHgMyoYQJbNxfoGLyU0aG3dSE3rrRm/A1oG4LWmRDUn1FgxH8NNAGCwM07ip3k9isEpspdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763398256; c=relaxed/relaxed;
	bh=YyOTTPcC/RNbKSFI2z0yUWvkIH44N+KJZsdn8cZpWm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBppH3xOIOhx/qxe5KfkvzT2sxIR2/jH2Z0tY6I65t9c6YMdYI2YPMaJ3fF/vz+sKrjnYyodRMm3wafa8paiT3jWd2EOvMtiNMf1lQJm6/nN5HIo5AvI0ZAh31KO0M8SvITL2qfUjAEa6f/3NBBiBaaHlv9IISp2Dip5OAWrOe4YPJv834+M94ereh2bOWhhSP7HiVKwvYuBna8EylvkSLhOrACIUwtp6YClelFBOfBpRnnpc865uskRAED+TV4ZFFn4FrZNkUC0w6BvdB7Tjmxmx/OcV9nLZNzAV3NhT0cHQIJF1wKXZjhFhMq04fAFtoKcaxbKZwhamrgAhORJVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJv5mJhz300F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 03:50:55 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9D9B0fVlz9sTk;
	Mon, 17 Nov 2025 17:44:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eU0hj9tte4dv; Mon, 17 Nov 2025 17:44:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9D996cx9z9sTj;
	Mon, 17 Nov 2025 17:44:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE2E78B763;
	Mon, 17 Nov 2025 17:44:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tff4OGSdT2mn; Mon, 17 Nov 2025 17:44:13 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A48D28B768;
	Mon, 17 Nov 2025 17:44:12 +0100 (CET)
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
Subject: [PATCH v5 4/4] lib/strn*,uaccess: Use masked_user_{read/write}_access_begin when required
Date: Mon, 17 Nov 2025 17:43:44 +0100
Message-ID: <cb5e4b0fa49ea9c740570949d5e3544423389757.1763396724.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763396724.git.christophe.leroy@csgroup.eu>
References: <cover.1763396724.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=qDckhyWd5Xp/iUbxoRJgosMNjecj8byVLupzPsFbxdU=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRKB5zwcf5XZ8nQsPWQR3SBdCH7ipUnHdxv1zv7Ku9On 1xYOe1CRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZjIyQJGhg+x8vzW+28u3+X+ ZFGOZmr8v6hj/g/nf9VfOM1v700nrukM/71WCtXdYlPy+rWCe77xJ9dct9gfnaqndGPERLYczlm gxQkA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Properly use masked_user_read_access_begin() and
masked_user_write_access_begin() instead of masked_user_access_begin()
in order to match user_read_access_end() and user_write_access_end().
This is important for architectures like powerpc that enable
separately user reads and user writes.

That means masked_user_read_access_begin() is used when user memory is
exclusively read during the window and masked_user_write_access_begin()
is used when user memory is exclusively writen during the window.
masked_user_access_begin() remains and is used when both reads and
writes are performed during the open window. Each of them is expected
to be terminated by the matching user_read_access_end(),
user_write_access_end() and user_access_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5:
- Removed net/core/scm.c which is converted to scope user access by previous patch
- Renamed the patch as it now only handles lib/strncpy_from_user.c and lib/strnlen_user.c

v4: Rebased on top of core-scoped-uaccess tag

v3: Rebased on top of v6.18-rc1 ==> change in net/core/scm.c

v2: Added more explanations in the commit message following comments received.
---
 lib/strncpy_from_user.c | 2 +-
 lib/strnlen_user.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index 6dc234913dd5..5bb752ff7c61 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -126,7 +126,7 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (can_do_masked_user_access()) {
 		long retval;
 
-		src = masked_user_access_begin(src);
+		src = masked_user_read_access_begin(src);
 		retval = do_strncpy_from_user(dst, src, count, count);
 		user_read_access_end();
 		return retval;
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 6e489f9e90f1..4a6574b67f82 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -99,7 +99,7 @@ long strnlen_user(const char __user *str, long count)
 	if (can_do_masked_user_access()) {
 		long retval;
 
-		str = masked_user_access_begin(str);
+		str = masked_user_read_access_begin(str);
 		retval = do_strnlen_user(str, count, count);
 		user_read_access_end();
 		return retval;
-- 
2.49.0


