Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6368C4F48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 12:44:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0YfS3fI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdtJQ3Q2Hz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 20:44:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s0YfS3fI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdtHf6dgyz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 20:43:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0B9A61228;
	Tue, 14 May 2024 10:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38261C4AF07;
	Tue, 14 May 2024 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715683403;
	bh=PJLtc52CgWNVdrSsNgEHGl0SbAdysC2zMmcc++VErTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0YfS3fIDJVU8JEKuKxoi0jyF9bX7Lq1eXONyZpqldx5P9BR9EpGTOo+4QR901dVd
	 1/H+S61zWWwWROa+0oZq2uI6445nS+zyPy9pLEDgr/iV7l/bAXZ26YksRsbsfjjJ6j
	 WjJyfY0lPRmWlKdcskxWxQUk9KZH3jAm0nlaJFGeKWikv0r+zigTzBJExtGegSmBX2
	 BLKgB/8/3arMGRtCV90OdlGhYJcBPb8YEaerwbsLoK9v6gg6YRO1wK/wPrIp3zm9rS
	 viZY4Fks9pt31kJHPWPs9dXsLXc5wdkFutb/SK7o2el2hcNdcuRD4xd1GaVYrRmKUA
	 ab9OSpF2I1Kiw==
Date: Tue, 14 May 2024 16:12:19 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/5] powerpc/64: Convert patch_instruction() to
 patch_u32()
Message-ID: <u4irwuytaii74mmblujmnb67222dgybo7kb7ywnzxv6tluqyei@jefh52acwfic>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
 <20240325055302.876434-4-bgray@linux.ibm.com>
 <xjnc3usfjrn3pqitpvvs4fkackuzcrnguqmqm2otocnhtrxmux@cd4d7bsyoweq>
 <8d6ba809067eb332e1c1a8e6103303cd4814df41.camel@linux.ibm.com>
 <1cf1c19a-c070-4d86-9351-85e8e58d3180@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cf1c19a-c070-4d86-9351-85e8e58d3180@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2024 at 04:39:30AM GMT, Christophe Leroy wrote:
> 
> 
> Le 14/05/2024 à 04:59, Benjamin Gray a écrit :
> > On Tue, 2024-04-23 at 15:09 +0530, Naveen N Rao wrote:
> >> On Mon, Mar 25, 2024 at 04:53:00PM +1100, Benjamin Gray wrote:
> >>> This use of patch_instruction() is working on 32 bit data, and can
> >>> fail
> >>> if the data looks like a prefixed instruction and the extra write
> >>> crosses a page boundary. Use patch_u32() to fix the write size.
> >>>
> >>> Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO
> >>> modules")
> >>> Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
> >>> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> >>>
> >>> ---
> >>>
> >>> v2: * Added the fixes tag, it seems appropriate even if the subject
> >>> does
> >>>        mention a more robust solution being required.
> >>>
> >>> patch_u64() should be more efficient, but judging from the bug
> >>> report
> >>> it doesn't seem like the data is doubleword aligned.
> >>
> >> Asking again, is that still the case? It looks like at least the
> >> first
> >> fix below can be converted to patch_u64().
> >>
> >> - Naveen
> > 
> > Sorry, I think I forgot this question last time. Reading the commit
> > descriptions you linked, I don't see any mention of "entry->funcdata
> > will always be doubleword aligned because XYZ". If the patch makes it
> > doubleword aligned anyway, I wouldn't be confident asserting all
> > callers will always do this without looking into it a lot more.

No worries. I was asking primarily to check if you had noticed a 
specific issue with alignment.

As Christophe mentions, the structure is aligned. It is primarily 
allotted in a separate stubs section for modules. Looking at it closer 
though, I wonder if we need the below:

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index cccb1f78e058..0226d73a0007 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -428,8 +428,11 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 
        /* Find .toc and .stubs sections, symtab and strtab */
        for (i = 1; i < hdr->e_shnum; i++) {
-               if (strcmp(secstrings + sechdrs[i].sh_name, ".stubs") == 0)
+               if (strcmp(secstrings + sechdrs[i].sh_name, ".stubs") == 0) {
                        me->arch.stubs_section = i;
+                       if (sechdrs[i].sh_addralign < 8)
+                               sechdrs[i].sh_addralign = 8;
+               }
 #ifdef CONFIG_PPC_KERNEL_PCREL
                else if (strcmp(secstrings + sechdrs[i].sh_name, ".data..percpu") == 0)
                        me->arch.pcpu_section = i;

> > 
> > Perhaps a separate series could optimise it with appropriate
> > justification/assertions to catch bad alignment. But I think leaving it
> > out of this series is fine because the original works in words, so it's
> > not regressing anything.

That should be fine.

> 
> As far as I can see, the struct is 64 bits aligned by definition so 
> funcdata field is aligned too as there are just 8x u32 before it:
> 
> struct ppc64_stub_entry {
> 	/*
> 	 * 28 byte jump instruction sequence (7 instructions) that can
> 	 * hold ppc64_stub_insns or stub_insns. Must be 8-byte aligned
> 	 * with PCREL kernels that use prefix instructions in the stub.
> 	 */
> 	u32 jump[7];
> 	/* Used by ftrace to identify stubs */
> 	u32 magic;
> 	/* Data for the above code */
> 	func_desc_t funcdata;
> } __aligned(8);
> 

Thanks,
Naveen

