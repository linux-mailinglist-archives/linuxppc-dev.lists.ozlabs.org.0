Return-Path: <linuxppc-dev+bounces-651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2B962089
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtwjH1gwJz2ysc;
	Wed, 28 Aug 2024 17:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824203;
	cv=none; b=HIPxP8b5xJKSl5Rrko4BkCUfov8gk3FxftwbM7fLy9sP9uSvIvWrEzLXbRUaoVPYHxsvhLt1Phs8XRO6ZMDmijh1ypZJsNmaJ9ni8V++JsIq6rdviWIJ2KvGPPBN4fHJt4c7myZL1Qf8eNxQ2l8hc5xWR2CPh8D7SD1VSIiJTCtif4FmnBgI9K0GYYqd0Cn40Gl6A+yf9kJAdnxxjnQ9H27DeHCiW/xQGThElXHI+4UAFxGQIbnRuhQAwnh2rYARfku4CMAod1Cy7XbqvU88ptbT4MAri6sKLO6isI8cuKSRUndnVvjXLr1rrGmTfwxq1ljsMcbc/DcsMt4ECPSpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824203; c=relaxed/relaxed;
	bh=hfZJveM1parb4u035pYGD3zTISJbrOiZGzu54vNwlmI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=SGsY8w7oyH/7Y6x7khXVWvXAdsMEXTODAp26z3/tmi7X9ur9L68xi7OMZ3q6FfUWU/fJJGWFd/rSOU5mGfa1FeabN/jlT6ObZJ2YERlsvluufY0BXY8viufeDmiLbv7vI3F/d+i4XhUec8T4DWr6HoYmYt9bjlLpVfBRJ1BH3nuTNnf0Z1Nm6cSegSEREUIy0mHHNZQE+MyNY3vqEJBlTtDyBsegZDt4EnulwZw5jCVI8A/ubKoN9OW37/ctiHa/oa/h84qGLqqsD1kmdcZCE5w7MTfFmIMbc4lKEf0XtX9YmftvVY+CZ1KQxGPf8YjmykaBsmYQE2udoGHgyKJKMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HbvRqk3N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HbvRqk3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttmC3BGVz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:50:03 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-201e52ca0caso44856555ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824200; x=1725429000; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfZJveM1parb4u035pYGD3zTISJbrOiZGzu54vNwlmI=;
        b=HbvRqk3NBz5zKQNq/MMjxWS4udvVs6zasoVvYle8E7vMcQXEyxRsZ8VZekUBSiTAKP
         t+qeeqH7FKpr3xoeDnOp29ZaneGdF4/za3jHmb5CJHiDLkHUTRV8deTLtfepRaxkcGFe
         CQYw830AyijVKcC6MnAe23VAp6YrMB6/8vPM5hrp0KUUOVo2wtsQSlEaSo6L5tnZO9vL
         bhmKrfMGEVqAAEnKKX2X+L2GT9YxGqyt5tUfkmkKqr2grqR+06iI+ihy84DvgXCgAzR5
         1RMVqJ+QsBs/yDnaFHcs58qdIkCWDrH4BnMe4RCQFPK9j6NwPc+pD/mp5RRc0g4dB+0s
         JgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824200; x=1725429000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfZJveM1parb4u035pYGD3zTISJbrOiZGzu54vNwlmI=;
        b=fEwskMN2FUN2YMP+779Su4m0J4qwAzCTOrawjzaqJy82CNjkSby7/u7eYsHZiQgJ3v
         GiXID9+vBalP3ycxngnsG8TEudCfAzBDEYD1AbpuUfEntB/VqQDMSRQV1IvukJjSsKAb
         bzcnPc3PRfnfzbcmIES7az8Di5bEsB//MbJ7mfvEB0iI5fxqH35LhcGBcqjlU/PucTTG
         QVm1UHohynyNKj6IKZR0MPGxSW3IVbMkHZRnEouPgg7q1+g410Mbt60FtB6WEwWjgrSK
         zCk6glvi4uSDOHxij2Vp2IejFGm+TEyqNL7wbgYnwuDGJ8215qi6C8jRIe4Hu0/bJje2
         f01w==
X-Forwarded-Encrypted: i=1; AJvYcCXXMpx0Yh1p25j41T+zfDCWzbXH0q/+GOCpw0A091tlnShhm9D84mH7wKvj9VuyMYdDk4zKTm+Fmhrp83s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzmFMZSXZGkvmWWciwPSa274KgOhE4xIy3e1sviV9aYCvEsYn/
	2frlsbQh9BYaFvVVcx75zj7QXYNcI34fxqYrQLXHmF6Segw4Tm1w3cvM19gfCdw=
X-Google-Smtp-Source: AGHT+IF596NtgPi2otbs5poJBgAoGUDj9IXzCrdKWZMEp8cIFyXQZx8MxZQO71jW2zsopg6SUNTImQ==
X-Received: by 2002:a17:903:2352:b0:201:f065:2b2c with SMTP id d9443c01a7336-2039e4fbbe2mr155506935ad.55.1724824200296;
        Tue, 27 Aug 2024 22:50:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:16 -0700
Subject: [PATCH 10/16] arm: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-10-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=1syBnrvTSOlOGGJG9VxttpQivuBkydj5+eNQ5N/relM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfH7+5/NObdD1TC7as2nnrut80uYIpiTE6QKMsStV
 jRo9UV3lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJH3iowMbzKLnvWynRbmDQrg
 3uNwlaGFp7De9nT0tCfZV9Zxzb2swMjwZeP9u8Jhqpz79ln+TNZVkXSd3DxD3/DEm3BhhnWsrp8
 4AQ==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/arm/mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index d65d0e6ed10a..fa0c79447b78 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -71,6 +71,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
@@ -122,6 +124,12 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = FIRST_USER_ADDRESS;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		/*
+		 * Subtract (STACK_TOP - mm->mmap_base) to get random
+		 * offset defined in mmap_base() in mm/util.c
+		 */
+		info.high_limit = MIN(info.high_limit, (addr + len) - (STACK_TOP - mm->mmap_base));
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -137,6 +145,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		info.flags = 0;
 		info.low_limit = mm->mmap_base;
 		info.high_limit = TASK_SIZE;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 

-- 
2.45.0


