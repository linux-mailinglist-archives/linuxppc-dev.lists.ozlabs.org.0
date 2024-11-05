Return-Path: <linuxppc-dev+bounces-2880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E459BD59D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 20:04:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjd7C0299z2xJF;
	Wed,  6 Nov 2024 06:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730833478;
	cv=none; b=LialPyE7hbzS38RfzLe3jryzD3GMfz30FOPnLEEMPdW+GKW+vb92s0FSVQbs+xkEdv5oP8jMRd6J6S7nFLfIr6/FPJWUOI1XiRa7VfyK9d4wVolGAT3OSZiRilJhEHc8/MZ3brhjzsah4Xc6H1teRoxiZyRpK5DiweBISqFnEufYe/XS5Amk0dUNImzYqAFk3te68+WkualqDKxZ1WZXnKpE7rfHHEQ7AHa64JN3PUGsRDFP8yAjQpaKUrU+vaam8jBfP9h0iZuI0gwcCzlXz7eycc/sSBHc442qE9hQXOzrruKh757qejLjNG8i1iIlAt/fLIXwZUONH7OOQA2fnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730833478; c=relaxed/relaxed;
	bh=Xv5HZHkAeuUPzpx5exucBGSesbPuj/Cq+qgRbmyI9bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouWD8id0yE/NNOikJl0cqTJImEiBcGN1TXD41S2+m3LHfhx8/IjRxbuFO8H5bTYhEeWSJwryDUtEUc/lzUH4PGDCwJBJ7uObmuMu4Y63fTCraqRSsUwxSn1l6vZLiRWpJ6hAW/6d3BclEwllHskxyZNTLkoJKBN3lpDYT8V0ssaSuYGYaDpQm9Q107Kpp9byRmIENwkmq1xxP8ZQ41XATVlzPedXsTcxqs/yaQ8e1TpuCmIXssBxzQeGibqOGZLuvsHv+qRlX7pvtYrVRVUKkNlkyQDLXZvMmFX0wbEUacGGMqaa4PseZ69q+j1Ary1D8kJm/b0JRC23/tu+yGFzVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndFUDxiZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndFUDxiZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjd795nbSz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 06:04:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09E375C4357;
	Tue,  5 Nov 2024 19:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14183C4CECF;
	Tue,  5 Nov 2024 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833472;
	bh=uoF4ZbISUkj3LBJVbm7mjK2pNt272UgYSEG9wAikNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndFUDxiZpHd3P71EA4Dtdpamj3S+pD0a2NSCYEIkT703any4R0lrK0H/JhQd4Hv2S
	 hAfH0p9N7ObDyDDis1fM3KZKbcT6xDBcyV1iwhCKpgr5eJTjsn996Jr680vAO44Otj
	 drCVf6YoRKOceIQN9knu/aAssyHKuocecyBZr/vNKZiP9PdCl8g8D3PbpLRYGfT7S3
	 8Jxa1hlnrGJeQdCliPqKl36JEkEIgDaJdtPl3tXojvE85kFpWmMnDAcr4PjH7oX62l
	 V8Za49Z9doiMVqhjlWd7GWzNdgnAXYy87njYhKhjV/rXdMfHzibVSbsFtDSY64+oSA
	 zKXctAOfMY/4A==
Date: Tue, 5 Nov 2024 12:04:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [PATCH v7 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241105190427.GA2903209@thelio-3990X>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-7-rppt@kernel.org>
 <20241104232741.GA3843610@thelio-3990X>
 <ZynDAhW0lKCfOqZl@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZynDAhW0lKCfOqZl@kernel.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 05, 2024 at 09:02:26AM +0200, Mike Rapoport wrote:
> There's a silly mistake in cfi_rewrite_endbr() in that commit, the patch
> below should fix it. Can you please test?

Yup, that was it! All my machines boot with this diff applied on top of
next-20241105, so with that fixed, I think we are all good here.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 3407efc26528..243843e44e89 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1241,7 +1241,7 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end, struct module *mod)
>  		void *addr = (void *)s + *s;
>  		void *wr_addr = module_writable_address(mod, addr);
>  
> -		poison_endbr(addr+16, wr_addr, false);
> +		poison_endbr(addr + 16, wr_addr + 16, false);
>  	}
>  }

Cheers,
Nathan

