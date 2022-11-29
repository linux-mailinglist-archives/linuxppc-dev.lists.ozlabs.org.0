Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA7F63B77F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 02:58:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLlqB1NZwz3f24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 12:58:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bd+lP5H1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bd+lP5H1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLlpC6Fthz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 12:57:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83EFA6152B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4430C433B5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669687039;
	bh=RR3l04y9mI6dUbLc2VgWj7KfTEgIhi84deXgt2t8g8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bd+lP5H1ZonmaSTZAWSB4ReBy/DwkSVI6jWbHxgQNxSC0w50c7lnODTIzXYBDcQ7T
	 T/leNw/QTL63YtLQZJH5c7X1so28BCgBWNFj/MQZumtFY3gyHxM4YetPzhsywvdRi7
	 tUNZHknN83zWD+y6usiSTBnr+EnDPBwqk/Ma0ceVx9v0NZKHiy1aHROHSUylmyvXFu
	 rO16hrXiYEchzTaTLbhGQi0lCNRuXMwRi02q0jWAZe5T8hvKeMhQhtLz9+2Kx2w1VQ
	 nEvX3wGqHOhlgDslSPmGjDRBjjo2mh4lmP2aIOTQRpsfxxcMygRxhZA4sz8fDCwCc7
	 BErs3piClv6iw==
Received: by mail-ej1-f52.google.com with SMTP id b2so14087037eja.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 17:57:19 -0800 (PST)
X-Gm-Message-State: ANoB5pmH3ynSOAdzkZ6VR3Ci+xnx4yg3NwQmlbTK9X1HrQMCtKyZNzfz
	S380x/dN3AnHwpiNagWyFAmTx3MDC+ZBIcFDsRg=
X-Google-Smtp-Source: AA0mqf7QPwy/gfx9+IQQdiRZ+nRvnL+Bi5qWVedX/jzBfS+m5qi3GdnOmGsm1gidpRnJ5G9t/0ENmzcMuZIq+IlBP8s=
X-Received: by 2002:a17:906:3954:b0:7bf:852b:e23c with SMTP id
 g20-20020a170906395400b007bf852be23cmr7332813eje.614.1669687038069; Mon, 28
 Nov 2022 17:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <Y3expGRt4cPoZgHL@alley>
In-Reply-To: <Y3expGRt4cPoZgHL@alley>
From: Song Liu <song@kernel.org>
Date: Mon, 28 Nov 2022 17:57:06 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
Message-ID: <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module removal
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
Cc: jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
>
[...]

> >
> > +#ifdef CONFIG_LIVEPATCH
> > +void clear_relocate_add(Elf64_Shdr *sechdrs,
> > +                    const char *strtab,
> > +                    unsigned int symindex,
> > +                    unsigned int relsec,
> > +                    struct module *me)
> > +{
> > +     unsigned int i;
> > +     Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
> > +     Elf64_Sym *sym;
> > +     unsigned long *location;
> > +     const char *symname;
> > +     u32 *instruction;
> > +
> > +     pr_debug("Clearing ADD relocate section %u to %u\n", relsec,
> > +              sechdrs[relsec].sh_info);
> > +
> > +     for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
> > +             location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
> > +                     + rela[i].r_offset;
> > +             sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
> > +                     + ELF64_R_SYM(rela[i].r_info);
> > +             symname = me->core_kallsyms.strtab
> > +                     + sym->st_name;
> > +
> > +             if (ELF64_R_TYPE(rela[i].r_info) != R_PPC_REL24)
> > +                     continue;
> > +             /*
> > +              * reverse the operations in apply_relocate_add() for case
> > +              * R_PPC_REL24.
> > +              */
> > +             if (sym->st_shndx != SHN_UNDEF &&
> > +                 sym->st_shndx != SHN_LIVEPATCH)
> > +                     continue;
> > +
> > +             instruction = (u32 *)location;
> > +             if (is_mprofile_ftrace_call(symname))
> > +                     continue;
> > +
> > +             if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
> > +                     continue;
> > +
> > +             instruction += 1;
> > +             patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
> > +     }
> > +
> > +}
>
> This looks like a lot of duplicated code. Isn't it?

TBH, I think the duplicated code is not really bad.

apply_relocate_add() is a much more complicated function, I would
rather not mess it up to make this function a little simpler.

[...]

>
> This duplicates a lot of code. Please, rename apply_relocate_add() the
> same way as __apply_clear_relocate_add() and add the "apply" parameter.
> Then add the wrappers for this:
>
> int write_relocate_add(Elf64_Shdr *sechdrs,
>                        const char *strtab,
>                        unsigned int symindex,
>                        unsigned int relsec,
>                        struct module *me,
>                        bool apply)
> {
>         int ret;
>         bool early = me->state == MODULE_STATE_UNFORMED;
>         void *(*write)(void *, const void *, size_t) = memcpy;
>
>         if (!early) {
>                 write = text_poke;
>                 mutex_lock(&text_mutex);
>         }

How about we move the "early" logic into __write_relocate_add()?

>
>         ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
>                                          write, apply);
>
>         if (!early) {
>                 text_poke_sync();
>                 mutex_unlock(&text_mutex);
>         }
>
>         return ret;
> }
>
> int apply_relocate_add(Elf64_Shdr *sechdrs,
>                        const char *strtab,
>                        unsigned int symindex,
>                        unsigned int relsec,
>                        struct module *me)
> {
>         return write_relocate_add(sechdrs, strtab, symindex, relsec, me, true);

Then we just call __write_relocate_add() from here...

> }
>
> #ifdef CONFIG_LIVEPATCH
> void apply_relocate_add(Elf64_Shdr *sechdrs,
>                         const char *strtab,
>                         unsigned int symindex,
>                         unsigned int relsec,
>                         struct module *me)
> {
>         write_relocate_add(sechdrs, strtab, symindex, relsec, me, false);

and here.


> }
> #endif
>
>
> > +#endif
> > +
> >  #endif
> >
> >  int module_finalize(const Elf_Ehdr *hdr,
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -316,6 +316,45 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
> >       return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
> >  }
> >
> > +static void klp_clear_object_relocations(struct module *pmod,
> > +                                     struct klp_object *obj)
> > +{
> > +     int i, cnt;
> > +     const char *objname, *secname;
> > +     char sec_objname[MODULE_NAME_LEN];
> > +     Elf_Shdr *sec;
> > +
> > +     objname = klp_is_module(obj) ? obj->name : "vmlinux";
> > +
> > +     /* For each klp relocation section */
> > +     for (i = 1; i < pmod->klp_info->hdr.e_shnum; i++) {
> > +             sec = pmod->klp_info->sechdrs + i;
> > +             secname = pmod->klp_info->secstrings + sec->sh_name;
> > +             if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
> > +                     continue;
> > +
> > +             /*
> > +              * Format: .klp.rela.sec_objname.section_name
> > +              * See comment in klp_resolve_symbols() for an explanation
> > +              * of the selected field width value.
> > +              */
> > +             secname = pmod->klp_info->secstrings + sec->sh_name;
> > +             cnt = sscanf(secname, ".klp.rela.%55[^.]", sec_objname);
> > +             if (cnt != 1) {
> > +                     pr_err("section %s has an incorrectly formatted name\n",
> > +                            secname);
> > +                     continue;
> > +             }

Actually, I think we don't need the cnt check here. Once it is removed,
there isn't much duplicated logic.

> > +
> > +             if (strcmp(objname, sec_objname))
> > +                     continue;
> > +
> > +             clear_relocate_add(pmod->klp_info->sechdrs,
> > +                                pmod->core_kallsyms.strtab,
> > +                                pmod->klp_info->symndx, i, pmod);
> > +     }
> > +}
>
> Huh, this duplicates a lot of tricky code.
>
> It is even worse because this squashed code from two functions
> klp_apply_section_relocs() and klp_apply_object_relocs()
> into a single function. As a result, the code duplication is not
> even obvious.
>
> Also the suffix "_reloacations() does not match the suffix of
> the related funciton:
>
>         + klp_apply_object_relocs()             (existing)
>         + klp_clear_object_relocations()        (new)
>
> This all would complicate maintenance of the code.
>
> Please, implement a common:
>
> int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
>                              const char *shstrtab, const char *strtab,
>                              unsigned int symndx, unsigned int secndx,
>                              const char *objname, bool apply);
>
> and
>
> int klp_write_object_relocs(struct klp_patch *patch,
>                             struct klp_object *obj,
>                             bool apply);
>
> and add the respective wrappers:
>
> int klp_apply_section_relocs();   /* also needed in module/main.c */
> int klp_apply_object_relocs();
> void klp_clear_object_relocs();

With the above simplification (removing cnt check), do we still need
all these wrappers? Personally, I think they will make the code more
difficult to follow..

Thanks,
Song
