Return-Path: <linuxppc-dev+bounces-583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB51796031E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtK4l0mJBz2yWK;
	Tue, 27 Aug 2024 17:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724743943;
	cv=none; b=Yrn9+Zi9K31f9Mi3FZXhIWp1N8czGsb4uAtGH6x66Pj2efEI/OqHG1zJQp/+3Jo5H++fZLk0Zl7WsJlQIxaAHJuZhd14nbFRAse0Xn479JmPn3+MXHsImmyigWM/YLoWD/XnaS5Iy1lo6Sp6LqWEcQsBEh+FfusHYw6/GQK0E05go9dKjpX7NnKoMDkn1tIFGqkM9uf6uFdT92UmBDPZCmT0AhzFNwYcUfDfOweMkI8GrpsDp/oeHwDow7pnDlo6ECSjCt+JNd3IzIaOaQBqevqZzjbVNza2Ft9CYls6ObhNwznib+AhgGvAYpoc+OWXUZHpskgRkGdLlCUmKPWRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724743943; c=relaxed/relaxed;
	bh=/sJ3wbge1Lobx3hs7Zy0Pdx/C3fbZwGixlyYQDyQfMM=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=EgkJWsX/Flnu4e26Z0NThfU4rmPZPbp3IL9IQHIIlJaUlrrPACzzwlz79ub0IZ2Kii1FrXc1C7L7idLxRS4c7E8QGxTdkxVUU2x8Y0gpi9CmS5eWALhUbMIssHfY6uHf1TqhNZ0eSS+mUv0yM8HA1xohSbvOGgEx8GTf5cGlsiFzeNkvhF5j2jTGiWdsnMlEgE/fss/KxcyJM7cJTluwpRStZfos+JAR3kTl4Kbdqda3MxWvF8rWdJ2ZaDR1ith4uybGtH8oOmduf9osNqBqjtl4oQVMhofheHlFJLBzun7emYqmZ1hRCjKEB1WSGexRdtFPQ8Pbztg0k4cWj8duow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtK4k5nBYz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:32:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtK4R2g5Jz9sRy;
	Tue, 27 Aug 2024 09:32:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7bo799OOrQp; Tue, 27 Aug 2024 09:32:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtK4Q3lVyz9rvV;
	Tue, 27 Aug 2024 09:32:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69D9D8B763;
	Tue, 27 Aug 2024 09:32:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Iq2bPXf9vqy9; Tue, 27 Aug 2024 09:32:06 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO19727.IDSI0.si.c-s.fr [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C22318B77C;
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
Subject: [PATCH 3/4] random: vDSO: Clean header inclusion in getrandom
Date: Tue, 27 Aug 2024 09:31:49 +0200
Message-ID: <8a025e72484467cd34412b20e8638a5982c1867e.1724743492.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724743908; l=2330; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=SyzZtI1+NQ+PNQRnqfr3VckHD6Z85j1Q1O6oyqTDKHY=; b=fSIKr6vEkPCdi8p5zjOImaiMT45fp/h6J0kyMRtTL2z1rmbefSRzhSk4X/1AAHcjDaSyMezbM dK4az5CEdO+CxwxlaFX6vEeo1nTBA2z6W7DA3ar177N5fbvEiNhjFzS
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Building a VDSO32 on a 64 bits kernel is problematic when some
system headers are included. See commit 8c59ab839f52 ("lib/vdso:
Enable common headers") for more details.

Minimise the amount of headers by moving needed items into
dedicated common headers.

Removing linux/time64.h leads to missing 'struct timespec64' in
x86's asm/pvclock.h. Add a forward declaration of that struct in
that file.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Split PAGE_SIZE/PAGE_MASK subject in another patch and explained the forward declaration of 'struct timespec64' in commit message.
---
 arch/x86/include/asm/pvclock.h | 1 +
 include/vdso/helpers.h         | 1 +
 lib/vdso/getrandom.c           | 8 +++-----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/pvclock.h b/arch/x86/include/asm/pvclock.h
index 0c92db84469d..6e4f8fae3ce9 100644
--- a/arch/x86/include/asm/pvclock.h
+++ b/arch/x86/include/asm/pvclock.h
@@ -5,6 +5,7 @@
 #include <asm/clocksource.h>
 #include <asm/pvclock-abi.h>
 
+struct timespec64;
 /* some helper functions for xen and kvm pv clock sources */
 u64 pvclock_clocksource_read(struct pvclock_vcpu_time_info *src);
 u64 pvclock_clocksource_read_nowd(struct pvclock_vcpu_time_info *src);
diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 73501149439d..3ddb03bb05cb 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -4,6 +4,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
 #include <vdso/datapage.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_data *vd)
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 5874e3072bfe..5d79663b026b 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -4,15 +4,13 @@
  */
 
 #include <linux/array_size.h>
-#include <linux/cache.h>
-#include <linux/kernel.h>
-#include <linux/time64.h>
+#include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/unaligned.h>
 #include <asm/vdso/getrandom.h>
-#include <asm/vdso/vsyscall.h>
-#include <asm/unaligned.h>
 #include <uapi/linux/mman.h>
+#include <uapi/linux/random.h>
 
 #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
 	while (len >= sizeof(type)) {						\
-- 
2.44.0


