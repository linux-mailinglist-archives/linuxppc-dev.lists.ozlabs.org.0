Return-Path: <linuxppc-dev+bounces-11228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A192B326B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Aug 2025 05:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c834K4zvGz3dBm;
	Sat, 23 Aug 2025 13:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755921041;
	cv=none; b=HP8KkGgh90GJBE1oEY+pVksU20Jux10u998LOuAdH84EWMj2wXSRSKoGDTL2ogxt94ve+a1t8wXFrAATx8lwMPgk484EW1NquMK9ewdocTmkSzHozxQBW5XbT2kEbdFv93i5lEkt5+2HPXxhuO6Iy+ATAM8zsv8crXrS8APFKzMG1GaUeX1lY5AKiRwx96e2tC1zNlcvg89+vovOUhk3paaUdjLAod5k3N31qV+16XPtKpymfcOc1041a+6ty9IfIluYz1eSKxTawvbfA7H6OM5pdO2nfOW9D3Ia7rb2KVNuWVsb/81FwcbKbVWZMDJuarak/Z7x0qkjpJKPuIWnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755921041; c=relaxed/relaxed;
	bh=ZDsMiuOA3dT+ZP0vxJtn5aA698LnzwNsTPXPCWK7pa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eta3tW66eLPbte75NAHz47DCGEG4ofxglvGgWrQMGNKTjI0lY/hIWoU5gVCoFePoj5JmRnhEDSIc4LwLBndoN3NTCIojl91RIrkm6Vau1KwqxEXCXhH0LhXAfz1ChxmoO16fArobnSWwJYFc4vST/27ELB1TaK2SpSzNvGdz+80weEN7/UqHp1OAW45MTCJSz8jI0FsD0vsdcnohvn2GHPSmqdYEoc0hfwXSNuJzWqe/MV1zM/jquzUGKyvyPFTvU2spouOKpwuP17XiPhqnA+j2ilMgBkKpjLxBo2tljZBH26cisxwKk+krixwLzRNRutvnFyLt8Pn88UuD615/jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c834K1b2Zz3dBj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 13:50:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7bGn55hjz9sSS;
	Fri, 22 Aug 2025 11:58:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pu_SUmsG5KVL; Fri, 22 Aug 2025 11:58:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7bGn4GTMz9sSR;
	Fri, 22 Aug 2025 11:58:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E0CC8B781;
	Fri, 22 Aug 2025 11:58:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id i33fjxtVLFhx; Fri, 22 Aug 2025 11:58:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 704358B780;
	Fri, 22 Aug 2025 11:58:08 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
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
	Linus Torvalds <torvalds@linux-foundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-block@vger.kernel.org
Subject: [PATCH v2 03/10] uaccess: Add masked_user_{read/write}_access_begin
Date: Fri, 22 Aug 2025 11:57:59 +0200
Message-ID: <7b570e237f7099d564d7b1a270169428ac1f3099.1755854833.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755856678; l=4235; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=dM/STExlfioZ7RWL1LZ1zuqJ7l+Gd1UGLLRM2BZr8VQ=; b=LfW2Zrcf/qOLKMyRJmXFszZyR+auMiNHDPsO2CmZ3LWYtqVMaj5jy30Bs37sk/DpkfpY4ScpY BhH/brYHdWZCciqcb6YZXz9IaYEwPiyBPpDY3g/qom3TrZu+gfvLQVX
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Allthough masked_user_access_begin() is to only be used when reading
data from user at the moment, introduce masked_user_read_access_begin()
and masked_user_write_access_begin() in order to match
user_read_access_begin() and user_write_access_begin().

That means masked_user_read_access_begin() is used when user memory is
exclusively read during the window, masked_user_write_access_begin()
is used when user memory is exclusively writen during the window,
masked_user_access_begin() remains and is used when both reads and
writes are performed during the open window. Each of them is expected
to be terminated by the matching user_read_access_end(),
user_write_access_end() and user_access_end().

Have them default to masked_user_access_begin() when they are
not defined.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Added more explanations in the commit message following comments received.
---
 fs/select.c             | 2 +-
 include/linux/uaccess.h | 7 +++++++
 kernel/futex/futex.h    | 4 ++--
 lib/strncpy_from_user.c | 2 +-
 lib/strnlen_user.c      | 2 +-
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index 082cf60c7e23..36db0359388c 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -777,7 +777,7 @@ static inline int get_sigset_argpack(struct sigset_argpack *to,
 	// the path is hot enough for overhead of copy_from_user() to matter
 	if (from) {
 		if (can_do_masked_user_access())
-			from = masked_user_access_begin(from);
+			from = masked_user_read_access_begin(from);
 		else if (!user_read_access_begin(from, sizeof(*from)))
 			return -EFAULT;
 		unsafe_get_user(to->p, &from->p, Efault);
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1beb5b395d81..aa48d5415d32 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -41,6 +41,13 @@
  #define mask_user_address(src) (src)
 #endif
 
+#ifndef masked_user_write_access_begin
+#define masked_user_write_access_begin masked_user_access_begin
+#endif
+#ifndef masked_user_read_access_begin
+#define masked_user_read_access_begin masked_user_access_begin
+#endif
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 2cd57096c38e..a1120a318c18 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -303,7 +303,7 @@ static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
 	u32 val;
 
 	if (can_do_masked_user_access())
-		from = masked_user_access_begin(from);
+		from = masked_user_read_access_begin(from);
 	else if (!user_read_access_begin(from, sizeof(*from)))
 		return -EFAULT;
 	unsafe_get_user(val, from, Efault);
@@ -318,7 +318,7 @@ static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
 static __always_inline int futex_put_value(u32 val, u32 __user *to)
 {
 	if (can_do_masked_user_access())
-		to = masked_user_access_begin(to);
+		to = masked_user_write_access_begin(to);
 	else if (!user_write_access_begin(to, sizeof(*to)))
 		return -EFAULT;
 	unsafe_put_user(val, to, Efault);
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


