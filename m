Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 621EE8CE226
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 10:16:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gTSmyPEV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlyRF6QmZz78tJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 18:11:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gTSmyPEV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlyQY55Kcz78Sv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 18:10:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 865DDCE18A1;
	Fri, 24 May 2024 08:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC38C2BBFC;
	Fri, 24 May 2024 08:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716538222;
	bh=KzZifyFunKdMl7mZy15PbBQXyBPtR28fDlzXAEBwRZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTSmyPEVPbnVYsbqpii0XYle0nGrfAI9KJYQ9QQtMO99GDFwrEnqvqqW0CTH4UlBj
	 tQBgvLjOBwnUJuGZxOGDTsX4L6RMbys6psDv8PUNuOdm/25RCKhlFkIYOfTrfRizEL
	 zrfZAyySbpZgi58QD2ndnKtlklKpcj+BMsW0AxWTTYZlCxENaRkfJYFJS6v1kNMR14
	 ga0qGrTXnaPwfBus+NEwyvGZfqJydhu3K7zoinPVPT9eMD//g3rIYeb7wY9RoPP5Ms
	 FDn/3P7s7/hz1wCZKv6/dHdxX1x3mYjBNAZq5sA38FYcjenIX4A18VMWI60BLNmiRp
	 OSh2FV9ePUR3g==
Date: Fri, 24 May 2024 11:08:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Patch v2] mm/memblock: discard .text/.data if
 CONFIG_ARCH_KEEP_MEMBLOCK not set
Message-ID: <ZlBK_PZ2ZivCFXCv@kernel.org>
References: <20240510020422.8038-1-richard.weiyang@gmail.com>
 <ZkxLkK7vgzzaEvyw@kernel.org>
 <20240524014656.odw4yuvhgbu4dgf7@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524014656.odw4yuvhgbu4dgf7@master>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 24, 2024 at 01:46:56AM +0000, Wei Yang wrote:
> On Tue, May 21, 2024 at 10:21:52AM +0300, Mike Rapoport wrote:
> >Hi,
> >
> >On Fri, May 10, 2024 at 02:04:22AM +0000, Wei Yang wrote:
> >> When CONFIG_ARCH_KEEP_MEMBLOCK not set, we expect to discard related
> >> code and data. But it doesn't until CONFIG_MEMORY_HOTPLUG not set
> >> neither.
> >> 
> >> This patch puts memblock's .text/.data into its own section, so that it
> >> only depends on CONFIG_ARCH_KEEP_MEMBLOCK to discard related code and
> >> data.
> >> 
> >> After this, from the log message in mem_init_print_info(), init size
> >> increase from 2420K to 2432K on arch x86.
> >> 
> >> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> >> 
> >> ---
> >> v2: fix orphan section for powerpc
> >> ---
> >>  arch/powerpc/kernel/vmlinux.lds.S |  1 +
> >>  include/asm-generic/vmlinux.lds.h | 14 +++++++++++++-
> >>  include/linux/memblock.h          |  8 ++++----
> >>  3 files changed, 18 insertions(+), 5 deletions(-)
> >>  
> >> +#define __init_memblock        __section(".mbinit.text") __cold notrace \
> >> +						  __latent_entropy
> >> +#define __initdata_memblock    __section(".mbinit.data")
> >> +
> >
> >The new .mbinit.* sections should be added to scripts/mod/modpost.c
> >alongside .meminit.* sections and then I expect modpost to report a bunch
> >of section mismatches because many memblock functions are called on memory
> >hotplug even on architectures that don't select ARCH_KEEP_MEMBLOCK.
> >
> 
> I tried to add some code in modpost.c, "make all" looks good.
> 
> May I ask how can I trigger the "mismatch" warning?
> 
> BTW, if ARCH_KEEP_MEMBLOCK unset, we would discard memblock meta-data. If
> hotplug would call memblock function, it would be dangerous?
> 
> The additional code I used is like below.
> 
> ---
>  scripts/mod/modpost.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 937294ff164f..c837e2882904 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -777,14 +777,14 @@ static void check_section(const char *modname, struct elf_info *elf,
>  
>  #define ALL_INIT_DATA_SECTIONS \
>  	".init.setup", ".init.rodata", ".meminit.rodata", \
> -	".init.data", ".meminit.data"
> +	".init.data", ".meminit.data", "mbinit.data"

should be ".mbinit.data"
>  
>  #define ALL_PCI_INIT_SECTIONS	\
>  	".pci_fixup_early", ".pci_fixup_header", ".pci_fixup_final", \
>  	".pci_fixup_enable", ".pci_fixup_resume", \
>  	".pci_fixup_resume_early", ".pci_fixup_suspend"
>  
> -#define ALL_XXXINIT_SECTIONS ".meminit.*"
> +#define ALL_XXXINIT_SECTIONS ".meminit.*", "mbinit.*"

and ".mbinit.*"

But regardless of typos, when ARCH_KEEP_MEMBLOCK=n the .mbinit is equivalent
to .init and it should not be referenced from .meminit, so I don't think
adding it here is correct.

If I simply alias __init_memblock to __init then with
CONFIG_MEMORY_HOTPLUG=y I get

WARNING: modpost: vmlinux: section mismatch in reference: early_pfn_to_nid+0x42 (section: .meminit.text) -> memblock_search_pfn_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: memmap_init_range+0x142 (section: .meminit.text) -> mirrored_kernelcore (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: memmap_init_range+0x1e1 (section: .meminit.text) -> memblock (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: memmap_init_range+0x1e8 (section: .meminit.text) -> memblock (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: sparse_buffer_alloc+0x3b (section: .meminit.text) -> memblock_free (section: .init.text)

>  #define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
>  #define ALL_EXIT_SECTIONS ".exit.*"
> @@ -799,7 +799,7 @@ static void check_section(const char *modname, struct elf_info *elf,
>  
>  #define INIT_SECTIONS      ".init.*"
>  
> -#define ALL_TEXT_SECTIONS  ".init.text", ".meminit.text", ".exit.text", \
> +#define ALL_TEXT_SECTIONS  ".init.text", ".meminit.text", ".mbinit.text", ".exit.text", \
>  		TEXT_SECTIONS, OTHER_TEXT_SECTIONS
>  
>  enum mismatch {
> 
> -- 
> Wei Yang
> Help you, Help me
> 

-- 
Sincerely yours,
Mike.
