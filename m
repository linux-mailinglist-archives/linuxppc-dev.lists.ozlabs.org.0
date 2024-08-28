Return-Path: <linuxppc-dev+bounces-650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D66F962088
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwj90hDYz2ypV;
	Wed, 28 Aug 2024 17:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824199;
	cv=none; b=Zv2mI9y4bvAA9LuN7zFRG8/OUwlM345gV3rcKEyJpmfU0/DTv49VOhbq4lAe8sAEJLpI7Nqso01EB3pO6J+m10l09LlEvj/Ooi5hvRj0UNLo7CmCTKl+MntU+7yf9t0qHW7LSJJkri8bO2HtC1sEKvsrbyoSUPnx49cmLUEBNde4rR7WoldQc21pXMPdh7omy8ext8YlxBX+TLG7L9VyHFjwekwF7LJFynBGB7WjBS9gVC3db3g/c/u8GJCKfsbvR5q2xEkuinwwoaulbSvbNeG3RVMbKv+8yI9zag7Lzkf3c7Znj0gKEwnC8/1gNYv74D5nhSyZd023tWkuTKIPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824199; c=relaxed/relaxed;
	bh=YNQglkp2lEnIf2YsbVUEYoAS4AW64pe58tBCUjsMipk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=mOoHTGz13jgP+0zXgPNb74sMF2/dD3GreE3agwlGSbczB2vDd8BLk7QwN64EKd/RmPUpZ6Alx4vEwX+LW0smntEYx1aFaTIo1cdjD9j2nsSDtfp38C9qc1z9xsxy2UpdIgPmjFL5nyjaSbsCfT9PpAJDB5tqQpon/6FBE8it/pjCqYdThDqxoqThqCppcJVsjXPXfyyi9cZtCvzcg1evcuDI3El4OE0zOt81lUqtQViDKiPMoDG95zM4IJx4zyBXa6utTKd8TTwQgLhWvIImNoB0UA1J3/On2360t4OF/vFbdI6hwadEoKAw8ETSb4wcxMkFl4g8Q9YQGNIzDT69PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=pFRD3xjn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=pFRD3xjn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttm66SBrz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:58 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2021c03c13aso2179355ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824197; x=1725428997; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNQglkp2lEnIf2YsbVUEYoAS4AW64pe58tBCUjsMipk=;
        b=pFRD3xjnUBw81LZgKy+zBzKvZHXyRWgE/gdEatIf0HnYaIoShoANCL8H9JhkQ0Iecs
         gn0AusuTAz5sc/yGtqOsKfTrOWVqnqKJasoBpYlP8icwOyFpzhFTnnZuw70+gkteStsh
         DZY+LbkZ7pn3n0Ki9nsVMQygiYuQQ5sgJ9VobJdQOxhKhCzOyLOkr1Q6U7blyMMxXfi0
         pPYxZCBqIl8vNT9A4eIpU5izZ3VobSr3fGtDnT9zmlsy7gylKWY90Rk4pxC7hnuTR7UB
         52EWXTXryICuKbsS626adXezTrA9O3siO1g8KEcrAO1WIB6LI4ahILU+fMkuU7E9X51Z
         AI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824197; x=1725428997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNQglkp2lEnIf2YsbVUEYoAS4AW64pe58tBCUjsMipk=;
        b=cKL/3JLND0MmL7/I/9E4XGMi+Nq1EV88gA2gU6jBNygiqZwr1Dd1Zm5oZ+/9LD8m4z
         6eDBHckWYFZ5dfN2PZgwbpYLX/auvvARJKhdfcZyJoKjsQCvNFWBASyaDmILHahEaPLk
         4GLf+7bV/4E34vxg0KzwVoSV3dMtC19A12goCYSDuFl4leBqi4jAn2ZcuE8mWzIgLojG
         tADmE9LoXm/ALy5bq9a/z+pT8LNPu4iJoS6sWccis/4QmZPGPtlRKao9NXt/6Y3QLOTZ
         sGQEjjPPLKU//XoupFAyFeWpt7QOXQjKfLRqyHaESg1KNq2QsRMQbQT5WlLorZb9I1FV
         E4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCikZzN06C3PSPMGNfG7d2Mwnzcg6qBgAAT3twgE3fIvZfBq5/vhmKq5GzBvhMg4xgI8lqqhBMIvig5Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqWugreMM87V6J9ksLQoCLe8rzCdj+yIoIbrZCaMHfVrjQybFo
	Gdkp6qda+JI38oGhbGhdX1lNXPL6laGFi5snUap8PIy23RpMpX3veLn1Srud/ts=
X-Google-Smtp-Source: AGHT+IFNvFc3w8ZqIqMUtm2tpVZkKTF+VkfsFh2Ia3nc64cPU9VogTthyuHsPbt4BWtQWf7nibqVyQ==
X-Received: by 2002:a17:903:35d0:b0:1fc:41c0:7a82 with SMTP id d9443c01a7336-204f9912733mr19643175ad.0.1724824196945;
        Tue, 27 Aug 2024 22:49:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:15 -0700
Subject: [PATCH 09/16] loongarch: mm: Support MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-9-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=mXZWgvc5d3nCYQqiz9PUCvFecQkJ9kp2ZooPsTsZSyA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfFl5t2npeO1W6ydtL9v1qitmfF53Tr5I+FmGy5eX
 hv8Y0JgRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABeJZGTYs2fGyX1L7U5s/pDP
 9zI7cOPnH9u8t8ZNYFCaqKg8I9+uk+F/YeihTo3z92Iv3r2a7r74pUGE/VYuj+S6OkvJ82tdPk5
 nAgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/mm/mmap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 889030985135..66a5badf849b 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -70,6 +70,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(mm->mmap_base,
+					      (addr + len) - (STACK_TOP - mm->mmap_base))
 		addr = vm_unmapped_area(&info);
 
 		if (!(addr & ~PAGE_MASK))
@@ -84,7 +91,11 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	}
 
 	info.low_limit = mm->mmap_base;
+
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
+
 	return vm_unmapped_area(&info);
 }
 

-- 
2.45.0


