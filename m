Return-Path: <linuxppc-dev+bounces-590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5534960460
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 10:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtLHV2bdCz2yRM;
	Tue, 27 Aug 2024 18:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724747206;
	cv=none; b=b2LBHFMsI0eOFxpUyaQmmuFcJmypUAr78vQpCmbQ3WzLr1ycWH9FgZwt3Ys3ven+s9PuAsHq4BF40l0vGA32LrONvxaoCbe/y/jq9froaPeLfwpTGOhnEj+xvSokmYnwX+QlkC6rDOjE9ajdKA5rfBxFflK5OOjd0cgxiXkFUiQ1PQzBMKYMoUosVsr4y3kFr9gWHzLLrjP7VCQbU9CW+OmxVHu6LFCZ3mcSSQILLF0tmentW+2uG1o63y0ee8IHHQHMMu8viwzIbSFLc+g7FkPlch7Gbn0WjgadPghVU7dt6oobE6VyvmQZOHdj0hUHLL+RoOaRxqIC2C/RmaEK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724747206; c=relaxed/relaxed;
	bh=+US9x+xhjl+BdlXk/gfdrODsuhhOirzXYczcpZbJWPI=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=Vi8FWYPgX+kORYk1wr3iABoOH+eRQqKnO4piUzoAaVr5ocChKD48qMGfDCRpNQJPNhOVKJKnkdkBum6jYTSQKF+fgvJnxGoZ+rFvptpRXsDqJv/HKL6XjFe6iIrg/RQcSO6JBEC7JDaF3vinBSGaw8KABMr+tuD5slPyEM1JojGyRipX8q52BmShTnYE+QP2BjJxOf5ERGMZpA80F10vlZPR/uOfD4n6FkkkSaRTpyJKteUV9w/SMdO6nsClHrsfg2sdHJpDdbMzdBXN+waCD/fIWDrpT3WuB1hrSWJs7uys10UsZ/xH5zf4I3LLVBA2/f09hD/JqaFdHpI79oMW9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtLHV0CPvz2yPj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 18:26:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtLHN1ly9z9sRs;
	Tue, 27 Aug 2024 10:26:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mhh1S0ena9Vk; Tue, 27 Aug 2024 10:26:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtLHN10Zcz9sRk;
	Tue, 27 Aug 2024 10:26:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 118488B77B;
	Tue, 27 Aug 2024 10:26:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZKjKsRV7tgiQ; Tue, 27 Aug 2024 10:26:40 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO19727.IDSI0.si.c-s.fr [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 67AAD8B763;
	Tue, 27 Aug 2024 10:26:39 +0200 (CEST)
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
Subject: [PATCH] random: vDSO: Redefine PAGE_SIZE and PAGE_MASK
Date: Tue, 27 Aug 2024 10:26:28 +0200
Message-ID: <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
References: 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724747190; l=1185; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VrUjwEsvjnm9x92ftet3dAaDiU/lOPFlBddTh4Jimzg=; b=kXAukdoV22AMsdQQpQEpkGpxMPMlzm7uRM0sQw9po6PRu9HvBgS2oHyJjKNPLjhmEOZYsqrhO N3vOjjEuqsWD8DT3YN2IIqXDZod7JASfOWe/U5my37En5+alm+LgojT
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Using PAGE_SIZE and PAGE_MASK in VDSO requires inclusion of
page.h and it creates several problems, see
commit 8b3843ae3634 ("vdso/datapage: Quick fix - use asm/page-def.h
for ARM64") and commit cffaefd15a8f ("vdso: Use CONFIG_PAGE_SHIFT in
vdso/datapage.h").

Redefine PAGE_SIZE and PAGE_MASK based on CONFIG_PAGE_SHIFT.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Use local consts instead of _PAGE_SIZE and _PAGE_MASK macros that are already defined by some architectures.

v4: undefine and redefine PAGE_SIZE and PAGE_MASK
---
 lib/vdso/getrandom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index f1643656d0b0..e5968ed141cb 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -14,6 +14,11 @@
 #include <asm/unaligned.h>
 #include <uapi/linux/mman.h>
 
+#undef PAGE_SIZE
+#undef PAGE_MASK
+#define PAGE_SIZE	(1UL << CONFIG_PAGE_SHIFT)
+#define PAGE_MASK	(~(PAGE_SIZE - 1))
+
 #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
 	while (len >= sizeof(type)) {						\
 		__put_unaligned_t(type, __get_unaligned_t(type, src), dst);	\
-- 
2.44.0


