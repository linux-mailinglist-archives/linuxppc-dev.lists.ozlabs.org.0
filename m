Return-Path: <linuxppc-dev+bounces-14218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76469C653D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 17:50:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJZ63Tqz2yw7;
	Tue, 18 Nov 2025 03:50:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763398238;
	cv=none; b=MDEu9BQGcDp6v485ohS8JBmshIctvOfy5nHINB4pk9XyyIwFuHtPTFk9ofeAOXleoY0KNCwh/RUPU/Y4fmj/MJd6rv/ilHrP1hlS75KTnd7r7ToZL5uvzdLQz/g+FndJLzKgXlzXuht51yyo7I0mIrBTjaNmbd+5ahkx2lepvExCNfmXEA/r7nygZtMFFMNNdIAASvFjEuzyUCVbbfNJcsrYLoomj2wXYxXLGd4Ds2npF2E3czYTU2ZTLbI8+tjm2Ush+FTK3y99VNcGDMeDQQDpWCq+1riuYG+oE7NtFBsCZ+KqGSVeI6Nagd/9wBGY1dcoWYdMioGI9QgTvNeodw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763398238; c=relaxed/relaxed;
	bh=+iicG9Pq1j11UZJK5Y7vhOYwtL1RnemGhDyLbjcirJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMrDbkBfQEnXEApYxYiOyiicookub5YF2g0yEH1oGGMTAzNTQ6TsfeYUcZtYJoClQIavsSBGUT0dTcUPOcNatxQ9FH+fwDCocysyMtKLLYXIzXKi4oLLSeRMJIz/s3/PvyNmZsrdfjYdSK34GmQ+kFjLBbcHUfvD4ODnqvfnPyLFTYWNeCYMi2ah8ZDNsMubzEgttz6vd2yPaXyVViZWPlJkyHovM1S4t7VonpZoGcCgJLVp8Yphnzh86/B/queruW0bWwXDgzzVY5aj5LG6pXESThQh+t3u6x7Ukk4m9X/G0mV2WXB0pZ3m35kpHjwggzroaPUQ0ym/UUWuFrHLYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9DJZ0n6zz2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 03:50:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9D964M8Rz9sTQ;
	Mon, 17 Nov 2025 17:44:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rt6ikktw9sm; Mon, 17 Nov 2025 17:44:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9D9638tnz9sSL;
	Mon, 17 Nov 2025 17:44:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 540BA8B763;
	Mon, 17 Nov 2025 17:44:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7sNQuGfP_LfF; Mon, 17 Nov 2025 17:44:10 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 347AE8B768;
	Mon, 17 Nov 2025 17:44:09 +0100 (CET)
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
Subject: [PATCH v5 1/4] iov_iter: Convert copy_from_user_iter() to masked user access
Date: Mon, 17 Nov 2025 17:43:41 +0100
Message-ID: <58e4b07d469ca68a2b9477fe2c1ccc8a44cef131.1763396724.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=rLnSkle9gDtzmk+Xzjh4JTt9WyaHRuH0dl6amNgDsgk=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRKBxw/U/rkPt+bqXsso2+trmi+bHKls0f76bOjvtFBu 98d1L33qqOUhUGMi0FWTJHl+H/uXTO6vqTmT92lDzOHlQlkCAMXpwBMRHkWI8Oc5nubJl3hm2vk sPjTg6ONon2q7p5t0otnK8VZd6aoO8kxMswMeGirabeizWPDTi6RbW2bzzgkp/nacr7ST90TKce xiwsA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Following patch will add missing barrier_nospec() to
copy_from_user_iter(). On some architecture like x86 it might
degrade performance, which would be unfortunate as
copy_from_user_iter() is a critical function.

Convert copy_from_user_iter() to using masked user access on
architecture that support it.

This is similar to what was done for copy_from_user() by
commit 0fc810ae3ae1 ("x86/uaccess: Avoid barrier_nospec()
in 64-bit copy_from_user()")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Changed commit message

v2: New in v2
---
 lib/iov_iter.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 2fe66a6b8789..a589935bf302 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -49,12 +49,16 @@ size_t copy_from_user_iter(void __user *iter_from, size_t progress,
 
 	if (should_fail_usercopy())
 		return len;
-	if (access_ok(iter_from, len)) {
-		to += progress;
-		instrument_copy_from_user_before(to, iter_from, len);
-		res = raw_copy_from_user(to, iter_from, len);
-		instrument_copy_from_user_after(to, iter_from, len, res);
-	}
+	if (can_do_masked_user_access())
+		iter_from = mask_user_address(iter_from);
+	else if (!access_ok(iter_from, len))
+		return res;
+
+	to += progress;
+	instrument_copy_from_user_before(to, iter_from, len);
+	res = raw_copy_from_user(to, iter_from, len);
+	instrument_copy_from_user_after(to, iter_from, len, res);
+
 	return res;
 }
 
-- 
2.49.0


