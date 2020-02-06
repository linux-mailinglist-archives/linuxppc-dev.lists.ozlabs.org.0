Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA65154F43
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 00:12:04 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DDhw3fqWzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 10:12:00 +1100 (AEDT)
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
 header.s=20161025 header.b=rZWRFOMu; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DDfs2CKYzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 10:10:12 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id 77so347554oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 15:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfLuh5NRKg6XsvzScM58aLq4tjUkW3EYuYPvHLo/rYA=;
 b=rZWRFOMuKmbesC0X1SmvZO1eUq8yz1eNthKwrVltzi8nP/6eyUQolAEhVMoWVaNGAt
 qZsqsFUbWYjUcWoBp0a/TFHA/TcMV6qdIX1daKZtSpH+C8gnfTFu8AMPk72J850t4J4T
 niVg52VBzImOnhm2lLJC0QDdQS+1RrpyaenNs7I975seIUc77Fxal1Rrwi2CIdDof1L/
 6oObYmqlPExu3rJ+VHWr+MtM6y6IlV2JPpvxS+a2vElYRzOdHkNc17pM8pg8dI9BmDGl
 e2mvatSXcIQAHSM16ZcEwBQgc9cS7GwXNodu1cCYYQBQY2uqndZJoRZnTtgkGrc1kYQb
 zL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfLuh5NRKg6XsvzScM58aLq4tjUkW3EYuYPvHLo/rYA=;
 b=SRBcMF6WjYs7kOkOM05tsJn9ndYsl+l70xdjtPueyrgUCpMiQTp7uPKGNpB68A4OSn
 POJzKICK9e7IG8FG0KN4Hk/JNb/4LhBn++cpC1dvsIi8Nykw9A8/g20te4chaHHPt2DQ
 QAfa2zbmedi2ijNZiS2rio8mp4/GOUi0K+VRDww+AeKtBQa5EouZv1hGfWZtLZJ2SZaV
 0X7BJt/DugUCW1ZyL7XGDMSZTMbU2k4ok5ks5OZGUFWSUBEDRbZrT/JJ1QfTKE6ue7aN
 DbU2dB6l+SeHdcttm/CSwfUswK2VrW2m2yMGsX2irDcIER/4tfsIjIOXNiSNJwaEPxhH
 6Nhw==
X-Gm-Message-State: APjAAAXKTAYXjXjeCrMrwFtxFDuV4aw7hyqPnnGZ7OctSxs5lN0cHTvh
 wxbWEd0b583m9ApeB09s7vnMyCvBmNwT1BVijjs=
X-Google-Smtp-Source: APXvYqxugWq8qq6Uv+VnEbjEm56MJblMZ1SWuRvDOfWF6gehyepiY1jhBYAmjrw95uD820ymwDGnLf1WClxvNF8g7vg=
X-Received: by 2002:a9d:222f:: with SMTP id o44mr404317ota.51.1581030609320;
 Thu, 06 Feb 2020 15:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-16-jniethe5@gmail.com>
 <20200113113015.GA5532@dhcp-9-109-246-161.in.ibm.com>
In-Reply-To: <20200113113015.GA5532@dhcp-9-109-246-161.in.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 7 Feb 2020 10:09:58 +1100
Message-ID: <CACzsE9pm84v_QfRo8aw5JRZ5r8zwFRUKXj6Hug=-TA99UwhZvA@mail.gmail.com>
Subject: Re: [PATCH 15/18] powerpc/uprobes: Add support for prefixed
 instructions
To: Balamuruhan S <bala24@linux.ibm.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 13, 2020 at 10:30 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Tue, Nov 26, 2019 at 04:21:38PM +1100, Jordan Niethe wrote:
> > Uprobes can execute instructions out of line. Increase the size of the
> > buffer used  for this so that this works for prefixed instructions. Take
> > into account the length of prefixed instructions when fixing up the nip.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/include/asm/uprobes.h | 18 ++++++++++++++----
> >  arch/powerpc/kernel/uprobes.c      |  4 ++--
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
> > index 2bbdf27d09b5..5b5e8a3d2f55 100644
> > --- a/arch/powerpc/include/asm/uprobes.h
> > +++ b/arch/powerpc/include/asm/uprobes.h
> > @@ -14,18 +14,28 @@
> >
> >  typedef ppc_opcode_t uprobe_opcode_t;
> >
> > +/*
> > + * We have to ensure we have enought space for prefixed instructions, which
>
> minor typo of `enought` and we can have something like below,
Thanks for catching that.
>
> s/We have to ensure we have enought/Ensure we have enough
Will do.
>
> -- Bala
>
> > + * are double the size of a word instruction, i.e. 8 bytes. However,
> > + * sometimes it is simpler to treat a prefixed instruction like 2 word
> > + * instructions.
> > + */
> >  #define MAX_UINSN_BYTES              4
> > -#define UPROBE_XOL_SLOT_BYTES        (MAX_UINSN_BYTES)
> > +#define UPROBE_XOL_SLOT_BYTES        (2 * MAX_UINSN_BYTES)
> >
> >  /* The following alias is needed for reference from arch-agnostic code */
> >  #define UPROBE_SWBP_INSN     BREAKPOINT_INSTRUCTION
> >  #define UPROBE_SWBP_INSN_SIZE        4 /* swbp insn size in bytes */
> >
> >  struct arch_uprobe {
> > +      /*
> > +       * Ensure there is enough space for prefixed instructions. Prefixed
> > +       * instructions must not cross 64-byte boundaries.
> > +       */
> >       union {
> > -             u32     insn;
> > -             u32     ixol;
> > -     };
> > +             uprobe_opcode_t insn[2];
> > +             uprobe_opcode_t ixol[2];
> > +     } __aligned(64);
> >  };
> >
> >  struct arch_uprobe_task {
> > diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> > index ab1077dc6148..cfcea6946f8b 100644
> > --- a/arch/powerpc/kernel/uprobes.c
> > +++ b/arch/powerpc/kernel/uprobes.c
> > @@ -111,7 +111,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
> >        * support doesn't exist and have to fix-up the next instruction
> >        * to be executed.
> >        */
> > -     regs->nip = utask->vaddr + MAX_UINSN_BYTES;
> > +     regs->nip = utask->vaddr + ((IS_PREFIX(auprobe->insn[0])) ? 8 : 4);
> >
> >       user_disable_single_step(current);
> >       return 0;
> > @@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
> >        * emulate_step() returns 1 if the insn was successfully emulated.
> >        * For all other cases, we need to single-step in hardware.
> >        */
> > -     ret = emulate_step(regs, auprobe->insn, 0);
> > +     ret = emulate_step(regs, auprobe->insn[0], auprobe->insn[1]);
> >       if (ret > 0)
> >               return true;
> >
> > --
> > 2.20.1
> >
>
