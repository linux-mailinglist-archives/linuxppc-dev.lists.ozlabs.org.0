Return-Path: <linuxppc-dev+bounces-1261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDD975A46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 20:21:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3pn44TLrz2yjN;
	Thu, 12 Sep 2024 04:21:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726078904;
	cv=none; b=b3Y3KXuSj7yDCWMtotDPYK0RYeR0kzenvwyCSwDITtnafcqc9MZ+b2kjtG+qudrr4U+kOuQGrjKqzIGA8WG0UkDOEieL6Y0sbcpsKO59T+PMnlVACm/5+InBrOxwV7wv94MiyP5cV0FF4UceH8MZg11wNAmmkl8sY7g8I18mYCJ13M7RLnc0LRHp6sDiJZL1VxXT2ThImzc/bkzTKqbMP8c2KMPZi6JljISflttCgrdkrRZoU/PS9jksDw602MZkUFaVj9UDGCrswZerlGgr/+0EH5J+YxzL3lnER7rjaxXh1RWIPGn1bLfzUBDicUUyiljDmKpEhB7AnyhR3gNL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726078904; c=relaxed/relaxed;
	bh=n6iY5aha6gHF4RHjAIeOymFa2jrsr74IoGTSxFE4JHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+rn/3LfseTk+7b9kbMf/3sgL3L5c3Yuw3saL8smfe9XN6PvRDXgYbVAc/APMPx5Qzmkr5+54IvfFZ5Tj6Yoz2jjPZiFNQ75byD/xjQR4dnxSkbIIHPN4nDjAOMFqAmk2kzs7nPJ9oGD38A+gIMuEdAr6TgwwFJK6n59aXQnjmIHAroHsT41jTP52gO7F2DN2ddtM4pqOEc8v+3EwnE89IYCARiY6MmHsUI03rp1pMl4evRqMtkMW9K/dvG5RcKdvzVkBHSYz9s+F0c22Rf9wUi8ru7SgHu9irMHkEjKrmQYQHeYuZP51rpF0m1C7MDEw3rxushBlJ/YEZksQd3ibg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3pn33yqMz2yhR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 04:21:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7BBCA45341;
	Wed, 11 Sep 2024 18:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB7BC4CEC0;
	Wed, 11 Sep 2024 18:21:30 +0000 (UTC)
Date: Wed, 11 Sep 2024 19:21:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <ZuHfp0_tAQhaymdy@arm.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
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
In-Reply-To: <ZuDoExckq21fePoe@ghost>

On Tue, Sep 10, 2024 at 05:45:07PM -0700, Charlie Jenkins wrote:
> On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> > * Catalin Marinas <catalin.marinas@arm.com> [240906 07:44]:
> > > On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
> > > > On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> > > > > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >> It's also unclear to me how we want this flag to interact with
> > > > >> the existing logic in arch_get_mmap_end(), which attempts to
> > > > >> limit the default mapping to a 47-bit address space already.
> > > > >
> > > > > To optimize RISC-V progress, I recommend:
> > > > >
> > > > > Step 1: Approve the patch.
> > > > > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> > > > > Step 3: Wait approximately several iterations for Go & OpenJDK
> > > > > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()

Point 4 is an ABI change. What guarantees that there isn't still
software out there that relies on the old behaviour?

> > > > I really want to first see a plausible explanation about why
> > > > RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
> > > > like all the other major architectures (x86, arm64, powerpc64),
> > > 
> > > FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
> > > configuration. We end up with a 47-bit with 16K pages but for a
> > > different reason that has to do with LPA2 support (I doubt we need this
> > > for the user mapping but we need to untangle some of the macros there;
> > > that's for a separate discussion).
> > > 
> > > That said, we haven't encountered any user space problems with a 48-bit
> > > DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
> > > approach (47 or 48 bit default limit). Better to have some ABI
> > > consistency between architectures. One can still ask for addresses above
> > > this default limit via mmap().
> > 
> > I think that is best as well.
> > 
> > Can we please just do what x86 and arm64 does?
> 
> I responded to Arnd in the other thread, but I am still not convinced
> that the solution that x86 and arm64 have selected is the best solution.
> The solution of defaulting to 47 bits does allow applications the
> ability to get addresses that are below 47 bits. However, due to
> differences across architectures it doesn't seem possible to have all
> architectures default to the same value. Additionally, this flag will be
> able to help users avoid potential bugs where a hint address is passed
> that causes upper bits of a VA to be used.

The reason we added this limit on arm64 is that we noticed programs
using the top 8 bits of a 64-bit pointer for additional information.
IIRC, it wasn't even openJDK but some JavaScript JIT. We could have
taught those programs of a new flag but since we couldn't tell how many
are out there, it was the safest to default to a smaller limit and opt
in to the higher one. Such opt-in is via mmap() but if you prefer a
prctl() flag, that's fine by me as well (though I think this should be
opt-in to higher addresses rather than opt-out of the higher addresses).

-- 
Catalin

