Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8406464895B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 21:00:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTMMg3GZSz3bhY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 07:00:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ei1w6rkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ei1w6rkT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTMLh5pxGz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Dec 2022 06:59:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9CDFFB82907
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 19:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8B4C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670615989;
	bh=2pRNCKcx+i/2M8U3jcMWgUdti6tr4GG5KNF2eAQP4h8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ei1w6rkTpoCOrZByMzmU6oIfniP14jEO8wLveqCL6uOOKGPG61lzBU5/Rg0SUqUgR
	 u1qW21EICqdTdAPTK9WyXLAsiX2hTbL7mXnK1vzltmrh2DIqKqQ+xrf5wkkxY9G0KV
	 6dLdpu8BxyYjNU3Ok1bQ9QJxpOr24FZVs8KaO7FLQnPqEHl81P+pSLv+WVmL80RUX5
	 RpEdShAcfiIPdK2frOOnG6rAPXS7Y+Po2ApOgHNYw1wncxs1osFKAhimvD1kA02usj
	 Af9R8zL32ZhOJiZXpZZ5Trk4o+KVFAQwEC6TvSnh8UflJc36F+kG9TArF5cw1yMiQP
	 5yRRp9t+P0zcA==
Received: by mail-ej1-f42.google.com with SMTP id vp12so13926313ejc.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Dec 2022 11:59:49 -0800 (PST)
X-Gm-Message-State: ANoB5pkmJHg7xrkMfBGqgGmndipUfgNl6Be/mCFV+VYDH0tOzz7IuM0E
	fuyEiL9Mwzyg/KU/89wIkxceA47qylUB1+WxGpo=
X-Google-Smtp-Source: AA0mqf5N+MHdzv0AWM6a+1eLCTIN06JvpjHTPV3WoGK/6sQfl/2nPDCMAb9CxcqMvxTa/B7fVazmmSShMdXYy+kJ+gk=
X-Received: by 2002:a17:906:a198:b0:7b4:bc42:3b44 with SMTP id
 s24-20020a170906a19800b007b4bc423b44mr73801661ejy.101.1670615988052; Fri, 09
 Dec 2022 11:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com> <Y5Me5dTGv+GznvtO@alley>
In-Reply-To: <Y5Me5dTGv+GznvtO@alley>
From: Song Liu <song@kernel.org>
Date: Fri, 9 Dec 2022 11:59:35 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4pt7vfHTj8KorTRCx5zJaoUiyYUOLy8uXZDbTbur4RRA@mail.gmail.com>
Message-ID: <CAPhsuW4pt7vfHTj8KorTRCx5zJaoUiyYUOLy8uXZDbTbur4RRA@mail.gmail.com>
Subject: Re: powerpc-part: was: Re: [PATCH v6] livepatch: Clear relocation
 targets on a module removal
To: Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Dec 9, 2022 at 3:41 AM Petr Mladek <pmladek@suse.com> wrote:
>
> Hi,
>
> this reply is only about the powerpc-specific part.
>
> Also adding Kamalesh and Michael into Cc who worked on the related
> commit a443bf6e8a7674b86221f49 ("powerpc/modules: Add REL24 relocation
> support of livepatch symbols").
>
>
> On Mon 2022-11-28 17:57:06, Song Liu wrote:
> > On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
> > >
> > > > --- a/arch/powerpc/kernel/module_64.c
> > > > +++ b/arch/powerpc/kernel/module_64.c
>
> I put back the name of the modified file so that it is easier
> to know what changes we are talking about.
>
> [...]
> > > > +#ifdef CONFIG_LIVEPATCH
> > > > +void clear_relocate_add(Elf64_Shdr *sechdrs,
> > > > +                    const char *strtab,
> > > > +                    unsigned int symindex,
> > > > +                    unsigned int relsec,
> > > > +                    struct module *me)
> > > > +{
> > > > +     unsigned int i;
> > > > +     Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
> > > > +     Elf64_Sym *sym;
> > > > +     unsigned long *location;
> > > > +     const char *symname;
> > > > +     u32 *instruction;
> > > > +
> > > > +     pr_debug("Clearing ADD relocate section %u to %u\n", relsec,
> > > > +              sechdrs[relsec].sh_info);
> > > > +
> > > > +     for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
> > > > +             location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
> > > > +                     + rela[i].r_offset;
> > > > +             sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
> > > > +                     + ELF64_R_SYM(rela[i].r_info);
> > > > +             symname = me->core_kallsyms.strtab
> > > > +                     + sym->st_name;
>
> The above calculation is quite complex. It seems to be copied from
> apply_relocate_add(). If I maintained this code I would want to avoid
> the duplication. definitely.
>
>
> > > > +
> > > > +             if (ELF64_R_TYPE(rela[i].r_info) != R_PPC_REL24)
> > > > +                     continue;
>
> Why are we interested only into R_PPC_REL24 relocation types, please?
>
> The code for generating the special SHN_LIVEPATCH section is not in
> the mainline so it is not well defined.
>
> I guess that R_PPC_REL24 relocation type is used by kPatch. Are we
> sure that other relocation types wont be needed?
>
> Anyway, we must warn when an unsupported type is used in SHN_LIVEPATCH
> section here.
>
>
> > > > +             /*
> > > > +              * reverse the operations in apply_relocate_add() for case
> > > > +              * R_PPC_REL24.
> > > > +              */
> > > > +             if (sym->st_shndx != SHN_UNDEF &&
>
> Do we want to handle SHN_UNDEF symbols here?
>
> The commit a443bf6e8a7674b86221f49 ("powerpc/modules: Add REL24
> relocation support of livepatch symbols") explains that
> R_PPC_REL24 relocations in SHN_LIVEPATCH section are handled
> __like__ relocations in SHN_UNDEF sections.
>
> My understanding is that R_PPC_REL24 reallocation type has
> two variants. Where the variant used in SHN_UNDEF and
> SHN_LIVEPATCH sections need some preprocessing.
>
> Anyway, if this function is livepatch-specific that we should
> clear only symbols from SHN_LIVEPATCH sections. I mean that
> we should probably ignore SHN_UNDEF here.
>
> > > > +                 sym->st_shndx != SHN_LIVEPATCH)
> > > > +                     continue;
> > > > +
> > > > +
> > > > +             instruction = (u32 *)location;
> > > > +             if (is_mprofile_ftrace_call(symname))
> > > > +                     continue;
>
> Why do we ignore these symbols?
>
> I can't find any counter-part in apply_relocate_add(). It looks super
> tricky. It would deserve a comment.
>
> And I have no idea how we could maintain these exceptions.
>
> > > > +             if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
> > > > +                     continue;
>
> Same here. It looks super tricky and there is no explanation.

The two checks are from restore_r2(). But I cannot really remember
why we needed them. It is probably an updated version from an earlier
version (3 year earlier..).

>
> > > > +             instruction += 1;
> > > > +             patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
> > > > +     }
> > > > +
> > > > +}
> > >
> > > This looks like a lot of duplicated code. Isn't it?
> >
> > TBH, I think the duplicated code is not really bad.
>
> How exactly do you mean it, please?
>
> Do you think that the amount of duplicated code is small enough?
> Or that the new function looks better that updating the existing one?
>
> > apply_relocate_add() is a much more complicated function, I would
> > rather not mess it up to make this function a little simpler.
>
> IMHO, the duplicated code is quite tricky. And if we really do
> not need to clear all relocation types then we could avoid
> the duplication another way, for example:
>
> int update_relocate_add(Elf64_Shdr *sechdrs,
>                        const char *strtab,
>                        unsigned int symindex,
>                        unsigned int relsec,
>                        struct module *me,
>                        bool apply)
> {
>         unsigned int i;
>         Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
>         Elf64_Sym *sym;
>         Elf64_Xword r_type;
>         unsigned long *location;
>
>         if (apply) {
>                 pr_debug("Applying ADD relocate section %u to %u\n", relsec,
>                        sechdrs[relsec].sh_info);
>         } else {
>                 pr_debug("Clearing ADD relocate section %u\n", relsec");
>         }
>
>         for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
>                 /* This is where to make the change */
>                 location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
>                         + rela[i].r_offset;
>                 /* This is the symbol it is referring to */
>                 sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
>                         + ELF64_R_SYM(rela[i].r_info);
>
>                 r_type = ELF64_R_TYPE(rela[i].r_info);
>
>                 if (apply) {
>                         apply_relocate_location(sym, location, r_type, rela[i].r_addend);
>                 } else {
>                         clear_relocate_location(sym, location, r_type);
>                 }

I personally don't like too many "if (apply) {...} else {...}" patterns in
a function. And these new functions confuse me sometimes:

    update_relocate_add(..., apply);
    apply_relocate_location();
    clear_relocate_location();

And I did think there wasn't too much duplicated code.

I know this is very personal. And I can understand your preference.
I can make the code to remove more duplicated code. But I guess
I need a better understanding of powerpc logic..

Thanks,
Song
