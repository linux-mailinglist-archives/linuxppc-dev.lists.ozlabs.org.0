Return-Path: <linuxppc-dev+bounces-722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDA963C64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:16:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXdJ1bRbz2yq4;
	Thu, 29 Aug 2024 17:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724915780;
	cv=none; b=keAuKUb1v5ToKFrPNIVjwo98tKohR1a2wUJUHaAc0Xtdu1uK+jVPMOPVRKN7rB9jHXELpfGxDbk8ZSwQ3yi6y2usYHEtr6OrErYPSgpOcGuguR/SIJ+QqYlG9p6jHloQ1CS0STk7IX5jN+ayA76a4skHq/vdjFZ1CLDzX2ItzYJPV8AW8Y6J6IxZ9QJjeUgZ8fvIDslIzDiI5p5FSwc6VCisdrq73wSbjmfvvJoG0dc+7T56G0TFM4ui6WAcqMP9crbpNU7OeElhzLPyPDUqeGO0Kzf+FZdend/NJ9KMHM5K1z9CWnnaUZgbbYbIJ+h435mAwK4Qh7Or/rPjVvZPew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724915780; c=relaxed/relaxed;
	bh=K+PlWd5TxPsjPig/hDVlAKKLZn98jtqGVu2vnt7YwwU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=JU8QIIY8DE9mgze1F0MZlKfwYAt/9vvj0h7fDHzgv08795+W3zobWXFB3WfLJ7NO//OVLJy4PJGcEw2vNV02nT7qZ2Yr0A/q1EYYQwmG1B7yc3JgFWZM3OzoP8VXC6egaMmKMjMViOWtAZybu0hsx2wX/3DnOMl4IP5Q0naYYsg0KZdg3M+36a0LtC+3XF3K04E15L335sY6KKDlf+zAQoH/ADLIH1SdhJajdlX2m0Y9U+g92FKvG6XiVIALt6VMauVX7rOFpPOi5AnGsSZmXybbACav+gMMKtMKYX99RYS3Cw+Um/p907tp9n3baFVBLJIJzX1QjGrcP/tioymTkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Y3f40lLt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Y3f40lLt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXdH5BwJz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:16:19 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so204779a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724915777; x=1725520577; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+PlWd5TxPsjPig/hDVlAKKLZn98jtqGVu2vnt7YwwU=;
        b=Y3f40lLtmQ/e4VvyT8zg/1jyegrB/R4Xm8kAH3LbMHS+SWFVdnRnDkWanDbthmxjnc
         BoHqdLm5DwVPcfXIRQfgT5rHpCeM/ISH4gmkGUphrK3Q0pxaE2ieLllOR2e0HIyHvVsy
         GYE5jZbFDWLa5gT7gk+AMm7vvIAr2ux1sMlOf+v33mvoL1rBofyQQ3Q4RmnYWmm5hjxi
         iLCo4JSJE+BY9E7oOxdaq6YT2b5W8zDfdp4i1I7FppUK6YsNE+jkJ0FB0+JTXodfdhZT
         bycmndSl73QX7XOQXhvJ5cJV6HNUl2fEYajZbm2SFF5Oubv3oddYhvtixoQuFkTwLqW5
         J1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915777; x=1725520577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+PlWd5TxPsjPig/hDVlAKKLZn98jtqGVu2vnt7YwwU=;
        b=gZSyLEc+evhuY92Frh32ADgQ8Sz9tuLgAqJs0YDF/dMHDPLYNCzMxw2Terna785ayT
         jqtouKDukC1DsXczQ/XnPjad/iMWGGIYQNUgcVSz1Gc5t69DjjjRTaTBLW0jYHeM8l7G
         TdB4O9F+wuDPmG2O2EWKWWO9LmZQLV/e2b6MCk8/Ex9ZrOa+P9fzZ3BCn8JYT+lFuBie
         9ZPfNGx3aByRV9zXDweYWgaf/XQGs95N86GNOA/bFOhEIIothytk0yfpG5Ln0r0ZS3jO
         j4wcLTQJly4zCoLJq/ISKI6a0j0oY5jObeFR7BdB/85Ze7yMeA7NFiXP31m9HvWueZxJ
         icLg==
X-Forwarded-Encrypted: i=1; AJvYcCVoj0pMGUDnl5fQTq01xQVGMtisTCvth+561X/3+YQWNY7RV77EJ//F3/Vfl55tu03y+ThwpLOtXMn8Stg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1W3hyVehNFi8Vf5T4yYE2EqC/iO8A0BRgKd9GbZ34oXN0iZHS
	FMH9ci8N5oVEN1ZzicT/5udmBGS/kFp9LMuWzCMGzZnpL/InxKPgrIAfSRfKuxw=
X-Google-Smtp-Source: AGHT+IFLTY1yKSBMzZ5xgis43aJyn47zOLzwLd2defzztxCwj/TAmDuOoW0Odpywez2pOZ4X8GI8+g==
X-Received: by 2002:a05:6a21:164e:b0:1c3:b16d:9ebf with SMTP id adf61e73a8af0-1cce10103d0mr1908062637.15.1724915776548;
        Thu, 29 Aug 2024 00:16:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9bef08sm581976a12.58.2024.08.29.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:16:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 29 Aug 2024 00:15:58 -0700
Subject: [PATCH RFC v2 1/4] mm: Add MAP_BELOW_HINT
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
Message-Id: <20240829-patches-below_hint_mmap-v2-1-638a28d9eae0@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=BFQJVSzGcUiBI/yFP8LdbUQD3Uj+U8GuBEaXAXz6ZKc=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9oFBYuLDvF9d6RNyqKnPc++ZptxLkm788kE4fk8m6PdD
 Gf/eyDdUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQUHjP8FT4q7/qhylvttk3+
 XKO3ddmdn3jey344uGPfdmlzxi+3HBkZXsjbfilaf335tejK27Ovnk67EVP0NumF3oyGea6eXuV
 VHAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the 48-bit address space,
unless the hint address uses more than 47 bits (the 48th bit is reserved
for the kernel address space).

To make this behavior explicit and more versatile across all
architectures, define a mmap flag that allows users to define an
arbitrary upper limit on addresses returned by mmap.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/uapi/asm-generic/mman-common.h       | 1 +
 tools/include/uapi/asm-generic/mman-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..03ac13d9aa37 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
 
 /*
  * Flags for mlock
diff --git a/tools/include/uapi/asm-generic/mman-common.h b/tools/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..03ac13d9aa37 100644
--- a/tools/include/uapi/asm-generic/mman-common.h
+++ b/tools/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
 
 /*
  * Flags for mlock

-- 
2.45.0


