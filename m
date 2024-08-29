Return-Path: <linuxppc-dev+bounces-773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21C9652E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 00:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvwth6YXfz2ypW;
	Fri, 30 Aug 2024 08:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724950852;
	cv=none; b=j1rfxrV0cSx9cPj02rsthb+UnQFYsOXY8K7+p/Y3Kql4zuM011uU4GHpX3+9B1EBx/XwO2pz+dBSQACfzCs9LMiGyCwhcxAGUfgdptFzm/MUfK5ta0bV9ESRHFF3STFs/Qjti2EBaj0IpsxjsfhDCw2AMp9rNKVQee2vcpSSFpaj8z3Fwr8WPL63kv2zha6fk4enGsfni5yUqs2d3j+74difXcw3qieHUeR+Ysgn9mllefRY/G0lwbJuluglni4uLHBRlpEBeZGu3Edm75RP/skaOWq1YPjTc080FioRhjEAARtBrLleZJmyXLBl1JoDfpd4nzLXXABzQXtFbzM05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724950852; c=relaxed/relaxed;
	bh=v6yVeKIAZdNlCjwxHunt8GrVJ/ApsEacIVWq6Y0ogzc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:X-Google-Original-Date:Subject:
	 In-Reply-To:CC:From:To:Message-ID; b=K4X85m8jdoalp1PxTNxGEcm4kui9AXeV+8LyytbmkRvEDN1zqsX4Vhk1+cB/+LqbJnUBYCyciol/vvUg2Lx1IiWtUCQkxsXO6gzKATZARnOwgEwNN9wDexrI5JBOGw3JjXHoU+jT+2wORNmISPObmih3gPFl9a/c0WYzINewUASPR+oqIpEpyn2erQQvUTvA31DC7jcaOFskiRT0q56dHicuo4LZyAVe+sSbXAQK8tGY7Wb0+g+rlupIzwEOAZP4xq908SvyVSpSUB+Q0TAjp6XnyBSIJt9CQHB9SqDqSXRfb4c43Fw+bgda0Bgfa9BbZACT3SsEHmmAruhfNb4JSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Nq6Rjw1k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Nq6Rjw1k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvnbl6WKrz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 03:00:49 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71433096e89so723991b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1724950847; x=1725555647; darn=lists.ozlabs.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6yVeKIAZdNlCjwxHunt8GrVJ/ApsEacIVWq6Y0ogzc=;
        b=Nq6Rjw1k1QDAxVQOsboUcpF6aCdDIQD46nJIJeTAObUpF8zCSpwTJGouKjp+g9SgIh
         dM31W9xUTbm7105AtitcGgX/T1y2GYtXa6BLeOfCaMlDDkEr+e9JFxFkzJsE0QuYeQQm
         MSVDksMnqRKE5CAM2+tkj5py31cJzDhAw89n24q+yOpNy6UWIMSbF1Y7qO8ld51SZuNY
         Hhle+8j/0aVjS1RowjCMgyNoM5fe10TMZwkPf2ldG1DjP5LNItrPnN9I3xdc7i9nxjQV
         /4AEfl4jdp85cH15F5PYTsFyc/VD7QDdRCXsxTEQatmDmcB9UuPV/EVocIEDEcK8RJv4
         2pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950847; x=1725555647;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6yVeKIAZdNlCjwxHunt8GrVJ/ApsEacIVWq6Y0ogzc=;
        b=HB5D22IHqIA6870S0cGmzhXOXGMFcMhq5y1I9F4aQhIOKOg2Q6VqbQyg4Mg0fi5o5r
         vJczSSYosv6mw2++1UF5lbx4COJk7qcFWJT+P0Xqsa28IfL5Wca+vFw64IX7Xemofzpy
         7mtnTTsL6M8tHI35nQJEGXSGBQ2SAbXDEwbigwFJHo8DgArH/mqGp2b+jCjo+NB4xBFE
         7d5OLpdqPua9/HpG3F4QR/DAGTDz3rLVurOcDWlTFTeYzE9oH8BMjqZrlD2dUijLUcOc
         o4jRW8xmUHNvQLL8tiAOw2W+P1LeppI49w/ZdzZSVkpkKgMSYbDeH4UUCuygFVAFh9+V
         qykA==
X-Forwarded-Encrypted: i=1; AJvYcCVW7KjPPChTab7cKfPqaMufIwUZxT1snSYUzj6TERvqFM8tbqGHpafi+EV3PdEwsYWM9j434FY3uRE+wzA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywi5WVxnplHWpU2VVn4IAaA1GgpBH4E5jcdtHgXILG0cmU3YmTS
	Q/HEIGoISb58mRW7ophoSAlOfXielpt4/tFixjOjumBcflmGxNHoOt1tUxMzkN4=
X-Google-Smtp-Source: AGHT+IH3f6jrHjn3UecOjnnTSh7f1mjtosaBnqcvhiQTmwoBq2WfcZwsjSYUQZNm8240zpeF9tE3wA==
X-Received: by 2002:a05:6a00:91a0:b0:70d:2b1b:a37f with SMTP id d2e1a72fcca58-715dfc22895mr4520173b3a.24.1724950846693;
        Thu, 29 Aug 2024 10:00:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e77438dsm1466259a12.27.2024.08.29.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:00:45 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:00:45 -0700 (PDT)
X-Google-Original-Date: Thu, 29 Aug 2024 10:00:42 PDT (-0700)
Subject:     Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
In-Reply-To: <a048515e-f6e4-4d77-920b-6742529f3ca4@suse.cz>
CC: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
  Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
  linux@armlinux.org.uk, guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
  tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
  npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, agordeev@linux.ibm.com,
  gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com,
  svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
  davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
  muchun.song@linux.dev, akpm@linux-foundation.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
  shuah@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vbabka@suse.cz
Message-ID: <mhng-77a89c0b-bfdf-4a6f-bb6e-cee3ff1efbc6@palmer-ri-x1c9>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

On Thu, 29 Aug 2024 02:02:34 PDT (-0700), vbabka@suse.cz wrote:
> Such a large recipient list and no linux-api. CC'd, please include it on
> future postings.
>
> On 8/29/24 09:15, Charlie Jenkins wrote:
>> Some applications rely on placing data in free bits addresses allocated
>> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
>> address returned by mmap to be less than the 48-bit address space,
>> unless the hint address uses more than 47 bits (the 48th bit is reserved
>> for the kernel address space).
>>
>> The riscv architecture needs a way to similarly restrict the virtual
>> address space. On the riscv port of OpenJDK an error is thrown if
>> attempted to run on the 57-bit address space, called sv57 [1].  golang
>> has a comment that sv57 support is not complete, but there are some
>> workarounds to get it to mostly work [2].
>>
>> These applications work on x86 because x86 does an implicit 47-bit
>> restriction of mmap() address that contain a hint address that is less
>> than 48 bits.
>>
>> Instead of implicitly restricting the address space on riscv (or any
>> current/future architecture), a flag would allow users to opt-in to this
>> behavior rather than opt-out as is done on other architectures. This is
>> desirable because it is a small class of applications that do pointer
>> masking.
>
> I doubt it's desirable to have different behavior depending on architecture.
> Also you could say it's a small class of applications that need more than 47
> bits.

We're sort of stuck with the architeture-depending behavior here: for 
the first few years RISC-V only had 39-bit VAs, so the defato uABI ended 
up being that userspace can ignore way more bits.  While 48 bits might 
be enough for everyone, 39 doesn't seem to be -- or at least IIRC when 
we tried restricting the default to that, we broke stuff.  There's also 
some other wrinkles like arbitrary bit boundaries in pointer masking and 
vendor-specific paging formats, but at some point we just end up down a 
rabbit hole of insanity there...

FWIW, I think that userspace depending on just tossing some VA bits 
because some kernels happened to never allocate from them is just 
broken, but it seems like other ports worked around the 48->57 bit 
transition and we're trying to do something similar for 39->48 (and that 
works with 49->57, as we'll have to deal with that eventually).

So that's basically how we ended up with this sort of thing: trying to 
do something similar without a flag broke userspace because we were 
trying to jam too much into the hints.  I couldn't really figure out a 
way to satisfy all the userspace constraints by just implicitly 
retrofitting behavior based on the hints, so we figured having an 
explicit flag to control the behavior would be the sanest way to go.

That said: I'm not opposed to just saying "depending on 39-bit VAs is 
broken" and just forcing people to fix it.

>> This flag will also allow seemless compatibility between all
>> architectures, so applications like Go and OpenJDK that use bits in a
>> virtual address can request the exact number of bits they need in a
>> generic way. The flag can be checked inside of vm_unmapped_area() so
>> that this flag does not have to be handled individually by each
>> architecture.
>>
>> Link:
>> https://github.com/openjdk/jdk/blob/f080b4bb8a75284db1b6037f8c00ef3b1ef1add1/src/hotspot/cpu/riscv/vm_version_riscv.cpp#L79
>> [1]
>> Link:
>> https://github.com/golang/go/blob/9e8ea567c838574a0f14538c0bbbd83c3215aa55/src/runtime/tagptr_64bit.go#L47
>> [2]
>>
>> To: Arnd Bergmann <arnd@arndb.de>
>> To: Richard Henderson <richard.henderson@linaro.org>
>> To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>> To: Matt Turner <mattst88@gmail.com>
>> To: Vineet Gupta <vgupta@kernel.org>
>> To: Russell King <linux@armlinux.org.uk>
>> To: Guo Ren <guoren@kernel.org>
>> To: Huacai Chen <chenhuacai@kernel.org>
>> To: WANG Xuerui <kernel@xen0n.name>
>> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
>> To: Helge Deller <deller@gmx.de>
>> To: Michael Ellerman <mpe@ellerman.id.au>
>> To: Nicholas Piggin <npiggin@gmail.com>
>> To: Christophe Leroy <christophe.leroy@csgroup.eu>
>> To: Naveen N Rao <naveen@kernel.org>
>> To: Alexander Gordeev <agordeev@linux.ibm.com>
>> To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
>> To: Heiko Carstens <hca@linux.ibm.com>
>> To: Vasily Gorbik <gor@linux.ibm.com>
>> To: Christian Borntraeger <borntraeger@linux.ibm.com>
>> To: Sven Schnelle <svens@linux.ibm.com>
>> To: Yoshinori Sato <ysato@users.sourceforge.jp>
>> To: Rich Felker <dalias@libc.org>
>> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>> To: David S. Miller <davem@davemloft.net>
>> To: Andreas Larsson <andreas@gaisler.com>
>> To: Thomas Gleixner <tglx@linutronix.de>
>> To: Ingo Molnar <mingo@redhat.com>
>> To: Borislav Petkov <bp@alien8.de>
>> To: Dave Hansen <dave.hansen@linux.intel.com>
>> To: x86@kernel.org
>> To: H. Peter Anvin <hpa@zytor.com>
>> To: Andy Lutomirski <luto@kernel.org>
>> To: Peter Zijlstra <peterz@infradead.org>
>> To: Muchun Song <muchun.song@linux.dev>
>> To: Andrew Morton <akpm@linux-foundation.org>
>> To: Liam R. Howlett <Liam.Howlett@oracle.com>
>> To: Vlastimil Babka <vbabka@suse.cz>
>> To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> To: Shuah Khan <shuah@kernel.org>
>> Cc: linux-arch@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-alpha@vger.kernel.org
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-csky@vger.kernel.org
>> Cc: loongarch@lists.linux.dev
>> Cc: linux-mips@vger.kernel.org
>> Cc: linux-parisc@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kselftest@vger.kernel.org
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>
>> Changes in v2:
>> - Added much greater detail to cover letter
>> - Removed all code that touched architecture specific code and was able
>>   to factor this out into all generic functions, except for flags that
>>   needed to be added to vm_unmapped_area_info
>> - Made this an RFC since I have only tested it on riscv and x86
>> - Link to v1: https://lore.kernel.org/r/20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com
>>
>> ---
>> Charlie Jenkins (4):
>>       mm: Add MAP_BELOW_HINT
>>       mm: Add hint and mmap_flags to struct vm_unmapped_area_info
>>       mm: Support MAP_BELOW_HINT in vm_unmapped_area()
>>       selftests/mm: Create MAP_BELOW_HINT test
>>
>>  arch/alpha/kernel/osf_sys.c                  |  2 ++
>>  arch/arc/mm/mmap.c                           |  3 +++
>>  arch/arm/mm/mmap.c                           |  7 ++++++
>>  arch/csky/abiv1/mmap.c                       |  3 +++
>>  arch/loongarch/mm/mmap.c                     |  3 +++
>>  arch/mips/mm/mmap.c                          |  3 +++
>>  arch/parisc/kernel/sys_parisc.c              |  3 +++
>>  arch/powerpc/mm/book3s64/slice.c             |  7 ++++++
>>  arch/s390/mm/hugetlbpage.c                   |  4 ++++
>>  arch/s390/mm/mmap.c                          |  6 ++++++
>>  arch/sh/mm/mmap.c                            |  6 ++++++
>>  arch/sparc/kernel/sys_sparc_32.c             |  3 +++
>>  arch/sparc/kernel/sys_sparc_64.c             |  6 ++++++
>>  arch/sparc/mm/hugetlbpage.c                  |  4 ++++
>>  arch/x86/kernel/sys_x86_64.c                 |  6 ++++++
>>  arch/x86/mm/hugetlbpage.c                    |  4 ++++
>>  fs/hugetlbfs/inode.c                         |  4 ++++
>>  include/linux/mm.h                           |  2 ++
>>  include/uapi/asm-generic/mman-common.h       |  1 +
>>  mm/mmap.c                                    |  9 ++++++++
>>  tools/include/uapi/asm-generic/mman-common.h |  1 +
>>  tools/testing/selftests/mm/Makefile          |  1 +
>>  tools/testing/selftests/mm/map_below_hint.c  | 32 ++++++++++++++++++++++++++++
>>  23 files changed, 120 insertions(+)
>> ---
>> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
>> change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55

