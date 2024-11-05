Return-Path: <linuxppc-dev+bounces-2859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4719BC670
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 08:03:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjK6X1T1Wz2xfR;
	Tue,  5 Nov 2024 18:03:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730790180;
	cv=none; b=ILEms6muIhI/4kofB7rXed5HXzUcDufXAwBs8W7Jrm/WatAEO9t3dr4gqWdzeDoCts5T5+NWFmYaFcpNEjRAhi1NoSuHF4xO2jRUDUp87ETQpHTwG8cF9GLc5sCvR1Ck/n/WOVeXMwjrthc3y4A0b3oPhRv0gBG+0ozrC0DS2qOlu0puvmD0yJzreWT5KF/dg1K6JWFdTTNbzw/VzmRGgK/ca9tMG8DRjpExbIq/QEMC2NK+Xg7b1TEp+EUu/YvPDCObH+E58lfEGHT/O0RAGvhNIgAoWevFZys9z/EeZj6F9MdguiHB42aeOm/JVGl7uBcNqMC34KRCP+FaIO6qCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730790180; c=relaxed/relaxed;
	bh=hDoiW9FoXeBueu7rvRElcbTxwRRFVCkHCMlNMIMFTMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ewf9rn3fgfm2gzazJNMskhlRezbjzvA8oBazXQYiJHJWS0gELXlEz/oHbsVFhaj9HRs9HmYO9cZjStOXxzJA8qVd4plCmMYu/U0JjrSYHuSrtNCu+yqRVkIgYzKxhjZsEKFXK7hpMJ2JLDAUV8L4XOIVMLKKs32zMbymxIS6BpKfo18zxjsNiRk1GrwMwavbBbvHyiRVmNIBu4Fu949TLKsMCuMkvkuihaygRpTBlWjK9jqgrHOUXw5j7HFTegVvgpKlK9bKHHYjf1kgu1J8+ls+so5WYJfW7klba8cMa+AhmPjAb+Lme20oMAoDj9WhX1yi2zlE26Z68/pDQ/ELSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i3dpbmwH; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i3dpbmwH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjK6V48Q5z2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 18:02:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE148A42167;
	Tue,  5 Nov 2024 07:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B12C4CECF;
	Tue,  5 Nov 2024 07:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730790174;
	bh=vfcX72EWl1PlKyFBzjhHz5V71yaLAfzK3VjVgomZL4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3dpbmwHLfd+qUmJoaWeTGPHb10DC+M0kf+DMEykGWoYpGOuSUDviaUCAAx4zIAfi
	 my4z1l/oyVoPrY5WEhvGAqrSv0MLPuXbzVIKUoMd0jh8oEVUCEONnRV4s7PDepCIp9
	 ZD54y4ohFGVDY1Cs7nPdmpyfCNtvqUqW5KJ/Ch+xipF5ZFMCAivKT3JR6Xd9V1a/4G
	 LvZ1wHQ1rlIUNyplCl+fPkOtsT/XeAFLJAPXe+EdvajpWUHCrgFIHiD89oCp0/Bkx4
	 xYtH7/sknC5+POJtdvm/YMmFy0WRYObll2kMIURKDi3pF/30ytxQP7HSq81EZrmTXO
	 namiYtOl86+Aw==
Date: Tue, 5 Nov 2024 09:02:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
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
Message-ID: <ZynDAhW0lKCfOqZl@kernel.org>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-7-rppt@kernel.org>
 <20241104232741.GA3843610@thelio-3990X>
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
In-Reply-To: <20241104232741.GA3843610@thelio-3990X>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Nathan,

On Mon, Nov 04, 2024 at 04:27:41PM -0700, Nathan Chancellor wrote:
> Hi Mike,
> 
> On Wed, Oct 23, 2024 at 07:27:09PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > When module text memory will be allocated with ROX permissions, the
> > memory at the actual address where the module will live will contain
> > invalid instructions and there will be a writable copy that contains the
> > actual module code.
> > 
> > Update relocations and alternatives patching to deal with it.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Tested-by: kdevops <kdevops@lists.linux.dev>
> 
> Hopefully the last time you have to hear from me, as I am only
> experiencing issues with only one of my test machines at this point and
> it is my only machine that supports IBT, so it seems to point to
> something specific with the IBT part of the FineIBT support. I notice
> either a boot hang or an almost immediate reboot (triple fault?). I
> guess this is how I missed reporting this earlier, as my machine was
> falling back to the default distribution kernel after the restart and I
> did not notice I was not actually testing a -next kernel.
> 
> Checking out the version of this change that is in next-20241104, commit
> 7ca6ed09db62 ("x86/module: prepare module loading for ROX allocations of
> text"), it boots with either 'cfi=off' or 'cfi=kcfi' but it exhibits the
> issues noted above with 'cfi=fineibt'. At the immediate parent, commit
> b575d981092f ("arch: introduce set_direct_map_valid_noflush()"), all
> three combinations boot fine.
> 
>   $ uname -r; tr ' ' '\n' </proc/cmdline | grep cfi=
> 
>   6.12.0-rc5-debug-00214-g7ca6ed09db62
>   cfi=kcfi
> 
>   6.12.0-rc5-debug-00214-g7ca6ed09db62
>   cfi=off
> 
>   6.12.0-rc5-debug-00213-gb575d981092f
>   cfi=fineibt
> 
>   6.12.0-rc5-debug-00213-gb575d981092f
>   cfi=kcfi
> 
>   6.12.0-rc5-debug-00213-gb575d981092f
>   cfi=off
> 
> I do not think this machine has an accessible serial port and I do not
> think IBT virtualization is supported via either KVM or TCG in QEMU, so
> I am not sure how to get more information about what is going on here. I
> wanted to try reverting these changes on top of next-20241104 but there
> was a non-trivial conflict in mm/execmem.c due to some changes on top,
> so I just tested in the mm history.
> 
> If there is any other information I can provide or patches I can test, I
> am more than happy to do so.

Yes, please :)

There's a silly mistake in cfi_rewrite_endbr() in that commit, the patch
below should fix it. Can you please test?

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 3407efc26528..243843e44e89 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1241,7 +1241,7 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end, struct module *mod)
 		void *addr = (void *)s + *s;
 		void *wr_addr = module_writable_address(mod, addr);
 
-		poison_endbr(addr+16, wr_addr, false);
+		poison_endbr(addr + 16, wr_addr + 16, false);
 	}
 }
 
 
> Cheers,
> Nathan

-- 
Sincerely yours,
Mike.

