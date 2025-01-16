Return-Path: <linuxppc-dev+bounces-5346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241CA13FBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 17:45:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYpcw5PS6z30NF;
	Fri, 17 Jan 2025 03:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737045904;
	cv=none; b=EauAdqvwoUd2ykTNaSabI0QpfKk1O3Cmy9vrql2BoKCuuPzoEqhSPRD27Xqr6GM+m4CEOzu67W+1SyN0QJ6IR/64TW/RfEd6OaNrDgxCjGPbFT8N7Zqz6UAH2N+UpZiguwID8S4f+lrWQoG1MNc7gi6V47IREZGcOMqyxp62sWhXUwnlaLOqzU1RNxaRuUtHoJ+/TWWenZAwEvrTgc3lCXu6wk8eApLnpnXyHMPUfMRtG7/oV7RnveGg1r41ZyUtMyN6PuRxjIYTaYgJkEkEATxy0moSco9YCwN7aaeBVvnXDIF3nPY0Qz0G4Gj++2jKGG/DBcw5QfWEm9fe1IumMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737045904; c=relaxed/relaxed;
	bh=WgoKIzz0OYQgA951gA+dXClPJUSxVjM8SRERMxXCGDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9SOCcPtRq0JCxVzkqs6NzWJQCVRSl2zXovAqL6NgDKBZSWHL947N7BzjFvxK/NlSNlFmDeB6In2sTOVtkhOKZ6l2E7PAFbrHcsU4zMWMY1zbbkK7QvchTaQD4yDFLEZEdGyPvYsjxfSU41WydDce+BDYYWtf4hvervUZE/nO0chsg0EgjI2o3jAm0ksXTktyLSohaKqQHydSZlVwqZrP7vSFH5TFwBQCwGVBugLG7R8fo9sHU7/aXKxr/gwo+lHuDrQmDWliadTwSGttty/M4UwpfOZl5McR1U0CpFYMXTcR3Lw2ztBHbgJU6L4y6YPJYts5olXG88cF+cJ8RW16g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Ii/k/+mE; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Ii/k/+mE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYpcv5TYCz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 03:45:03 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA9C340E015F;
	Thu, 16 Jan 2025 16:44:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id w_qUMcx4OXut; Thu, 16 Jan 2025 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1737045896; bh=WgoKIzz0OYQgA951gA+dXClPJUSxVjM8SRERMxXCGDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ii/k/+mEQxhvi2cUq/OXag0RZzqM3+5gAKnmstJm1M3emqPqpm+FuBuTOkVG6z7Xf
	 jK+idKpC77Q5Bb60bZEBETOeIYeybsV/OSz+HtCJkvQFCOANvCv50k0v7NDa6SMX+M
	 eW8d/Kr6ZqmS72pz22a2f/+VjuvWRZi/DggF/7WWes5sPk2G2kgdDpbQuINvEg40Bw
	 N23oo0oWrzyrbeWzAdiyVuD5Yw3mo37WXbbioRprWVaR2YxBJ0EXK+Gl4VR5xC9PZr
	 OEgpLDhSThdeD7i1O5+lXsNAoSSCiqPlPw+UuhcmOIMMGEIbCewfQxWy1tU8HF3OLo
	 971HvVXWqqaYqOUXF6C1rkTZJSjg6i1KL8jPchO1X57XYToTkMPLyPzCkyoYJKp2F/
	 Q31hRdIdEbLaR8cpz5o5mXbI7I5fBMqVNSBbod4oBwfFPYgChEyFgfhZOsoRk9Bs8B
	 Mq20gwUu5GXJt+hzn0MH9j0zSLA7eW0zjtMDtDIwaj3DW5gUm514gGFeEzI1eUM7E8
	 OlSpl1gBnv9+jHVUT6Im6NNIQMxUYvTlP22zuE4gO60oYZW58v76F1ovgaGaD+UBVR
	 WxxI3+3u6J2jlTd3rFkC2SVxOeTNpyK1mHsXzhJ+es/K1LUAYRL+ghsyJTRL2GcbTo
	 vQ/6kTLCL9KspKSVn+JOGlao=
Received: from zn.tnic (p200300ea971f934f329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971f:934f:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AF48840E0286;
	Thu, 16 Jan 2025 16:43:11 +0000 (UTC)
Date: Thu, 16 Jan 2025 17:43:05 +0100
From: Borislav Petkov <bp@alien8.de>
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mike Rapoport <rppt@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, Junaid Shahid <junaids@google.com>
Subject: Re: [PATCH RFC v2 02/29] x86: Create
 CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
Message-ID: <20250116164305.GEZ4k3Gd2IoJpJzEIl@fat_crate.local>
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 06:40:28PM +0000, Brendan Jackman wrote:
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7b9a7e8f39acc8e9aeb7d4213e87d71047865f5c..5a50582eb210e9d1309856a737d32b76fa1bfc85 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2519,6 +2519,20 @@ config MITIGATION_PAGE_TABLE_ISOLATION
>  
>  	  See Documentation/arch/x86/pti.rst for more details.
>  
> +config MITIGATION_ADDRESS_SPACE_ISOLATION
> +	bool "Allow code to run with a reduced kernel address space"
> +	default n
> +	depends on X86_64 && !PARAVIRT && !UML
> +	help
> +	  This feature provides the ability to run some kernel code

s/This feature provide/Provide/

> +	  with a reduced kernel address space. This can be used to
> +	  mitigate some speculative execution attacks.
> +
> +	  The !PARAVIRT dependency is only because of lack of testing; in theory
> +	  the code is written to work under paravirtualization. In practice
> +	  there are likely to be unhandled cases, in particular concerning TLB
> +	  flushes.

Right, this paragraph should be under the "---" line too until PARAVIRT gets
tested, ofc.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

