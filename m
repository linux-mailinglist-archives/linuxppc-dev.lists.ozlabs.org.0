Return-Path: <linuxppc-dev+bounces-14221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64CC653F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 17:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJr4J0gz3bWX;
	Tue, 18 Nov 2025 03:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763398252;
	cv=none; b=SH1WB9YAKEv7SfnHcAd2177+4HhOh5GC6IgRJUxHdiMFLqT7SWagUToN3kw6N82pWxoKqsWsLNi5Ytw00cSU45CK7TS/GxUe4LdCes/m0cxuOAoYk1054LwMjKaCgt/B6wyEVgIkws3rg6u1evDXeJ2kiBttoM2KIJUauq3SorusK29pa9W7tSnMF3GbG4A7W0Dj0aUUdRIrKx86uXyYDR8j0L9twCOlqHsaW/uUWBbGh4ea2wqfChlZRWPCflB+gvYGvKOd54sQmyWBYLxOuCCYXtap3JiftRv6xckxlhIybtawx8IRWhjnpqZnVJKxyepUXcuFiNADmBoBPDibhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763398252; c=relaxed/relaxed;
	bh=pO6k7Jhg9TOBKGhsvcM39j4QsLYtMJCzoIcbeLFZMIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrPMlAismMURG8M4BYMPv3XpqTB9d5XNfz/3YK3x7XXI4m73IYwEKdNBg2iQGaBMIjNL0fPqqFKP25XPrOimun58BTgfkDu7K1gwDoJK9R8Xs0XjN1t41Cynae8hI3LXAm+yBRCKDg4c/5uZWNGo7UO7s/uRQEx57wqHx+LIl52pN6DgoSbkJCd7eAabGbn2SlbMAleyPXgEXKNJmhfRFqS2WSPK/BywSkBVENsLcfWeqzoGMAflVrbeutCiH/gfny8ZjN7b4AzG/lU4YvNaeBaDxjJpPWOTpD14iqgaEQntSeFedD4q+NM58mqOxz6hSw5LAqQ9EzXhkF6OOODOAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJq6jg3z3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 03:50:51 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9D986Dcjz9sTh;
	Mon, 17 Nov 2025 17:44:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODDw4OUpL3tH; Mon, 17 Nov 2025 17:44:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9D98579Gz9sTZ;
	Mon, 17 Nov 2025 17:44:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7F18B763;
	Mon, 17 Nov 2025 17:44:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hO1787tWgDqo; Mon, 17 Nov 2025 17:44:12 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FB1E8B768;
	Mon, 17 Nov 2025 17:44:11 +0100 (CET)
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
Subject: [PATCH v5 3/4] scm: Convert put_cmsg() to scoped user access
Date: Mon, 17 Nov 2025 17:43:43 +0100
Message-ID: <793219313f641eda09a892d06768d2837246bf9f.1763396724.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=G9vSR7KnQqIxN+4o+okHL5tWkQyiUXlrPWVzKylp4RY=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRKB5y4msa79uMdnvb97Ws8Dr5sdLO50Ghlq90Ym1rzX Ofc1FTWjlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjARSyVGhpazbZ9+HNTk3i7v amJmo3boZihrUcvNMkv+VxX/Nl/4F8vI8EOU7U+KU0bAKSa/9293WU7XvRW190pY0r+tVmXBk7d a8wMA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the open coded implementation with the scoped user access
guards.

No functional change intended.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
---
 net/core/scm.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/net/core/scm.c b/net/core/scm.c
index 66eaee783e8b..cd87f66671aa 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -273,17 +273,13 @@ int put_cmsg(struct msghdr * msg, int level, int type, int len, void *data)
 
 		check_object_size(data, cmlen - sizeof(*cm), true);
 
-		if (can_do_masked_user_access())
-			cm = masked_user_access_begin(cm);
-		else if (!user_write_access_begin(cm, cmlen))
-			goto efault;
-
-		unsafe_put_user(cmlen, &cm->cmsg_len, efault_end);
-		unsafe_put_user(level, &cm->cmsg_level, efault_end);
-		unsafe_put_user(type, &cm->cmsg_type, efault_end);
-		unsafe_copy_to_user(CMSG_USER_DATA(cm), data,
-				    cmlen - sizeof(*cm), efault_end);
-		user_write_access_end();
+		scoped_user_write_access_size(cm, cmlen, efault) {
+			unsafe_put_user(cmlen, &cm->cmsg_len, efault);
+			unsafe_put_user(level, &cm->cmsg_level, efault);
+			unsafe_put_user(type, &cm->cmsg_type, efault);
+			unsafe_copy_to_user(CMSG_USER_DATA(cm), data,
+					    cmlen - sizeof(*cm), efault);
+		}
 	} else {
 		struct cmsghdr *cm = msg->msg_control;
 
@@ -301,8 +297,6 @@ int put_cmsg(struct msghdr * msg, int level, int type, int len, void *data)
 	msg->msg_controllen -= cmlen;
 	return 0;
 
-efault_end:
-	user_write_access_end();
 efault:
 	return -EFAULT;
 }
-- 
2.49.0


