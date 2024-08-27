Return-Path: <linuxppc-dev+bounces-582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263F196031C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtK4f38BQz2yN3;
	Tue, 27 Aug 2024 17:32:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724743938;
	cv=none; b=eQbq5WPXweoVtxBeAsxJitDPiec1CvJ6Qaytt5dI5HRP+IVA+puiilBT1mHoGWCeg9Ggu43YqU/YR3ONiXYu+BBk1CiHWX4MTztZeXJIQBcXmwiHUjCokOoYGMUDO7YvYdmhoT1QJCqW/iFnBmCo1tFDUEwoWkhii7zs5wMTsbcRvJPZQDmWTvX8PmqTwj9571NVGYAYa8b1idyJ6RGNL6jq5Xn+CZEKBKRWaocToE9WTTn6yKK/sRL9Lxpv3Z7Ft07pFsLuzW9F3vf3nuAPFg0sOcDq6ADW8fpjWQ5LmLOqJ6P8sN5QzpBbLirxHPEqKRty6+wnQLrL5Pi2M+b0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724743938; c=relaxed/relaxed;
	bh=bwQFT9MQW6kUGs0KyN3zBFzkBz1YOo18PXpdqkfvcvQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=jC0bfOpk64QU7/UvLwaeCleqgf89nCuqVXm6KKRTIcw3z/Zz1CKCanhxI8cR9bdJA064vZGj8RaXYlTD2o+EWEEIOjBofFUc/pI/Rikses1quGW9fgCbdm4ycnyYNm8dvRi4jnsUO0wWgLOqoCYsEqRYdIo7STkEj1iu/atkGSb89GTLBY/lRzMhT+Ou6AzSIYOcOZ8Z/Yp59cOxy9pJ+GHD1/s71BCTBwdd0+LK+U5BRcRqccnAtfFAZ30E+2e1On5A7mhdntKpv1Y/iZkRs79P6d/0YPs3Eo0Aa5morU3CZj8NN1FxFwJsWY8JPwAQey7Dj178s/+KkPWkqPVbng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtK4f11fCz2xTq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:32:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtK4Q27v3z9sRr;
	Tue, 27 Aug 2024 09:32:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPCY-APdZu3N; Tue, 27 Aug 2024 09:32:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtK4P6G7Dz9rvV;
	Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C04A08B763;
	Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hMVUKRzp0jMh; Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO19727.IDSI0.si.c-s.fr [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 21CE18B77B;
	Tue, 27 Aug 2024 09:32:05 +0200 (CEST)
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
Subject: [PATCH 2/4] random: vDSO: Don't use PAGE_SIZE and PAGE_MASK
Date: Tue, 27 Aug 2024 09:31:48 +0200
Message-ID: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724743908; l=2168; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=o9YWHrFdPzZGidRnEzU0vKK3U5uhwWoxkBlG7VaI1nw=; b=Jzdk8bA+JLpbtdo4RXJTRUl8shLVBGDmieb0laeJWctzJnZLzRtRPVKLcEx9a6LzVWBohY/cA vXk1XywBvIjAOGdicr0AwQftC4aMQ2oC7T59qsxhVCJj1BnMW3L0h2/
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Using PAGE_SIZE and PAGE_MASK in VDSO requires inclusion of
page.h and it creates several problems, see
commit 8b3843ae3634 ("vdso/datapage: Quick fix - use asm/page-def.h
for ARM64") and commit cffaefd15a8f ("vdso: Use CONFIG_PAGE_SHIFT in
vdso/datapage.h").

An easy solution would be to define PAGE_SIZE and PAGE_MASK in vDSO
when they do not exist already, but this can be misleading.

So follow the same approach as commit cffaefd15a8f ("vdso: Use
CONFIG_PAGE_SHIFT in vdso/datapage.h") and exclusively use
CONFIG_PAGE_SHIFT. To avoid too much ugliness, define local consts
that constains the calculated page size and page mask.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Use local consts instead of _PAGE_SIZE and _PAGE_MASK macros that are already defined by some architectures.
---
 lib/vdso/getrandom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index f1643656d0b0..5874e3072bfe 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -65,7 +65,9 @@ static __always_inline ssize_t
 __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_t len,
 		       unsigned int flags, void *opaque_state, size_t opaque_len)
 {
-	ssize_t ret = min_t(size_t, INT_MAX & PAGE_MASK /* = MAX_RW_COUNT */, len);
+	const unsigned long page_size = 1UL << CONFIG_PAGE_SHIFT;
+	const unsigned long page_mask = ~(page_size - 1);
+	ssize_t ret = min_t(size_t, INT_MAX & page_mask /* = MAX_RW_COUNT */, len);
 	struct vgetrandom_state *state = opaque_state;
 	size_t batch_len, nblocks, orig_len = len;
 	bool in_use, have_retried = false;
@@ -84,7 +86,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 	}
 
 	/* The state must not straddle a page, since pages can be zeroed at any time. */
-	if (unlikely(((unsigned long)opaque_state & ~PAGE_MASK) + sizeof(*state) > PAGE_SIZE))
+	if (unlikely(((unsigned long)opaque_state & ~page_mask) + sizeof(*state) > page_size))
 		return -EFAULT;
 
 	/* Handle unexpected flags by falling back to the kernel. */
-- 
2.44.0


