Return-Path: <linuxppc-dev+bounces-654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847A96208F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:18:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwjk3Bxlz2yx7;
	Wed, 28 Aug 2024 17:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824213;
	cv=none; b=LSIpoNdoqs7R7OlPe8rMEFMI+e+RelPxrUtSPi6SVu29mUjrWa9hsnng6VU9SzgRFaWVg58l6Z5RlUBWJmBG+DJ2f5pri+6cQfg2ZmnxRYp6TwO8thOO6Kyrgsn7XK11pFZxZARTAgUJzEDA5S82ooRgFEOxvKokWoyLRUwegCUqxPpvy3B+tzPxcEqXyrJFZwoXPcxf4ntGB4gqY3ASYLucaBMk3Pwf09s+7OdPz1Mdaw3QpWuRe4B7GhgyKP6GtfJGowfZi/SCa+5E/wkUfe09UF1OBhSWtpLcszgKujhHKJtYCYeJ4u8FGlFU2iHVaoNQ967WBFj6UdCmCGQCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824213; c=relaxed/relaxed;
	bh=AarzQWw7jN5pNetRW1c1iMmZVGfhSNhFxAvdf8X4j7o=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=MXYylszzcmjh3j/MmSmh3qNwD3Ao6AVqZZPs/+ld6iHzK5/ZUNYeqo6e4r8jtymXtZRR7ZkjPUBJ4MFxMAoLgwL3bR3qJfnJLApCZM2W6Pe1GjIqmsrSzPIXzpKYJZX6kGEhzTCSm7wfoov70maEiwKbGNQGo7ViG08qY9LL/TfgoNbV3RirEMoMASkN3/jnXQjJDy/R9DnjSsYieygCWWoLgkjvuj9u7fEwWv0W+I0fFB0h76fQX0i2+8xKV65ElYsV4rwoqqfQ1lw9q6byBCuh+gkUKGW4tyIZSJNuGil3Kx+8MJshKQGc+6USCXQDHQdsHydzj0KkhrU8TcjZHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wFB7feF+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wFB7feF+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttmP24kSz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:50:13 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7cd8d2731d1so4170534a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824211; x=1725429011; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AarzQWw7jN5pNetRW1c1iMmZVGfhSNhFxAvdf8X4j7o=;
        b=wFB7feF+21gnLxKuHpAbKy8QRan2hlak+2QiNPOOYHpnHpkYAaoUAlFboiLIIe+QqN
         RSfN6dPSJmx6rL109iLAieWvMOwcFjzh+aAd7b71JZQIcaWI4DUMLl+kJzbreQj2MgJR
         CT7dQ2ZPRcF7CIV/ev777vzT5XDwN9h2QqDU667rL8E/I9inTvhoJ8gL9v3UFiaxqI5d
         e749Xwj+vuBrbWQG5Evaye+r7QQnOGC0jl38JJxF/jvV7WiP0RSd3UCRFn8hPitiJU9Y
         gei1WdtDLMN5CyEcmJnGWT6euZm3a0XIAdhnt/Q7D1KFqdAoPzSoloizSq0nhPkpgqiA
         oi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824211; x=1725429011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AarzQWw7jN5pNetRW1c1iMmZVGfhSNhFxAvdf8X4j7o=;
        b=e21dHAbmjqv09dWsLZ5lvpfquAdc44Cl16q4cJLHnp4f7+Kw4eon+AsRCe8k+HpOIN
         Z+XLAitfHUybhW6GAlC1sSM32mFNXEXfwKtMiVSvU/qcd0ou1kr3QHaIItBx1caXT0of
         P2FZF6yJ/RZiyMhucQGhVTO9LmjghfZ4wo71OTKh9ShPy0744HRFrYjHbUYtUPq4J/Yq
         Au6bwQpPpWFPbhpRLONcAWDSSgYxxvHdUOSgaxcRxnDdgnGQ81l7gfeazJh4PcDYNY/I
         Icq7kQde+t8y1ZU5GYMXOeXPenir1g7cPMORmAsvLrb9a53zHxinxUpXG0U9EtlqCLUs
         OQUw==
X-Forwarded-Encrypted: i=1; AJvYcCU2WuDMlUVmHAKwUfkRgCSmdRV41OAXnkLBKvtpbKkbNzCX1GVza1W/n8TLOGyFUv4qs2h67/6AJ5UqBeE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrNzyN38JM06TwsA1L4QFfIAdBbdsnuK4k03ROziAQjbILKgA3
	aRqAdB9MxJGiSehT++VBGPd65nq16upr3rPXGVdHnoKGbCFzM7QbDdTrKryjEtg=
X-Google-Smtp-Source: AGHT+IGSDxOLe5G0EzaI75j/pi3mF3L/KyOur/N+gUKJdt7aHyrcvZDzyi6uPsaAVyWSE2f/rnhW5w==
X-Received: by 2002:a05:6a21:2d8f:b0:1cc:cdb6:c11a with SMTP id adf61e73a8af0-1cccdb6c913mr2470861637.24.1724824210534;
        Tue, 27 Aug 2024 22:50:10 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:19 -0700
Subject: [PATCH 13/16] s390: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-13-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=LDlOb3puh00G9LsastMFHCdP3tuzGW5CWMac22J4/f0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQkTzp+9JuBqJbUp4CZHz86P7jsl/+dUPtx28/aiw
 uJ/F77s7ShlYRDjYJAVU2ThudbA3HpHv+yoaNkEmDmsTCBDGLg4BWAilewM/zPyq60vOxt27XXL
 PhSUqxi9dMWuaSXlSf4nvq4JmxBdu5+RYfa1r9wzZq5YzaDtGr2m541pUMtOl1Xnuf/rbZGaqVf
 Eyg0A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/s390/mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 206756946589..29e20351ca85 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -105,6 +105,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = get_align_mask(filp, flags);
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -143,6 +145,12 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		/*
+		 * Subtract (STACK_TOP - mm->mmap_base) to get random
+		 * offset defined in mmap_base() in mm/util.c
+		 */
+		info.high_limit = MIN(info.high_limit, addr + len) - (STACK_TOP - mm->mmap_base);
 	info.align_mask = get_align_mask(filp, flags);
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -158,6 +166,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 		info.flags = 0;
 		info.low_limit = TASK_UNMAPPED_BASE;
 		info.high_limit = TASK_SIZE;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(TASK_SIZE, addr + len);
 		addr = vm_unmapped_area(&info);
 		if (offset_in_page(addr))
 			return addr;

-- 
2.45.0


