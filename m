Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E734D4E4D9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 08:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNgYY5svrz306j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 18:52:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=dSlfkM5u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.145; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=dSlfkM5u; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound4mad.lav.puc.rediris.es
 [130.206.19.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNgXt3xWSz2x9R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 18:51:40 +1100 (AEDT)
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
 by mx01.puc.rediris.es  with ESMTP id 22N7p0Da009936-22N7p0Dc009936
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 23 Mar 2022 08:51:00 +0100
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id C12FE39088;
 Wed, 23 Mar 2022 08:50:59 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTP id 4070C39082;
 Wed, 23 Mar 2022 08:50:59 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out04.sim.rediris.es
Received: from sim.rediris.es ([127.0.0.1])
 by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lK7zAAHi9gpV; Wed, 23 Mar 2022 08:50:59 +0100 (CET)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
 by sim.rediris.es (Postfix) with ESMTPA id 22C7239089;
 Wed, 23 Mar 2022 08:50:56 +0100 (CET)
Date: Wed, 23 Mar 2022 08:50:52 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/boot: Stop using RELACOUNT
Message-ID: <YjrRXLTafw3wgb/l@lt-gp.iram.es>
References: <20220321071026.918262-1-aik@ozlabs.ru>
 <87fsnahh10.fsf@mpe.ellerman.id.au>
 <ed991242-6ef2-b346-ffde-a38cb75db0cf@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed991242-6ef2-b346-ffde-a38cb75db0cf@ozlabs.ru>
X-FE-Policy-ID: 23:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=US0/a71B4I2N/fWD25Gu20XctD0o+DhHY1Vby8G8dBw=;
 b=dSlfkM5uQ0fuAF5P+JrG810CxAcL2doU+kup5lWnYf5oAk/rA+7lcYh+hnnGJk6tzT7grJjlCVlg
 NS+OrKMOh0cDp3j+itNmb9u6IY65rQZ/VxcZhGoaFK+5HBbdLRIc74q+5i2Y/V7RIoOilipmJHmN
 GLTWF3/MsdZr4XIDa67CKQTvD4jEXPl8GQxhoZH0cG0WkltudzI28SsIhZObZK3PX/sL2YLNwn1o
 XWKunbRNmDk7W9AE4vvHyNqk0toa5jBbvo9kSJJPilNHeGexZzT5YKeAIVQ5aXBN6V8i7aPXzTxz
 5k0KQXhKZdic1fvcRPNHh6yNWMwSm+jzTKQhcg==
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 23, 2022 at 11:18:40AM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 3/22/22 13:12, Michael Ellerman wrote:
> > Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> > > So far the RELACOUNT tag from the ELF header was containing the exact
> > > number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
> > > recent change [1] make it equal-or-less than the actual number which
> > > makes it useless.
> > > 
> > > This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
> > > The vmlinux relocation code is fixed in [2].
> > 
> > That's committed so you can say:
> >    in commit d79976918852 ("powerpc/64: Add UADDR64 relocation support")
> > 
> > > To make it more future proof, this walks through the entire .rela.dyn
> > > section instead of assuming that the section is sorter by a relocation
> > > type. Unlike [1], this does not add unaligned UADDR/UADDR64 relocations
> >                  ^
> >                  that should be 2?
> 
> Yes.
> 
> > 
> > > as in hardly possible to see those in arch-specific zImage.
> > 
> > I don't quite parse that. Is it true we can never see them in zImage?
> > Maybe it's true that we don't see them in practice.
> 
> I can force UADDR64 in zImage as I did for d79976918852 but zImage is lot
> smaller and more arch-specific than vmlinux and so far only PRINT_INDEX
> triggered UADDR64 in vmlinux and chances of the same thing happening in
> zImage are small.
> 
> 
> > 
> > > [1] https://github.com/llvm/llvm-project/commit/da0e5b885b25cf4
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=d799769188529a
> > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > ---
> > >   arch/powerpc/boot/crt0.S | 43 +++++++++++++++++++++++++---------------
> > >   1 file changed, 27 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
> > > index feadee18e271..6ea3417da3b7 100644
> > > --- a/arch/powerpc/boot/crt0.S
> > > +++ b/arch/powerpc/boot/crt0.S
> > > @@ -8,7 +8,8 @@
> > >   #include "ppc_asm.h"
> > >   RELA = 7
> > > -RELACOUNT = 0x6ffffff9
> > > +RELASZ = 8
> > > +RELAENT = 9
> > >   	.data
> > >   	/* A procedure descriptor used when booting this as a COFF file.
> > > @@ -75,34 +76,38 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
> > >   	bne	11f
> > >   	lwz	r9,4(r12)	/* get RELA pointer in r9 */
> > >   	b	12f
> > > -11:	addis	r8,r8,(-RELACOUNT)@ha
> > > -	cmpwi	r8,RELACOUNT@l
> > > +11:	cmpwi	r8,RELASZ
> > > +	bne	111f
> > > +	lwz	r0,4(r12)       /* get RELASZ value in r0 */
> > > +	b	12f
> > > +111:	cmpwi	r8,RELAENT
> > 
> > Can you use named local labels for new labels you introduce?
> > 
> > This could be .Lcheck_for_relaent: perhaps.
> 
> Then I'll need to rename them all/most and add more noise to the patch which
> reduces chances of it being reviewed. But sure, I can rename labels.
> 
> 
> 
> > >   	bne	12f
> > > -	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
> > > +	lwz     r14,4(r12)      /* get RELAENT value in r14 */
> > >   12:	addi	r12,r12,8
> > >   	b	9b
> > >   	/* The relocation section contains a list of relocations.
> > >   	 * We now do the R_PPC_RELATIVE ones, which point to words
> > > -	 * which need to be initialized with addend + offset.
> > > -	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
> > > -	 * of them. */
> > > +	 * which need to be initialized with addend + offset */
> > >   10:	/* skip relocation if we don't have both */
> > >   	cmpwi	r0,0
> > >   	beq	3f
> > >   	cmpwi	r9,0
> > >   	beq	3f
> > > +	cmpwi	r14,0
> > > +	beq	3f
> > >   	add	r9,r9,r11	/* Relocate RELA pointer */
> > > +	divd    r0,r0,r14       /* RELASZ / RELAENT */
> > 
> > This is in the 32-bit portion isn't it. AFAIK 32-bit CPUs don't
> > implement divd. I'm not sure why the toolchain allowed it. I would
> > expect it to trap if run on real 32-bit hardware.
> 
> 
> Uff, my bad, "divw", right?

Or maybe even "divwu", since I suspect both values are unsigned.

Probably does not make a difference in practice.

	Gabriel

> 
> I am guessing it works as zImage for 64bit BigEndian is still ELF32 which
> runs in 64bit CPU and I did not test on real PPC32 as I'm not quite sure how
> and I hoped your farm will do this for me :)
> 
> 
> 
> > >   	mtctr	r0
> > >   2:	lbz	r0,4+3(r9)	/* ELF32_R_INFO(reloc->r_info) */
> > >   	cmpwi	r0,22		/* R_PPC_RELATIVE */
> > > -	bne	3f
> > > +	bne	22f
> > >   	lwz	r12,0(r9)	/* reloc->r_offset */
> > >   	lwz	r0,8(r9)	/* reloc->r_addend */
> > >   	add	r0,r0,r11
> > >   	stwx	r0,r11,r12
> > > -	addi	r9,r9,12
> > > +22:	add	r9,r9,r14
> > >   	bdnz	2b
> > >   	/* Do a cache flush for our text, in case the loader didn't */
> > 
> > cheers
 

