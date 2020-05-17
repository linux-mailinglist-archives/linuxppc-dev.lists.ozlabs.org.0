Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A621D6773
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 12:46:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PzMj5395zDqcj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 20:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DuvlEidJ; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PzL65Hf0zDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 20:44:44 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id 72so5642423otu.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F/xGWdJXIliFw+TSkU13nV5MMpTm7HVgYwZHnuQlv7A=;
 b=DuvlEidJ8WT2UtAQq7WP5eqeaH/ZfZfFDR2Ll6c8Xq3RNGwAduWOX0MzJqxgBY64aK
 UGdDpWRG3jNwr9LXeqBdRa/CXcRotrnWwGk5/I9zAOid8FGdPnQvgKqFMHAixrIY6J9Y
 D1EJrbqXQv7CobK497pPOYLmaFuvm0dKn7bDXEkEbO4m7jXI0260A5rBue/quLzg8DlG
 0Dyd9dzvP0nlDbo5D+MpHG2BECFwmmgfhQuAJ1nyIr64SpP5wmkf52Shy7m3nmJlVXbB
 AsG0+6e7NHVQnc63BXBWd2abfURL8V0qihw828p+I4FQDShNc7OBWGpq4RxaVBQCj6G7
 rrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F/xGWdJXIliFw+TSkU13nV5MMpTm7HVgYwZHnuQlv7A=;
 b=P9sx+KnXFuEjeCj3qUS9HEjBkN0e0ylBsz6TD9kvOyCg9F3TGJHaHkkIsKsHVrsKW9
 y3dPV/edZKpKgHYuiYmw0294w5PBkRehNpS3AL2Ml1W/KtwWLMhgFJEabarU5vNVO0iN
 oOuNLW4g99ou6tVRS09wnQaDQ2sy8dbjUDP9Uybp3XVN0nCBcLbZxRuQzYpI2M2T2NwN
 6P07F+paTIpSBiXUQWohzJOewFKXqyWuwFTGFTem9hpWMQZORD7xwOFY504ED2JIkUsZ
 a6M6ChLb+feXT9tFj6WkLSK7ZzSPFvwu2rjS3MsyMYEy98Ll9kx8POg5V6Nk6CHpRQeK
 b4Vg==
X-Gm-Message-State: AOAM531o3CkvAvyChA0kGECsugtklsckYojQ9GILWNdkHE7hfDqbusjd
 dF24nYXgxbe6hycMdnkOl1y2i1AgYesnrqKGiwRsbffnaw4=
X-Google-Smtp-Source: ABdhPJw0z4l6fpgM7LXHv+Aa+LyxvQvVej+/oNOw2SnjZLfrOBiQyxtW8vw3gUD1zPPpMyPiwoyX4grOoDawgqFLq5E=
X-Received: by 2002:a9d:220c:: with SMTP id o12mr898013ota.155.1589712280724; 
 Sun, 17 May 2020 03:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-13-jniethe5@gmail.com>
 <a7005edf-cdda-4aec-b7b0-fd9f45776147@csgroup.eu>
In-Reply-To: <a7005edf-cdda-4aec-b7b0-fd9f45776147@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sun, 17 May 2020 20:44:29 +1000
Message-ID: <CACzsE9qBXBsv0s25DWugjWUaTUZfYpHyONW5ryE4dnLKP5P7cA@mail.gmail.com>
Subject: Re: [PATCH v8 12/30] powerpc: Use a function for reading instructions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 17, 2020 at 4:39 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 06/05/2020 =C3=A0 05:40, Jordan Niethe a =C3=A9crit :
> > Prefixed instructions will mean there are instructions of different
> > length. As a result dereferencing a pointer to an instruction will not
> > necessarily give the desired result. Introduce a function for reading
> > instructions from memory into the instruction data type.
>
>
> Shouldn't this function be used in mmu_patch_addis() in mm/nohash/8xx.c ?
>
> Christophe
Yes, that would be a good idea. mpe here is a fix, along with one I'll
post for [PATCH v8 11/30] powerpc: Use a datatype for instructions.

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -98,7 +98,7 @@ static void mmu_patch_cmp_limit(s32 *site, unsigned
long mapped)

 static void mmu_patch_addis(s32 *site, long simm)
 {
-    struct ppc_inst instr =3D *(struct ppc_inst *)patch_site_addr(site);
+    struct ppc_inst instr =3D ppc_inst_read((struct ppc_inst
*)patch_site_addr(site));
     unsigned int val =3D ppc_inst_val(instr);

     val &=3D 0xffff0000;
--=20
>
> >
> > Reviewed-by: Alistair Popple <alistair@popple.id.au>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > v5: - Rename read_inst() -> probe_kernel_read_inst()
> >      - No longer modify uprobe probe type in this patch
> > v6: - feature-fixups.c: do_final_fixups(): Use here
> >      - arch_prepare_kprobe(): patch_instruction(): no longer part of th=
is
> >        patch
> >      - Move probe_kernel_read_inst() out of this patch
> >      - Use in uprobes
> > v8: style
> > ---
> >   arch/powerpc/include/asm/inst.h    |  5 +++++
> >   arch/powerpc/kernel/kprobes.c      |  6 +++---
> >   arch/powerpc/kernel/mce_power.c    |  2 +-
> >   arch/powerpc/kernel/optprobes.c    |  4 ++--
> >   arch/powerpc/kernel/trace/ftrace.c |  4 ++--
> >   arch/powerpc/kernel/uprobes.c      |  2 +-
> >   arch/powerpc/lib/code-patching.c   | 26 ++++++++++++++------------
> >   arch/powerpc/lib/feature-fixups.c  |  4 ++--
> >   arch/powerpc/xmon/xmon.c           |  6 +++---
> >   9 files changed, 33 insertions(+), 26 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm=
/inst.h
> > index 19d8bb7a1c2b..552e953bf04f 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -27,6 +27,11 @@ static inline struct ppc_inst ppc_inst_swab(struct p=
pc_inst x)
> >       return ppc_inst(swab32(ppc_inst_val(x)));
> >   }
> >
> > +static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr=
)
> > +{
> > +     return *ptr;
> > +}
> > +
> >   static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst =
y)
> >   {
> >       return ppc_inst_val(x) =3D=3D ppc_inst_val(y);
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobe=
s.c
> > index a08ae5803622..f64312dca84f 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -106,7 +106,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *nam=
e, unsigned int offset)
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> >       int ret =3D 0;
> > -     struct ppc_inst insn =3D *(struct ppc_inst *)p->addr;
> > +     struct ppc_inst insn =3D ppc_inst_read((struct ppc_inst *)p->addr=
);
> >
> >       if ((unsigned long)p->addr & 0x03) {
> >               printk("Attempt to register kprobe at an unaligned addres=
s\n");
> > @@ -127,7 +127,7 @@ int arch_prepare_kprobe(struct kprobe *p)
> >       if (!ret) {
> >               memcpy(p->ainsn.insn, p->addr,
> >                               MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
> > -             p->opcode =3D *p->addr;
> > +             p->opcode =3D ppc_inst_val(insn);
> >               flush_icache_range((unsigned long)p->ainsn.insn,
> >                       (unsigned long)p->ainsn.insn + sizeof(kprobe_opco=
de_t));
> >       }
> > @@ -217,7 +217,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
> >   static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
> >   {
> >       int ret;
> > -     struct ppc_inst insn =3D *(struct ppc_inst *)p->ainsn.insn;
> > +     struct ppc_inst insn =3D ppc_inst_read((struct ppc_inst *)p->ains=
n.insn);
> >
> >       /* regs->nip is also adjusted if emulate_step returns 1 */
> >       ret =3D emulate_step(regs, insn);
> > diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_=
power.c
> > index cd23218c60bb..45c51ba0071b 100644
> > --- a/arch/powerpc/kernel/mce_power.c
> > +++ b/arch/powerpc/kernel/mce_power.c
> > @@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_reg=
s *regs, uint64_t *addr,
> >       pfn =3D addr_to_pfn(regs, regs->nip);
> >       if (pfn !=3D ULONG_MAX) {
> >               instr_addr =3D (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_M=
ASK);
> > -             instr =3D *(struct ppc_inst *)(instr_addr);
> > +             instr =3D ppc_inst_read((struct ppc_inst *)instr_addr);
> >               if (!analyse_instr(&op, &tmp, instr)) {
> >                       pfn =3D addr_to_pfn(regs, op.ea);
> >                       *addr =3D op.ea;
> > diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optp=
robes.c
> > index 5a71fef71c22..52c1ab3f85aa 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -100,9 +100,9 @@ static unsigned long can_optimize(struct kprobe *p)
> >        * Ensure that the instruction is not a conditional branch,
> >        * and that can be emulated.
> >        */
> > -     if (!is_conditional_branch(*(struct ppc_inst *)p->ainsn.insn) &&
> > +     if (!is_conditional_branch(ppc_inst_read((struct ppc_inst *)p->ai=
nsn.insn)) &&
> >           analyse_instr(&op, &regs,
> > -                       *(struct ppc_inst *)p->ainsn.insn) =3D=3D 1) {
> > +                       ppc_inst_read((struct ppc_inst *)p->ainsn.insn)=
) =3D=3D 1) {
> >               emulate_update_regs(&regs, &op);
> >               nip =3D regs.nip;
> >       }
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/t=
race/ftrace.c
> > index 3117ed675735..acd5b889815f 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -848,7 +848,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
> >       struct ppc_inst old, new;
> >       int ret;
> >
> > -     old =3D *(struct ppc_inst *)&ftrace_call;
> > +     old =3D ppc_inst_read((struct ppc_inst *)&ftrace_call);
> >       new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
> >       ret =3D ftrace_modify_code(ip, old, new);
> >
> > @@ -856,7 +856,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
> >       /* Also update the regs callback function */
> >       if (!ret) {
> >               ip =3D (unsigned long)(&ftrace_regs_call);
> > -             old =3D *(struct ppc_inst *)&ftrace_regs_call;
> > +             old =3D ppc_inst_read((struct ppc_inst *)&ftrace_regs_cal=
l);
> >               new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
> >               ret =3D ftrace_modify_code(ip, old, new);
> >       }
> > diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobe=
s.c
> > index 31c870287f2b..6893d40a48c5 100644
> > --- a/arch/powerpc/kernel/uprobes.c
> > +++ b/arch/powerpc/kernel/uprobes.c
> > @@ -174,7 +174,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *aup=
robe, struct pt_regs *regs)
> >        * emulate_step() returns 1 if the insn was successfully emulated=
.
> >        * For all other cases, we need to single-step in hardware.
> >        */
> > -     ret =3D emulate_step(regs, auprobe->insn);
> > +     ret =3D emulate_step(regs, ppc_inst_read(&auprobe->insn));
> >       if (ret > 0)
> >               return true;
> >
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 1dff9d9d6645..435fc8e9f45d 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -348,9 +348,9 @@ static unsigned long branch_bform_target(const stru=
ct ppc_inst *instr)
> >
> >   unsigned long branch_target(const struct ppc_inst *instr)
> >   {
> > -     if (instr_is_branch_iform(*instr))
> > +     if (instr_is_branch_iform(ppc_inst_read(instr)))
> >               return branch_iform_target(instr);
> > -     else if (instr_is_branch_bform(*instr))
> > +     else if (instr_is_branch_bform(ppc_inst_read(instr)))
> >               return branch_bform_target(instr);
> >
> >       return 0;
> > @@ -358,7 +358,8 @@ unsigned long branch_target(const struct ppc_inst *=
instr)
> >
> >   int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned lo=
ng addr)
> >   {
> > -     if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr=
))
> > +     if (instr_is_branch_iform(ppc_inst_read(instr)) ||
> > +         instr_is_branch_bform(ppc_inst_read(instr)))
> >               return branch_target(instr) =3D=3D addr;
> >
> >       return 0;
> > @@ -368,13 +369,14 @@ int translate_branch(struct ppc_inst *instr, cons=
t struct ppc_inst *dest,
> >                    const struct ppc_inst *src)
> >   {
> >       unsigned long target;
> > -
> >       target =3D branch_target(src);
> >
> > -     if (instr_is_branch_iform(*src))
> > -             return create_branch(instr, dest, target, ppc_inst_val(*s=
rc));
> > -     else if (instr_is_branch_bform(*src))
> > -             return create_cond_branch(instr, dest, target, ppc_inst_v=
al(*src));
> > +     if (instr_is_branch_iform(ppc_inst_read(src)))
> > +             return create_branch(instr, dest, target,
> > +                                  ppc_inst_val(ppc_inst_read(src)));
> > +     else if (instr_is_branch_bform(ppc_inst_read(src)))
> > +             return create_cond_branch(instr, dest, target,
> > +                                       ppc_inst_val(ppc_inst_read(src)=
));
> >
> >       return 1;
> >   }
> > @@ -598,7 +600,7 @@ static void __init test_translate_branch(void)
> >       patch_instruction(q, instr);
> >       check(instr_is_branch_to_addr(p, addr));
> >       check(instr_is_branch_to_addr(q, addr));
> > -     check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
> > +     check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x4a000000)));
> >
> >       /* Maximum positive case, move x to x - 32 MB + 4 */
> >       p =3D buf + 0x2000000;
> > @@ -609,7 +611,7 @@ static void __init test_translate_branch(void)
> >       patch_instruction(q, instr);
> >       check(instr_is_branch_to_addr(p, addr));
> >       check(instr_is_branch_to_addr(q, addr));
> > -     check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
> > +     check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x49fffffc)));
> >
> >       /* Jump to x + 16 MB moved to x + 20 MB */
> >       p =3D buf;
> > @@ -655,7 +657,7 @@ static void __init test_translate_branch(void)
> >       patch_instruction(q, instr);
> >       check(instr_is_branch_to_addr(p, addr));
> >       check(instr_is_branch_to_addr(q, addr));
> > -     check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
> > +     check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff8000)));
> >
> >       /* Maximum positive case, move x to x - 32 KB + 4 */
> >       p =3D buf + 0x8000;
> > @@ -667,7 +669,7 @@ static void __init test_translate_branch(void)
> >       patch_instruction(q, instr);
> >       check(instr_is_branch_to_addr(p, addr));
> >       check(instr_is_branch_to_addr(q, addr));
> > -     check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
> > +     check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff7ffc)));
> >
> >       /* Jump to x + 12 KB moved to x + 20 KB */
> >       p =3D buf;
> > diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/featu=
re-fixups.c
> > index fb6e8e8abf4e..c0d3ed4efb7e 100644
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -48,7 +48,7 @@ static int patch_alt_instruction(struct ppc_inst *src=
, struct ppc_inst *dest,
> >       int err;
> >       struct ppc_inst instr;
> >
> > -     instr =3D *src;
> > +     instr =3D ppc_inst_read(src);
> >
> >       if (instr_is_relative_branch(*src)) {
> >               struct ppc_inst *target =3D (struct ppc_inst *)branch_tar=
get(src);
> > @@ -403,7 +403,7 @@ static void do_final_fixups(void)
> >       length =3D (__end_interrupts - _stext) / sizeof(struct ppc_inst);
> >
> >       while (length--) {
> > -             raw_patch_instruction(dest, *src);
> > +             raw_patch_instruction(dest, ppc_inst_read(src));
> >               src++;
> >               dest++;
> >       }
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index e0132d6d24d0..68e0b05d9226 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -702,13 +702,13 @@ static int xmon_core(struct pt_regs *regs, int fr=
omipi)
> >       if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) =3D=3D (MSR_IR|MSR_64=
BIT)) {
> >               bp =3D at_breakpoint(regs->nip);
> >               if (bp !=3D NULL) {
> > -                     int stepped =3D emulate_step(regs, bp->instr[0]);
> > +                     int stepped =3D emulate_step(regs, ppc_inst_read(=
bp->instr));
> >                       if (stepped =3D=3D 0) {
> >                               regs->nip =3D (unsigned long) &bp->instr[=
0];
> >                               atomic_inc(&bp->ref_count);
> >                       } else if (stepped < 0) {
> >                               printf("Couldn't single-step %s instructi=
on\n",
> > -                                 (IS_RFID(bp->instr[0])? "rfid": "mtms=
rd"));
> > +                                 IS_RFID(ppc_inst_read(bp->instr))? "r=
fid": "mtmsrd");
> >                       }
> >               }
> >       }
> > @@ -949,7 +949,7 @@ static void remove_bpts(void)
> >               if (mread(bp->address, &instr, 4) =3D=3D 4
> >                   && ppc_inst_equal(instr, ppc_inst(bpinstr))
> >                   && patch_instruction(
> > -                     (struct ppc_inst *)bp->address, bp->instr[0]) !=
=3D 0)
> > +                     (struct ppc_inst *)bp->address, ppc_inst_read(bp-=
>instr)) !=3D 0)
> >                       printf("Couldn't remove breakpoint at %lx\n",
> >                              bp->address);
> >       }
> >
