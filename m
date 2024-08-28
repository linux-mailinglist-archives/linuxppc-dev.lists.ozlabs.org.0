Return-Path: <linuxppc-dev+bounces-700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BBE962F75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 20:13:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvCFs6cgVz2xbF;
	Thu, 29 Aug 2024 04:13:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724868801;
	cv=none; b=gNMe/JJ92Gdan9QjLIW7jWf34o+1j36Cj/Wzg8somRNgYg9lxEajzAAnPTvw8Rs8FGRyn97SPUWVnBNZ6VBGpKCP8vjnnmjNtp1ljZ80EWQCFU9YGgBfXfBokqg/ypYxThAScUm7+aq9M/dBi9NEl62kxnPHo1JbY2JqVSxTIwaNsPCOsCRqhPrY2Ju6gTF+Y7PaZROBL1utvZ0Po5KmIx3PgbnAZb9qbSIvUsDq7eXiOWErWGkUA5remFY6TX0CDfmnZ51kdk9WtmgEAUtGPs+rc6wXF/jj6mZ6iAl/mzZuF5uxAxs+5QgkBgYDsPaRzTZ7/wRnPBL5fiSIjzcuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724868801; c=relaxed/relaxed;
	bh=LALoI8v52A4/X4uxJhIa0heHcwoa9eC5vLoHkCEA7Ac=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Nope5EnLLMYHtCqv4/Awp8da+cABZBCGtM2V1XH2P1O+FuGUiWJ7NEcZJPAJlAPNFaBf8UMjnZNG6CG1XoGy+KbPXzYTp9Dbr2gy3FDWL1tfX0uvB7DTAETD06fJh6uujr4h06zxmtHi6E47uPUTF1LKGAOtXeynFaoGLIAhlDFsFAUbSCWER0Da6dxi42hUZCos55yXoZ6l3ABYWR3VeyO5FH2bgG/cTl8v5T5ntsa5ocItRI6vUtfiXyarLGB1bc9Uo9L3w3WOTOiquwuJk35CA6PwCiItYn6QyM0wn6IU20grG08A/liOILInX+iKA55IXUIfge/8WP97LP2tRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Orj2CBaj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Orj2CBaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvCFs37Vbz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 04:13:20 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2023dd9b86aso56258205ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724868797; x=1725473597; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LALoI8v52A4/X4uxJhIa0heHcwoa9eC5vLoHkCEA7Ac=;
        b=Orj2CBajnglZFOZe8SKCe3sEwUd/JuHD7o9sy3fyg70wIFUKx2y5tcg30buoMaoVsL
         tuGqiigiit9Lp5sCawsdRShXWYwNUtUZLRD9NISyYMNQWsFAboK9p1kjnXfWk5TTdl+r
         tfd5jQYKlV7LuA+KWShmqdGlFMbRoxVEQCWCBs5gWFThFJTCSl84gH6hYqGF1UA+96tC
         p1vWA2PdBIerGNaeuWAHKGfvUx4InHZ7v4RImMGYHsNWA+PF09j4IPFpNqXmL4m2LLhP
         QhjhUz5M0Ktdhmnu8ZLVUrFpju19ljEECYJ4Jc3bxSy9GeS91NCioWLUf880EaR1zatI
         jW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868797; x=1725473597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LALoI8v52A4/X4uxJhIa0heHcwoa9eC5vLoHkCEA7Ac=;
        b=qg/nkhnPNWTkLDS6BrN1Dh3JP/G6H68YX0E1tlGbI8USphGK40t+mAkigy9hDFKx2t
         +P9hnNQeRpXjsz8EpmG5zvFRKsHgrH3xKeFnRmESbdwMQv+jNiugN9Im/EQ5/9tVvBGv
         AfReh0xzd7MRH4GTEilGLq10JjDLfGjnKkImvLtwlHu3dGH8bR88ZrGgq2b7Xn2jvOAE
         RkR0NuuvQMoZuyfaEDhs1lBU0t7Zd/Ws7zKsEZpDOWKyln/JBKWowj4VSQ+Iq41UqW8N
         yYp4AI+tEuTzQ/cF4GOAgZrth8zYfJGCMxQ25783YB1UFdjqscqWcuwislk0+udbUMEB
         Sl1w==
X-Forwarded-Encrypted: i=1; AJvYcCV0xAfo6IfDBSCxFxOMGQBsUKjMlZyFCAMxqA6U4J9Z3zLoX2mxoC4z4XIr0hp4Wy3mBu2kg0XZzZtWDTk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw060wRsIzKRwF4kVbIPcl+p6YS6f8rT1R8z+S2Mf9GucxsViL3
	VvyblNrvcWB4EeSf/Igm0WuyPAmzagNK5fpbtxEPWzB+n7TtAcHSkeIthev6aN8=
X-Google-Smtp-Source: AGHT+IGuZvjR8n1DEJgaREJ89Ekx33Df2TcjSjzsxg5aNNIN6dSl+M4/n8ZHA/SWHFgBiHe+4H0WZQ==
X-Received: by 2002:a17:902:f78c:b0:1fd:9269:72c6 with SMTP id d9443c01a7336-2050c4a5b8fmr3765425ad.62.1724868797179;
        Wed, 28 Aug 2024 11:13:17 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df88esm101966005ad.152.2024.08.28.11.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:13:16 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:13:11 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 16/16] selftests/mm: Create MAP_BELOW_HINT test
Message-ID: <Zs9oty09IysKUHCF@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <20240827-patches-below_hint_mmap-v1-16-46ff2eb9022d@rivosinc.com>
 <71528354-4884-41e4-a4a9-318e26187f86@lucifer.local>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71528354-4884-41e4-a4a9-318e26187f86@lucifer.local>

On Wed, Aug 28, 2024 at 06:48:33PM +0100, Lorenzo Stoakes wrote:
> On Tue, Aug 27, 2024 at 10:49:22PM GMT, Charlie Jenkins wrote:
> > Add a selftest for MAP_BELOW_HINT that maps until it runs out of space
> > below the hint address.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/testing/selftests/mm/Makefile         |  1 +
> >  tools/testing/selftests/mm/map_below_hint.c | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> > index cfad627e8d94..4e2de85267b5 100644
> > --- a/tools/testing/selftests/mm/Makefile
> > +++ b/tools/testing/selftests/mm/Makefile
> > @@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
> >  TEST_GEN_FILES += hugepage-vmemmap
> >  TEST_GEN_FILES += khugepaged
> >  TEST_GEN_FILES += madv_populate
> > +TEST_GEN_FILES += map_below_hint
> >  TEST_GEN_FILES += map_fixed_noreplace
> >  TEST_GEN_FILES += map_hugetlb
> >  TEST_GEN_FILES += map_populate
> > diff --git a/tools/testing/selftests/mm/map_below_hint.c b/tools/testing/selftests/mm/map_below_hint.c
> > new file mode 100644
> > index 000000000000..305274c5af49
> > --- /dev/null
> > +++ b/tools/testing/selftests/mm/map_below_hint.c
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Test the MAP_BELOW_HINT mmap flag.
> > + */
> > +#include <sys/mman.h>
> > +#include "../kselftest.h"
> > +
> > +#define ADDR 0x1000000UL
> > +#define LENGTH (ADDR / 100)
> > +
> > +#define MAP_BELOW_HINT	  0x8000000	/* Not defined in all libc */
> > +
> > +/*
> > + * Map memory with MAP_BELOW_HINT until no memory left. Ensure that all returned
> > + * addresses are below the hint.
> > + */
> > +int main(int argc, char **argv)
> > +{
> > +	void *addr;
> > +
> > +	do {
> > +		addr = mmap((void *)ADDR, LENGTH, MAP_ANONYMOUS, MAP_BELOW_HINT, -1, 0);
> 
> How can this be correct? mmap() has parameters:
> 
>        void *mmap(void addr[.length], size_t length, int prot, int flags,
>                   int fd, off_t offset);
> 
> You'r setting prot = MAP_ANONYMOUS, flags = MAP_BELOW_HINT...
> 
> This surely should be:
> 
> mmap(..., PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE | MAP_BELOW_HINT, -1, 0);
> 
> > +	} while (addr == MAP_FAILED && (unsigned long)addr <= ADDR);
> 
> How can addr == MAP_FAILED (i.e. ~0) and addr <= ADDR? This will just loop
> through once...
> 
> If you want to make sure you're getting mappings only below the hint until
> you start getting MAP_FAILED's you'll need to handle this more robustly.
> 
> > +
> > +	if (addr != MAP_FAILED && (unsigned long)addr > ADDR)
> > +		ksft_exit_fail_msg("mmap returned address above hint with MAP_BELOW_HINT\n");
> 
> This is just going to fail because your flags are wrong then wrongly claim
> to have passed...

I obviously didn't spend enough time thinking about this test case...
You are correct that I wrote this incorrectly. I will make a proper test case
and send out a new version.

- Charlie

> 
> > +
> > +	ksft_test_result_pass("MAP_BELOW_HINT works\n");
> > +}
> >
> > --
> > 2.45.0
> >

