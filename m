Return-Path: <linuxppc-dev+bounces-648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FF962086
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwhw1yY7z2ym2;
	Wed, 28 Aug 2024 17:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824193;
	cv=none; b=UPkNA0NJcXKAaKtyK6bcRhf9A+u7nDqmoERc6pDlZ2TJJrUXZa0v9Fq1EEyWBP+XpMk04OAkbN9+juAGQgL2MtcvP+iskMVGwab0MonRHLYJV7jLkpUnt2NRbZXVEgEhpDXcTA9CCubB3DLY8C/SdOLF18s/VZeDYXghuKhFQeizm/n9IasFyhn6YXIT4z60W4XcO6LVdBBbKpttYcobvjB5dRaWxV2Bd/hlTAZKmLI+jZrjTq+7/uRSzOxXCWS6m25+qAYHtUaG6iRs5Yd14dPO3bw6Uu30nWoTiozCcPy5Do2D2PDSjXXhXo2JUkyUKjPSdpGfZkoORlrlSGnl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824193; c=relaxed/relaxed;
	bh=01svQ9ue7Mr4CWZ3Wn0HVoOhr4xAPnLaZCO9CnTXUgc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=h4rZxoSh6LDe7iJmQzvd9FeyrxILhZZ2iLE5HseftT7w7YIGdkVqTpTjKJCTh2FDCzszmhHx7h6r59z7gd2ZiDMt7C/unt+IoqLmbndknjqNF0c7fG7JLBkJPyD1nwVy17Xmt2kxjRo1eHOq3lRW45FPDvVaxJuQNHPg75EYbc/2+566mX0YOD7GgyiAp8YnkXqGmkeghBk6NWBqfsEVHbYAtWiTN5cQTkCpIEtQdjvYPUa1vHrws1h87j6TI0em/1BK5vrq0FrDAHHdnI9I9/Onau/4H/17gQNVM0/pQChaVpjOHOeFZPoM2yuggjWpLwyoP+zaJZqeP35IgxVbIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1rbmgISf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1rbmgISf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttm127ZCz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:53 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2020b730049so49696325ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824190; x=1725428990; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01svQ9ue7Mr4CWZ3Wn0HVoOhr4xAPnLaZCO9CnTXUgc=;
        b=1rbmgISfwFIN5KDNY5FRIoA75PPDuFkO7X+Rsy7cczn5ptXPdMC4PjUwt/wL+0Gtqf
         acN+Oh5V9YceYqxI3YpeGurwioZDwLjnsVJJgrj/9WIG3sOzW87DWHJhYPtviz9X1UWF
         XdgqgOJy7gxRLl7niNE3DS3rphRjV/lRhJn3Od8kLK6Xkf21Z64tdwFGUVnSqWg22j/D
         kjjRcVceO86UfHvf6vhrTOoF2gvVFAy3cF5TPOvt1q+Qo0of7APKm/gitiLfgCNWq2FH
         4JTJa5rWxogxPVZwfPYLk1aKO57rxWkFzT+W3VG9Wd9khnKtlC58Te+IeNyAPalPGLH0
         DLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824190; x=1725428990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01svQ9ue7Mr4CWZ3Wn0HVoOhr4xAPnLaZCO9CnTXUgc=;
        b=dQBvuawBqZAhwQu4QZLgsmdNtK1JwQriuTPc80DuVwvpMUcMWy96bLqQbiaYVngUWd
         EOMXbl/DuXmqRbm22mWTjmG0c+rgzIUwjKMQAf1ypNkw40QxGKNtsvK7aAmE3VWO5iSN
         OGWQ1b2VQPayGiy/z6mp7JhxfoZ95GA3qIjA+sspWW7MThh5inIqdZQi9t8m60MLNpJF
         F4oAs9JjKqs90SHyPsEwcV10VVAeqgb6BuOuWyO5DmuNFqqTQ536ivqLJRHVNSNNd5Ut
         rr6rrIj4VYDR/Es+wzenvey++vmghRraRG+9MYu9g5THIbJluKRDKWmvApntI/3tBeYy
         1RtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU22e+fZXPS+x2+O5ypXmygwlo7lkjvik1Rf3UP4VHlsjHl2ABIOU1kF6YcCLLOkxNADcc7J788nnX4Y+I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPYw452qKQ/7D7n/ue09i5It5QDuENBFgr52S9T+A5tVJd+2cz
	aMMVWKWuOK3Cb0H4iJ/ZFVrv1BHSMxCgSXv+kdNazip54eYDlSXZHIPahgbfbBQ=
X-Google-Smtp-Source: AGHT+IFEjwUM/ElshIB7y6tneVtatsCyua8fDLSA2/rXWwDoWBaTV3bT3kKjnxkFupcj6i3KTQazzg==
X-Received: by 2002:a17:903:41c6:b0:1fa:449:1dd6 with SMTP id d9443c01a7336-2039e510e6emr137316635ad.48.1724824190164;
        Tue, 27 Aug 2024 22:49:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:13 -0700
Subject: [PATCH 07/16] powerpc: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=efrv8gA6WD0kUzxMoz7FX/k/QnHAbRwwUgR0y2hEUd8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfETrh9IO7T/uFjUxMhNQooG1iuWi1pdtJg6YcLD7
 VUZ209HdpSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARbV+GvyIzjrH36plzvXDr
 3H/Wo2jj7SdL50ufO/vC42XF9noOjvuMDF8DvSaxHlpya2VRHMuNXyrdOxW6nj44wHJxyn8TwWv
 XdrEDAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to arch_get_mmap_base() and
arch_get_mmap_end().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/powerpc/include/asm/task_size_64.h | 36 +++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index 239b363841aa..a37a5a81365d 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -72,12 +72,36 @@
 #define STACK_TOP_MAX TASK_SIZE_USER64
 #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
 
-#define arch_get_mmap_base(addr, len, base, flags) \
-	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
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
+	mmap_end;									\
+})
 
-#define arch_get_mmap_end(addr, len, flags) \
-	(((addr) > DEFAULT_MAP_WINDOW) || \
-	 (((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW)) ? TASK_SIZE : \
-									    DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags)							\
+({												\
+	unsigned long mmap_end;									\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(len) _len = (len);								\
+	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))	\
+		mmap_end = (_addr + _len);							\
+	else											\
+		mmap_end = (((_addr) > DEFAULT_MAP_WINDOW) ||					\
+				(((_flags) & MAP_FIXED) && ((_addr) + (_len) > DEFAULT_MAP_WINDOW))\
+				? TASK_SIZE : DEFAULT_MAP_WINDOW)				\
+	mmap_end;										\
+})
 
 #endif /* _ASM_POWERPC_TASK_SIZE_64_H */

-- 
2.45.0


