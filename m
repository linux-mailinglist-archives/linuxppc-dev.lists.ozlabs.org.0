Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06364B0E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 09:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWWWQ3RZ7z3cGr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 19:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=thufXt/C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=thufXt/C;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWWVQ3h8tz3bXW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 19:14:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5A1161355
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41CFC433F2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670919241;
	bh=7xPEbrei0NyX/mGLvOAro3hLbHbX35N6d2BWlufUqBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=thufXt/C2idr1pAvoqvCSS7Tyb9V6MrcxejLJ6Owpg8YjRTMLkozWeZ0oHN5hcx+M
	 9N7mUgPisJrKIDOl4ckrTC0ON3okVhBFPvhfIgpStwedXMfXML3h0gLb8COffeAFYg
	 KscklPw83es5TZpJU2H6NTZWh2/x5NEDggwn1Tv626EO+sICg4TXHDgoFrbr6E0BzJ
	 3VWnGFVE1a8zP2R1CJEMR8j0jq3XpPEAcIF4BSVRtyz/L9w8PoFgFckfpaKQc4DstX
	 Na3lMHiNN3oTi8h7mRtiT/yL8Fx8u0dgAPNDXwA2pvKTyeQLQaveTSl4vGN33YIvqE
	 XMCzKXmijoBhQ==
Received: by mail-ed1-f49.google.com with SMTP id a16so16584813edb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 00:14:01 -0800 (PST)
X-Gm-Message-State: ANoB5pkmUfnNrhqedIgLxHTC/DDKIGPuSY1BRruoJeaOu9RSWtWhzKjP
	9gMVb/A3TR0SA9dM9q9YbmjnTOie1PU/5vcLorI=
X-Google-Smtp-Source: AA0mqf71UOGF6I0rG8JS82bKCoXozbJrtc5xXMM60ai97cWLvWF2mzMa1fOE5BUnFghraHCMUbFT7CZ8Wu/LbCEonGk=
X-Received: by 2002:aa7:cd4d:0:b0:46a:832a:b851 with SMTP id
 v13-20020aa7cd4d000000b0046a832ab851mr58908656edw.127.1670919240038; Tue, 13
 Dec 2022 00:14:00 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
 <Y5Me5dTGv+GznvtO@alley> <CAPhsuW4pt7vfHTj8KorTRCx5zJaoUiyYUOLy8uXZDbTbur4RRA@mail.gmail.com>
 <Y5dg25LV24mBRf4t@alley>
In-Reply-To: <Y5dg25LV24mBRf4t@alley>
From: Song Liu <song@kernel.org>
Date: Tue, 13 Dec 2022 00:13:46 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7y1GzT8+quk4vJEqM6SagqDqc=HXA3jtdmfTfC=Gsv-Q@mail.gmail.com>
Message-ID: <CAPhsuW7y1GzT8+quk4vJEqM6SagqDqc=HXA3jtdmfTfC=Gsv-Q@mail.gmail.com>
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

)() ()On Mon, Dec 12, 2022 at 9:12 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Fri 2022-12-09 11:59:35, Song Liu wrote:
> > On Fri, Dec 9, 2022 at 3:41 AM Petr Mladek <pmladek@suse.com> wrote:
> > > On Mon 2022-11-28 17:57:06, Song Liu wrote:
> > > > On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
> > > > >
> > > > > > --- a/arch/powerpc/kernel/module_64.c
> > > > > > +++ b/arch/powerpc/kernel/module_64.c
> > > > > > +#ifdef CONFIG_LIVEPATCH
> > > > > > +void clear_relocate_add(Elf64_Shdr *sechdrs,
> > > > > > +                    const char *strtab,
> > > > > > +                    unsigned int symindex,
> > > > > > +                    unsigned int relsec,
> > > > > > +                    struct module *me)
> > > > > > +{
>
> [...]
>
> > > > > > +
> > > > > > +             instruction = (u32 *)location;
> > > > > > +             if (is_mprofile_ftrace_call(symname))
> > > > > > +                     continue;
> > >
> > > Why do we ignore these symbols?
> > >
> > > I can't find any counter-part in apply_relocate_add(). It looks super
> > > tricky. It would deserve a comment.
> > >
> > > And I have no idea how we could maintain these exceptions.
> > >
> > > > > > +             if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
> > > > > > +                     continue;
> > >
> > > Same here. It looks super tricky and there is no explanation.
> >
> > The two checks are from restore_r2(). But I cannot really remember
> > why we needed them. It is probably an updated version from an earlier
> > version (3 year earlier..).
>
> This is a good sign that it has to be explained in a comment.
> Or even better, it should not by copy pasted.
>
> > > > > > +             instruction += 1;
> > > > > > +             patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
>
> I believe that this is not enough. apply_relocate_add() does this:
>
> int apply_relocate_add(Elf64_Shdr *sechdrs,
> [...]
>                        struct module *me)
> {
> [...]
>                 case R_PPC_REL24:
>                         /* FIXME: Handle weak symbols here --RR */
>                         if (sym->st_shndx == SHN_UNDEF ||
>                             sym->st_shndx == SHN_LIVEPATCH) {
> [...]
>                         if (!restore_r2(strtab + sym->st_name,
>                                                         (u32 *)location + 1, me))
> [...]                                   return -ENOEXEC;
>
> --->                    if (patch_instruction((u32 *)location, ppc_inst(value)))
>                                 return -EFAULT;
>
> , where restore_r2() does:
>
> static int restore_r2(const char *name, u32 *instruction, struct module *me)
> {
> [...]
>         /* ld r2,R2_STACK_OFFSET(r1) */
> --->    if (patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC)))
>                 return 0;
> [...]
> }
>
> By other words, apply_relocate_add() modifies two instructions:
>
>    + patch_instruction() called in restore_r2() writes into "location + 1"
>    + patch_instruction() called in apply_relocate_add() writes into "location"
>
> IMHO, we have to clear both.
>
> IMHO, we need to implement a function that reverts the changes done
> in restore_r2(). Also we need to revert the changes done in
> apply_relocate_add().

I finally got time to read all the details again and recalled what
happened with the code.

The failure happens when we
1) call apply_relocate_add() on klp load (or module first load,
   if klp was loaded first);
2) do nothing when the module is unloaded;
3) call apply_relocate_add() on module reload, which failed.

The failure happens at this check in restore_r2():

        if (*instruction != PPC_RAW_NOP()) {
                pr_err("%s: Expected nop after call, got %08x at %pS\n",
                        me->name, *instruction, instruction);
                return 0;
        }

Therefore, apply_relocate_add only fails when "location + 1"
is not NOP. And to make it not fail, we only need to write NOP to
"location + 1" in clear_relocate_add().

IIUC, you want clear_relocate_add() to undo everything we did
in apply_relocate_add(); while I was writing clear_relocate_add()
to make the next apply_relocate_add() not fail.

I agree that, based on the name, clear_relocate_add() should
undo everything by apply_relocate_add(). But I am not sure how
to handle some cases. For example, how do we undo

                case R_PPC64_ADDR32:
                        /* Simply set it */
                        *(u32 *)location = value;
                       break;

Shall we just write zeros? I don't think this matters.

I think this is the question we should answer first:
What shall clear_relocate_add() do?
1) undo everything by apply_relocate_add();
2) only do things needed to make the next
   apply_relocate_add succeed;
3) something between 1) and 2).

WDYT?

Thanks,
Song

>
> Please, avoid code duplication as much as possible. Especially,
> the two checks is_mprofile_ftrace_call() and
> instr_is_relative_link_branch() must be shared. IMHO, it is
> the only way to keep the code maintainable. We must make sure that
> we will clear the instructions only when they were patched. And
> copy pasting various tricky exceptions is a way to hell.
>
>
> > > int update_relocate_add(Elf64_Shdr *sechdrs,
> > >                        const char *strtab,
> > >                        unsigned int symindex,
> > >                        unsigned int relsec,
> > >                        struct module *me,
> > >                        bool apply)
> > > {
> > >         unsigned int i;
> > >         Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
> > >         Elf64_Sym *sym;
> > >         Elf64_Xword r_type;
> > >         unsigned long *location;
> > >
> > >         if (apply) {
> > >                 pr_debug("Applying ADD relocate section %u to %u\n", relsec,
> > >                        sechdrs[relsec].sh_info);
> > >         } else {
> > >                 pr_debug("Clearing ADD relocate section %u\n", relsec");
> > >         }
> > >
> > >         for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
> > >                 /* This is where to make the change */
> > >                 location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
> > >                         + rela[i].r_offset;
> > >                 /* This is the symbol it is referring to */
> > >                 sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
> > >                         + ELF64_R_SYM(rela[i].r_info);
> > >
> > >                 r_type = ELF64_R_TYPE(rela[i].r_info);
> > >
> > >                 if (apply) {
> > >                         apply_relocate_location(sym, location, r_type, rela[i].r_addend);
> > >                 } else {
> > >                         clear_relocate_location(sym, location, r_type);
> > >                 }
> >
> > I personally don't like too many "if (apply) {...} else {...}" patterns in
> > a function. And these new functions confuse me sometimes:
> >
> >     update_relocate_add(..., apply);
> >     apply_relocate_location();
> >     clear_relocate_location();
>
> Feel free to come up with another way how to avoid code duplication.
>
> > And I did think there wasn't too much duplicated code.
>
> I think that it looks very different when you are writing or reading
> or mantainting the code. It might be easier to write code and modify
> it. It is more complicated to find the differences later. Also it is
> more complicated to do the same changes many times when the common
> code is updated later.
>
> Best Regards,
> Petr
