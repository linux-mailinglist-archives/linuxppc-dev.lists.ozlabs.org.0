Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 106FB4720F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 07:08:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC9zT73hkz3bhh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 17:08:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=RULPijSC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kE+F6uIL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=RULPijSC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kE+F6uIL; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC9yk61Rzz2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 17:07:26 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 98CE45C0097;
 Mon, 13 Dec 2021 01:07:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 01:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:in-reply-to:references
 :content-type:date:mime-version:content-transfer-encoding; s=
 fm3; bh=oBCcaWmcC3nSaIOPSwBkbOCEl1+2mMavwzCz1JILnb4=; b=RULPijSC
 UpohxlqxnbboA9lCiBamUV+4OO9NU9peKjA/E7wu+7OBVwaGgx42zT0f8IDeckI5
 ex4wuNHslGHplgM3rldDs9xB04ID9mDZW8OO7jdzx5yfJjFk+FPiLXx7S0tL5bp7
 px3XP4ZWJev8ciEJVYMrla/sNp1SBRj8nIz2yC1wQFcTMkw0xq4+497smTKBXmlF
 Y9tSzgxpjBWuxU8SIKneO87LDIJ3BoY7ZrWweYxP1xqFo3A15k/DaWHLX3jSwAbW
 6Y0MEyifXBrOitWJZJIWABEhFTQ1aGFUDbDvetBFvMvmx1D+VIvoC6Gf3FiL4sh6
 gdzNX8yNd8ZbnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=oBCcaWmcC3nSaIOPSwBkbOCEl1+2mMavwzCz1JILn
 b4=; b=kE+F6uILMUhvlVpQWjHbdqiPXOped9cbvm8QkZjP+WcBSFrOewj6yQs1Y
 IAy/3Ns9JUj2OcxKLSCsJsjKX/FeKsO0Hpq71qysQVz5WiZK1KNMxAwxk+R/76wF
 oQnUNvlMIFz4qR3jLPBpRRNNIkUeW/aFVEmGJe/sJLbKi9faWTKvdHeM7eiqBTPV
 UbMSa0jiFnaCHSgKH0MLKY+NR9bzxL2f8jXmiSF+rV/3uq1ohWUl8faQ/A4/5bNe
 +rUhARxW1GwRb6ybxrRVOxb9Zr45C88EFJ2pOQSVFb8oN58qzoH6QkxS8EC6MwTE
 IYHbUXLQXtOg8/53e/2ah+3J1CkEQ==
X-ME-Sender: <xms:HOO2Yd5Pn_G28DWreZEntjeRbyAT1NOaY_vSTRPysCQR0c7Baav0eA>
 <xme:HOO2Ya6RNG_tefpFqZUddw3x5XXOxZ8ut3RKGDfCz3l6AASp1518VSWYkCrppPEaA
 6iK4ZxafsvMShkrhQ>
X-ME-Received: <xmr:HOO2YUezDLxSlT2-A1i73GjmpGhZO4T2O1XZ7MQiUZHJR3FP-yprh0flK6pTObm4VGKM57A4_lXM3MoGsfNy21_uxLDa5cQv87W19tQ0P8FA0a4dYxXd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeejgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhepkffuhffvjghftgffgggfgfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepgedvfeffgfeuhefhveeileeuveejheet
 geettdevleegheetueetgefgvdejkeetnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:HOO2YWKL0ZY8sCia7iV3flZjVsWXPtEQf8EM6-9foo4woCSJfaZozQ>
 <xmx:HOO2YRIpDjEicHM-dqX_8uhCBwYGy60oGViNRMDMXj2u9ONhmAPh0w>
 <xmx:HOO2YfxEbJXSK_ZCtmhPnlKE88Y-fdOrrstXtp87yWa4MTWEo99lxg>
 <xmx:HOO2Yfi-YgaUwEmT4EbnMJsD9DkLTa9GahBdGIhfiTLc0xD0wAkQ4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 01:07:21 -0500 (EST)
Message-ID: <657f15f5bf7e918441ca9670e67254435cf57ad3.camel@russell.cc>
Subject: Re: [PATCH v2 2/2] powerpc/module_64: Use patch_memory() to apply
 relocations to loaded modules
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <12d81cfc-1c76-705f-af83-1b424eff64a0@csgroup.eu>
References: <20211212010357.16280-1-ruscur@russell.cc>
 <20211212010357.16280-2-ruscur@russell.cc>
 <12d81cfc-1c76-705f-af83-1b424eff64a0@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Dec 2021 16:07:19 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.2 
Content-Transfer-Encoding: 8bit
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "joe.lawrence@redhat.com" <joe.lawrence@redhat.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2021-12-12 at 10:41 +0000, Christophe Leroy wrote:
> 
> 
> Le 12/12/2021 à 02:03, Russell Currey a écrit :
> > Livepatching a loaded module involves applying relocations through
> > apply_relocate_add(), which attempts to write to read-only memory
> > when
> > CONFIG_STRICT_MODULE_RWX=y.  Work around this by performing these
> > writes through the text poke area by using patch_memory().
> > 
> > Similar to x86 and s390 implementations, apply_relocate_add() now
> > chooses to use patch_memory() or memcpy() depending on if the
> > module
> > is loaded or not.  Without STRICT_KERNEL_RWX, patch_memory() is
> > just
> > memcpy(), so there should be no performance impact.
> > 
> > While many relocation types may not be applied in a livepatch
> > context, comprehensively handling them prevents any issues in
> > future,
> > with no performance penalty as the text poke area is only used when
> > necessary.
> > 
> > create_stub() and create_ftrace_stub() are modified to first write
> > to the stack so that the ppc64_stub_entry struct only takes one
> > write() to modify, saving several map/unmap/flush operations
> > when use of patch_memory() is necessary.
> > 
> > This patch also contains some trivial whitespace fixes.
> > 
> > Fixes: c35717c71e98 ("powerpc: Set ARCH_HAS_STRICT_MODULE_RWX")
> > Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> > v2: No changes.
> > 
> > Some discussion here:https://github.com/linuxppc/issues/issues/375
> > for-stable version using patch_instruction():
> > https://lore.kernel.org/linuxppc-dev/20211123081520.18843-1-ruscur@russell.cc/
> > 
> >   arch/powerpc/kernel/module_64.c | 157 +++++++++++++++++++++------
> > -----
> >   1 file changed, 104 insertions(+), 53 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/module_64.c
> > b/arch/powerpc/kernel/module_64.c
> > index 6baa676e7cb6..2a146750fa6f 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -350,11 +350,11 @@ static u32 stub_insns[] = {
> >    */
> >   static inline int create_ftrace_stub(struct ppc64_stub_entry
> > *entry,
> >                                         unsigned long addr,
> > -                                       struct module *me)
> > +                                       struct module *me,
> > +                                       void *(*write)(void *,
> > const void *, size_t))
> 
> I really dislike this write() parameter to the function.
> 
> I think it would be better to define a static sub-function that takes
> write()'s parameters plus the 'struct module *me' and have it call 
> either patch_memory() or memcpy() based on me->state.

I don't like it much either, I was just going off prior art from x86
and s390.  I like your idea better, and that function could just be
memcpy() if !CONFIG_STRICT_MODULE_RWX, removing the need to check the
state in that case.

> 
> >   {
> >         long reladdr;
> > -
> > -       memcpy(entry->jump, stub_insns, sizeof(stub_insns));
> > +       struct ppc64_stub_entry tmp_entry;
> >   
> >         /* Stub uses address relative to kernel toc (from the paca)
> > */
> >         reladdr = addr - kernel_toc_addr();
> > @@ -364,12 +364,20 @@ static inline int create_ftrace_stub(struct
> > ppc64_stub_entry *entry,
> >                 return 0;
> >         }
> >   
> > -       entry->jump[1] |= PPC_HA(reladdr);
> > -       entry->jump[2] |= PPC_LO(reladdr);
> > +       /*
> > +        * In case @entry is write-protected, make our changes on
> > the stack
> > +        * so we can update the whole struct in one write().
> > +        */
> > +       memcpy(&tmp_entry, entry, sizeof(struct ppc64_stub_entry));
> 
> That copy seems unnecessary, entry is a struct with three fields and
> you 
> are setting all three field below.

Oops, you're right.

> >   
> > +       memcpy(&tmp_entry.jump, stub_insns, sizeof(stub_insns));
> > +       tmp_entry.jump[1] |= PPC_HA(reladdr);
> > +       tmp_entry.jump[2] |= PPC_LO(reladdr);
> >         /* Eventhough we don't use funcdata in the stub, it's
> > needed elsewhere. */
> > -       entry->funcdata = func_desc(addr);
> > -       entry->magic = STUB_MAGIC;
> > +       tmp_entry.funcdata = func_desc(addr);
> > +       tmp_entry.magic = STUB_MAGIC;
> > +
> > +       write(entry, &tmp_entry, sizeof(struct ppc64_stub_entry));
> >   
> >         return 1;
> >   }
> > @@ -392,7 +400,8 @@ static bool is_mprofile_ftrace_call(const char
> > *name)
> >   #else
> >   static inline int create_ftrace_stub(struct ppc64_stub_entry
> > *entry,
> >                                         unsigned long addr,
> > -                                       struct module *me)
> > +                                       struct module *me,
> > +                                       void *(*write)(void *,
> > const void *, size_t))
> >   {
> >         return 0;
> >   }
> > @@ -419,14 +428,14 @@ static inline int create_stub(const
> > Elf64_Shdr *sechdrs,
> >                               struct ppc64_stub_entry *entry,
> >                               unsigned long addr,
> >                               struct module *me,
> > -                             const char *name)
> > +                             const char *name,
> > +                             void *(*write)(void *, const void *,
> > size_t))
> >   {
> >         long reladdr;
> > +       struct ppc64_stub_entry tmp_entry;
> >   
> >         if (is_mprofile_ftrace_call(name))
> > -               return create_ftrace_stub(entry, addr, me);
> > -
> > -       memcpy(entry->jump, ppc64_stub_insns,
> > sizeof(ppc64_stub_insns));
> > +               return create_ftrace_stub(entry, addr, me, write);
> >   
> >         /* Stub uses address relative to r2. */
> >         reladdr = (unsigned long)entry - my_r2(sechdrs, me);
> > @@ -437,10 +446,19 @@ static inline int create_stub(const
> > Elf64_Shdr *sechdrs,
> >         }
> >         pr_debug("Stub %p get data from reladdr %li\n", entry,
> > reladdr);
> >   
> > -       entry->jump[0] |= PPC_HA(reladdr);
> > -       entry->jump[1] |= PPC_LO(reladdr);
> > -       entry->funcdata = func_desc(addr);
> > -       entry->magic = STUB_MAGIC;
> > +       /*
> > +        * In case @entry is write-protected, make our changes on
> > the stack
> > +        * so we can update the whole struct in one write().
> > +        */
> > +       memcpy(&tmp_entry, entry, sizeof(struct ppc64_stub_entry));
> > +
> > +       memcpy(&tmp_entry.jump, ppc64_stub_insns,
> > sizeof(ppc64_stub_insns));
> > +       tmp_entry.jump[0] |= PPC_HA(reladdr);
> > +       tmp_entry.jump[1] |= PPC_LO(reladdr);
> > +       tmp_entry.funcdata = func_desc(addr);
> > +       tmp_entry.magic = STUB_MAGIC;
> > +
> > +       write(entry, &tmp_entry, sizeof(struct ppc64_stub_entry));
> >   
> >         return 1;
> >   }
> > @@ -450,7 +468,8 @@ static inline int create_stub(const Elf64_Shdr
> > *sechdrs,
> >   static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
> >                                    unsigned long addr,
> >                                    struct module *me,
> > -                                  const char *name)
> > +                                  const char *name,
> > +                                  void *(*write)(void *, const
> > void *, size_t))
> >   {
> >         struct ppc64_stub_entry *stubs;
> >         unsigned int i, num_stubs;
> > @@ -467,7 +486,7 @@ static unsigned long stub_for_addr(const
> > Elf64_Shdr *sechdrs,
> >                         return (unsigned long)&stubs[i];
> >         }
> >   
> > -       if (!create_stub(sechdrs, &stubs[i], addr, me, name))
> > +       if (!create_stub(sechdrs, &stubs[i], addr, me, name,
> > write))
> >                 return 0;
> >   
> >         return (unsigned long)&stubs[i];
> > @@ -496,15 +515,20 @@ static int restore_r2(const char *name, u32
> > *instruction, struct module *me)
> >                 return 0;
> >         }
> >         /* ld r2,R2_STACK_OFFSET(r1) */
> > -       *instruction = PPC_INST_LD_TOC;
> > +       if (me->state == MODULE_STATE_UNFORMED)
> > +               *instruction = PPC_INST_LD_TOC;
> > +       else
> > +               patch_instruction(instruction,
> > ppc_inst(PPC_INST_LD_TOC));
> > +
> 
> Would be better if that hunk was following the same approach as other
> places.

It's not great that it's different, but I do like using
patch_instruction() for instructions.

> 
> >         return 1;
> >   }
> >   
> > -int apply_relocate_add(Elf64_Shdr *sechdrs,
> > -                      const char *strtab,
> > -                      unsigned int symindex,
> > -                      unsigned int relsec,
> > -                      struct module *me)
> > +static int __apply_relocate_add(Elf64_Shdr *sechdrs,
> > +                               const char *strtab,
> > +                               unsigned int symindex,
> > +                               unsigned int relsec,
> > +                               struct module *me,
> > +                               void *(*write)(void *dest, const
> > void *src, size_t len))
> >   {
> >         unsigned int i;
> >         Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
> > @@ -544,16 +568,17 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                 switch (ELF64_R_TYPE(rela[i].r_info)) {
> >                 case R_PPC64_ADDR32:
> >                         /* Simply set it */
> > -                       *(u32 *)location = value;
> > +                       write(location, &value, 4);
> >                         break;
> >   
> >                 case R_PPC64_ADDR64:
> >                         /* Simply set it */
> > -                       *(unsigned long *)location = value;
> > +                       write(location, &value, 8);
> >                         break;
> >   
> >                 case R_PPC64_TOC:
> > -                       *(unsigned long *)location = my_r2(sechdrs,
> > me);
> > +                       value = my_r2(sechdrs, me);
> > +                       write(location, &value, 8);
> >                         break;
> >   
> >                 case R_PPC64_TOC16:
> > @@ -564,17 +589,17 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                                        me->name, value);
> >                                 return -ENOEXEC;
> >                         }
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xffff)
> > +                       value = (*((uint16_t *) location) &
> > ~0xffff)
> >                                 | (value & 0xffff);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 case R_PPC64_TOC16_LO:
> >                         /* Subtract TOC pointer */
> >                         value -= my_r2(sechdrs, me);
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xffff)
> > +                       value = (*((uint16_t *) location) &
> > ~0xffff)
> >                                 | (value & 0xffff);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 case R_PPC64_TOC16_DS:
> > @@ -585,9 +610,9 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                                        me->name, value);
> >                                 return -ENOEXEC;
> >                         }
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xfffc)
> > +                       value = (*((uint16_t *) location) &
> > ~0xfffc)
> >                                 | (value & 0xfffc);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 case R_PPC64_TOC16_LO_DS:
> > @@ -598,18 +623,18 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                                        me->name, value);
> >                                 return -ENOEXEC;
> >                         }
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xfffc)
> > +                       value = (*((uint16_t *) location) &
> > ~0xfffc)
> >                                 | (value & 0xfffc);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 case R_PPC64_TOC16_HA:
> >                         /* Subtract TOC pointer */
> >                         value -= my_r2(sechdrs, me);
> >                         value = ((value + 0x8000) >> 16);
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xffff)
> > +                       value = (*((uint16_t *) location) &
> > ~0xffff)
> >                                 | (value & 0xffff);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 case R_PPC_REL24:
> > @@ -618,14 +643,15 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                             sym->st_shndx == SHN_LIVEPATCH) {
> >                                 /* External: go via stub */
> >                                 value = stub_for_addr(sechdrs,
> > value, me,
> > -                                               strtab + sym-
> > >st_name);
> > +                                                     strtab + sym-
> > >st_name, write);
> >                                 if (!value)
> >                                         return -ENOENT;
> >                                 if (!restore_r2(strtab + sym-
> > >st_name,
> >                                                         (u32
> > *)location + 1, me))
> >                                         return -ENOEXEC;
> > -                       } else
> > +                       } else {
> >                                 value += local_entry_offset(sym);
> > +                       }
> >   
> >                         /* Convert value to relative */
> >                         value -= (unsigned long)location;
> > @@ -636,14 +662,15 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                         }
> >   
> >                         /* Only replace bits 2 through 26 */
> > -                       *(uint32_t *)location
> > -                               = (*(uint32_t *)location &
> > ~0x03fffffc)
> > +                       value = (*(uint32_t *)location &
> > ~0x03fffffc)
> >                                 | (value & 0x03fffffc);
> > +                       write(location, &value, 4);
> >                         break;
> >   
> >                 case R_PPC64_REL64:
> >                         /* 64 bits relative (used by features
> > fixups) */
> > -                       *location = value - (unsigned
> > long)location;
> > +                       value -= (unsigned long)location;
> > +                       write(location, &value, 8);
> >                         break;
> >   
> >                 case R_PPC64_REL32:
> > @@ -655,7 +682,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                                        me->name, (long int)value);
> >                                 return -ENOEXEC;
> >                         }
> > -                       *(u32 *)location = value;
> > +                       write(location, &value, 4);
> >                         break;
> >   
> >                 case R_PPC64_TOCSAVE:
> > @@ -676,7 +703,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                                 break;
> >                         /*
> >                          * Check for the large code model prolog
> > sequence:
> > -                        *      ld r2, ...(r12)
> > +                        *      ld r2, ...(r12)
> >                          *      add r2, r2, r12
> >                          */
> >                         if ((((uint32_t *)location)[0] & ~0xfffc)
> > != PPC_RAW_LD(_R2, _R12, 0))
> > @@ -688,25 +715,27 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                          *      addis r2, r12, (.TOC.-func)@ha
> >                          *      addi  r2,  r2, (.TOC.-func)@l
> >                          */
> > -                       ((uint32_t *)location)[0] =
> > PPC_RAW_ADDIS(_R2, _R12, PPC_HA(value));
> > -                       ((uint32_t *)location)[1] =
> > PPC_RAW_ADDI(_R2, _R2, PPC_LO(value));
> > +                       patch_instruction(&((uint32_t
> > *)location)[0],
> > +                                        
> > ppc_inst(PPC_RAW_ADDIS(_R2, _R12, PPC_HA(value))));
> > +                       patch_instruction(&((uint32_t
> > *)location)[1],
> > +                                        
> > ppc_inst(PPC_RAW_ADDI(_R2, _R2, PPC_LO(value))));
> 
> Shouldn't you do like restore_r2() ?

Yeah, I probably did it this way to reduce code size in this already
very ugly section.  I can solve both problems with a static helper.

> 
> >                         break;
> >   
> >                 case R_PPC64_REL16_HA:
> >                         /* Subtract location pointer */
> >                         value -= (unsigned long)location;
> >                         value = ((value + 0x8000) >> 16);
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xffff)
> > +                       value = (*((uint16_t *) location) &
> > ~0xffff)
> >                                 | (value & 0xffff);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 case R_PPC64_REL16_LO:
> >                         /* Subtract location pointer */
> >                         value -= (unsigned long)location;
> > -                       *((uint16_t *) location)
> > -                               = (*((uint16_t *) location) &
> > ~0xffff)
> > +                       value = (*((uint16_t *) location) &
> > ~0xffff)
> >                                 | (value & 0xffff);
> > +                       write(location, &value, 2);
> >                         break;
> >   
> >                 default:
> > @@ -720,6 +749,20 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >         return 0;
> >   }
> >   
> > +int apply_relocate_add(Elf64_Shdr *sechdrs,
> > +                      const char *strtab,
> > +                      unsigned int symindex,
> > +                      unsigned int relsec,
> > +                      struct module *me)
> > +{
> > +       void *(*write)(void *, const void *, size_t) = memcpy;
> > +       bool early = me->state == MODULE_STATE_UNFORMED;
> > +
> > +       if (!early)
> > +               write = patch_memory;
> > +
> > +       return __apply_relocate_add(sechdrs, strtab, symindex,
> > relsec, me, write);
> > +}
> 
> I really dislike this stuff with the write() function as a parameter.
> We 
> have 'me', it should be enough for the callee to know what to do, see
> my 
> first comment at the top of this email.

I'll rework it.  No love lost, I had to look up function pointer syntax
for this.

Thanks for the feedback.
- Russell

> 
> >   #ifdef CONFIG_DYNAMIC_FTRACE
> >   int module_trampoline_target(struct module *mod, unsigned long
> > addr,
> >                              unsigned long *target)
> > @@ -749,7 +792,7 @@ int module_trampoline_target(struct module
> > *mod, unsigned long addr,
> >         if (copy_from_kernel_nofault(&funcdata, &stub->funcdata,
> >                         sizeof(funcdata))) {
> >                 pr_err("%s: fault reading funcdata for stub %lx for
> > %s\n", __func__, addr, mod->name);
> > -                return -EFAULT;
> > +               return -EFAULT;
> >         }
> >   
> >         *target = stub_func_addr(funcdata);
> > @@ -759,15 +802,23 @@ int module_trampoline_target(struct module
> > *mod, unsigned long addr,
> >   
> >   int module_finalize_ftrace(struct module *mod, const Elf_Shdr
> > *sechdrs)
> >   {
> > +       void *(*write)(void *, const void *, size_t) = memcpy;
> > +       bool early = mod->state == MODULE_STATE_UNFORMED;
> > +
> > +       if (!early)
> > +               write = patch_memory;
> > +
> >         mod->arch.tramp = stub_for_addr(sechdrs,
> >                                         (unsigned
> > long)ftrace_caller,
> >                                         mod,
> > -                                       "ftrace_caller");
> > +                                       "ftrace_caller",
> > +                                       write);
> >   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> >         mod->arch.tramp_regs = stub_for_addr(sechdrs,
> >                                         (unsigned
> > long)ftrace_regs_caller,
> >                                         mod,
> > -                                       "ftrace_regs_caller");
> > +                                       "ftrace_regs_caller",
> > +                                       write);
> >         if (!mod->arch.tramp_regs)
> >                 return -ENOENT;
> >   #endif
> > 
> 
> Christophe

