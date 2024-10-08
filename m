Return-Path: <linuxppc-dev+bounces-1811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684E993EA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 08:23:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN5YQ0VXHz2x9j;
	Tue,  8 Oct 2024 17:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728368586;
	cv=none; b=HnZLROKKq3lVi8gRDCuA+89B9jYmyHTv2239dBKrXflEWeyoMAOn7AIyaGs52+wwZoK02K5Mol89Tk+dQgSW5iwot9mZBm2mjccBoNYGrmnxN38usH3HkDWwaFAwSzlbmktsIuV3CngXRWfFwuicFGnhdPbfJUpAbYFAbpO19N2lRjGAQOJgcmUSr15AaGl64cgGKDjNkjCn2X475CNoXNsVtNEqYyWFKGSQRb+GtahYBitumugdp090HN5c9IyJ4OX65Q2ULfQI3WETQhMTyk1+lIxPiqdQ64oJ0hPo8CUyVKBUzcyOO8kQkBnlC9Q8/PRF+VF1Yq2g6ljD3N8wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728368586; c=relaxed/relaxed;
	bh=2ytn5ipKOi2iwHXLlnzsD5i06mmFCc0Gkvx6tbtOc3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhbbahgvwUtt/msY15M+WNNwV2XEZBmFuZjPbxeU6Lka4NCPeFZA1XGL6g7jSPmOTcBy5QTWELsFfwMgEmcRt9TiXwd5HGDqNoxi7OEiCAMIw8UCmN743OFzBs4wF87I2+rsv8F08uB3PrX6Txz7vLDWJTTMeXxcdSUzFDgJyFvypBTmYCx7hmeZKMvPmi7E6ZtyWHa9aIFvsN1HQ+XEEERfM+qaPWmNM0lZ6202UJYaI/Ye/vjm/Jvu6c+dWNGukWHDnuofS38IeHdBSYlCgPA696qhvl0jnPz0rBT+aQZuyvenkN++SDAwnkwKkVE/zGBl+NavWv1EzHX6ZTSmSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HLZ7O/Hp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HLZ7O/Hp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN5YN68h8z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 17:23:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F05D1A43229;
	Tue,  8 Oct 2024 06:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C076C4CEC7;
	Tue,  8 Oct 2024 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728368581;
	bh=7+OOlYDwjjrmYkugp0zG3rCIOBJXVhabkZlBvijiN0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLZ7O/HpKqwZhtBX1cNCiAk8EV6vD0WzAl1dR/RILMS7jSHhGDnYDNH2Dzn6ECEly
	 M0+GSr/JGL8nAopaejPjKSQKa6Jmnx6kHabKvo9FyggKvIK/+rwoLnO5mphSBOrVi8
	 U9wdgL7Nl7zM0jbSh9FiGcxw5b5J+su+JR+7Gf4XG9wvT3v6GVYlXJH8m3l11OFKZ1
	 9jEHuFYuJh2kBStvb3JCpXCoRR3L/JiHNjMlM70jCbMyIiQEwYJp2wijiSZ4G1su3J
	 9j8W/sm+G2yCx41UsRZ1DC/eNueJYqT+Lq5WzrcGaGCVNkuw9bP/AltQfceSnkaSt6
	 lK+siW3UD/EyQ==
Date: Tue, 8 Oct 2024 09:19:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 5/8] arch: introduce set_direct_map_valid_noflush()
Message-ID: <ZwTO4S_smfPbP06x@kernel.org>
References: <20241007062858.44248-1-rppt@kernel.org>
 <20241007062858.44248-6-rppt@kernel.org>
 <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
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
In-Reply-To: <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Huacai,

On Tue, Oct 08, 2024 at 10:11:25AM +0800, Huacai Chen wrote:
> Hi, Mike,
> 
> On Mon, Oct 7, 2024 at 2:30 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Add an API that will allow updates of the direct/linear map for a set of
> > physically contiguous pages.
> >
> > It will be used in the following patches.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/arm64/include/asm/set_memory.h     |  1 +
> >  arch/arm64/mm/pageattr.c                | 10 ++++++++++
> >  arch/loongarch/include/asm/set_memory.h |  1 +
> >  arch/loongarch/mm/pageattr.c            | 21 +++++++++++++++++++++
> >  arch/riscv/include/asm/set_memory.h     |  1 +
> >  arch/riscv/mm/pageattr.c                | 15 +++++++++++++++
> >  arch/s390/include/asm/set_memory.h      |  1 +
> >  arch/s390/mm/pageattr.c                 | 11 +++++++++++
> >  arch/x86/include/asm/set_memory.h       |  1 +
> >  arch/x86/mm/pat/set_memory.c            |  8 ++++++++
> >  include/linux/set_memory.h              |  6 ++++++
> >  11 files changed, 76 insertions(+)
> >
> > diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/include/asm/set_memory.h
> > index d70505b6676c..55dfaefd02c8 100644
> > --- a/arch/loongarch/include/asm/set_memory.h
> > +++ b/arch/loongarch/include/asm/set_memory.h
> > @@ -17,5 +17,6 @@ int set_memory_rw(unsigned long addr, int numpages);
> >  bool kernel_page_present(struct page *page);
> >  int set_direct_map_default_noflush(struct page *page);
> >  int set_direct_map_invalid_noflush(struct page *page);
> > +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
> >
> >  #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
> > diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> > index ffd8d76021d4..f14b40c968b4 100644
> > --- a/arch/loongarch/mm/pageattr.c
> > +++ b/arch/loongarch/mm/pageattr.c
> > @@ -216,3 +216,24 @@ int set_direct_map_invalid_noflush(struct page *page)
> >
> >         return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT | _PAGE_VALID));
> >  }
> > +
> > +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
> > +{
> > +       unsigned long addr = (unsigned long)page_address(page);
> > +       pgprot_t set, clear;
> > +
> > +       return __set_memory((unsigned long)page_address(page), nr, set, clear);
> This line should be removed.

Argh, copy/paste is so hard...

Thanks, will do.
 
> Huacai

-- 
Sincerely yours,
Mike.

