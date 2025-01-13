Return-Path: <linuxppc-dev+bounces-5134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865D0A0B1AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWmDG24b4z3cCh;
	Mon, 13 Jan 2025 19:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736758206;
	cv=none; b=HoBj/Nrx67V/sarbTiV33Rjl09DIR80lw+Sa51IlJIbYyIuvmYF9QEPjMEV4chXq9ZO3sZrSddqfOYI0SAZ7pRKTMVqFQZfcAbo6VhSps6Q4VNdc30Eaatu0L9IqvKImMFgo+zoVIA2ZG7D9p7Wm7yVWdS788+l89erqLlA5Abv90gzB8x/WF6u6nLOrCaiGomCqG8x92zxlSn32SxqOtXCISYUDINf8I56CkpbBn6CuRDr4FBEsAV+BEVcqKCxSXSU55QQQKkQkNlSI+ovMzxVbaTR/VqPjvWZ7F/YaC0cO1XQtZYoGaXrAhypXSwvKeKIzHT9MimIWNdcSP/pAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736758206; c=relaxed/relaxed;
	bh=K31QpTMQU7qS4G/3zYm/ivxKpwRUp4T67ZNLDWr1OOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mjzmyBlzrWP3E3etk9eheyXCQinm46V6Q1c27ZiWcvC6gpLroH5IMHbiE103nJDA0CVLuYw6Jb24NYi/ByFDuzlI6iP6PLho6G2cctn+ikBqW2g+8vMM81Dc+SF0+u9P92Q0jT2tzH2QWvjWPmskgF0rMDYs2ntz8o5bnw6kZRRd/D6lSpjvWp5HYpGvjQsrOyhUJ1px3lqMTYaNHqN8G9OixkjxH9z6jLZ/2RQjSZMu0UgL6P+nEG6JK1kvsB7E8DKJjhqrgeC5VosFUWdILPiJw1PPRLfpyKAJA4OChS7W2Crb0P4mF2kcEMB5IZHZuT+lWtVAH7oBWSqVbhy0og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWmDF11d8z3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YWlxx0DNFz9sRr;
	Mon, 13 Jan 2025 09:37:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w76OwdcTENrn; Mon, 13 Jan 2025 09:37:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YWlxw6dj0z9sRk;
	Mon, 13 Jan 2025 09:37:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D440C8B764;
	Mon, 13 Jan 2025 09:37:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zZzy_d-axCZi; Mon, 13 Jan 2025 09:37:40 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 750F08B763;
	Mon, 13 Jan 2025 09:37:40 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] select: Fix unbalanced user_access_end()
Date: Mon, 13 Jan 2025 09:37:24 +0100
Message-ID: <a7139e28d767a13e667ee3c79599a8047222ef36.1736751221.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736757445; l=1345; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=GfLmI1oWTT5uRUR64Gl4CbPAl2bkR1SyenD+AV/4gok=; b=9CX9VONXbPj7xJyUWDM8Nk8fBIzdepNT6o+XxKeNrilu+ZzM4EpHCQ/SIUXNUN0+jMoe/QLPJ eBhPbM1+a6kCtU2dPS2rhfgKmldZ65AqaPKoRKZYFtvn4ainrXLJfU2
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

While working on implementing user access validation on powerpc
I got the following warnings on a pmac32_defconfig build:

	  CC      fs/select.o
	fs/select.o: warning: objtool: sys_pselect6+0x1bc: redundant UACCESS disable
	fs/select.o: warning: objtool: sys_pselect6_time32+0x1bc: redundant UACCESS disable

On powerpc/32s, user_read_access_begin/end() are no-ops, but the
failure path has a user_access_end() instead of user_read_access_end()
which means an access end without any prior access begin.

Replace that user_access_end() by user_read_access_end().

Fixes: 7e71609f64ec ("pselect6() and friends: take handling the combined 6th/7th args into helper")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 fs/select.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index e223d1fe9d55..7da531b1cf6b 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -786,7 +786,7 @@ static inline int get_sigset_argpack(struct sigset_argpack *to,
 	}
 	return 0;
 Efault:
-	user_access_end();
+	user_read_access_end();
 	return -EFAULT;
 }
 
@@ -1355,7 +1355,7 @@ static inline int get_compat_sigset_argpack(struct compat_sigset_argpack *to,
 	}
 	return 0;
 Efault:
-	user_access_end();
+	user_read_access_end();
 	return -EFAULT;
 }
 
-- 
2.47.0


