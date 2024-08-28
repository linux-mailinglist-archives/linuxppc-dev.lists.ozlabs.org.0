Return-Path: <linuxppc-dev+bounces-652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A867696208C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtwjN636tz2ytm;
	Wed, 28 Aug 2024 17:17:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824207;
	cv=none; b=UScKE2SjatI4Onm8aUo3strEIddn0tlvE2uNYuVOxpSRCA0r4piVe5HtkwoydT9uDIlRXvq1GgTPOL8DNDp95HMPbIN5jfkHY3DSBdQrL8p5nbJKj/IWGtNMs1gZRIVWmLoEKNv93Vff5Nh+ihgiTTJC21r4yI20cFhPV9LRbUMAxUsMeTHbfIuctdoP9LqlpaIhFCJwytViFdbsIxcEjDdSDWYPrPl2w/MJRpCZk81Qir75lCFdiyZUg8UITQgIipW48FmWEp5skXZEertyCmTxY2PRHmpaHRhox0TotI0QlTyKHjbKqms+Yt4tqXtSgIL1/Dk1s1Y6cwjQBgeWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824207; c=relaxed/relaxed;
	bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=Oj4RUC+eR5fT9i49irx3GigkDX5LZzUF02mX2kC8pBO+iHoJ0GIXbeF3NwdMD7Tg2ksxCqLQoonFxIMCvL/OVwZxbv2bq2CZS9xM97cYdNUD+eTZw0ZbSN759QRdm0MRcRri8XRrtx26OTgdFmotaq2MlXV1D06vjLKqFuuCmSf1Jx1Qbb5oWp8zlDROOT31BVlCY2CLF8+lAkoxO10xX6/VRd6OvUJPGX/l5MzJ2bHEdRh9lPolg9BKcmhk3UR/14iv9D0CFiIUUIC9IW7QGfElYZRmr501bFBqGGx+uaLHHKHZ+REZWnjlzOZwJ+ULznNmo9O8vxO9GjV2Hk8YPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=serfCQJL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=serfCQJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttmG5Nvxz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:50:06 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7143185edf2so5288872b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824204; x=1725429004; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=serfCQJL0cy5P6tJQKIXG0XvB4P3TamDJc4RE9kGGc0hrUliMe8yf7xFrQwLcdzast
         Jle6SA72p0X6kT5gYzM+isp1N5ass4oodGDfE8TiYBb6RLyHGWLU01ZuhJTr+WEQtSyg
         UJcKcYoePfX2FqDJDxdd5fntQRJaImVNByzutzRYH3RCoM1usd6sCOjuE+aixKCFhADw
         WSaZRGO+1DJdue0t0SWIKYkrgWYfWF+GiqGhaiIXlIkchchYfRRSgzPolTDLX2w5+jAC
         LhwP7WrEIUtmjMj46ey4Ajw9mE0Zd4mglaf9cSgU/lVZuwJLQsnfKY+XfWvkMYE418A9
         5LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824204; x=1725429004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=j4C2v3Hng2WatX9ApamjgQlAJX2ut5ha+4lC3lGQyHCC+sruv+OLa4sf7OxvALoWo1
         1I9lFDiYFc4ZeXQPWj0uR9fS1Lv1cXI2+ZnP2VY9ZVMbcHiOzFMIzxwuLvK4H7T8Uj0W
         slzlVkS4P0KAKKa5EljE4ifZt8U12x+uqbvLo4K824HNvoWO25sYDlLxlb/bjfYui2B5
         VNaKGZ0BnuObtmVwFxLOKEyvslLqdqhil8JjKbwEdEKNm21NAdObRG9GVrjAIo1RlJQC
         iDhwaWE1ddhqfu3VG7ZItxj0tIXlsVMMpSmhlTDrDweJ2YWrrls7XwZT2+ldtWTkRUTF
         v07Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+pF9gaaKLWPiZ3udLFPRs6tIWYBm096B+mrNH+VlcksgSaube88uqiUY+l4rB4qeL44KBN/F3W+RO7Lw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqqMu5L9q3c0NPWnH4937AwcCtGLWti+PeISETWxO5Qe9DmLYX
	dT0orjblwNYkrMJ7zOkl0L6hDssu/cx1LqjUtA7RbhYV8KlXjCPtMYBCJgU+lJk=
X-Google-Smtp-Source: AGHT+IExz2l4cJy30WX6CK7UJnnTV99XpNodRNjqDrqaX9iShx7VT4aEy+MVWDHksfv413xg6BHqWQ==
X-Received: by 2002:a05:6a20:c6c1:b0:1c3:b61c:57cb with SMTP id adf61e73a8af0-1cc8b63e7admr19641639637.53.1724824203730;
        Tue, 27 Aug 2024 22:50:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:17 -0700
Subject: [PATCH 11/16] mips: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-11-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=hr+5sO+DwZ7b30hixHrcXcBJzkXJVKP+oyQ8pDF00F0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQkfk1qWxrKnZbieZ1K/6LSwKGjL0hcztOaE2KQe3
 3vFh3FJRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABMReMjwm1XqYMYTd7kZ029e
 Ywn89Unq1bGI6TwyXnVzFq65HWqvWsnIcHriXK9fRsZbv646duvxv8pFDmYGX/naxDT1E9+JfDu
 ykAsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/mips/mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 7e11d7b58761..1595fda284cd 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -79,6 +79,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(info.high_limit,
+					      (addr + len) - (STACK_TOP - mm->mmap_base));
 		addr = vm_unmapped_area(&info);
 
 		if (!(addr & ~PAGE_MASK))
@@ -94,6 +101,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	return vm_unmapped_area(&info);
 }
 

-- 
2.45.0


