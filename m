Return-Path: <linuxppc-dev+bounces-641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDAA962072
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwg02pfdz2yZ4;
	Wed, 28 Aug 2024 17:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824170;
	cv=none; b=n9o9J8U+HbRZNRXc4QkSpMBCJj6rGas2BJHfRYBEuTRS8qa/sVlK6VUhUFmYNNHLSpy1HA11gL0f4G8HAefEKR1uAIFxgoS+S2cihZcrH+L2yFmLqbp5WTIyDSaIiTAVLtLES060ZZ3HJ0fu00H7tOPrUiPQvJFsjvGMxjRVRWvnpzEEuPiQyljmhfz8BRT7JEHgpGX7K/wtMcEfl16ltPk/l5SPZirXQaxgCie4UFHHCSB+GTLQf3CQMepoW/7JWBOQAsbPBkXwZpxvIL29OprWkM5YupsGA4ZiwFit8JCXXsY4avt39jvm9Fuk3op++tj0qHVv4oYqClgYhyHKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824170; c=relaxed/relaxed;
	bh=IUFbDMgjzsoT48Z/N2yqe2kry93QHxmitnGNSfp0h7M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=Grif8FEDlEXsyKQHX5xZE2oaPcKfuAv9gPQ6nVZpWpz8YXrw6wFbaaQi7refSFLx72U9K6cUYsBDtqtwXilNTdwZzOJoRG8wfppKjX01KfW97Rl3UNj0J0eYJwYyNAcv1Ud8mZpjb5S5Cg/uItQzsqs43V/5xPa52KsJs6TtoYcr6TIWVTK7ktOki/5/enTLmiqN9aEf02jHrS6UWBmW7n+/eTVQ3kYP0MbR5Vqzx/3Xi55DZdkFdfZDgqX65dfFMttxb+T5uL6V/5rkHRPvX7+eFAmUaK9Pwed8JOVPNGfwc6BUxVF5M1lHQFZcWST4WDao/+dVVOsi+WZdC39Cvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kmLqZvrJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kmLqZvrJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WttlY5c4vz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:49:28 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-714262f1bb4so4649229b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824166; x=1725428966; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUFbDMgjzsoT48Z/N2yqe2kry93QHxmitnGNSfp0h7M=;
        b=kmLqZvrJFqWzaDvWhBbbPLjJOpmM8Fsir7Tbv41q98SuGy+Ej5PEkRhq9fXL/xUqt/
         jyFj/uOdvt2cWe62fpnruKW+PiImbXzmYDxY8eYhTJN3zl8mvfgYAzF5vj8UTT3f2H45
         EHeQUDaFCx0hEiVggL4XZb40wZXsoijeRYmFgnE12YK38uQBzw6hN8o034tW/6WUzv6I
         JfXMIWCDuV4mItEjOSpIiRH1T3FzRBxjsNMW5+CCDAVkoVhZmL1I1yJJVTqfncAJMFpb
         9NXLiOlRa3mmbi+qIeG3qiq4aof6GbuASYrLqsQl66TBq2Lu9DJG6My8JYADNfdbfiul
         jQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824166; x=1725428966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUFbDMgjzsoT48Z/N2yqe2kry93QHxmitnGNSfp0h7M=;
        b=kRQDaB0Z0Pl8Iud/TrcW8HdOH4b6U+a6pmkhnZgW7CMSEvka7eOFP0KhXbix/BDkY3
         dVzjSZXLvM5AsHeJ8ag3dAV+MaWpEA1swBECOFgkQQWzXPzgO1zuyYDfaDkA0oTLR3HI
         b4qUPQg6aVN3iLYFKfbjS1paRH4ouXZx+cIx6OogmCqw1ffmTAu2snM26aaGBB9sXshR
         EzGCiDJQBBpdyW2eblNkhxTmLRbRnNRa3eXlb6ArYYfpnpmWPeLiAdDzuV8WtZqU6/co
         /RmumT6QoiitIzhBW8RQ8a6KOEFASOIE4mXfPPAepXaFIvCO8wq1RcJsEMEddGPTtoXb
         1EFA==
X-Forwarded-Encrypted: i=1; AJvYcCVQS85vHG8WF/HBYON8EnfnXB4bkKs+SuaaS5WQgqDs3AVNdKYkHALKvZUvT8fNcwOxCW/tzdaCUQusxxE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzNMl3U39IZn0qMhMWUHDqMfAs9W/yJdhGnYMF/usM93KgCCZL/
	WKDmJMdNdtIwUdYGuO9i9aP11pbPf1OuWgMEcYOZXdEA654vbR/Le1kZUjOgFzI=
X-Google-Smtp-Source: AGHT+IF6T5IRS6PI9ffePkiTGEXwg74qwFWRmO3+h509ZqjZl31p2gGXC6rr0MOwZENhtWiyWe3S3w==
X-Received: by 2002:a05:6a21:78e:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1cc8b49d8abmr14865175637.27.1724824165540;
        Tue, 27 Aug 2024 22:49:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:24 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Date: Tue, 27 Aug 2024 22:49:06 -0700
Message-Id: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
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
X-B4-Tracking: v=1; b=H4sIAFK6zmYC/x3MTQqAIBBA4avErBPSkn6uEhFmUw6UiUYF4d2Tl
 t/ivRcCesIAXfaCx4sCHTaB5xloo+yKjOZkEIWoikbUzKlTGwxswu24R0P2HPddOTbxcq5bhVx
 LCal2Hhd6/nM/xPgBQKT3MGkAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6044; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rybnxgXRfasNksP5lSU1TnJeqx+66siNWRNOd7Jshtg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XSH3lM7XXzj5QFjW4OtX+60nZ+rMb1N2D9F5e2t+8
 tuSp8uiOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIkUMMf8WSWp0unDgcOEl5
 8kUJVXP5KYyTLI0KMiNvKmnOTI5taWBk2Cj+dkXn/qc3T0v2+U/SXhD+ZpOA/e/6H56BP2LNukr
 5GQE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the maximum address space,
unless the hint address is greater than this value.

On arm64 this barrier is at 52 bits and on x86 it is at 56 bits. This
flag allows applications a way to specify exactly how many bits they
want to be left unused by mmap. This eliminates the need for
applications to know the page table hierarchy of the system to be able
to reason which addresses mmap will be allowed to return.

---
riscv made this feature of mmap returning addresses less than the hint
address the default behavior. This was in contrast to the implementation
of x86/arm64 that have a single boundary at the 5-level page table
region. However this restriction proved too great -- the reduced
address space when using a hint address was too small.

A patch for riscv [1] reverts the behavior that broke userspace. This
series serves to make this feature available to all architectures.

I have only tested on riscv and x86. There is a tremendous amount of
duplicated code in mmap so the implementations across architectures I
believe should be mostly consistent. I added this feature to all
architectures that implement either
arch_get_mmap_end()/arch_get_mmap_base() or
arch_get_unmapped_area_topdown()/arch_get_unmapped_area(). I also added
it to the default behavior for arch_get_mmap_end()/arch_get_mmap_base().

Link: https://lore.kernel.org/lkml/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/T/ [1]

To: Arnd Bergmann <arnd@arndb.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
To: Liam R. Howlett <Liam.Howlett@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Thomas Gleixner <tglx@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: H. Peter Anvin <hpa@zytor.com>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Russell King <linux@armlinux.org.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
To: Alexander Gordeev <agordeev@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
To: Vasily Gorbik <gor@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Sven Schnelle <svens@linux.ibm.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
To: Rich Felker <dalias@libc.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David S. Miller <davem@davemloft.net>
To: Andreas Larsson <andreas@gaisler.com>
To: Shuah Khan <shuah@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Charlie Jenkins (16):
      mm: Add MAP_BELOW_HINT
      riscv: mm: Do not restrict mmap address based on hint
      mm: Add flag and len param to arch_get_mmap_base()
      mm: Add generic MAP_BELOW_HINT
      riscv: mm: Support MAP_BELOW_HINT
      arm64: mm: Support MAP_BELOW_HINT
      powerpc: mm: Support MAP_BELOW_HINT
      x86: mm: Support MAP_BELOW_HINT
      loongarch: mm: Support MAP_BELOW_HINT
      arm: mm: Support MAP_BELOW_HINT
      mips: mm: Support MAP_BELOW_HINT
      parisc: mm: Support MAP_BELOW_HINT
      s390: mm: Support MAP_BELOW_HINT
      sh: mm: Support MAP_BELOW_HINT
      sparc: mm: Support MAP_BELOW_HINT
      selftests/mm: Create MAP_BELOW_HINT test

 arch/arm/mm/mmap.c                           | 10 ++++++++
 arch/arm64/include/asm/processor.h           | 34 ++++++++++++++++++++++----
 arch/loongarch/mm/mmap.c                     | 11 +++++++++
 arch/mips/mm/mmap.c                          |  9 +++++++
 arch/parisc/include/uapi/asm/mman.h          |  1 +
 arch/parisc/kernel/sys_parisc.c              |  9 +++++++
 arch/powerpc/include/asm/task_size_64.h      | 36 +++++++++++++++++++++++-----
 arch/riscv/include/asm/processor.h           | 32 -------------------------
 arch/s390/mm/mmap.c                          | 10 ++++++++
 arch/sh/mm/mmap.c                            | 10 ++++++++
 arch/sparc/kernel/sys_sparc_64.c             |  8 +++++++
 arch/x86/kernel/sys_x86_64.c                 | 25 ++++++++++++++++---
 fs/hugetlbfs/inode.c                         |  2 +-
 include/linux/sched/mm.h                     | 34 ++++++++++++++++++++++++--
 include/uapi/asm-generic/mman-common.h       |  1 +
 mm/mmap.c                                    |  2 +-
 tools/arch/parisc/include/uapi/asm/mman.h    |  1 +
 tools/include/uapi/asm-generic/mman-common.h |  1 +
 tools/testing/selftests/mm/Makefile          |  1 +
 tools/testing/selftests/mm/map_below_hint.c  | 29 ++++++++++++++++++++++
 20 files changed, 216 insertions(+), 50 deletions(-)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55
-- 
- Charlie


