Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1267172E69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 02:50:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCCx0QQZzDr9H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 12:50:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HDFvCelF; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TC9z2tN4zDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 12:48:37 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 15so823840pfo.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=WLNtYxCa50U1hUGodwFENZL4epJdU6YGmbwdZyfAxBA=;
 b=HDFvCelF18jHRNmkC9nZrTh4yyYBPV2Fh7Bmk/j6YPS3PrFI8P9S2EyJ/vFVi409hu
 qsifcPvH93e8dlOz5S8JZPZvf+4BMqMk5V5q5Suu4hiPUlNGlxfEmCeNesbzs3EPo2xa
 U5x+qlHXxIF6h3kReQ4bEpc14c7fTTlANAklM+89qac+YtgktfhREtBG7N17Vmxoxn63
 48R+qAopWx9ujZ5uGAnB3Vyb2JBWxte0DSTb6LfWtK1ugzrHeqgIEjHt/Xnf1N2/+yn0
 wddgYNoXvw4On3eMxfY/swztctA6AWmZbyAheDXOp9pD+EICH4juvKYwIIX75KF5+fQX
 3Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=WLNtYxCa50U1hUGodwFENZL4epJdU6YGmbwdZyfAxBA=;
 b=lzMg6KUHqhLTGEM6AWuxLbbDX56nobye0bGIUysmtj9Sr9ZaPLyh9W5bCYd88Ks3Au
 2mffU7c8FRSLXIpt82Q/1YbLLsvzodNOSIz8sFxpTJOIp3Gt0vKMO/cHTB+zIIxA8g8n
 +Nx6AoqobzSfwLUoUtyHr0b1RRIENq9tCsc/BHV18hfs8nbBUY8FHR8SCx0aDQTuo7F8
 SxJnO6uBZPk/rC0aajglQSo5z3YSQfdAdoNnzVlvfKqMCwDlSZ6GXq2iEt4/seHqDksW
 B4TQm9pZw6qq0pyX1zhCY6/UJwlryG0cMtMKt2rpKhjTZfXkRM4wRWNd1tJsrp36X75z
 Vepw==
X-Gm-Message-State: APjAAAUWPAWLpJwAHYRA3a/uuSMLUD3FsxqHaDHXQIJBgk5X7j075TZ1
 xbfnMXfKb0QCD78qCzc5VzM=
X-Google-Smtp-Source: APXvYqwEes4nJBjJwVnG9zwLMuKJA4XetCToL79Agsi90SWnifcDaJQgEUBVfXQtE3DZnKgLhBxCCQ==
X-Received: by 2002:a63:2447:: with SMTP id k68mr2130206pgk.368.1582854514405; 
 Thu, 27 Feb 2020 17:48:34 -0800 (PST)
Received: from localhost (193-116-109-34.tpgi.com.au. [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id x21sm8512683pfq.76.2020.02.27.17.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 17:48:33 -0800 (PST)
Date: Fri, 28 Feb 2020 11:47:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 11/14] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-12-jniethe5@gmail.com>
 <1582700856.cbydlhx2wj.astroid@bobo.none>
 <CACzsE9r+dKAgmTPsWtzPTnjmVskG_BO5G3=0V_Qm_6pu-_ZRFg@mail.gmail.com>
In-Reply-To: <CACzsE9r+dKAgmTPsWtzPTnjmVskG_BO5G3=0V_Qm_6pu-_ZRFg@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582853017.uien0qdstw.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 27, 2020 10:58 am:
> On Wed, Feb 26, 2020 at 6:18 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on February 26, 2020 2:07 pm:
>> > @@ -136,11 +148,14 @@ int arch_prepare_kprobe(struct kprobe *p)
>> >       }
>> >
>> >       if (!ret) {
>> > -             patch_instruction(p->ainsn.insn, *p->addr);
>> > +             patch_instruction(&p->ainsn.insn[0], p->addr[0]);
>> > +             if (IS_PREFIX(insn))
>> > +                     patch_instruction(&p->ainsn.insn[1], p->addr[1])=
;
>> >               p->opcode =3D *p->addr;
>>
>> Not to single out this hunk or this patch even, but what do you reckon
>> about adding an instruction data type, and then use that in all these
>> call sites rather than adding the extra arg or doing the extra copy
>> manually in each place depending on prefix?
>>
>> instrs_are_equal, get_user_instr, analyse_instr, patch_instruction,
>> etc., would all take this new instr. Places that open code a memory
>> access like your MCE change need some accessor
>>
>>                instr =3D *(unsigned int *)(instr_addr);
>> -               if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
>> +               if (IS_PREFIX(instr))
>> +                       suffix =3D *(unsigned int *)(instr_addr + 4);
>>
>> Becomes
>>                read_instr(instr_addr, &instr);
>>                if (!analyse_instr(&op, &tmp, instr)) ...
>>
>> etc.
> Daniel Axtens also talked about this and my reasons not to do so were
> pretty unconvincing, so I started trying something like this. One

Okay.

> thing I have been wondering is how pervasive should the new type be.

I wouldn't mind it being quite pervasive. We have to be careful not
to copy it directly to/from memory now, but if we have accessors to
do all that with, I think it should be okay.

> Below is data type I have started using, which I think works
> reasonably for replacing unsigned ints everywhere (like within
> code-patching.c). In a few architecture independent places such as
> uprobes which want to do =3D=3D, etc the union type does not work so well=
.

There will be some places you have to make the boundary. I would start
by just making it a powerpc thing, but possibly there is or could be
some generic helpers. How does something like x86 cope with this?

> I will have the next revision of the series start using a type.

Thanks for doing that.

>=20
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/i=
nst.h
> new file mode 100644
> index 000000000000..50adb3dbdeb4
> --- /dev/null
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -0,0 +1,87 @@
> +
> +#ifndef _ASM_INST_H
> +#define _ASM_INST_H
> +
> +#ifdef __powerpc64__
> +
> +/* 64  bit Instruction */
> +
> +typedef struct {
> +    unsigned int prefix;
> +    unsigned int suffix;

u32?

> +} __packed ppc_prefixed_inst;
> +
> +typedef union ppc_inst {
> +    unsigned int w;
> +    ppc_prefixed_inst p;
> +} ppc_inst;

I'd make it a struct and use nameless structs/unions inside it (with
appropriate packed annotation):

struct ppc_inst {
    union {
        struct {
            u32 word;
	    u32 pad;
	};
	struct {
	    u32 prefix;
	    u32 suffix;
	};
    };
};

> +
> +#define PPC_INST_IS_PREFIXED(inst) (((inst).w >> 26) =3D=3D 1)
> +#define PPC_INST_LEN(inst) (PPC_INST_IS_PREFIXED((inst)) ?
> sizeof((inst).p) : sizeof((inst).w))

Good accessors, I'd make them all C inline functions and lower case.

> +
> +#define PPC_INST_NEW_WORD(x) ((ppc_inst) { .w =3D (x) })
> +#define PPC_INST_NEW_WORD_PAD(x) ((ppc_inst) { .p.prefix =3D (x),
> .p.suffix =3D (0x60000000) })
> +#define PPC_INST_NEW_PREFIXED(x, y) ((ppc_inst) { .p.prefix =3D (x),
> .p.suffix =3D (y) })

If these are widely used, I'd make them a bit shorter

#define PPC_INST(x)
#define PPC_INST_PREFIXED(x)

I'd also set padding to something invalid 0 or 0xffffffff for the first
case, and have your accessors check that rather than carrying around
another type of ppc_inst (prefixed, padded, non-padded).

> +
> +#define PPC_INST_WORD(x) ((x).w)
> +#define PPC_INST_PREFIX(x) (x.p.prefix)
> +#define PPC_INST_SUFFIX(x) (x.p.suffix)
> +#define PPC_INST_EMPTY(x) (PPC_INST_WORD(x) =3D=3D 0)

I'd avoid simple accessors like this completely. If they have any use
it would be to ensure you don't try to use prefix/suffix on a=20
non-prefixed instruction for example. If you want to do that I'd use
inline functions for it.

> +
> +#define DEREF_PPC_INST_PTR(ptr)                \
> +({                            \
> +    ppc_inst __inst;                \
> +    __inst.w =3D *(unsigned int *)(ptr);        \
> +    if (PPC_INST_IS_PREFIXED(__inst))        \
> +        __inst.p =3D *(ppc_prefixed_inst *)(ptr);    \
> +    __inst;                        \
> +})

I'd go an inline with shorter lowercase names. ppc_inst_read(&inst);

> +#define PPC_INST_NEXT(ptr) ((ptr) +=3D PPC_INST_LEN(DEREF_PPC_INST_PTR((=
ptr))))
> +#define PPC_INST_PREV(ptr) ((ptr) -=3D PPC_INST_LEN(DEREF_PPC_INST_PTR((=
ptr))))

Wouldn't bother with this accessor, caller could ptr +=3D ppc_inst_len(inst=
)


> +#define PPC_INST_EQ(x, y)                \
> +({                            \
> +    long pic_ret =3D 0;                \
> +    pic_ret =3D (PPC_INST_PREFIX(x) =3D=3D PPC_INST_PREFIX(y));    \
> +    if (pic_ret) {                    \
> +        if (PPC_INST_IS_PREFIXED(x) && PPC_INST_IS_PREFIXED(y)) {    \
> +            pic_ret =3D (PPC_INST_SUFFIX(x) =3D=3D PPC_INST_SUFFIX(y)); =
   \
> +        } else {                \
> +            pic_ret =3D 0;            \
> +        }                    \
> +    }                        \
> +    pic_ret;                    \
> +})

static inline bool ppc_inst_eq(struct ppc_inst x, struct ppc_inst y)
{
	return !memcmp(&x, &y, sizeof(struct ppc_inst));
}

If all accessors and initalisers are such that the padding gets set,
that'll work.

Thanks,
Nick
=
