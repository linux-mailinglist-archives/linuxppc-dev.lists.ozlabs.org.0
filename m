Return-Path: <linuxppc-dev+bounces-725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4ED963C79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:16:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXdT0MK5z2ytR;
	Thu, 29 Aug 2024 17:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724915789;
	cv=none; b=hEiJpYjM3Kaz+oem1+G3JRl9AydkoHJG6cbBbjcGfWBtAXvJHuvIU0OWaTCfbIThra2jooU9Ppsv+4VXGCwLFG3K/PQa4H/3DlRl2uZCPqlePzrWKpuesayuNO5+9nHnNa3qgMnALrvw/aw35NFJtTc9kylI/DhwPR9iGX5wr4ddwol3CNYj5NdmCVjnFxczZif9vz170FFaC1WLbRGyv6nn82Ac/+gkiZL6tiWkm9j25vlX3Gp7J/qGE0LiVImXijLySH5D+xYN18tzuVL4G8pvvK94YYE4BTa/8nnAetIHr/dut9kM9LRtsJ22UACs9YoJwOI0c5Y9fP5yuSq8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724915789; c=relaxed/relaxed;
	bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=Ki0V8X/8KbJWUW3gx6r5HHP610lZhdW3YFt93Pd7E2N0671fl25ANa/yA9TGlUM1fyeWWcZERjaotnH9laLT+74d2wk2Dq58EC+bQj0MZkqVLa/NVB63GqyywY/bMcuNFdGyu2OY7pNrqodlkAXQl43yPSReQyZzeKV4yOmxW6qiXTGkMwi1TJTafZiYbPf3d8ypM8spGg2aoChH2sr8VYjZ701SQKpNmJU4gJMAO6TYqOz4oP4/ey1HPePvJwPYLqKOSIGvYkvfSPCfVI4ViE8o3pf+QXR/Oa+NCe4+OOFYxcs7g3NplJ0dGXhl+S921ullrETOT7VG5Lrvcyyk5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ar5n1fvH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ar5n1fvH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXdS5g5Sz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:16:28 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-715c160e231so304497b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915787; x=1725520587; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
        b=ar5n1fvHS9l3lknEJXSrEFDKOg9hdJaHFgF/aLAojsk+T+/Z0qxiwB6fGmej4tSoZX
         8DtzDmoh7LAGDyoAjMrzPvTuUz0ZpXWI7U9pl75Hl0QLxMp2vjgR2iLC7XMMjzWcHyqL
         B/HIaZ2fvf3V42mzTsBD/1vhf+2r6T04W2AuThgixLA9B8+3rjdCpCh2Cn677b7QoYKY
         I0tVlTfFVmFuuHMlWeXF7X4A0k+ZqdFWBRGo+ir15atxsKT83vF2UjwxIkZTFnv1JYZo
         coM8tHdmiRFRpXWLxCnHbf9JdlwEH7qRYjXDh3ujdwsed+K6Y7CtoZfN2+1DKzL5M7PK
         zaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915787; x=1725520587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9klKwS2bfsiGNUk5X0TeI2il7xQjjU59nEcVHrUHGMg=;
        b=evfxblSm91lZ8cuwq4LcZUFoe0TOaFPNQRFFFVcbDJOswd5BxmQHA1qpVky57+uN94
         KB+HTJdx8lp2fDUNeSL+0IYO4HZkEmhFCrRy4KMi5DF69mr6A78BkZRpyv+b4STmgNjq
         SdBlOZ2QhmIjwpTIywjuGB4T7aYsuEjxXrEIlyBoQsVzR/xvrUhRN3+LIFUjxPWwcstX
         XfgefIpLweT7OQNhLa86YCOhAErNy/kXYtY7k6/LRyFddCbjuHilLP2gH8gPAQKdZTi2
         EfOAttfKCutFOCNsgpAj70IrI9LhKdBwBpfbGpkLssSv1evNhzVOF839r2hKR70LMDxp
         URuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxAuEBWN43kw+q9IZb0yMkWzfBdKWVYky0rnA8YFFudWjv+jopCWaL53T+TOwRbE1OJk1DOC75oXqRZl0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6nciJpVc6C9BSd/L9eZmkhjkV72/vdKgPPTXKhy4uOFXV7npE
	C4lRxwgba24L57h1n30l6WwkqdyHSxVgh5HVqv6xpKwX/hJ81AihLshhzYVsuqU=
X-Google-Smtp-Source: AGHT+IF3t2cjexZNLvhhEG5lVGM8VXbW+pDj1JAzDu87zeFwskGcSX3PJG32Vb5o0zHIzYY5Gmbt2A==
X-Received: by 2002:a05:6a20:e196:b0:1be:c4bb:6f31 with SMTP id adf61e73a8af0-1cce1011dd6mr2308343637.18.1724915786799;
        Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:16:01 -0700
Subject: [PATCH RFC v2 4/4] selftests/mm: Create MAP_BELOW_HINT test
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-patches-below_hint_mmap-v2-4-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=s/V5Z34t4dT0xkb/r9QmO4zmTWyR+OmvwZt8Wf5I9yo=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBcsP6+L/Tm5SuNTuoL5vd1CHFePmle9+1/Le0d5Yp
 3hVY8XNjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYikcjwz6bDSmrzHWPjp6+e
 zUhZGF3tGZgzRbFMebrXzej5O9YXpDH8j7Z7ceLNKc+79Xs9s7LbGbZefbF4gvgksf23zjP3/b/
 +jhkA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add a selftest for MAP_BELOW_HINT that maps until it runs out of space
below the hint address.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/mm/Makefile         |  1 +
 tools/testing/selftests/mm/map_below_hint.c | 32 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cfad627e8d94..4e2de85267b5 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += hugepage-vmemmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
+TEST_GEN_FILES += map_below_hint
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
diff --git a/tools/testing/selftests/mm/map_below_hint.c b/tools/testing/selftests/mm/map_below_hint.c
new file mode 100644
index 000000000000..55d6cbf90645
--- /dev/null
+++ b/tools/testing/selftests/mm/map_below_hint.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test the MAP_BELOW_HINT mmap flag.
+ */
+#include <sys/mman.h>
+#include <errno.h>
+#include "../kselftest.h"
+
+#define ADDR (1 << 20)
+#define LENGTH (ADDR / 10000)
+
+#define MAP_BELOW_HINT	  0x8000000	/* Not defined in all libc */
+
+/*
+ * Map memory with MAP_BELOW_HINT until no memory left. Ensure that all returned
+ * addresses are below the hint.
+ */
+int main(int argc, char **argv)
+{
+	void *addr;
+
+	do {
+		addr = mmap((void *)ADDR, LENGTH, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS | MAP_BELOW_HINT, -1, 0);
+	} while (addr != MAP_FAILED && (unsigned long)addr <= ADDR);
+
+	if (errno == ENOMEM)
+		ksft_test_result_pass("MAP_BELOW_HINT works\n");
+	else
+		ksft_test_result_fail("mmap returned address above hint with MAP_BELOW_HINT with error: %s\n",
+				      strerror(errno));
+}

-- 
2.45.0


