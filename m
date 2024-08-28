Return-Path: <linuxppc-dev+bounces-643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A001596207B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwh72gL0z2ygG;
	Wed, 28 Aug 2024 17:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824176;
	cv=none; b=SPR2FkVGaZpVGGGyJM8iFYPPOyXKA9hIE4eMyqZmO3Gc00qCpDNN8ijLMdYiPmgl8Uyk8XLF2CgUpSgoHTc69AzYUWTaVTmWIGmvHOEVaN1K+hWfjMVb6ZEZooYJ6lIQKth/vgIpALY4yv3BIimcAtKaHEVb2Eup6GtRYGNG/3Jf1nvGUtiUELTaMU0ECkAEqsBNntGrKYHTyYBWJUpyp8bYdQyhEVqUpug1TybfUIZjBznSvcNVr+BOd+0mdNviFZtIJ80LqdYSiK1cDc1hc3+mhGrlAZw6yLV6iuQOUxem4JI6jk4KzDqFHrPFhKYExE+FachYHbX0avqgmZVO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824176; c=relaxed/relaxed;
	bh=moiMY/9kOk6Xzt0Khn1FkF8wyTL4BDNBgOSp+BMugag=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=GNnpefCBI4eTSLL3+rPrs7y7ilLjBfaUrxlxkNbJqiyxv9zu2BEd8Set8oYNE9QkoBg7UAqQ57GeBSS2+d8XDP9I58qjOSypFSZ9fejdBF4ZOyOcomeGJW+5+hzn03QbpUDoe+nD6Uh2MfRL6A4fojQWwNzZ/zgewg5m06iV+9qgIJoOPLIII+YphlQl//waB2qUdmbyAGRBKJMIcZR5/wGJCG2VWxikYf2rf6WmzhqsRtBZu5XqDZjMIE+2f8wR/oHOeVnMYGf6+m01UW3k+zrIK4/rdjNEJqR9XwdxfK362OjL5GGVIe1uA6NIxPXwKzl2F7KIevHY0z++r2w0Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=T4Bh5nkm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=T4Bh5nkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttlg5jvVz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:35 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc47abc040so55315415ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824173; x=1725428973; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moiMY/9kOk6Xzt0Khn1FkF8wyTL4BDNBgOSp+BMugag=;
        b=T4Bh5nkm0NQrsPGxypGVEv3YSSCLQJiQjsnPfntgqiVSsDyLJo0mE8Zkyks/dBnJkF
         J4d7LxqvhQ7kGL77mcQXIFgpzDhcnLIRYHUtvMULt00d7fs9LQSM/SVIijlr5yQ4us4F
         zYPkkm/svDiK7wCxyI+Eg5CBTnyVgYdSI9+UA0/J+ZdohO9H6wqwRyc63irVXMQeYITk
         RgPnK5g57PQaXN8khgYGTd7HTi6xDJC8Iprt1KC1qKXXQEHLV4tM7/cBGl+FRUfGoIGo
         W/ah/l+f1oxFdbNC9RistEP/xDRU7sCbD3RmdwPPJB9bOh1WW/4nf7voTrAhZclRiMaP
         HP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824173; x=1725428973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moiMY/9kOk6Xzt0Khn1FkF8wyTL4BDNBgOSp+BMugag=;
        b=HLhV66U7N0qppOzacWelaj3/QoBkPcipWTdXPGFITCB77qJoQpeJZFMQS50uYdTMz2
         Tr0If7bwm6lTHBVCsJVg2DLJaGTGeZeZ2x0YYumLCrbPS+9oxJM30j0g4wclXfHwihfb
         rgsJmunb09LRjqdaIJtZwH19+7ew4tKMTLEstSN6+hJj9Cc+nSozpWDXmiTyrE2bf8k3
         //DdzFvumahCJ2Db9v7vAHHJ+HPvSIMEkbqpd+6z8MH0FPrSA9GIH6ujMjrGUvL2TcZ4
         IQE73ePfNfGYrid7Tu6VnmL7u5L8UC+Etca1zaTQM+/uTmbqzSQjcrLKMfTrm/wQHONA
         LOhg==
X-Forwarded-Encrypted: i=1; AJvYcCX46QYnbE9tZ6lHp3i5dj+LTMbmcyuYua0tXpAgP23Y8MkVBQb6hYwxQULtw9H7zA6IXBdDVNLdhy4duEQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNKbJt1bNHKusg+kk+zvthrtM8zP8c8LjnJfwJN8ATRgTykXqG
	qsxzeRmzrXxWCrIh0sGrj5O/EZplk+prXQpE1NrSABAO9TXDKrHxJJKPmZkTjp0wpAFVm9YEFpY
	s
X-Google-Smtp-Source: AGHT+IE+xcDspGauSp7IVmRnQSeJseOyw+wVLX4elXR4/BGbU1fHY0MaCzZG4/pxtEucaF+r97Z9DQ==
X-Received: by 2002:a17:903:124b:b0:202:4079:1c19 with SMTP id d9443c01a7336-2039e47589dmr164242605ad.14.1724824172722;
        Tue, 27 Aug 2024 22:49:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:08 -0700
Subject: [PATCH 02/16] riscv: mm: Do not restrict mmap address based on
 hint
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
Message-Id: <20240827-patches-below_hint_mmap-v1-2-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=YMF9irkRUC4sRvnkdcE8hTIaJNmeFPHDQEKHg4RlOyw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbEGN52ULpq4/39venW688upWgwFDj9spqW3rOd57
 Wdme6Ooo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInoxjIyLPq831JpspB17kOr
 jRV1b1+9OjXz6TVOvZStd2IFbrHtWM3wV9buiFXmKu3sWVt1RJfzLlfjNmD+lbK6aQ3rc0+mG/t
 jOAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The hint address should not forcefully restrict the addresses returned
by mmap as this causes mmap to report ENOMEM when there is memory still
available.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765

---

This patch is pulled from [1] for ease of review of this series.

Link:
https://lore.kernel.org/lkml/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/T/
[1]
---
 arch/riscv/include/asm/processor.h | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8702b8721a27..1015f2a49917 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,36 +14,14 @@
 
 #include <asm/ptrace.h>
 
-/*
- * addr is a hint to the maximum userspace address that mmap should provide, so
- * this macro needs to return the largest address space available so that
- * mmap_end < addr, being mmap_end the top of that address space.
- * See Documentation/arch/riscv/vm-layout.rst for more details.
- */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
-	unsigned long mmap_end;					\
-	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || is_compat_task() ||			\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_end = STACK_TOP_MAX;			\
-	else							\
-		mmap_end = (_addr + len);			\
-	mmap_end;						\
+	STACK_TOP_MAX;						\
 })
 
-#define arch_get_mmap_base(addr, base)				\
+#define arch_get_mmap_base(addr, base, flags)			\
 ({								\
-	unsigned long mmap_base;				\
-	typeof(addr) _addr = (addr);				\
-	typeof(base) _base = (base);				\
-	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || is_compat_task() || 		\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_base = (_base);				\
-	else							\
-		mmap_base = (_addr + len) - rnd_gap;		\
-	mmap_base;						\
+	base;							\
 })
 
 #ifdef CONFIG_64BIT

-- 
2.45.0


