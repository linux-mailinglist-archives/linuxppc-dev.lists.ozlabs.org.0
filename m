Return-Path: <linuxppc-dev+bounces-581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3996031B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtK4Y3JtJz2yD5;
	Tue, 27 Aug 2024 17:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724743933;
	cv=none; b=V//Zb8uzXvI3LBAbes3QPJ+ag1eRqCdXQDb/NTbr/1qzD9r03BOsYzg3YOVCTJivXi3jsMm6wtb0o7RgA2wA9l504+JWWvHGcxv+breGLh6eqvarJgXZeQ0d9JTdv/ZGy/0MHZjrZ0XSGJUje1+iKsJD7CrJPVvSFMQERoX9sL+pIX8ObAIt7vyB7Pu5h2rVgxE54w+9pFpQkwvp8PMNDTiGNYAXJJLcihKf9BuaX2r1Zt0CJguDr6rkUtTMVt+WNT2IvmUze2nW9QncRfQplg6Ff8JCXWk/cbU4sLcxwDerd1E/nFvpb6WEE9j8UwGNL6eO7ecG/NHNECFdWfrDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724743933; c=relaxed/relaxed;
	bh=sif7IgiJ5FNM15Q3ELj8Pi8FnPDRW+/Wer7b5sNOKo0=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=Z1nEtM+yGOwZiYekQ7sAjuDh9B9RC7tvK6wvp0UH0J+nl0zrURZ49t/46WNI4qHz1B9qgK7zsqFz7608hD9agp+8YFS57zTgEhCrqhCzx9mEuF578DeiewstIvoo051GVxO3nJ/4BmsDOVDqNSksi7kSd0vbcREAmtp8OOkap4dxxZDoGJhYyCyn6GD/wPf/hshKdxP8x30i8QUWaKGv4GMSOewhC7v2AlJ7ebKc4Sn/l2+9VBKIisIb41EHeoqh4ZhEM+92Cy+4I82w+3U+HqOMzXryLhrXqILy6FTef7Pt4rfUn1WHh9M6eJNNzawzYi0kbHAucxNIXct6zUVuNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtK4Y1CRYz2xTq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:32:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtK4P2W7bz9sRk;
	Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiFew2TziKmP; Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtK4P1YDbz9rvV;
	Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FACA8B763;
	Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6YCOSSZW0mJI; Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO19727.IDSI0.si.c-s.fr [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 762398B77C;
	Tue, 27 Aug 2024 09:32:04 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/4] asm-generic/unaligned.h: Extract common header for vDSO
Date: Tue, 27 Aug 2024 09:31:47 +0200
Message-ID: <5b72ae99e07ca3360fccfcec603afac2410e05b6.1724743492.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724743492.git.christophe.leroy@csgroup.eu>
References: <cover.1724743492.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724743908; l=2154; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PMuEkb4wUUODc8BHWuAMDd3O1VO5F7l6ew490+ETezs=; b=ALhlsQl4VRbLc40pb9oImNXUKFq4TqKvoMldqBrkUAl0/m4uIVX4FpBcwGoswPuFUuYHOXd+c o/BH9fC/9j7CTPaDabFIdEbw+1RKWRm2jRJCtiF0ajM9gs5WwqG5KQy
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

getrandom vDSO implementation requires __put_unaligned_t() and
__put_unaligned_t() but including asm-generic/unaligned.h pulls
too many other headers.

Follow the same approach as for most things in include/vdso/,
see for instance commit 8165b57bca21 ("linux/const.h: Extract
common header for vDSO"): Move __get_unaligned_t and __put_unaligned_t
into a new unaligned.h living in the vdso/ include directory.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/asm-generic/unaligned.h | 11 +----------
 include/vdso/unaligned.h        | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 include/vdso/unaligned.h

diff --git a/include/asm-generic/unaligned.h b/include/asm-generic/unaligned.h
index a84c64e5f11e..95acdd70b3b2 100644
--- a/include/asm-generic/unaligned.h
+++ b/include/asm-generic/unaligned.h
@@ -8,16 +8,7 @@
  */
 #include <linux/unaligned/packed_struct.h>
 #include <asm/byteorder.h>
-
-#define __get_unaligned_t(type, ptr) ({						\
-	const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);	\
-	__pptr->x;								\
-})
-
-#define __put_unaligned_t(type, val, ptr) do {					\
-	struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);		\
-	__pptr->x = (val);							\
-} while (0)
+#include <vdso/unaligned.h>
 
 #define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
 #define put_unaligned(val, ptr) __put_unaligned_t(typeof(*(ptr)), (val), (ptr))
diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
new file mode 100644
index 000000000000..eee3d2a4dbe4
--- /dev/null
+++ b/include/vdso/unaligned.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __VDSO_UNALIGNED_H
+#define __VDSO_UNALIGNED_H
+
+#define __get_unaligned_t(type, ptr) ({						\
+	const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);	\
+	__pptr->x;								\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {					\
+	struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);		\
+	__pptr->x = (val);							\
+} while (0)
+
+#endif /* __VDSO_UNALIGNED_H */
-- 
2.44.0


