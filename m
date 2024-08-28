Return-Path: <linuxppc-dev+bounces-655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEE962092
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwjs2MKjz2yyJ;
	Wed, 28 Aug 2024 17:18:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824217;
	cv=none; b=FEEaDC+wZ9+o1AnQcn3Y1SiOrpKk3kDPXys4ncWbwy+ht33JL+/1FlIUS9MXZBHBwVVMNyDw/Y2NMcI3odIxFQ6PNm6xDrM4tRpcXxcXomoCa457Nq4Y3220uTc1awHEFot5La4ce0193ZPdUWbx+u2qFxUM2HTAAbGgEPoX4+wx/2ubGAA6KQ5w/0EgvvhY73hqjogZSbhLSKzRnB15BxI6XYkwH34plwCiudVVkhGlrhYl/8CJUzrq9NBJzWjGskp74S9/DQcGr5xJthE4CeGxoUz8q4jEgMAs9YOSHD2gdQu39hp2R3+xN1PTzJGP2pAQdzzkrC3n8cdvr34BLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824217; c=relaxed/relaxed;
	bh=74ih38qyFApS59Oo5hAHcKEdd4ieUrnz9WHar/pXDMA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=Uidj1uA1A3fB02qPy/SxFzhEcVdV7H6u2JlGuffUVW5n46isrnmrjaMoYbykMDcFVJnp1MYAl569bDwysZ8ftPe4JJPLM4K0lBK3jjKQEuVoq+Z6aZs+IfREnScNC5GPzOZoiLI7N27zG4GY/fAsm4WokmP7glrc/SUyYoLi4nK2jXh6brGm0kjMpW/1wkFKbg33Rxx7R2QDAC6kEoQVExQOL7e2/B05+uYavqmCP8ubYggiEzm4r69SiXQprg7i8x/CoLzTC15V00ZwEvKWHXrYeYF0sBR/Xn2jAGCHjfBtWSOXDFfWHjO7gbJWQ+lntRJgOUJFAtsZtKMNSzrDAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tyGjbk0b; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tyGjbk0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttmT03jzz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:50:16 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2025031eb60so55565575ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824214; x=1725429014; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74ih38qyFApS59Oo5hAHcKEdd4ieUrnz9WHar/pXDMA=;
        b=tyGjbk0bX1+zdr2YGHWu+C7v+cHRyMzTHWa2c0dxUI/V1lSJrQoJqlLbNu6nZlNgy5
         2x63wfhLPvMwKZiJAyVxyFD11W00cDgJHgNCfvFJm/Vd60pdnilE0IZyWTJov/MC48AZ
         5VfBUTIjCns5FMaLbMaeOIRIa73eV867u4v64iB2+bnuOVjIG0rjJlv0q01zE5vvIbe5
         /IaRPE3isVKpVYoXN8/qkxSX7NU5XOed8pb+gXYg+48Aqr6Cb1bVQvbUPBpdORb9n/VN
         6BG9wxgz29wlz8cvowLUPbxiK7w8A0F+/nQTtYw9yhKFQtnyqqfPH6gdq6GQvJsWVXJ/
         ozDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824214; x=1725429014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74ih38qyFApS59Oo5hAHcKEdd4ieUrnz9WHar/pXDMA=;
        b=A3TniCniGGoDY1FxYDWQP6G1PVyexeVVIiWnfvsUOKieMmzHgM1mXUlrCIZlMPSsNT
         Kr3ZC3IwojzFIi/NEo4oK1Hz+P01tMKUA0cMScT25Yb9w8JESC2M8kVjkDhjYjjt8H3w
         LJFUxjndHcehtycI2xaZyq4HG9+LCpM7nU8RROERBErxzr5W3NPlYb821FVvhZqOw7EO
         5olJWdsTxpLRYorjGOGhVPB5mOroUxq7ruNFLgGIdLgxE1zX0soWPqV9cxrdoanbMIUX
         A3RJrGP6ksrHGovFyAxYRVpthMu6YCRl8d8p2+sfQ5prwPlcR4UIu5GD0iq1IPLwp7J+
         k3uw==
X-Forwarded-Encrypted: i=1; AJvYcCWE22X2Xo0yhkxKfAHDedTUojBsv0yAmDw2353UywzebHV5gMBwTUjTO48SNTbEf2h9jK4LOonGRVfHFik=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2fy0bUZ4EV/K8mUK11MX1FCVXCJQC+8AZ4ijOKRQ9EXLGcEOX
	fFM9OArjvtWMovXVYhBLVBQjGw9NkhLuEohpdcyeHEIX38Twe/yfsZ+oobawX60=
X-Google-Smtp-Source: AGHT+IHaxH8ov/UqUPxBA8x0bmmHbs3R6mKOF+WDurSlvopgHqFjxqmjotSQ0dAp9h1od2RsPmTDOA==
X-Received: by 2002:a17:902:e852:b0:200:ac2c:6785 with SMTP id d9443c01a7336-2039e44cbcdmr164066655ad.3.1724824213959;
        Tue, 27 Aug 2024 22:50:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:20 -0700
Subject: [PATCH 14/16] sh: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-14-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=RSW/tCXIl3OqIq1wugK/BMhqzVxC+hGCJaNgaxgxyH4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XYlVP75VR006aZFn+70kVT1K4PGO6plPeD6ttY1Ib
 fZuvX6uo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInsXsrw34+bSWfTiYerug+W
 bJm2uPHhi6ei0zVPGCvcutghUP70ggcjQ8uKDy93HJCN5MpSDQ5Y9+eF9/TONIm5nufepW33SA2
 /wgMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/sh/mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index bee329d4149a..867f6598b7d0 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -91,6 +91,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_colour_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
@@ -141,6 +143,12 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		/*
+		 * Subtract (STACK_TOP - mm->mmap_base) to get random
+		 * offset defined in mmap_base() in mm/util.c
+		 */
+		info.high_limit = MIN(info.high_limit, (addr + len) - (STACK_TOP - mm->mmap_base));
 	info.align_mask = do_colour_align ? (PAGE_MASK & shm_align_mask) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -156,6 +164,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		info.flags = 0;
 		info.low_limit = TASK_UNMAPPED_BASE;
 		info.high_limit = TASK_SIZE;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 

-- 
2.45.0


