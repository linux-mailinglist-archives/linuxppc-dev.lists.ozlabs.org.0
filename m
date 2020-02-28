Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EB173013
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:56:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48THLL2nBKzDrFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 15:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=atM5fLxZ; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48THJV2CSWzDrCt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 15:54:33 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z12so865379pgl.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 20:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=wdhrq7tBhVRtvcclECyLgIThzaLGg3RltcPQVabRvAU=;
 b=atM5fLxZPGX0VjBDgp4PpIn5rr6dGj2XyByEfmG61MuWdfXrshdCA0hY/1rVmxt36C
 8loI1gsHCw1tmNR2/H6WeCiDPt5d9i+1+LRShED6Blcx1AUn08+UGuW/Xq6SobfCNfsL
 vJLpAkkavTVLVgYx9lCd76ed88AKQgGtf0uXHNKtMrL04OytI9e0E+XOv7WUQg6KERZW
 Y4a3naRG9RxEZfBEzCzUc17LvsBqqT/ve/I8Lv4Cukdw4AABL4UkFzYZv5vbFsbyB+rY
 rMNDzK0MkB8KPCkYVUp54yBOMZRMVoB5EzqGznHdhbm4gFR/Hrw7pQ9pRmFsR3Zrljl6
 uG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=wdhrq7tBhVRtvcclECyLgIThzaLGg3RltcPQVabRvAU=;
 b=hXP9AUwDUOrlBzqSMeB3Sg+TPOnAre4S9V/0K1ECGe8bLOMjZ6YLjN64qI/CAt42PX
 Alyfd578wcE2JYEY/erNmgjTsFRPvnsW3lCIC8Pym8A9bsegQad5JyZtCNyL0Nnpkwoi
 m07wGcB1BYUyTkxjWxGQRDC6IP6XA04dDUy4iv4Y3abCk6A9kWsSDdN2zHme407ujxoh
 eOdTQQDE0Ud8+rN/foPOvILFOncGrzMgA21k0gJ2556BfS0QTIvw7GwKDpZxZavGEUQI
 yv4tJ1Q/+JxteHWlJ0nGJ9qrfKepyXThh1uT42ZneDi9UI3HoZBXqDXqEZUBlUbTVwjV
 nj2w==
X-Gm-Message-State: APjAAAUav3wz0/r5FRYfUy3GxOhVSwtitNj9JcNCo+4by6y1F/wJfBlP
 dqFj0elAmLY0CCuIyRJ82Tw=
X-Google-Smtp-Source: APXvYqzhEKPOAWUYm/II8AirLITF6sZdAlXrfODcnZuhdJaeudo635Skt+Hlm3as/JOvp8Q+wLDU0w==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr2623505pfq.198.1582865670625; 
 Thu, 27 Feb 2020 20:54:30 -0800 (PST)
Received: from localhost (193-116-109-34.tpgi.com.au. [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id c19sm9780700pfc.144.2020.02.27.20.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 20:54:30 -0800 (PST)
Date: Fri, 28 Feb 2020 14:53:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 11/14] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-12-jniethe5@gmail.com>
 <1582700856.cbydlhx2wj.astroid@bobo.none>
 <CACzsE9r+dKAgmTPsWtzPTnjmVskG_BO5G3=0V_Qm_6pu-_ZRFg@mail.gmail.com>
 <1582853017.uien0qdstw.astroid@bobo.none>
 <CACzsE9oyVoukqHZHkSbEoWBmotksqORKJNOuFz_4J4ExMUeijw@mail.gmail.com>
In-Reply-To: <CACzsE9oyVoukqHZHkSbEoWBmotksqORKJNOuFz_4J4ExMUeijw@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582865322.01nj96i6g1.astroid@bobo.none>
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

Jordan Niethe's on February 28, 2020 1:23 pm:
> On Fri, Feb 28, 2020 at 12:48 PM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
>>
>> Jordan Niethe's on February 27, 2020 10:58 am:
>> > On Wed, Feb 26, 2020 at 6:18 PM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>> >>
>> >> Jordan Niethe's on February 26, 2020 2:07 pm:
>> >> > @@ -136,11 +148,14 @@ int arch_prepare_kprobe(struct kprobe *p)
>> >> >       }
>> >> >
>> >> >       if (!ret) {
>> >> > -             patch_instruction(p->ainsn.insn, *p->addr);
>> >> > +             patch_instruction(&p->ainsn.insn[0], p->addr[0]);
>> >> > +             if (IS_PREFIX(insn))
>> >> > +                     patch_instruction(&p->ainsn.insn[1], p->addr[=
1]);
>> >> >               p->opcode =3D *p->addr;
>> >>
>> >> Not to single out this hunk or this patch even, but what do you recko=
n
>> >> about adding an instruction data type, and then use that in all these
>> >> call sites rather than adding the extra arg or doing the extra copy
>> >> manually in each place depending on prefix?
>> >>
>> >> instrs_are_equal, get_user_instr, analyse_instr, patch_instruction,
>> >> etc., would all take this new instr. Places that open code a memory
>> >> access like your MCE change need some accessor
>> >>
>> >>                instr =3D *(unsigned int *)(instr_addr);
>> >> -               if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) =
{
>> >> +               if (IS_PREFIX(instr))
>> >> +                       suffix =3D *(unsigned int *)(instr_addr + 4);
>> >>
>> >> Becomes
>> >>                read_instr(instr_addr, &instr);
>> >>                if (!analyse_instr(&op, &tmp, instr)) ...
>> >>
>> >> etc.
>> > Daniel Axtens also talked about this and my reasons not to do so were
>> > pretty unconvincing, so I started trying something like this. One
>>
>> Okay.
>>
>> > thing I have been wondering is how pervasive should the new type be.
>>
>> I wouldn't mind it being quite pervasive. We have to be careful not
>> to copy it directly to/from memory now, but if we have accessors to
>> do all that with, I think it should be okay.
>>
>> > Below is data type I have started using, which I think works
>> > reasonably for replacing unsigned ints everywhere (like within
>> > code-patching.c). In a few architecture independent places such as
>> > uprobes which want to do =3D=3D, etc the union type does not work so w=
ell.
>>
>> There will be some places you have to make the boundary. I would start
>> by just making it a powerpc thing, but possibly there is or could be
>> some generic helpers. How does something like x86 cope with this?
>=20
> One of the places I was thinking of was is_swbp_insn() in
> kernel/events/uprobes.c. The problem was I wanted to typedef
> uprobe_opcode_t as ppc_insn type which was probably the wrong thing to
> do. x86 typedef's it as u8 (size of the trap they use). So we probably
> can do the same thing and just keep it as a u32.

Sounds good.

>> > I will have the next revision of the series start using a type.
>>
>> Thanks for doing that.
>>
>> >
>> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/as=
m/inst.h
>> > new file mode 100644
>> > index 000000000000..50adb3dbdeb4
>> > --- /dev/null
>> > +++ b/arch/powerpc/include/asm/inst.h
>> > @@ -0,0 +1,87 @@
>> > +
>> > +#ifndef _ASM_INST_H
>> > +#define _ASM_INST_H
>> > +
>> > +#ifdef __powerpc64__
>> > +
>> > +/* 64  bit Instruction */
>> > +
>> > +typedef struct {
>> > +    unsigned int prefix;
>> > +    unsigned int suffix;
>>
>> u32?
> Sure.
>>
>> > +} __packed ppc_prefixed_inst;
>> > +
>> > +typedef union ppc_inst {
>> > +    unsigned int w;
>> > +    ppc_prefixed_inst p;
>> > +} ppc_inst;
>>
>> I'd make it a struct and use nameless structs/unions inside it (with
>> appropriate packed annotation):
> Yeah that will be nicer.
>>
>> struct ppc_inst {
>>     union {
>>         struct {
>>             u32 word;
>>             u32 pad;
>>         };
>>         struct {
>>             u32 prefix;
>>             u32 suffix;
>>         };
>>     };
>> };
>>
>> > +
>> > +#define PPC_INST_IS_PREFIXED(inst) (((inst).w >> 26) =3D=3D 1)
>> > +#define PPC_INST_LEN(inst) (PPC_INST_IS_PREFIXED((inst)) ?
>> > sizeof((inst).p) : sizeof((inst).w))
>>
>> Good accessors, I'd make them all C inline functions and lower case.
> Will change.
>>
>> > +
>> > +#define PPC_INST_NEW_WORD(x) ((ppc_inst) { .w =3D (x) })
>> > +#define PPC_INST_NEW_WORD_PAD(x) ((ppc_inst) { .p.prefix =3D (x),
>> > .p.suffix =3D (0x60000000) })
>> > +#define PPC_INST_NEW_PREFIXED(x, y) ((ppc_inst) { .p.prefix =3D (x),
>> > .p.suffix =3D (y) })
>>
>> If these are widely used, I'd make them a bit shorter
>>
>> #define PPC_INST(x)
>> #define PPC_INST_PREFIXED(x)
> Good idea, they do end up used quite widely.
>>
>> I'd also set padding to something invalid 0 or 0xffffffff for the first
>> case, and have your accessors check that rather than carrying around
>> another type of ppc_inst (prefixed, padded, non-padded).
>>
>> > +
>> > +#define PPC_INST_WORD(x) ((x).w)
>> > +#define PPC_INST_PREFIX(x) (x.p.prefix)
>> > +#define PPC_INST_SUFFIX(x) (x.p.suffix)
>> > +#define PPC_INST_EMPTY(x) (PPC_INST_WORD(x) =3D=3D 0)
>>
>> I'd avoid simple accessors like this completely. If they have any use
>> it would be to ensure you don't try to use prefix/suffix on a
>> non-prefixed instruction for example. If you want to do that I'd use
>> inline functions for it.
> What I was thinking with these macros was that they would let us keep
> the instruction type as a simple u32 on 32 bit ppc. Is it worth trying
> to do that?

Hmm, it might be. On the other hand if ppc32 can use the same
struct ppc_insn struct it might help share code without too many
macros.

I guess it's up to Christophe and Michael and you I won't complain
any more (so long as they're lower case and inlines where possible :))

Thanks,
Nick
=
