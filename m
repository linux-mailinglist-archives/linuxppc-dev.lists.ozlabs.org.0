Return-Path: <linuxppc-dev+bounces-1068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F596E4BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 23:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0BxG5MHpz2yx7;
	Fri,  6 Sep 2024 07:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725570978;
	cv=none; b=f4CxagvdPACTnoAYvZrc40/X25aYCnzDA0R+teLQQJDGoD4Ugc58/m5mrOK43fo636R5syw+DAAA7Z612ClPj+L7IzVEw69PujHUHYThtpbeLOHOcBcl99NKmCSsI3BdthJC2evYEIZ9Q8EhujVr9oJF1N+unZZtf4xv4EnsX6K7ydmZ82UqbsuWo935Enb6561vfBLRFad0CUGkprB1WPi5j3vHdloEfAHSK8btpIIDagQVTrQSPCHKQSus7p8vaYk/hJC1gOjGOSlDABEcdboqu7j7QsArzt2nehhvyNekZsfzELTVEGLHHnDR0BAw/Z2XI2B30F/55JOatWfl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725570978; c=relaxed/relaxed;
	bh=h1RxVlhkB8p72E7vZJvb+Ijp4614DvwE9gm+Vso2ack=;
	h=DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:To:Cc; b=SfjFB5EQFTNwwry/9N2sYtCLzskSrQi7NKsEUgJF9lVOHxmWfBGnrziCEhnVEEIJn1BetnSmqx3WT9eIcMoMtQ/oADtDImxVGCpvXRgkVDQYCfA4EmW3GzQ/XKsw7To1TPt6uH8TEx8qdL1yELstCXnQkKDOU51YTNJbhqesrO+bQExyX0S1yYpqM7y5vycR+DcGc+k0PYXXQUsRE91MiXfyLqUd8klW3F2/ClfNh37vcRs2VrYtzU2ApNxtHZGbwbsEC2HR+JL1s5JBqac5Ds1BidCb9UV2XxSitPi1T1bOshI2D3D4EJ/e1tE2MMpOi/CoLUhlW01Z/DYgBfHRxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=e36VJfNH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=e36VJfNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0BxF5MqVz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 07:16:16 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-709339c91f9so878316a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 14:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725570972; x=1726175772; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1RxVlhkB8p72E7vZJvb+Ijp4614DvwE9gm+Vso2ack=;
        b=e36VJfNHFi9X/sBm7gpBvsbocYCC28IHfqj558wBgrobFfuyiLOHv3pagaH3EyjPgk
         tyLAeO/qz8WjMQDndwmdPJjnOZ+WYg54lHRbeNH20JA2rr46qFEDu9RYqe8laEJmGwSw
         ME6T7sgIHBDMgWyrjbGQBQK4ICfdLx/j74+wSYy4n/dDD0tzJFvxmZAP/U1kukko+3oj
         pu0ocbqqD81AwOLS+Ewv/+7bMmDgHRHgOtv8sg8Sz8BNc0uu476fmJi2y901c1AGrbkR
         rDiYdyLGevIsMhHKtiZ9LONP47hmn64uOiknKO/xUeWKASTy+a9CLgjp1NTeOmuRb7c8
         BDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725570972; x=1726175772;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1RxVlhkB8p72E7vZJvb+Ijp4614DvwE9gm+Vso2ack=;
        b=BWwOLRH8oIJ7MPdWHMBPWu07t1FhVrTNN8WQjy+/MePxkBB9Wnqpa1Au6b+ujYcija
         sUxjQgkksNvYNeWiPbs6d4W+HyrD9S5xIIn8IbqYcjPMP4n3T7rzVLL/BWN36wER1cxx
         VEeS+mM45Pvz2JVSHbHseUvaL288a6wCoKJ8aZXaioj414PFY9Eke9+JuJreludHcTRo
         tLzmISO9jJ1qWud44NMTbHr7uF0g/Qf/IY6f1++AYIG2Orlm3OCsdI/fG7SiJ43L9IDk
         fENX1JPtyP8bJ7GT2NH7kkvB/gNVJZPfAOWGW5Is0JoN6t4D0cu9eaXIKRDxebkbRhP/
         jPOA==
X-Forwarded-Encrypted: i=1; AJvYcCUIrQ4MKtePJ3jx+YKweuoB3eoFfxmYablrsgoB+HfUjYQgo5ucUnD0T05ibC323UGJIbshDU1PSZJIe/s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLBIGkoMkg/8rrcPld8hOcSlDAuANEji65aWR1f1rKsfcJuuWy
	3ptC0H5V9PMk3QDykv1PKvo3oiah7Mg5Yjz/hMCIrTs+tvWQPBlJ3Paa9XOL8W0=
X-Google-Smtp-Source: AGHT+IFUGglg1gI40db05Oyw57X6jum9/dYSwirPMN5y+AFduyw81mLgzW8++XC4iGt5jarfSGqHMg==
X-Received: by 2002:a05:6358:4709:b0:1b8:3498:5ab2 with SMTP id e5c5f4694b2df-1b8386e10e6mr71603755d.18.1725570972065;
        Thu, 05 Sep 2024 14:16:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbda7abesm3775746a12.61.2024.09.05.14.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 14:16:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH RFC v3 0/2] mm: Introduce ADDR_LIMIT_47BIT personality flag
Date: Thu, 05 Sep 2024 14:15:50 -0700
Message-Id: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
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
X-B4-Tracking: v=1; b=H4sIAIYf2mYC/4XNTQrCMBAF4KtI1kaS6b8rQfAAbkVKmk7NgG1KU
 qJSendDVyKIyzeP+d7MPDpCz/abmTkM5MkOMSTbDdNGDTfk1MbMQEAqSij4qCZt0PMG7/ZRGxq
 muu/VyBuZtEWlUOosY/F7dNjRc5Uv7Hw6sms8GvKTda91Lci1+gsHyQVP864DbCoB0B4cBetp0
 Dtt+5UN8ElVvymIVJ6UCsq2QoXii1qW5Q0BYjuXEQEAAA==
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>, 
 Chris Torek <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5488; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8yDjUN3v9pzHbAJkU962KdEeNCXYhTKg/kSM+xczGS8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9ot+f6nvpcl97tY5XM5HRGwunrS/1hN4Jrc4J63aWdPl
 kkz5fzoKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCIbvBgZfjQZPtnyo0T8l+3r
 pTc0r/6LOCzwZu3XBXX7mfYvU6k4cI2R4YF4V0iLZoGQYvmDbN1ZIvanHjMsmvbgwI2pnto/ozc
 e4gMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the 48-bit address space,
unless the hint address uses more than 47 bits (the 48th bit is reserved
for the kernel address space).

The riscv architecture needs a way to similarly restrict the virtual
address space. On the riscv port of OpenJDK an error is thrown if
attempted to run on the 57-bit address space, called sv57 [1].  golang
has a comment that sv57 support is not complete, but there are some
workarounds to get it to mostly work [2].

These applications work on x86 because x86 does an implicit 47-bit
restriction of mmap() address that contain a hint address that is less
than 48 bits.

Instead of implicitly restricting the address space on riscv (or any
current/future architecture), provide a flag to the personality syscall
that can be used to ensure an application works in any arbitrary VA
space. A similar feature has already been implemented by the personality
syscall in ADDR_LIMIT_32BIT.

This flag will also allow seemless compatibility between all
architectures, so applications like Go and OpenJDK that use bits in a
virtual address can request the exact number of bits they need in a
generic way. The flag can be checked inside of vm_unmapped_area() so
that this flag does not have to be handled individually by each
architecture. 

Link:
https://github.com/openjdk/jdk/blob/f080b4bb8a75284db1b6037f8c00ef3b1ef1add1/src/hotspot/cpu/riscv/vm_version_riscv.cpp#L79
[1]
Link:
https://github.com/golang/go/blob/9e8ea567c838574a0f14538c0bbbd83c3215aa55/src/runtime/tagptr_64bit.go#L47
[2]

To: Arnd Bergmann <arnd@arndb.de>
To: Richard Henderson <richard.henderson@linaro.org>
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
To: Matt Turner <mattst88@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
To: Russell King <linux@armlinux.org.uk>
To: Guo Ren <guoren@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>
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
To: Thomas Gleixner <tglx@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: H. Peter Anvin <hpa@zytor.com>
To: Andy Lutomirski <luto@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
To: Muchun Song <muchun.song@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
To: Liam R. Howlett <Liam.Howlett@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Shuah Khan <shuah@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
To: Michal Hocko <mhocko@suse.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chris Torek <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-abi-devel@lists.sourceforge.net
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Changes in v2:
- Added much greater detail to cover letter
- Removed all code that touched architecture specific code and was able
  to factor this out into all generic functions, except for flags that
  needed to be added to vm_unmapped_area_info
- Made this an RFC since I have only tested it on riscv and x86
- Link to v1: https://lore.kernel.org/r/20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com

Changes in v3:
- Use a personality flag instead of an mmap flag
- Link to v2: https://lore.kernel.org/r/20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com

---
Charlie Jenkins (2):
      mm: Add personality flag to limit address to 47 bits
      selftests/mm: Create ADDR_LIMIT_47BIT test

 include/uapi/linux/personality.h                   |  1 +
 mm/mmap.c                                          |  3 ++
 tools/testing/selftests/mm/.gitignore              |  1 +
 tools/testing/selftests/mm/Makefile                |  1 +
 tools/testing/selftests/mm/map_47bit_personality.c | 34 ++++++++++++++++++++++
 5 files changed, 40 insertions(+)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55
-- 
- Charlie


