Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C24172F49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:25:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TFKm2vJYzDrG3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 14:25:32 +1100 (AEDT)
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
 header.s=20161025 header.b=VjTDdH4g; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TFJ10TL2zDrDT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 14:24:00 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id h9so1301197otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 19:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mynXAUogcqpmu2CXMdptJt+uSKiy1ZCv7hLi9glvAxo=;
 b=VjTDdH4gUx8JsZ8UVXXfvtgyS1/xqv8wckZ4sofuJPVMkgSPjAIZiWw34pK5Bxjsa2
 GsHNpikC4DesVSM51zrAqDQku1mtdGeumoVCoJQJ2jhkacPJJAifZ6+0gpWWg6zJQFN7
 o70OZiYqslqiiDPEOl5Sg5TbY0TVKv8w/eT6bJkZgRpEutxs4IzTxf3QfdNAGopf3sNh
 V2Wx62zQcWqiDM7hXau7s8BgJe0NqBa4FjvUsbK8Yz5StUZYHk1zmVKaJXv/SbOk5+WZ
 8jYD8lGh2alQRyGGfevPd+qtfVeqvAeZQJWDlFIGonszK7pSz4lvu4AJMgjrfND67vlR
 QIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mynXAUogcqpmu2CXMdptJt+uSKiy1ZCv7hLi9glvAxo=;
 b=ulVJuKUfL4hVOk3YMKeQCJRa0hr94d8R97d7BpS1xf55VHapmvNn+uhLbRmKzc6XoT
 XxvoeQdvjTKtNGtFTwcIKJJG9Sjza3gNY93cNR1dyp+eUJ4ev8pgC4SUgQnGs4+7gXsk
 v8zNooEmQxjxYiJzbAC62xvzdUTcCjyfN84nFwuhPmhG8G/W13C8EDFFgxG2aiZHGxWP
 oXKQk48/GOQ7h/bixPdpMxg3mnBmKQNN4mN8Ozm7P0J7QV2vM6m/HDGtBJjd23eegwjj
 UfSlNq9eVerVwa48FBLkNFpwe4Pa472QrEh8yZtJq5+7iddwuXVcoh1EDy+NfwrzxSTt
 2RgA==
X-Gm-Message-State: APjAAAVPa+BniHm9cHfREmsbuwIMPzbXibIUKa+q0Yxab5J+YDwBjYIH
 JT5Q2pa7grMFnC8TdjUkwhx8cT8j7lUdzpyCt/w=
X-Google-Smtp-Source: APXvYqxy+zmkIZojtBOMDiJGUUeCqmSFSHyG1bYb2rznzWbZLdg9OAETOO2/SfE6bVJFOLx10x+6Uh6bAvaHO5RSLS0=
X-Received: by 2002:a05:6830:1304:: with SMTP id
 p4mr1713387otq.327.1582860237574; 
 Thu, 27 Feb 2020 19:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-12-jniethe5@gmail.com>
 <1582700856.cbydlhx2wj.astroid@bobo.none>
 <CACzsE9r+dKAgmTPsWtzPTnjmVskG_BO5G3=0V_Qm_6pu-_ZRFg@mail.gmail.com>
 <1582853017.uien0qdstw.astroid@bobo.none>
In-Reply-To: <1582853017.uien0qdstw.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 28 Feb 2020 14:23:46 +1100
Message-ID: <CACzsE9oyVoukqHZHkSbEoWBmotksqORKJNOuFz_4J4ExMUeijw@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 12:48 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on February 27, 2020 10:58 am:
> > On Wed, Feb 26, 2020 at 6:18 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> >>
> >> Jordan Niethe's on February 26, 2020 2:07 pm:
> >> > @@ -136,11 +148,14 @@ int arch_prepare_kprobe(struct kprobe *p)
> >> >       }
> >> >
> >> >       if (!ret) {
> >> > -             patch_instruction(p->ainsn.insn, *p->addr);
> >> > +             patch_instruction(&p->ainsn.insn[0], p->addr[0]);
> >> > +             if (IS_PREFIX(insn))
> >> > +                     patch_instruction(&p->ainsn.insn[1], p->addr[1]);
> >> >               p->opcode = *p->addr;
> >>
> >> Not to single out this hunk or this patch even, but what do you reckon
> >> about adding an instruction data type, and then use that in all these
> >> call sites rather than adding the extra arg or doing the extra copy
> >> manually in each place depending on prefix?
> >>
> >> instrs_are_equal, get_user_instr, analyse_instr, patch_instruction,
> >> etc., would all take this new instr. Places that open code a memory
> >> access like your MCE change need some accessor
> >>
> >>                instr = *(unsigned int *)(instr_addr);
> >> -               if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
> >> +               if (IS_PREFIX(instr))
> >> +                       suffix = *(unsigned int *)(instr_addr + 4);
> >>
> >> Becomes
> >>                read_instr(instr_addr, &instr);
> >>                if (!analyse_instr(&op, &tmp, instr)) ...
> >>
> >> etc.
> > Daniel Axtens also talked about this and my reasons not to do so were
> > pretty unconvincing, so I started trying something like this. One
>
> Okay.
>
> > thing I have been wondering is how pervasive should the new type be.
>
> I wouldn't mind it being quite pervasive. We have to be careful not
> to copy it directly to/from memory now, but if we have accessors to
> do all that with, I think it should be okay.
>
> > Below is data type I have started using, which I think works
> > reasonably for replacing unsigned ints everywhere (like within
> > code-patching.c). In a few architecture independent places such as
> > uprobes which want to do ==, etc the union type does not work so well.
>
> There will be some places you have to make the boundary. I would start
> by just making it a powerpc thing, but possibly there is or could be
> some generic helpers. How does something like x86 cope with this?

One of the places I was thinking of was is_swbp_insn() in
kernel/events/uprobes.c. The problem was I wanted to typedef
uprobe_opcode_t as ppc_insn type which was probably the wrong thing to
do. x86 typedef's it as u8 (size of the trap they use). So we probably
can do the same thing and just keep it as a u32.

>
> > I will have the next revision of the series start using a type.
>
> Thanks for doing that.
>
> >
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> > new file mode 100644
> > index 000000000000..50adb3dbdeb4
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -0,0 +1,87 @@
> > +
> > +#ifndef _ASM_INST_H
> > +#define _ASM_INST_H
> > +
> > +#ifdef __powerpc64__
> > +
> > +/* 64  bit Instruction */
> > +
> > +typedef struct {
> > +    unsigned int prefix;
> > +    unsigned int suffix;
>
> u32?
Sure.
>
> > +} __packed ppc_prefixed_inst;
> > +
> > +typedef union ppc_inst {
> > +    unsigned int w;
> > +    ppc_prefixed_inst p;
> > +} ppc_inst;
>
> I'd make it a struct and use nameless structs/unions inside it (with
> appropriate packed annotation):
Yeah that will be nicer.
>
> struct ppc_inst {
>     union {
>         struct {
>             u32 word;
>             u32 pad;
>         };
>         struct {
>             u32 prefix;
>             u32 suffix;
>         };
>     };
> };
>
> > +
> > +#define PPC_INST_IS_PREFIXED(inst) (((inst).w >> 26) == 1)
> > +#define PPC_INST_LEN(inst) (PPC_INST_IS_PREFIXED((inst)) ?
> > sizeof((inst).p) : sizeof((inst).w))
>
> Good accessors, I'd make them all C inline functions and lower case.
Will change.
>
> > +
> > +#define PPC_INST_NEW_WORD(x) ((ppc_inst) { .w = (x) })
> > +#define PPC_INST_NEW_WORD_PAD(x) ((ppc_inst) { .p.prefix = (x),
> > .p.suffix = (0x60000000) })
> > +#define PPC_INST_NEW_PREFIXED(x, y) ((ppc_inst) { .p.prefix = (x),
> > .p.suffix = (y) })
>
> If these are widely used, I'd make them a bit shorter
>
> #define PPC_INST(x)
> #define PPC_INST_PREFIXED(x)
Good idea, they do end up used quite widely.
>
> I'd also set padding to something invalid 0 or 0xffffffff for the first
> case, and have your accessors check that rather than carrying around
> another type of ppc_inst (prefixed, padded, non-padded).
>
> > +
> > +#define PPC_INST_WORD(x) ((x).w)
> > +#define PPC_INST_PREFIX(x) (x.p.prefix)
> > +#define PPC_INST_SUFFIX(x) (x.p.suffix)
> > +#define PPC_INST_EMPTY(x) (PPC_INST_WORD(x) == 0)
>
> I'd avoid simple accessors like this completely. If they have any use
> it would be to ensure you don't try to use prefix/suffix on a
> non-prefixed instruction for example. If you want to do that I'd use
> inline functions for it.
What I was thinking with these macros was that they would let us keep
the instruction type as a simple u32 on 32 bit ppc. Is it worth trying
to do that?
>
> > +
> > +#define DEREF_PPC_INST_PTR(ptr)                \
> > +({                            \
> > +    ppc_inst __inst;                \
> > +    __inst.w = *(unsigned int *)(ptr);        \
> > +    if (PPC_INST_IS_PREFIXED(__inst))        \
> > +        __inst.p = *(ppc_prefixed_inst *)(ptr);    \
> > +    __inst;                        \
> > +})
>
> I'd go an inline with shorter lowercase names. ppc_inst_read(&inst);
Will do.
>
> > +#define PPC_INST_NEXT(ptr) ((ptr) += PPC_INST_LEN(DEREF_PPC_INST_PTR((ptr))))
> > +#define PPC_INST_PREV(ptr) ((ptr) -= PPC_INST_LEN(DEREF_PPC_INST_PTR((ptr))))
>
> Wouldn't bother with this accessor, caller could ptr += ppc_inst_len(inst)
Good point.
>
>
> > +#define PPC_INST_EQ(x, y)                \
> > +({                            \
> > +    long pic_ret = 0;                \
> > +    pic_ret = (PPC_INST_PREFIX(x) == PPC_INST_PREFIX(y));    \
> > +    if (pic_ret) {                    \
> > +        if (PPC_INST_IS_PREFIXED(x) && PPC_INST_IS_PREFIXED(y)) {    \
> > +            pic_ret = (PPC_INST_SUFFIX(x) == PPC_INST_SUFFIX(y));    \
> > +        } else {                \
> > +            pic_ret = 0;            \
> > +        }                    \
> > +    }                        \
> > +    pic_ret;                    \
> > +})
>
> static inline bool ppc_inst_eq(struct ppc_inst x, struct ppc_inst y)
> {
>         return !memcmp(&x, &y, sizeof(struct ppc_inst));
> }
Well that is definitely cleaner!

Thank you for the feedback.
>
> If all accessors and initalisers are such that the padding gets set,
> that'll work.
>
> Thanks,
> Nick
