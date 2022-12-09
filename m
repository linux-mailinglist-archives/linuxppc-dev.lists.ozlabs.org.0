Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A26481E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 12:42:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NT8Jg3BMhz3bgd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 22:42:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=V1GJBCPD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=V1GJBCPD;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT8Hj4BMcz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 22:41:36 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id B335B2012E;
	Fri,  9 Dec 2022 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670586086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q/V5k+xtXXGmytm1ASxvItnbc20EM4KwcKJPRFAp5ZE=;
	b=V1GJBCPD24UtbXPCbQiXwNWkX6ps3vdquy6d5xd5X/us2FZv9LwQ9A7/4ScePImGH0Cu1g
	COpnjxaJ/ombeA/OX9GE2qpcx5+bgMHfxZPUhClbZwaJyayqjm/+Gj5h0SaNz9Uq1quPNk
	v8FjQnANAiCzJ9G5pbefY26p7iVjoIo=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0127E2C141;
	Fri,  9 Dec 2022 11:41:25 +0000 (UTC)
Date: Fri, 9 Dec 2022 12:41:25 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Subject: powerpc-part: was: Re: [PATCH v6] livepatch: Clear relocation
 targets on a module removal
Message-ID: <Y5Me5dTGv+GznvtO@alley>
References: <20220901171252.2148348-1-song@kernel.org>
 <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
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
Cc: jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

this reply is only about the powerpc-specific part.

Also adding Kamalesh and Michael into Cc who worked on the related
commit a443bf6e8a7674b86221f49 ("powerpc/modules: Add REL24 relocation
support of livepatch symbols").


On Mon 2022-11-28 17:57:06, Song Liu wrote:
> On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > > --- a/arch/powerpc/kernel/module_64.c
> > > +++ b/arch/powerpc/kernel/module_64.c

I put back the name of the modified file so that it is easier
to know what changes we are talking about.

[...]
> > > +#ifdef CONFIG_LIVEPATCH
> > > +void clear_relocate_add(Elf64_Shdr *sechdrs,
> > > +                    const char *strtab,
> > > +                    unsigned int symindex,
> > > +                    unsigned int relsec,
> > > +                    struct module *me)
> > > +{
> > > +     unsigned int i;
> > > +     Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
> > > +     Elf64_Sym *sym;
> > > +     unsigned long *location;
> > > +     const char *symname;
> > > +     u32 *instruction;
> > > +
> > > +     pr_debug("Clearing ADD relocate section %u to %u\n", relsec,
> > > +              sechdrs[relsec].sh_info);
> > > +
> > > +     for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
> > > +             location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
> > > +                     + rela[i].r_offset;
> > > +             sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
> > > +                     + ELF64_R_SYM(rela[i].r_info);
> > > +             symname = me->core_kallsyms.strtab
> > > +                     + sym->st_name;

The above calculation is quite complex. It seems to be copied from
apply_relocate_add(). If I maintained this code I would want to avoid
the duplication. definitely.


> > > +
> > > +             if (ELF64_R_TYPE(rela[i].r_info) != R_PPC_REL24)
> > > +                     continue;

Why are we interested only into R_PPC_REL24 relocation types, please?

The code for generating the special SHN_LIVEPATCH section is not in
the mainline so it is not well defined.

I guess that R_PPC_REL24 relocation type is used by kPatch. Are we
sure that other relocation types wont be needed?

Anyway, we must warn when an unsupported type is used in SHN_LIVEPATCH
section here.


> > > +             /*
> > > +              * reverse the operations in apply_relocate_add() for case
> > > +              * R_PPC_REL24.
> > > +              */
> > > +             if (sym->st_shndx != SHN_UNDEF &&

Do we want to handle SHN_UNDEF symbols here?

The commit a443bf6e8a7674b86221f49 ("powerpc/modules: Add REL24
relocation support of livepatch symbols") explains that
R_PPC_REL24 relocations in SHN_LIVEPATCH section are handled
__like__ relocations in SHN_UNDEF sections.

My understanding is that R_PPC_REL24 reallocation type has
two variants. Where the variant used in SHN_UNDEF and
SHN_LIVEPATCH sections need some preprocessing.

Anyway, if this function is livepatch-specific that we should
clear only symbols from SHN_LIVEPATCH sections. I mean that
we should probably ignore SHN_UNDEF here.

> > > +                 sym->st_shndx != SHN_LIVEPATCH)
> > > +                     continue;
> > > +
> > > +
> > > +             instruction = (u32 *)location;
> > > +             if (is_mprofile_ftrace_call(symname))
> > > +                     continue;

Why do we ignore these symbols?

I can't find any counter-part in apply_relocate_add(). It looks super
tricky. It would deserve a comment.

And I have no idea how we could maintain these exceptions.

> > > +             if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
> > > +                     continue;

Same here. It looks super tricky and there is no explanation.

> > > +             instruction += 1;
> > > +             patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
> > > +     }
> > > +
> > > +}
> >
> > This looks like a lot of duplicated code. Isn't it?
> 
> TBH, I think the duplicated code is not really bad.

How exactly do you mean it, please?

Do you think that the amount of duplicated code is small enough?
Or that the new function looks better that updating the existing one?

> apply_relocate_add() is a much more complicated function, I would
> rather not mess it up to make this function a little simpler.

IMHO, the duplicated code is quite tricky. And if we really do
not need to clear all relocation types then we could avoid
the duplication another way, for example:

int update_relocate_add(Elf64_Shdr *sechdrs,
		       const char *strtab,
		       unsigned int symindex,
		       unsigned int relsec,
		       struct module *me,
		       bool apply)
{
	unsigned int i;
	Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
	Elf64_Sym *sym;
	Elf64_Xword r_type;
	unsigned long *location;

	if (apply) {
		pr_debug("Applying ADD relocate section %u to %u\n", relsec,
		       sechdrs[relsec].sh_info);
	} else {
		pr_debug("Clearing ADD relocate section %u\n", relsec");
	}

	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
		/* This is where to make the change */
		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
			+ rela[i].r_offset;
		/* This is the symbol it is referring to */
		sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
			+ ELF64_R_SYM(rela[i].r_info);

		r_type = ELF64_R_TYPE(rela[i].r_info);

		if (apply) {
			apply_relocate_location(sym, location, r_type, rela[i].r_addend);
		} else {
			clear_relocate_location(sym, location, r_type);
		}
	}
}

where the two functions would implement the r_type-specific stuff.
It would remove a lot of duplicated code. Wouldn't?

My main concern is how to maintain this code. I am afraid that
if it is in #ifdef CONFIG_LIVEPATCH section than nobody would
update it when doing some changes in apply_relocate_add().

In this case, the livepatch-specific code has to be minimal,
warn about unsupported scenarios, and livepatch maintainers
should understand what is going on there.

Best Regards,
Petr
