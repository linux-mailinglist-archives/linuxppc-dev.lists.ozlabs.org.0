Return-Path: <linuxppc-dev+bounces-645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13496207D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtwhQ6DNqz2yjN;
	Wed, 28 Aug 2024 17:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824182;
	cv=none; b=dSTduHTctyosH4NpPZbknqQjJBbhQ1VrWowYLPtQKqR0re1SQ4wA2CuV43tHYIinMZl6y73nDuBpxR3WbfOoCxDr9pBX+SfvT+KmzOkKcZPTwQJ4fErq/6cbeEsv0N/Mvj47mM6oUlmTFMaF8hxfl9O2VU75oSjpFsTTpfWAYFyV1kwgukN8Ul3o0ckFy5ytsuJtOcb7Dsg56sd7e59Xp/pa818Keuufc49ySlScSBC/ADnVVwSt2mJ6npOWt/+CkcJQ94uQtX11G7QYpuWbCh6ZeSsFHuANd1AkLfaovZu18O0USoIwKQxdZnb8GildE9x6bh6UqLAauXOJuHysCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824182; c=relaxed/relaxed;
	bh=g+f5iieqZfHqFwlVhHOpYZvOeyZcJe//7AT/XT4juc0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=m+j520i6e6MA+gmSlGwxKqKSO6XnlStdlY325bkBZxJszUb70v1A9DThzrSeevw/uqnXLeCOsXK3Mz5a6ydYzrMyj0obSpOL4/3reyOKJNTysdJ6YIXuD25VJxKjaFWesH4spT0t0t3D3xcECKfLFci/HKBx+jyj3v0SQ7lDy/zqLTG+M0ouVy3OfigvTrM0rOHzZaRdBCdZxGw6uud+tYbb2fvxOAPAyHq0CH5qFIBgVSdWIndTi1GbKifiSsWfuu+h70PUIt1FQ1E3j3rEm12I19AsU6NCtDceCtlv3K68tz7amYaDAwEezdrFpFGKfvLgQnM9TtkEhkfw1vCYIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U4oVX8q7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U4oVX8q7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wttln5Wd4z2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:41 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7142e4dddbfso4925902b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824180; x=1725428980; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+f5iieqZfHqFwlVhHOpYZvOeyZcJe//7AT/XT4juc0=;
        b=U4oVX8q7FvntVMetDpXnGOjqPI2IVwoC+hhXwg2PuFjbF2vDftK0kqpdAssKR3/gQX
         qBd9Yij4g7tpF0tsa6SD0VZsSULlHHDCZ71VEZcKjmMJDeavGQfYwS1n68amX081bV5c
         Qi0jyvjQBqEQWofp44N+AU2gg6EVSCYGTHXPZnwTu9HrPdH5nHeYICfZTSTzelUvXKii
         IDSCprnFFTgPU9UINlhs8C+GOOx1zq3Y4lhoJBm53l9+UIFwLNwMSqaV8nWxATHfsnKD
         qJohUySuuoxCUnB/1kBTzDBDTrlzZfhKskFsRmTPgfTtVY/Yr7j9C7hJ2f2WnBZo6Y2a
         6/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824180; x=1725428980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+f5iieqZfHqFwlVhHOpYZvOeyZcJe//7AT/XT4juc0=;
        b=I2Jge4zAWDY0QS8SYd6CggaVziPY5fx2pnt5a70tFnn1wslg4Rg1e0W6o0ZIKaovq2
         dCPqw8XE3UfKlknwmRK1bU3gLIebTzevqcyOfzBgrUGmY1uiUbomTY2/L5QD8mze8oZY
         iRnmLl2UvIXm14igdgf3Y8cpxl7DBQ9xDwaCuODvn68pR9E7t/RqGOMua+3KYEjAplkE
         UX7VPPmze+4YFz2RMmNCcfNmFcG0H+kA/Rzds/jZBT89/y2Lj2BhMkugZ/euUPuId7wB
         48qBRyKsy27yvUwNF4SvCHGbEFAkU7OnBzSjCxs+52+7FnHpjAhGKBvSxwhrRNWiwUbD
         bIRw==
X-Forwarded-Encrypted: i=1; AJvYcCWdLiig3CGW8B0p78N+Yy8IsbVpf3gm1Qpi0ZXodyNqg3OknZcVlichtpRWU4I6nWdhpjzho/+c3zmqUAM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyjgmXLH33KPivkFci9FGdNgBSdDlSa8U7cVmW9JcBeS/ZRRnK
	vZF3E47MOrAL3v+qlV/JBkUC21p/UzaqM4cFmH9rEhP6Q59oKmbj6OjBTi9IknE=
X-Google-Smtp-Source: AGHT+IGKYEbmAbccdwLglj8Rtz7Ncms8BNc+Vjhrih2XUvI/cV2bfefpghFryVXCiPvCQUUiKdRNjQ==
X-Received: by 2002:a05:6a21:3401:b0:1c6:a777:4cfa with SMTP id adf61e73a8af0-1cc8b475035mr13030363637.13.1724824179851;
        Tue, 27 Aug 2024 22:49:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:10 -0700
Subject: [PATCH 04/16] mm: Add generic MAP_BELOW_HINT
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
Message-Id: <20240827-patches-below_hint_mmap-v1-4-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=+G9/grHdHxL6H0Lnh65S6ISh5epJb2mrAov/AP0hs9c=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XXGZXkeVtgeold2b3dqjkt+vEXMu6H6oc1bJNYtbJ
 3aetlzTUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERWFTEyNKap9S5rOHHkFBPT
 SkUp8yq1Cd/4ljyftDBFnmW663I5b4Z/RluSpK/6drw7JD8vOuPN75znwc73OQp/v/2R9GK2Tfl
 mPgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Make the generic implementation of arch_get_mmap_base() and
arch_get_mmap_end() support MAP_BELOW_HINT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/linux/sched/mm.h | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 265b43855d0b..c350bb5ac0a2 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -9,6 +9,7 @@
 #include <linux/gfp.h>
 #include <linux/sync_core.h>
 #include <linux/sched/coredump.h>
+#include <uapi/asm/mman.h>
 
 /*
  * Routines for handling mm_structs
@@ -170,11 +171,40 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
 
 #ifdef CONFIG_MMU
 #ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
+#define arch_get_mmap_end(addr, len, flags)							\
+({												\
+	unsigned long mmap_end;									\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(len) _len = (len);								\
+	mmap_end = TASK_SIZE;									\
+	if (_flags & MAP_BELOW_HINT && _addr != 0)						\
+		mmap_end = MIN(mmap_end, _addr + _len);						\
+	mmap_end;										\
+})
 #endif
 
 #ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, len, base, flags) (base)
+/*
+ * rnd_gap is defined to be (STACK_TOP - _base) due to the definition of
+ * mmap_base in mm/util.c
+ *
+ * Assumes ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT, which all architectures that
+ * implement generic mmap use
+ */
+#define arch_get_mmap_base(addr, len, base, flags)						\
+({												\
+	unsigned long mmap_base;								\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(base) _base = (base);								\
+	typeof(len) _len = (len);								\
+	unsigned long rnd_gap = STACK_TOP - _base;						\
+	mmap_base = _base;									\
+	if (_flags & MAP_BELOW_HINT && _addr != 0)						\
+		mmap_base = MIN(mmap_base, (_addr + _len) - rnd_gap);				\
+	mmap_base;										\
+})
 #endif
 
 extern void arch_pick_mmap_layout(struct mm_struct *mm,

-- 
2.45.0


