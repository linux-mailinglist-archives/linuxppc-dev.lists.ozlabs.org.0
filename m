Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431C159E0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 01:35:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HLKJ4LsSzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 11:35:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ETMHDtZA; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HLFG2NpfzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 11:32:18 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id b18so221069otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=garS9B2jijdBoyO3r+RMJe44/q1Dmtmh2HXsi+bsb3Q=;
 b=ETMHDtZA9a92v9hMIubRqzNtpGWUcl7b5yIA4uOL7LJe/wYH8JlnlRL+aFcXeXHF3i
 8QTCjYar6oBK6KqkCuLL724Uk1wd7hL72BouGSnmfSbip2mOZwRR81W0N/sdKsnqFTAr
 HPSqYS+rKlzb/ystK0d4sYV2DiJIERjfnTx+wLy8QP1lI4gMvyC3IBckEj5BA+J59MrX
 DeN1Tmi08wL8PNht22aILD7Lepertc2UDvOMJCzkhoatyFUYYyH3OmS88X51I6F9sMAC
 H9a/fQBKP7tSHE+K4RWvxB/kVq/HJB7cZhO34J2KV+3ZbkcpkZISMQoosTyLjt8+MhEA
 AVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=garS9B2jijdBoyO3r+RMJe44/q1Dmtmh2HXsi+bsb3Q=;
 b=CBrX7NzQqD8MwRSCw9H6Eti09ptiwvKj+fvbMj6elsgNqTJhTkXbFm++9yO3rTvqSA
 tbY05l3Btu1P+goOYglk/lxtCPzVWDLJA+hbt+LRoqJ0Ey4j09JhkENuJTC5lk0m17JC
 JUczIDK7QA4O0blQnT1kXwo8hiCB+1teaWBwqMuwU8Jrcu65bo72KqJmKQcZKpYlQhky
 arlUgYHUlMvU7J1OuJpUE+JGdRHLXd5YMW936jlB4qFAxlcG8Dx+UF7Ltb+wWd9ztlie
 F8WlU2iI7+90KC+VblnRI+/7Txg2sdaijjqRvvtQoDXRuw9GXlXpIRp/6IpxDrSiyasn
 kq7Q==
X-Gm-Message-State: APjAAAXW8Cwhj9RfOo22xwP9j3QvqB1WmDqBEjaTnldr+Z5bdmEbld/w
 IPoaojx2kUVQveg/AUsFmCoBEbx4n8VTkNEfCpw=
X-Google-Smtp-Source: APXvYqwbCyhxOWPPXRdNm0aPXXikQGN5q9g4GVO0feJOa8HiWCaXEiKVw3sb21ZPeC27fP2oe9MFlKdwSek0xdFcENk=
X-Received: by 2002:a05:6830:43:: with SMTP id
 d3mr7623132otp.259.1581467534961; 
 Tue, 11 Feb 2020 16:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-11-jniethe5@gmail.com>
 <4557dfcc-064f-6c94-7620-df13370b6cfb@c-s.fr>
In-Reply-To: <4557dfcc-064f-6c94-7620-df13370b6cfb@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 12 Feb 2020 11:32:03 +1100
Message-ID: <CACzsE9pL0ycdRD-FGocckSxJ_NPun3tqXvBOTSXUCSfOpRNU-g@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Balamuruhan S <bala24@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 5:46 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 11/02/2020 =C3=A0 06:33, Jordan Niethe a =C3=A9crit :
> > A prefixed instruction is composed of a word prefix followed by a word
> > suffix. It does not make sense to be able to have a kprobe on the suffi=
x
> > of a prefixed instruction, so make this impossible.
> >
> > Kprobes work by replacing an instruction with a trap and saving that
> > instruction to be single stepped out of place later. Currently there is
> > not enough space allocated to keep a prefixed instruction for single
> > stepping. Increase the amount of space allocated for holding the
> > instruction copy.
> >
> > kprobe_post_handler() expects all instructions to be 4 bytes long which
> > means that it does not function correctly for prefixed instructions.
> > Add checks for prefixed instructions which will use a length of 8 bytes
> > instead.
> >
> > For optprobes we normally patch in loading the instruction we put a
> > probe on into r4 before calling emulate_step(). We now make space and
> > patch in loading the suffix into r5 as well.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >   arch/powerpc/include/asm/kprobes.h   |  5 +--
> >   arch/powerpc/kernel/kprobes.c        | 47 +++++++++++++++++++++------=
-
> >   arch/powerpc/kernel/optprobes.c      | 32 ++++++++++---------
> >   arch/powerpc/kernel/optprobes_head.S |  6 ++++
> >   4 files changed, 63 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/=
asm/kprobes.h
> > index 66b3f2983b22..0d44ce8a3163 100644
> > --- a/arch/powerpc/include/asm/kprobes.h
> > +++ b/arch/powerpc/include/asm/kprobes.h
> > @@ -38,12 +38,13 @@ extern kprobe_opcode_t optprobe_template_entry[];
> >   extern kprobe_opcode_t optprobe_template_op_address[];
> >   extern kprobe_opcode_t optprobe_template_call_handler[];
> >   extern kprobe_opcode_t optprobe_template_insn[];
> > +extern kprobe_opcode_t optprobe_template_suffix[];
> >   extern kprobe_opcode_t optprobe_template_call_emulate[];
> >   extern kprobe_opcode_t optprobe_template_ret[];
> >   extern kprobe_opcode_t optprobe_template_end[];
> >
> > -/* Fixed instruction size for powerpc */
> > -#define MAX_INSN_SIZE                1
> > +/* Prefixed instructions are two words */
> > +#define MAX_INSN_SIZE                2
> >   #define MAX_OPTIMIZED_LENGTH        sizeof(kprobe_opcode_t) /* 4 byte=
s */
> >   #define MAX_OPTINSN_SIZE    (optprobe_template_end - optprobe_templat=
e_entry)
> >   #define RELATIVEJUMP_SIZE   sizeof(kprobe_opcode_t) /* 4 bytes */
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobe=
s.c
> > index 24a56f062d9e..b061deba4fe7 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -104,17 +104,30 @@ kprobe_opcode_t *kprobe_lookup_name(const char *n=
ame, unsigned int offset)
> >
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> > +     int len;
> >       int ret =3D 0;
> > +     struct kprobe *prev;
> >       kprobe_opcode_t insn =3D *p->addr;
> > +     kprobe_opcode_t prefix =3D *(p->addr - 1);
> >
> > +     preempt_disable();
> >       if ((unsigned long)p->addr & 0x03) {
> >               printk("Attempt to register kprobe at an unaligned addres=
s\n");
> >               ret =3D -EINVAL;
> >       } else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
> >               printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\=
n");
> >               ret =3D -EINVAL;
> > +     } else if (IS_PREFIX(prefix)) {
> > +             printk("Cannot register a kprobe on the second word of pr=
efixed instruction\n");
> > +             ret =3D -EINVAL;
> > +     }
> > +     prev =3D get_kprobe(p->addr - 1);
> > +     if (prev && IS_PREFIX(*prev->ainsn.insn)) {
> > +             printk("Cannot register a kprobe on the second word of pr=
efixed instruction\n");
> > +             ret =3D -EINVAL;
> >       }
> >
> > +
> >       /* insn must be on a special executable page on ppc64.  This is
> >        * not explicitly required on ppc32 (right now), but it doesn't h=
urt */
> >       if (!ret) {
> > @@ -124,14 +137,18 @@ int arch_prepare_kprobe(struct kprobe *p)
> >       }
> >
> >       if (!ret) {
> > -             memcpy(p->ainsn.insn, p->addr,
> > -                             MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
> > +             if (IS_PREFIX(insn))
> > +                     len =3D MAX_INSN_SIZE * sizeof(kprobe_opcode_t);
> > +             else
> > +                     len =3D sizeof(kprobe_opcode_t);
> > +             memcpy(p->ainsn.insn, p->addr, len);
>
> This code is about to get changed, see
> https://patchwork.ozlabs.org/patch/1232619/
Ah thank you for the heads up.
>
> >               p->opcode =3D *p->addr;
> >               flush_icache_range((unsigned long)p->ainsn.insn,
> >                       (unsigned long)p->ainsn.insn + sizeof(kprobe_opco=
de_t));
> >       }
> >
> >       p->ainsn.boostable =3D 0;
> > +     preempt_enable_no_resched();
> >       return ret;
> >   }
> >   NOKPROBE_SYMBOL(arch_prepare_kprobe);
> > @@ -216,10 +233,11 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
> >   static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
> >   {
> >       int ret;
> > -     unsigned int insn =3D *p->ainsn.insn;
> > +     unsigned int insn =3D p->ainsn.insn[0];
> > +     unsigned int suffix =3D p->ainsn.insn[1];
> >
> >       /* regs->nip is also adjusted if emulate_step returns 1 */
> > -     ret =3D emulate_step(regs, insn, PPC_NO_SUFFIX);
> > +     ret =3D emulate_step(regs, insn, suffix);
> >       if (ret > 0) {
> >               /*
> >                * Once this instruction has been boosted
> > @@ -233,7 +251,11 @@ static int try_to_emulate(struct kprobe *p, struct=
 pt_regs *regs)
> >                * So, we should never get here... but, its still
> >                * good to catch them, just in case...
> >                */
> > -             printk("Can't step on instruction %x\n", insn);
> > +             if (!IS_PREFIX(insn))
> > +                     printk("Can't step on instruction %x\n", insn);
> > +             else
> > +                     printk("Can't step on instruction %x %x\n", insn,
> > +                            suffix);
>
> Maybe %x:%x as in xmon ?
Good point.
>
> Christophe
