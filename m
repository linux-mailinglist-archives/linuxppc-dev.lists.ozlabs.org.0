Return-Path: <linuxppc-dev+bounces-1380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5589796E7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 15:51:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X68bv23gbz2y8r;
	Sun, 15 Sep 2024 23:51:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726408315;
	cv=none; b=SUR2hM2nZcq7qdQb+1iXj8epcQmA6tH9b4y3tpBHT8E98WleSsWJDGMitC8rDJ3H2vQ2UI6mE+vhs+g7eMJ0RN0X9Av4LtewGy3/dTOupX+YD0+qyh0p/Dc1DTHrg6FG6lZRF8z8EmSTjLImVT68PFvRE3DdcS11yLLeX+dXpyBwuxdJTfyc1i2FlUyv1PNuShU6kI+FWXgAAWv06Jc20HJ52UOvhi1vZHtCasLqPL3dHdDdRDpcp2H/K2Fzzb9+IA8HjZobNmGN7MfmB3an6gz+32ydsP1G0CZ+4wL62hXaZuL+Zj06s3IEnAmN1xVkPLnDVQmswCPzcOUMhJv7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726408315; c=relaxed/relaxed;
	bh=PRdpsXqKOB66nzid05vkfMQY+h3dZqrBw/EG9fBVIP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+6K8INxp4LzUv176Cej0+JcpV/BGublMxkLvrrVKmRipBO9Hh9/f1Ptfg0YNMgBRoFKhNxQC2RU5aAg0CqFHi+YbFZBkHDlURtVBb8zm+RYCfCEUWQilxIFpBk5y9fQjjSH119ryHcSTCHOtgoGcdTVQPLBFZNdqzoW0majIRrV7lMDxYQ5UQk+IVF2Fj1M7gvyAha3557nz0R0BNMFEPzl6FMlfi077FWDi9SwFNYlkviPaKNjGPyvetmWIfL2OfVJj8ue/4cPU74Ij/Uv2sn9sAOTytHqTL/4tTfxytIPXVHvefhDfaNJojPE394x2Q49AOVBxJb8UZ9NSIn8IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DRkIar9R; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DRkIar9R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X68bt6D1qz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2024 23:51:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45A6A5C54F3;
	Sun, 15 Sep 2024 13:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666C4C4CEC3;
	Sun, 15 Sep 2024 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726408306;
	bh=q7WJquAI08+CAD5lP6bdNehob9Dq1wPKxQPjeFRtiiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRkIar9RFkBNG39Lg4VF36+C0l1NwYSaEE09Z1SxGxc6M4S+jx9O3QiS3XE0iEOXa
	 dugg4+gux8cHvhMy415EwhG2oqeI29OZXErerIPWPPLxGdjDxioHvmSB5SFgMR8cmZ
	 GF890/YHKLL0YWKx3z2y3nIavnufDvUSXph8DwoVC1aciO37Nuj9Dl/4U3xgMBW1Vr
	 QqbWqbJwbZ+B8JLq+POjgebhgVzaYSVrG+oX+aypioA+ScnFYEAUCNxQIIMCRKMIR8
	 1d75vfMvgyrvMLYGrv0O59GREHzSdXP1f5IYJf2XBPq1KtNNCfQ4hdGzn/h6TRc0iB
	 7g69hrbWPmj5g==
Date: Sun, 15 Sep 2024 16:48:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
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
Subject: Re: [PATCH v3 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zublq4tR0q7lvicK@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
 <20240909064730.3290724-8-rppt@kernel.org>
 <CAMj1kXG_Z=7B_eDAk3vhtDjfcnka3AoSKNzvFQDzpvYY2EyVfg@mail.gmail.com>
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
In-Reply-To: <CAMj1kXG_Z=7B_eDAk3vhtDjfcnka3AoSKNzvFQDzpvYY2EyVfg@mail.gmail.com>

Hi Ard,

On Fri, Sep 13, 2024 at 05:00:42PM +0200, Ard Biesheuvel wrote:
> Hi Mike,
> 
> On Mon, 9 Sept 2024 at 08:51, Mike Rapoport <rppt@kernel.org> wrote:

...

> > +static void execmem_fill_trapping_insns(void *ptr, size_t size, bool writable)
> > +{
> > +       if (execmem_info->fill_trapping_insns)
> > +               execmem_info->fill_trapping_insns(ptr, size, writable);
> > +       else
> > +               memset(ptr, 0, size);
> 
> Does this really have to be a function pointer with a runtime check?
> 
> This could just be a __weak definition, with the arch providing an
> override if the memset() is not appropriate.

I prefer to keep this a method in execmem_info rather that have a __weak
definition that architectures can override.

This is not on the hot path, so I don't think a runtime check here would
matter. Still, I can fill in a default with memset at init time.

-- 
Sincerely yours,
Mike.

