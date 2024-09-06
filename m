Return-Path: <linuxppc-dev+bounces-1076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD396E9AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 08:09:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Qlv4Nd5z3013;
	Fri,  6 Sep 2024 16:08:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725602939;
	cv=none; b=G0/xAiavpHJNM1Gw8AkoYpHk5mgkjJvdwN1UKQPw19tYkNmnHV1Ew9Y7jNGusAt701wDWR5xdI9Nw2vx+JaxN+Tx0OwrCOadBzCVdS5iEG2VO/j52yDk/EqVs+ScxPDHD83K99Dq3SNmGlBvBcWS2ehu/FEw9HgFMmBDVGhoL3U9PrXJQeA21GFlKdM0k4s/hH8L1LhTQw9DyT8hUv4qatBUbtKq/0JoxDQCRncj+pH4dmuWHYsqKQQFn+wyAxroEMSlRJipd14UwcTE82Cr/OekVqoxohNA2GVPbkTR9qfRxNOaTJwOzKLWQ5dXniy8MdphWVeZkz0XpT2iy9+9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725602939; c=relaxed/relaxed;
	bh=KoDC8byJaDeNriYQvbHrbg6UlJkCxONYM11UgK73y7s=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=JpQuTzPdreTAdOlFFypt9qivdlp5Xd9DKtKzLkSDLcCdihmcL+mxPAFtPOboSDEW1xngljgD2bGHz2JbrId6ZZvMhE/wUd3CN0YqxItMa4jqlR8Lg9T4kfsE4vKGVAmI+vg4XmVCAa5OZc1Zhe6XJZd777Rjnh3NlTzLygbZxWTdvKzYqR0B8WAGA3SfryGxTmmu+PVeYG0I1E3FDfjypnnzhDnQ6nmHe5snEdDGvXIwEh9JeYwZPvqMlKpe/iGbRt+kdnf+GCOHIN9vdMh+/52FiEskg74f3KsWk1CLWM7cXZM12BLVwidVM7LyP9m0VddR8UUQl6Dd2ASCZi/+hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mMW64gLm; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mMW64gLm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Qlv0gGZz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 16:08:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBA595C5B3E
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 06:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7EEC4AF0E
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725602934;
	bh=imDUvx1Hii43SnkhK8GwTQs26eTyhJYRfhTDRAtZziQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mMW64gLmWYwNHxfzlvaoGMBLGF0ueWOxcjrWhSUrtIlP4vdUd7xae5JPy3JKqIExz
	 HFuiZx6oWJmovq63/cl+v1ZU19PDWFCuqMas6d7gV33rwhbsIjf/6jKgtDJi0CjkaM
	 nAyscQokSqYPIUNn+/TkhSXvtu24dJ3kiLF2CEDvIPyPBbHH7uk6zFOptSZYge3L0P
	 rhjznSkw4UEu9OgtKgG+WNoivArvnTJTCqu9mRUL1aD6wfECi7osbo4z5PCvKLIQRB
	 x3CsUjPvuNXAShUQV2Y5AaW8FjjBy+AWygG7+uu3f9QIpIxTL3VXFknAtoxQuKUuS7
	 CI+n8mob5I75g==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso233313766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 23:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+jsHrqfZ6MEWpCuZvNrHmunS6L2sRCeR6+q/++pLAhEKqj/SOtq1PPfbZSGbo9L7bS1OGI5NUxmEt2as=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzulcJ4/nbbinukQYytvMQ7x4ITYol1BakW9X4bmwvYu1IjyzKb
	lqGqs6scl1nF5u5MJPnEM2gAA7/wpj7FrdDWlOrCkgXshwBs2Rvv0A1hheIokwXk9hQQA9d2nrn
	tRYM/7WRxlC2vsH7kOMPy3Jlfkw8=
X-Google-Smtp-Source: AGHT+IHmDTwta2M/ptJ8I+HJGlz0i22zQ861L/VtKZzzihvpyO7sN1xzTAGALtM9rjMcOlsIyxzfNUzFUkdZe9E/qYg=
X-Received: by 2002:a17:907:7d94:b0:a86:beb2:1d6d with SMTP id
 a640c23a62f3a-a8a431c7214mr876305366b.26.1725602932791; Thu, 05 Sep 2024
 23:08:52 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
In-Reply-To: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Sep 2024 14:08:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS4=8dMypnWe2dpuQfdfV3+XLq5fZeGbJWZPDN_ypfuvQ@mail.gmail.com>
Message-ID: <CAJF2gTS4=8dMypnWe2dpuQfdfV3+XLq5fZeGbJWZPDN_ypfuvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/2] mm: Introduce ADDR_LIMIT_47BIT personality flag
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 5:16=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> Some applications rely on placing data in free bits addresses allocated
> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> address returned by mmap to be less than the 48-bit address space,
> unless the hint address uses more than 47 bits (the 48th bit is reserved
> for the kernel address space).
>
> The riscv architecture needs a way to similarly restrict the virtual
> address space. On the riscv port of OpenJDK an error is thrown if
> attempted to run on the 57-bit address space, called sv57 [1].  golang
> has a comment that sv57 support is not complete, but there are some
> workarounds to get it to mostly work [2].
>
> These applications work on x86 because x86 does an implicit 47-bit
> restriction of mmap() address that contain a hint address that is less
> than 48 bits.
>
> Instead of implicitly restricting the address space on riscv (or any
> current/future architecture), provide a flag to the personality syscall
> that can be used to ensure an application works in any arbitrary VA
> space. A similar feature has already been implemented by the personality
> syscall in ADDR_LIMIT_32BIT.
>
> This flag will also allow seemless compatibility between all
> architectures, so applications like Go and OpenJDK that use bits in a
> virtual address can request the exact number of bits they need in a
> generic way. The flag can be checked inside of vm_unmapped_area() so
> that this flag does not have to be handled individually by each
> architecture.
Acked-by: Guo Ren <guoren@kernel.org>

Sv57's pain finds its cure in this antidote.

>
> Link:
> https://github.com/openjdk/jdk/blob/f080b4bb8a75284db1b6037f8c00ef3b1ef1a=
dd1/src/hotspot/cpu/riscv/vm_version_riscv.cpp#L79
> [1]
> Link:
> https://github.com/golang/go/blob/9e8ea567c838574a0f14538c0bbbd83c3215aa5=
5/src/runtime/tagptr_64bit.go#L47
> [2]
>
> To: Arnd Bergmann <arnd@arndb.de>
> To: Richard Henderson <richard.henderson@linaro.org>
> To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> To: Matt Turner <mattst88@gmail.com>
> To: Vineet Gupta <vgupta@kernel.org>
> To: Russell King <linux@armlinux.org.uk>
> To: Guo Ren <guoren@kernel.org>
> To: Huacai Chen <chenhuacai@kernel.org>
> To: WANG Xuerui <kernel@xen0n.name>
> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> To: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> To: Helge Deller <deller@gmx.de>
> To: Michael Ellerman <mpe@ellerman.id.au>
> To: Nicholas Piggin <npiggin@gmail.com>
> To: Christophe Leroy <christophe.leroy@csgroup.eu>
> To: Naveen N Rao <naveen@kernel.org>
> To: Alexander Gordeev <agordeev@linux.ibm.com>
> To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> To: Heiko Carstens <hca@linux.ibm.com>
> To: Vasily Gorbik <gor@linux.ibm.com>
> To: Christian Borntraeger <borntraeger@linux.ibm.com>
> To: Sven Schnelle <svens@linux.ibm.com>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> To: David S. Miller <davem@davemloft.net>
> To: Andreas Larsson <andreas@gaisler.com>
> To: Thomas Gleixner <tglx@linutronix.de>
> To: Ingo Molnar <mingo@redhat.com>
> To: Borislav Petkov <bp@alien8.de>
> To: Dave Hansen <dave.hansen@linux.intel.com>
> To: x86@kernel.org
> To: H. Peter Anvin <hpa@zytor.com>
> To: Andy Lutomirski <luto@kernel.org>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Muchun Song <muchun.song@linux.dev>
> To: Andrew Morton <akpm@linux-foundation.org>
> To: Liam R. Howlett <Liam.Howlett@oracle.com>
> To: Vlastimil Babka <vbabka@suse.cz>
> To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> To: Shuah Khan <shuah@kernel.org>
> To: Christoph Hellwig <hch@infradead.org>
> To: Michal Hocko <mhocko@suse.com>
> To: "Kirill A. Shutemov" <kirill@shutemov.name>
> To: Chris Torek <chris.torek@gmail.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-abi-devel@lists.sourceforge.net
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>
> Changes in v2:
> - Added much greater detail to cover letter
> - Removed all code that touched architecture specific code and was able
>   to factor this out into all generic functions, except for flags that
>   needed to be added to vm_unmapped_area_info
> - Made this an RFC since I have only tested it on riscv and x86
> - Link to v1: https://lore.kernel.org/r/20240827-patches-below_hint_mmap-=
v1-0-46ff2eb9022d@rivosinc.com
>
> Changes in v3:
> - Use a personality flag instead of an mmap flag
> - Link to v2: https://lore.kernel.org/r/20240829-patches-below_hint_mmap-=
v2-0-638a28d9eae0@rivosinc.com
>
> ---
> Charlie Jenkins (2):
>       mm: Add personality flag to limit address to 47 bits
>       selftests/mm: Create ADDR_LIMIT_47BIT test
>
>  include/uapi/linux/personality.h                   |  1 +
>  mm/mmap.c                                          |  3 ++
>  tools/testing/selftests/mm/.gitignore              |  1 +
>  tools/testing/selftests/mm/Makefile                |  1 +
>  tools/testing/selftests/mm/map_47bit_personality.c | 34 ++++++++++++++++=
++++++
>  5 files changed, 40 insertions(+)
> ---
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> change-id: 20240827-patches-below_hint_mmap-b13d79ae1c55
> --
> - Charlie
>


--=20
Best Regards
 Guo Ren

