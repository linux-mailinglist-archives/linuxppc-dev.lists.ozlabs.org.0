Return-Path: <linuxppc-dev+bounces-13793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C4C35B42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 13:51:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1lZD4gwVz3bW7;
	Wed,  5 Nov 2025 23:51:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762347092;
	cv=none; b=cXQzspyAwrlptrd6F4cdLuL0V0iGC2cffLPK6SHc/5fYOoL1dPAEm7TyM31YX5bNEDGYj9jRVk4Ng5u+kB2qFFUaSLEM3QpR1yn1fvzUk6vHQwsNlAEf1V70mftXeU/8M8Yj/kmD7AwZtFydiqxJxzoRZC1OEKn4Ua0SQTWIHvcyy+6RdkHm/ORtNFMTba7tVoWjMPCoD6Yh+lgNAucqXt4WZYG9tr1q6c2o7GcGnwoD8aHJNwNx81fcRjSnY7GZyx5K/oa7Pp2dEMGmXOrHK906S4T9mGmsEIIn8KG0vTK3xFK1/dfF8U34rIRX7qB7NKWg0lV/sPSbRxjIjjNCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762347092; c=relaxed/relaxed;
	bh=/HbUeaAEICYyZhHzsw6Tjow7GxlRxHImaPf6rqef4WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gt0oJUKbLpWVkYG1L7odJYOnfaEmAIJF8NEfrc+0wLpthZJ3XwkoxeM5Hr88cPD1OiiTYOw9miV2WABrG2CUhPjA1xW6hwW0JJFQNejOiB8pcQqUTOkYQmNrjEuhYR0a2V8WofafK96LRyQ3DebxU9na9ngLSnF46E+r+j50wTSQ4EW8dui4CBJjKxu17t9kEaeYay0mGavIHApUDl+f77Lt9ki+c0AWHEAM2SL23zAB4Z42tbElfqXaAcrmX9hj0tMBlIv72qhy8CRdy0WVoc0WJdISgeS8uSq5864ZdKnPGa+Q15RNMONdGviFh+JXDUABTdPrR72saE6F1QHo0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBwrliEk; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBwrliEk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1lZC3dyyz2yjp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 23:51:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B36356021F;
	Wed,  5 Nov 2025 12:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C58C4CEFB;
	Wed,  5 Nov 2025 12:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762347088;
	bh=NChEMqk4UnAegwpc13kkXhlg2bRI7YYn/F/CUppX0po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBwrliEkoft7x27y00kAQyZYlZwNolOx9I+8LO6vlJTpvP7N0QHNW8gY7HgDSRRaK
	 nBiCan+seJQsNbTb85l6Du0+jGYSjyU+PsJRp37fib7OLR8zNwqJVCTCxmRC1ed7ik
	 IbGndcJW3oFPeK4Fn6Gqd4Eqqg72hK7mST0FfhOH4Lp6F1bZThRhsVlMV6XSXutFbt
	 qg2GOl9NAuKOJodfCtM+2wuTFS165/xw157AGYMKGIn8Rzq6cHQj70zrB/o6nydG9v
	 T6eXE49TVOyb0UTcnch9NBoiUzf0cB7UzWllSdEs37/aTSiKjJTx/zXT8qHkoX8b1X
	 BHYTAjiCnLn2g==
Date: Wed, 5 Nov 2025 13:51:22 +0100
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	Omar Sandoval <osandov@osandov.com>, linux-kbuild@vger.kernel.org,
	Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQtISpMElVm7jQ4y@example.org>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
 <20251105011548.GB769905@ax162>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105011548.GB769905@ax162>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 06:15:48PM -0700, Nathan Chancellor wrote:
> On Tue, Nov 04, 2025 at 08:35:57PM +0000, Dimitri John Ledkov wrote:
> > On Tue, 4 Nov 2025 at 18:12, Omar Sandoval <osandov@osandov.com> wrote:
> > > drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
> > > commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > > vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
> > > for some configurations, which confused drgn until I added a workaround
> > > (https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
> > > So there's some funkiness in this area.
> 
> Omar, could you provide me with a configuration file that reproduces
> this for you? Is there an easy way to check for this situation on the
> command line?
> 
> > The expectation is that said section is removed from the final binary.
> > But the fact that it is present with 0 length, indicates incorrect
> > linking. It also now makes sense why on x86/arm it is tripping up
> > section alignment.
> 
> If I diff the output of 'llvm-readelf -e' for vmlinux.unstripped and
> vmlinux when building 'ARCH=arm64 defconfig' using my suggested diff on
> top of 6.18-rc4, I do see .modinfo get removed and I am not sure I see
> an empty segment as a result?
> 
> diff --git a/tmp/.psub.Rg1zsq b/tmp/.psub.nGpcxI
> index 2f079cb57f58..dcca71062760 100644
> --- a/tmp/.psub.Rg1zsq
> +++ b/tmp/.psub.nGpcxI
> @@ -10,15 +10,15 @@ ELF Header:
>    Version:                           0x1
>    Entry point address:               0xffff800080000000
>    Start of program headers:          64 (bytes into file)
> -  Start of section headers:          157810560 (bytes into file)
> +  Start of section headers:          156417384 (bytes into file)
>    Flags:                             0x0
>    Size of this header:               64 (bytes)
>    Size of program headers:           56 (bytes)
> -  Number of program headers:         5
> +  Number of program headers:         4
>    Size of section headers:           64 (bytes)
> -  Number of section headers:         47
> -  Section header string table index: 46
> -There are 47 section headers, starting at offset 0x967ff80:
> +  Number of section headers:         46
> +  Section header string table index: 45
> +There are 46 section headers, starting at offset 0x952bd68:
>  
>  Section Headers:
>    [Nr] Name              Type            Address          Off    Size   ES Flg Lk Inf Al
> @@ -56,19 +56,18 @@ Section Headers:
>    [31] .mmuoff.data.read PROGBITS        ffff80008270b800 271b800 000008 00  WA  0   0  8
>    [32] .pecoff_edata_padding PROGBITS    ffff80008270b808 271b808 0001f8 00   A  0   0  1
>    [33] .bss              NOBITS          ffff80008270c000 271ba00 0ac970 00  WA  0   0 4096
> -  [34] .debug_aranges    PROGBITS        0000000000000000 27d09d0 047550 00      0   0 16
> -  [35] .debug_info       PROGBITS        0000000000000000 2817f20 38fdcf1 00      0   0  1
> -  [36] .debug_abbrev     PROGBITS        0000000000000000 6115c11 4845e1 00      0   0  1
> -  [37] .debug_line       PROGBITS        0000000000000000 659a1f2 1848e28 00      0   0  1
> -  [38] .debug_frame      PROGBITS        0000000000000000 7de3020 3e2858 00      0   0  8
> -  [39] .debug_str        PROGBITS        0000000000000000 81c5878 58f8cc 01  MS  0   0  1
> -  [40] .debug_line_str   PROGBITS        0000000000000000 8755144 057ff7 01  MS  0   0  1
> -  [41] .debug_rnglists   PROGBITS        0000000000000000 87ad13b 4d3fc6 00      0   0  1
> -  [42] .modinfo          PROGBITS        ffff8000827d0000 2720000 0b09c8 00   A  0   0  1
> -  [43] .comment          PROGBITS        0000000000000000 8c81101 000012 01  MS  0   0  1
> -  [44] .symtab           SYMTAB          0000000000000000 8c81118 671a60 18     45 250028  8
> -  [45] .strtab           STRTAB          0000000000000000 92f2b78 38d1f3 00      0   0  1
> -  [46] .shstrtab         STRTAB          0000000000000000 967fd6b 000215 00      0   0  1
> +  [34] .debug_aranges    PROGBITS        0000000000000000 271ba00 047550 00      0   0 16
> +  [35] .debug_info       PROGBITS        0000000000000000 2762f50 38fdcf1 00      0   0  1
> +  [36] .debug_abbrev     PROGBITS        0000000000000000 6060c41 4845e1 00      0   0  1
> +  [37] .debug_line       PROGBITS        0000000000000000 64e5222 1848e28 00      0   0  1
> +  [38] .debug_frame      PROGBITS        0000000000000000 7d2e050 3e2858 00      0   0  8
> +  [39] .debug_str        PROGBITS        0000000000000000 81108a8 58f8cc 01  MS  0   0  1
> +  [40] .debug_line_str   PROGBITS        0000000000000000 86a0174 057ff7 01  MS  0   0  1
> +  [41] .debug_rnglists   PROGBITS        0000000000000000 86f816b 4d3fc6 00      0   0  1
> +  [42] .comment          PROGBITS        0000000000000000 8bcc131 000012 01  MS  0   0  1
> +  [43] .symtab           SYMTAB          0000000000000000 8bcc148 612990 18     44 233806  8
> +  [44] .strtab           STRTAB          0000000000000000 91dead8 34d07e 00      0   0  1
> +  [45] .shstrtab         STRTAB          0000000000000000 952bb56 00020c 00      0   0  1
>  Key to Flags:
>    W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
>    L (link order), O (extra OS processing required), G (group), T (TLS),
> @@ -77,21 +76,19 @@ Key to Flags:
>  
>  Elf file type is DYN (Shared object file)
>  Entry point 0xffff800080000000
> -There are 5 program headers, starting at offset 64
> +There are 4 program headers, starting at offset 64
>  
>  Program Headers:
>    Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
>    LOAD           0x010000 0xffff800080000000 0xffff800080000000 0x11cc000 0x11cc000 R E 0x10000
>    LOAD           0x11e0000 0xffff8000811d0000 0xffff8000811d0000 0x153ba00 0x15e8970 RWE 0x10000
> -  LOAD           0x2720000 0xffff8000827d0000 0xffff8000827d0000 0x0b09c8 0x0b09c8 R   0x10000
>    NOTE           0x1e83cf4 0xffff800081e73cf4 0xffff800081e73cf4 0x000054 0x000054 R   0x4
> -  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10
> +  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x8
>  
>   Section to Segment mapping:
>    Segment Sections...
>     00     .head.text .text 
>     01     .rodata .pci_fixup __ksymtab __ksymtab_gpl __ksymtab_strings __param __modver __ex_table .notes .hyp.rodata .got .got.plt .rodata.text .init.text .exit.text .altinstructions .init.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .data..percpu .hyp.data..percpu .hyp.reloc .rela.dyn .relr.dyn .data __bug_table .hyp.data .mmuoff.data.write .mmuoff.data.read .pecoff_edata_padding .bss 
> -   02     .modinfo 
> -   03     .notes 
> -   04     
> +   02     .notes 
> +   03     
>     None   .debug_aranges .debug_info .debug_abbrev .debug_line .debug_frame .debug_str .debug_line_str .debug_rnglists .comment .symtab .strtab .shstrtab 
> 
> > As it is likely that it is the same underlying issue that such segment
> > exists in the first place.
> > 
> > I wonder if the original implementation of moving sections about and
> > when/where the builtin module info is kept is not as tidy as it was
> > intended to be.
> 
> This is entirely possible. It would be helpful to know why exactly this
> is happening to be certain.
> 
> > I wonder if we should:
> > - rollback to the state of how things were before that feature was added
> > - keep the production / stripped / installed kernel build as is
> > - reshuffle of how modinfo is preserved in the unstripped kernel with
> > a bespoke linker script
> > 
> > Such that hopefully we have correct alignment, without any zero length segments.
> > 
> > Or possibly even link / split the built-in module info somewhere else entirely.
> > 
> > As in revert both:
> > - d50f21091358b (kbuild: align modinfo section for Secureboot
> > Authenticode EDK2 compat, 2025-10-26)
> > - 3e86e4d74c049 (kbuild: keep .modinfo section in vmlinux.unstripped,
> > 2025-09-18)
> > 
> > And try implementing the keeping of .modinfo section again.
> > 
> > Better structure tests, after linking would be nice to catch such
> > issues, because linker scripts are hard and trying to understand how a
> > linker script change affects the result.
> 
> I think if we cannot figure out these issues by -rc6 timeframe, it may
> be worth reverting the entire builtin .modinfo series and trying again
> for 6.20 (it will probably be too late for 6.19 at that point) but I
> would like to avoid doing that to Alexey if possible. I am not sure the
> zero length segment issue is worth an entire back out at this point
> alone, as I have proposed a fix for the original issue brought up by
> this thread.

Nathan, if you see that my changes are creating more problems than they
are solving, feel free to revert them.

My changes were based on Masahiro Yamada's patches. I didn't expect his
changes to cause many problems. Before his changes, I tried to use a
different approach. If you think it's worth it, we can return to
discussing it.

https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/

-- 
Rgrds, legion


