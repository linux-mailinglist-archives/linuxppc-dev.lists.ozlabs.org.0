Return-Path: <linuxppc-dev+bounces-2345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD29A20F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 13:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTlwN43K5z30NN;
	Thu, 17 Oct 2024 22:29:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729164548;
	cv=none; b=ewddgZl9l1c5GQdYEElGuDZaJSpaXCbgTV9xTD9U+r+dEwL5+zM0djPempKL7uz5sRfWHJSQ89wPS2rxMvQhihuTdFvVdHGUNVQjx7y0QIzbGScwgEJkFrlpbg9KbnTS1Px2i1lW4Fue0jEbc/KVSo9B2QcrAAOt1/OpCqSNHtx3vI4Sh88BMqtaUbkvdvQEgL2aeNGpEGWGJRsnOXW0Z5sNMnrfXAX8sdsE9m4Ek3EDhzvj1swyoVfAnH1e8HJyE7Aoq4j9tx65xxvZCW2eFvmNm9u610nzLAU0uW4v/K57qiT3+I4xlLhRYGk/4XlUFyDfTWPN3ZJs358l/6rp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729164548; c=relaxed/relaxed;
	bh=5TEnRdFDrGp3g8cb84z8escMU96OZKkwtQ0FRZiWHBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGXAHkNXbeCf5yS8tOMMGOGeEaxtEsVweMTDJwZfi/KC8gQDpCnaC4x2clv2syYq/xy/AE0qPSmPClGT2fNMt+/SKBYbagT4fj7d8yBqUIV2s3XtfxWqtvDCe9HmuL1jBEYRMPlRXWH4EVV5jxnzzvdn7kyoeTXriap0pWPH9bLAhncsS5risShcSz7Q16Pr449CDAIi/X+PE9rbwvbpaMlWHCSKbBl8vWYx0I4XwPT1KMqkQW6CW5LU+GGD1gVNs+6o4mKVk6aKd/EnzipYoB5SaW7p7JpHzMnddNQqKacmV5G2U0UzXPGLmK8vTmpeSz8ffDg25W68I/GedIfkKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ot+aEOLg; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ot+aEOLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTlwM2Zn0z2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 22:29:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E816CA43D50;
	Thu, 17 Oct 2024 11:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51E6C4CEC3;
	Thu, 17 Oct 2024 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729164541;
	bh=rt80HNwYvry4F4GclVQlY1veJ+krWpXQVKReUpcl890=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ot+aEOLgX5JjytFWTSP6bvwXMFkowa3+f8eQ2nWquiQ2RAv0bCvly8HaX5AltuwSG
	 MSL87zIBHWGLQnCmCdiEfFC7X5ejkFjDqsJRxmUPBDOphZUPBuoh9vgoceix8Psav5
	 Yvn0UgFKrQvx/wSoy69QgTtp5NCCSdTL6QB1vx3PWWPTlokB4+yqFBJYWypC9U2bHQ
	 nQtmXd5x7H21VQL4AHHLnM8nJNg1uOm2mWoaE2bjtRwnQ1e9g0HZLSZljRpX0WRG/I
	 j7Jg7Czseip6435Tp950cr2IcSkIthwfZaEljLp7+y1XWJYi+AU0xcha6M5b6FnQGJ
	 4UYbNkR0gIbzA==
Date: Thu, 17 Oct 2024 14:25:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
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
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
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
Subject: Re: [PATCH v6 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <ZxD0EVBoO-jcxEGE@kernel.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-7-rppt@kernel.org>
 <20241016170128.7afeb8b0@gandalf.local.home>
 <20241017093515.GU16066@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20241017093515.GU16066@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024 at 11:35:15AM +0200, Peter Zijlstra wrote:
> On Wed, Oct 16, 2024 at 05:01:28PM -0400, Steven Rostedt wrote:
> > On Wed, 16 Oct 2024 15:24:22 +0300
> > Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > > diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> > > index 8da0e66ca22d..b498897b213c 100644
> > > --- a/arch/x86/kernel/ftrace.c
> > > +++ b/arch/x86/kernel/ftrace.c
> > > @@ -118,10 +118,13 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
> > >  		return ret;
> > >  
> > >  	/* replace the text with the new text */
> > > -	if (ftrace_poke_late)
> > > +	if (ftrace_poke_late) {
> > >  		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
> > > -	else
> > > -		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
> > > +	} else {
> > > +		mutex_lock(&text_mutex);
> > > +		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
> > > +		mutex_unlock(&text_mutex);
> > > +	}
> > >  	return 0;
> > >  }
> > 
> > So this slows down the boot by over 30ms. That may not sound like much, but
> > we care very much about boot times. This code is serialized with boot and
> > runs whenever ftrace is configured in the kernel. The way I measured this,
> > was that I added:
> > 
> 
> > If this is only needed for module load, can we at least still use the
> > text_poke_early() at boot up?
> 
> Right, so I don't understand why this is needed at all.
> ftrace_module_init() runs before complete_formation() which normally
> switches to ROX, as such ftrace should be able to continue to do direct
> modifications here.

With this series the module text is allocated as ROX at the first place, so
the modifications ftrace does to module text have to either use text poking
even before complete_formation() or deal with a writable copy like I did
for relocations and alternatives.

I've been carrying the ftrace changes from a very old prototype and
didn't pay enough attention to them them until Steve's complaint.

I'll look into it.
 
> Which reminds me, at some point I did patches adding a
> MODULE_STATE_UNFORMED callback in order for static_call / jump_label to
> be able to avoid the expensive patching on module load as well (arguably
> ftrace should be using that too, instead of a custom callback).
> 

-- 
Sincerely yours,
Mike.

