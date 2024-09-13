Return-Path: <linuxppc-dev+bounces-1349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61049978A5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 23:04:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X56Hj1K71z2yVZ;
	Sat, 14 Sep 2024 07:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726261457;
	cv=none; b=iYCAYrIrF6T5+JHzoVdauBlgH5it5LVWFocX2sGhFwrkBYNbtgwKoBLO94n44ldN/R/31l1hHSDgzYEnzghw4Hxd4A4vLPs6VEFSdvNNlzg+732BluC2o5uqNg+W3e/G0cYF7V2qcX+MuAoHPC9z2jXVpQWavhSULhEAVx0BWH3Fxt415AYrtmNamAscQVXrDBSB2+Ttg59f8PsPfx0zPXBZOMicXJDLSLUDYmBaEuRsVEfKC81kYNdG6LkxexVb76EaUn1/zILF97dGzuZoISdDpSy2BcPYs2Zbbyk8BQdImdTW5mEzCdafruzOwn0khVzfhoJXjLB2Rc07t+hSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726261457; c=relaxed/relaxed;
	bh=pGN098PfFZ1p39RZKtno/bb1iGOxyKkQDSILC8HyAbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoTKcLo0p8GgUAqjJfVgK0p1p0uJBRMZLt7mC5gvO4/iF3jB8Cj/h8vuDv+2ggTYz61D0XzoMJsqdUMrhEk6N4+7FCOgQYqpz5Eh9jCZJ7CNnt4aC7MUG6ZnLoiPKTyLJ1gsHCij7lR1LWhCiDv4SzRhOvV0OciVowDcU7+eWb/zpZ+XYNQJk9juIhm9OjQB8sFcgGe7K0p/yHuhJqpw7ic7LDxBm6UT4kmxg0cWuSADJCqlQ1ya5ArLU1ewFS9F1BOiIbPqoPv2PubltNYjp5PuRPAelmpdTtaDvn3Nn+/DY8y8t7RB4FiJZPvDetukKUsG4SeSzG3rKYKAmxThyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Cug1/MTq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Cug1/MTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X56Hh5Zb4z2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 07:04:15 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-206aee40676so12118285ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726261452; x=1726866252; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pGN098PfFZ1p39RZKtno/bb1iGOxyKkQDSILC8HyAbs=;
        b=Cug1/MTq7P0IalB0AQG3eTPOAcPCSh8/epKXDsSO59ftjnLnOxElVWWNFR34rS/QHr
         /95baQylhmS6zm7UeDqPx6LtB9WMTxKIERpDBdAyLGmR3EMowzTOKhwM2MQqJysej8+Q
         2/WqHIhEeyVNW1muX2U8UY8ZxzXZeEb/N7mrf6oXsuXzV35ZS4i9c8vxaoRp2Q0xVoPI
         mdOb/V4BcCNdjWN3huDVICHnP1/UdL+pbi99CSqKXPqMoXFcNsDo4Bc5QZonav3Pe5Dt
         0h6pornv55ikKf5dfCq8A7jIauAIdEaNZ4g+Uy0vVt6cvIfBVyoakMzrbGsM+noppSUy
         IIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726261452; x=1726866252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGN098PfFZ1p39RZKtno/bb1iGOxyKkQDSILC8HyAbs=;
        b=pEwx2y/HWct/XNxucGl5kw+lpke3dBiQV3F4EMBU6ZNP3aifdQN6BeH66UG/qAB2oB
         jTA1oGEBfek4Fte+Mv9uNsNUsKGVY+iyhGJUlToGUPaQdtCV6dR+jZNx9kLt6lNhPJFn
         IULkkkUSxpz2IP3lEEYhH+SY0Ppw/cKrlgLYnebJAG/uyzsawRWTrVOX+S3K+ItPwqzO
         L1KUK2thgwGUV1H5aHkcFyj/yCWDIeXjUlBC16V4jo/3XpECeCxIYBgtyeKXZFpEKfnF
         UwSY+ymKPK7Pp2H0VcuJrKG86IccABz9yzCIn1eQTGpIxemxmUWCpPR3S71GjmP75/UX
         xc5w==
X-Forwarded-Encrypted: i=1; AJvYcCVYOZd+k80Tob7DT1xiQY4NOfjBftfDE8eAqaml95b8I4qrT0aKC4/oZGLjRR6hcTvCKyNkjTKFWzbGlzw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLBPbuDm7Ei8NmfomyhBjfaaD3lgbwE/mnc6cXHfYkuccErAiH
	2FOrGo45QiUfVfjX8A+7qlH7vR455Ihy6o278HApwGXVwjDg2yp8Ccsda+IPylI=
X-Google-Smtp-Source: AGHT+IHQy68+7/4em5wfAX0phJQ7a7VsNC8xlp5lvUp2N1zpKPOlth6aUECbhTSHxYBYBN7icOc/wA==
X-Received: by 2002:a17:902:f54f:b0:207:457f:b8a6 with SMTP id d9443c01a7336-2078262ccc1mr54571405ad.12.1726261452005;
        Fri, 13 Sep 2024 14:04:12 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da8c9sm608475ad.17.2024.09.13.14.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:04:11 -0700 (PDT)
Date: Fri, 13 Sep 2024 14:04:06 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, shuah <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuSoxh5U3Kj1XgGq@ghost>
References: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <d873a994-4efa-4d3a-bdae-5d9a3eff29f2@lucifer.local>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d873a994-4efa-4d3a-bdae-5d9a3eff29f2@lucifer.local>

On Fri, Sep 13, 2024 at 08:41:34AM +0100, Lorenzo Stoakes wrote:
> On Wed, Sep 11, 2024 at 11:18:12PM GMT, Charlie Jenkins wrote:
> > On Wed, Sep 11, 2024 at 07:21:27PM +0100, Catalin Marinas wrote:
> > > On Tue, Sep 10, 2024 at 05:45:07PM -0700, Charlie Jenkins wrote:
> > > > On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> > > > > * Catalin Marinas <catalin.marinas@arm.com> [240906 07:44]:
> > > > > > On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
> > > > > > > On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> > > > > > > > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > >> It's also unclear to me how we want this flag to interact with
> > > > > > > >> the existing logic in arch_get_mmap_end(), which attempts to
> > > > > > > >> limit the default mapping to a 47-bit address space already.
> > > > > > > >
> > > > > > > > To optimize RISC-V progress, I recommend:
> > > > > > > >
> > > > > > > > Step 1: Approve the patch.
> > > > > > > > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> > > > > > > > Step 3: Wait approximately several iterations for Go & OpenJDK
> > > > > > > > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()
> > >
> > > Point 4 is an ABI change. What guarantees that there isn't still
> > > software out there that relies on the old behaviour?
> >
> > Yeah I don't think it would be desirable to remove the 47 bit
> > constraint in architectures that already have it.
> >
> > >
> > > > > > > I really want to first see a plausible explanation about why
> > > > > > > RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
> > > > > > > like all the other major architectures (x86, arm64, powerpc64),
> > > > > >
> > > > > > FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
> > > > > > configuration. We end up with a 47-bit with 16K pages but for a
> > > > > > different reason that has to do with LPA2 support (I doubt we need this
> > > > > > for the user mapping but we need to untangle some of the macros there;
> > > > > > that's for a separate discussion).
> > > > > >
> > > > > > That said, we haven't encountered any user space problems with a 48-bit
> > > > > > DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
> > > > > > approach (47 or 48 bit default limit). Better to have some ABI
> > > > > > consistency between architectures. One can still ask for addresses above
> > > > > > this default limit via mmap().
> > > > >
> > > > > I think that is best as well.
> > > > >
> > > > > Can we please just do what x86 and arm64 does?
> > > >
> > > > I responded to Arnd in the other thread, but I am still not convinced
> > > > that the solution that x86 and arm64 have selected is the best solution.
> > > > The solution of defaulting to 47 bits does allow applications the
> > > > ability to get addresses that are below 47 bits. However, due to
> > > > differences across architectures it doesn't seem possible to have all
> > > > architectures default to the same value. Additionally, this flag will be
> > > > able to help users avoid potential bugs where a hint address is passed
> > > > that causes upper bits of a VA to be used.
> > >
> > > The reason we added this limit on arm64 is that we noticed programs
> > > using the top 8 bits of a 64-bit pointer for additional information.
> > > IIRC, it wasn't even openJDK but some JavaScript JIT. We could have
> > > taught those programs of a new flag but since we couldn't tell how many
> > > are out there, it was the safest to default to a smaller limit and opt
> > > in to the higher one. Such opt-in is via mmap() but if you prefer a
> > > prctl() flag, that's fine by me as well (though I think this should be
> > > opt-in to higher addresses rather than opt-out of the higher addresses).
> >
> > The mmap() flag was used in previous versions but was decided against
> > because this feature is more useful if it is process-wide. A
> > personality() flag was chosen instead of a prctl() flag because there
> > existed other flags in personality() that were similar. I am tempted to
> > use prctl() however because then we could have an additional arg to
> > select the exact number of bits that should be reserved (rather than
> > being fixed at 47 bits).
> 
> I am very much not in favour of a prctl(), it would require us to add state
> limiting the address space and the timing of it becomes critical. Then we
> have the same issue we do with the other proposals as to - what happens if
> this is too low?
> 
> What is 'too low' varies by architecture, and for 32-bit architectures
> could get quite... problematic.
> 
> And again, wha is the RoI here - we introducing maintenance burden and edge
> cases vs. the x86 solution in order to... accommodate things that need more
> than 128 TiB of address space? A problem that does not appear to exist in
> reality?
> 
> I suggested the personality approach as the least impactful compromise way
> of this series working, but I think after what Arnd has said (and please
> forgive me if I've missed further discussion have been dipping in and out
> of this!) - adapting risc v to the approach we take elsewhere seems the
> most sensible solution to me.
>
> This remains something we can revisit in future if this turns out to be
> egregious.
>

I appreciate Arnd's comments, but I do not think that making 47-bit the
default is the best solution for riscv. On riscv, support for 48-bit
address spaces was merged in 5.17 and support for 57-bit address spaces
was merged in 5.18 without changing the default addresses provided by
mmap(). It could be argued that this was a mistake, however since at the
time there didn't exist hardware with larger address spaces it wasn't an
issue. The applications that existed at the time that relied on the
smaller address spaces have not been able to move to larger address
spaces. Making a 47-bit user-space address space default solves the
problem, but that is not arch agnostic, and can't be since of the
varying differences in page table sizes across architectures, which is
the other part of the problem I am trying to solve.

> >
> > Opting-in to the higher address space is reasonable. However, it is not
> > my preference, because the purpose of this flag is to ensure that
> > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > applications that want this guarantee to be the ones setting the flag,
> > rather than the applications that want the higher bits setting the flag.
> 
> Perfect is the enemy of the good :) and an idealised solution may not end
> up being something everybody can agree on.

Yes you are totally right! Although this is not my ideal solution, it
sufficiently accomplishes the goal so I think it is reasonable to
implement this as a personality flag.

> 
> >
> > - Charlie
> >
> > >
> > > --
> > > Catalin
> >
> >
> >

