Return-Path: <linuxppc-dev+bounces-647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E6962084
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwhm1GCPz2yks;
	Wed, 28 Aug 2024 17:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824189;
	cv=none; b=iDkACw7n+uIjcNxe7g6mgAkoRz4G4x45ZtaM1LpJQEXut4dnw5Wv2DNXD7yuvWPVbEl1rmZBUQGP5CMXaGdpEZ71iRNkYtxp8Aeua94vZeN656jhDQ+U4okRDdhzs4f2Ue9fuhQczFeoyp4gh3XzRvshtk+OkK8JfoG0Jnmjujur8vPN+x9aVIOJFDAJ6MXirBvtIc4/ekpG7RAdTat5Cflag2VArIeKlt8Nq7K8aSDRgPvN26v705gwwt1zkuQlmX21wcyYTdvXMlcZnm95cmkqGzabxFmxlDkqINtnyUFBI7cN356hps3PzwKJtGfxVwD/a7DrhHEptr+8QXKN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824189; c=relaxed/relaxed;
	bh=fVwUzK3Wi136bLF1beJbPIYrhSgOvSQiUtDec+6VrAU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=hGWf699G+y4+0Mj3PvN7kfXU868I6P9fANUvWrtZaOqMj1dhOauw1pGowlP5EbPlFS63XGRIFU6A0Mz1N0YanMzusOoSGAIzVSs2RunJGv1cpw2KxXaauouLgurNUpfE2DCqsrcfhwvVwa3FJXtC71uZ68ht2GkiEkcuo80zJIil0WeLpOasVnh2rmlFOXgxQq71cWVUPDe32bTX7o1TwdvCK37HVzAOUJAEpxLoA4V5ljeic/f9RgOJ+2aJBB5Ns9u84kBdrzIfkLQtdN43emdeVWTKMDsqXgpNzjFgZ48vBgeNYU86l32Kp6QXRUMM7YLjeT3VS6F24yw1Z6N9vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cf6TdYci; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cf6TdYci;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttlx5MbLz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:49 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2021a99af5eso57401055ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824187; x=1725428987; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVwUzK3Wi136bLF1beJbPIYrhSgOvSQiUtDec+6VrAU=;
        b=cf6TdYciXAo/LeLUlFR7cxo0LMooUS3NcYTbMWa68v/K0x2u1vFdVZp/pJxdqILRFt
         pXIQ3G4MDXWIZe+TNHRPgeKAFWoSoXolkBZq/RjGfBhpi9rvZCFg+j5rUp64HFdUtdpO
         Xavs8vBrbcxvgv/rI8N7+f+wQWBLKnKfwcwMwvvYyCk9oagq4XunhNFn2OJVhzEUQknl
         dXVNE0q3RaT2hxKTuc3NyE9hkdenWI1U0OWLAjN0UpHjWTn9JWzX1DJKb8MWhYzZuGQv
         GyBbH7RNFhdQHGeLrLlxtxaSuKKaUbJvR6dihErm4NYe8j6o6xpe6FDiDNcUrzWbbv7G
         BuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824187; x=1725428987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVwUzK3Wi136bLF1beJbPIYrhSgOvSQiUtDec+6VrAU=;
        b=FM4BXkROzL3n0rpJ+d1yAeXdO+uR4U/wj1F3ygeOq+pSFGyqIXGOcUpgVzLPT1ZE40
         OquDAnlqKPOHl1jS9I285C+06BBPrPaniqCVRF714hQxuiFfn6R+IkwOizfGyIsYtPwr
         /ZghkgAVWqfkoYVfPDhcuSDMu2wiNQHAzlVpwcrCHr9qbXHHvfFjbdNWtBqPaKOCdDfN
         yLRAew7mAGUO9pNvSBMHW8HFbsuxkxwOHgX0OREAizNXEe+ibAgloGbCVUK5CfUXUdet
         nOuPM+zImMCfaxHMCjd1JTVVpOkXPm9/kwk4PWTO+GLhRhHn0M7xfV3CRSjrebhfnDgy
         vntg==
X-Forwarded-Encrypted: i=1; AJvYcCWfzCrkI91kyN0VrtOPX7nqdQY0vP67aGRCAC8eY91zjNN3VZqOF3Dz543fLbMCRMe8d1SuTAvhLmRKP1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQqw89CqEl3ifCZpv7m/Q/6gSofvtkISO8uWJCK8KwWNn30IXJ
	ic4O6Jnmb/rw6UXN+ZdAr1XWEltlvCym+1WsCcsuHa8N3wDWI0BFoLEohownHWw=
X-Google-Smtp-Source: AGHT+IFs6bhbKPqiE/XUyq+o9y28MS2XMnZalJw5Zqf2sXjfONhgRAKfe8uENwidGpxKTHXbXFBJcg==
X-Received: by 2002:a17:903:41d1:b0:202:54a5:deaf with SMTP id d9443c01a7336-2039e4fbd80mr220740285ad.57.1724824186699;
        Tue, 27 Aug 2024 22:49:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:12 -0700
Subject: [PATCH 06/16] arm64: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-6-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ib/vcnYDgaY2P7lUbSF3YkIC17EmCG0vvapvjDW6XVw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XXGJ67WyV1982VXredvh0ENd1glLC4s4HJVXs9RbW
 X20a7/aUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwETa9BkZOnYYvlBTj2FUnbDH
 vODh/SmrdzHc++GxrUXG77agmXy8LCPDkyuNIo53Hzx7czND5bWgC3vzEimd+TtdNE+3T847GKz
 FAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to arch_get_mmap_base() and
arch_get_mmap_end().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/arm64/include/asm/processor.h | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index a67ca119bb91..39aabb1619f6 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -92,12 +92,36 @@
 #endif /* CONFIG_COMPAT */
 
 #ifndef CONFIG_ARM64_FORCE_52BIT
-#define arch_get_mmap_end(addr, len, flags) \
-		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags)							\
+({												\
+	unsigned long mmap_end;									\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(len) _len = (len);								\
+	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))	\
+		mmap_end = (_addr + _len);							\
+	else											\
+		mmap_end = ((_addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW);	\
+	mmap_end										\
+})
+
+#define arch_get_mmap_base(addr, len, base, flags)					\
+({											\
+	unsigned long mmap_base;							\
+	typeof(flags) _flags = (flags);							\
+	typeof(addr) _addr = (addr);							\
+	typeof(base) _base = (base);							\
+	typeof(len) _len = (len);							\
+	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);				\
+	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))\
+		mmap_base = (_addr + _len) - rnd_gap;					\
+	else										\
+		mmap_end = ((_addr > DEFAULT_MAP_WINDOW) ?				\
+				_base + TASK_SIZE - DEFAULT_MAP_WINDOW :		\
+				_base);							\
+	mmap_end									\
+})
 
-#define arch_get_mmap_base(addr, len, base, flags) ((addr > DEFAULT_MAP_WINDOW) ? \
-					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
-					base)
 #endif /* CONFIG_ARM64_FORCE_52BIT */
 
 extern phys_addr_t arm64_dma_phys_limit;

-- 
2.45.0


