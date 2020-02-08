Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E11561F0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 01:30:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DtNS1XY5zDqkB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 11:30:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M9AyyOm8; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DtLn3M6wzDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 11:28:32 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id l136so3824893oig.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2020 16:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2snVobxEJeJ9luG+rMfVpW1vjRVLHoDwEKzminpr3kc=;
 b=M9AyyOm83pgkxnFdbFz4Xyz3KdeOpEmrSllcFDgNfm+gU9pLNJjKc9cxfXtYGv2Mja
 as9xi3sj+/6XU+0PzzhCq3VIUpaLqUX/132a8xll9vpUHtfd6m8QAg0ivnvwO6u3VqF3
 2xXktQcdeKhxuTcdnc7h4VzRc6zOalL3MWVHc9x9xPfYwNshmMSfOARzYVwf30w3do+o
 QrBzahBZpG0xAJIl1JJwBc0ApEPjlVInLxSSwoSp82Z7b0kAvcas3aosqLnJVpv6IJ4w
 03zvSq3XHejE4MVKEqoc1YeR6MC1QX+jS8zvasryNZmrutChMntOFL/Ok4KjrTDPtPtn
 Ld2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2snVobxEJeJ9luG+rMfVpW1vjRVLHoDwEKzminpr3kc=;
 b=ZQoX74P9vuT5x76iy/cPOoVRPRcxP8g3GJXZmzUkqscS3UVvN3tGi0cgoxWEFJ5MWp
 GdgL7N5+cd5ywRUubFAdTAKoVnc1S9W7gQvI5Ol32B4S0E9iBKDuMFJzX9NP82QrVSEC
 /HLiSHLqmgmE75JIZzuqP/dNjgXS7Qyq6VeRBHh/Bk9r/B+PyjANlbUQtNHx2rceFjR/
 VsLyRLIbGOVJSRxRTAPM2Ur1zR+HhuawMTZfe1Py/98bT93lPCkIaPJQGC7NGuMEuaNq
 VWI9bjGXmOCtMl8VaFIR+pDZsOpOVK0SeuXYUP7x5eHXPB9QelYoZV5XcK0JVClby0WK
 EORA==
X-Gm-Message-State: APjAAAUnxo9Qn7xUWVF8kkHpQ+C2y2tlSyA3KI70ASzN/PItFsyhnybS
 QaLmcGFEN1Znk2SUrxFL/TjXgVkGPPU/TpWazhf95A==
X-Google-Smtp-Source: APXvYqyvz2dw3TFW0Xj541PPtEpGcx0DjZSiZ9TRUOX4mRAt+NdI3oM6g1RsDs3E/tP9Y1o/jDp4E8N6nDeMgZXw9QU=
X-Received: by 2002:aca:55cc:: with SMTP id j195mr3907416oib.22.1581121709685; 
 Fri, 07 Feb 2020 16:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-19-jniethe5@gmail.com>
 <87immdu3je.fsf@dja-thinkpad.axtens.net> <20200207091555.59442fac@bahia.lan>
In-Reply-To: <20200207091555.59442fac@bahia.lan>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 8 Feb 2020 11:28:18 +1100
Message-ID: <CACzsE9oCqZuAXqOPAA_Kb9vHBv7MznEgc6boQUszRyMcFKDDPw@mail.gmail.com>
Subject: Re: [PATCH 18/18] powerpc/fault: Use analyse_instr() to check for
 store with updates to sp
To: Greg Kurz <groug@kaod.org>
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 7, 2020 at 7:16 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Thu, 19 Dec 2019 01:11:33 +1100
> Daniel Axtens <dja@axtens.net> wrote:
>
> > Jordan Niethe <jniethe5@gmail.com> writes:
> >
> > > A user-mode access to an address a long way below the stack pointer is
> > > only valid if the instruction is one that would update the stack pointer
> > > to the address accessed. This is checked by directly looking at the
> > > instructions op-code. As a result is does not take into account prefixed
> > > instructions. Instead of looking at the instruction our self, use
> > > analyse_instr() determine if this a store instruction that will update
> > > the stack pointer.
> > >
> > > Something to note is that there currently are not any store with update
> > > prefixed instructions. Actually there is no plan for prefixed
> > > update-form loads and stores. So this patch is probably not needed but
> > > it might be preferable to use analyse_instr() rather than open coding
> > > the test anyway.
> >
> > Yes please. I was looking through this code recently and was
> > horrified. This improves things a lot and I think is justification
> > enough as-is.
> >
>
> Except it doesn't work... I'm now experiencing a systematic crash of
> systemd at boot in my fedora31 guest:
>
> [    3.322912] systemd[1]: segfault (11) at 7ffff3eaf550 nip 7ce4d42f8d78 lr 9d82c098fc0 code 1 in libsystemd-shared-243.so[7ce4d4150000+2e0000]
> [    3.323112] systemd[1]: code: 00000480 60420000 3c4c001e 3842edb0 7c0802a6 3d81fff0 fb81ffe0 fba1ffe8
> [    3.323244] systemd[1]: code: fbc1fff0 fbe1fff8 f8010010 7c200b78 <f801f001> 7c216000 4082fff8 f801ff71
>
> f801f001 is
>
> 0x1a8d78 <serialize_item_format+40>: stdu    r0,-4096(r1)
>
> which analyse_instr() is supposed to decode as a STORE that
> updates r1 so we should be good... Unfortunately analyse_instr()
> forbids partial register sets, since it might return op->val
> based on some register content depending on the instruction:
>
>         /* Following cases refer to regs->gpr[], so we need all regs */
>         if (!FULL_REGS(regs))
>                 return -1;
>
> analyse_instr() was introduced with instruction emulation in mind, which
> goes far beyond the need we have in store_updates_sp(). Especially the
> fault path doesn't care for the register content at all...
>
> Not sure how to cope with that correctly (refactor analyse_instr() ? ) but
> until someone comes up with a solution, please don't merge this patch.
>
> Cheers,
>
> --
> Greg
Thank you this information. I agree analyse_instr() is overkill for
the situation
especially as there are no prefixed store-with-updates. I am going to drop this
patch from the series.
>
> > Regards,
> > Daniel
> > >
> > > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > > ---
> > >  arch/powerpc/mm/fault.c | 39 +++++++++++----------------------------
> > >  1 file changed, 11 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > > index b5047f9b5dec..cb78b3ca1800 100644
> > > --- a/arch/powerpc/mm/fault.c
> > > +++ b/arch/powerpc/mm/fault.c
> > > @@ -41,37 +41,17 @@
> > >  #include <asm/siginfo.h>
> > >  #include <asm/debug.h>
> > >  #include <asm/kup.h>
> > > +#include <asm/sstep.h>
> > >
> > >  /*
> > >   * Check whether the instruction inst is a store using
> > >   * an update addressing form which will update r1.
> > >   */
> > > -static bool store_updates_sp(unsigned int inst)
> > > +static bool store_updates_sp(struct instruction_op *op)
> > >  {
> > > -   /* check for 1 in the rA field */
> > > -   if (((inst >> 16) & 0x1f) != 1)
> > > -           return false;
> > > -   /* check major opcode */
> > > -   switch (inst >> 26) {
> > > -   case OP_STWU:
> > > -   case OP_STBU:
> > > -   case OP_STHU:
> > > -   case OP_STFSU:
> > > -   case OP_STFDU:
> > > -           return true;
> > > -   case OP_STD:    /* std or stdu */
> > > -           return (inst & 3) == 1;
> > > -   case OP_31:
> > > -           /* check minor opcode */
> > > -           switch ((inst >> 1) & 0x3ff) {
> > > -           case OP_31_XOP_STDUX:
> > > -           case OP_31_XOP_STWUX:
> > > -           case OP_31_XOP_STBUX:
> > > -           case OP_31_XOP_STHUX:
> > > -           case OP_31_XOP_STFSUX:
> > > -           case OP_31_XOP_STFDUX:
> > > +   if (GETTYPE(op->type) == STORE) {
> > > +           if ((op->type & UPDATE) && (op->update_reg == 1))
> > >                     return true;
> > > -           }
> > >     }
> > >     return false;
> > >  }
> > > @@ -278,14 +258,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
> > >
> > >             if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
> > >                 access_ok(nip, sizeof(*nip))) {
> > > -                   unsigned int inst;
> > > +                   unsigned int inst, sufx;
> > > +                   struct instruction_op op;
> > >                     int res;
> > >
> > >                     pagefault_disable();
> > > -                   res = __get_user_inatomic(inst, nip);
> > > +                   res = __get_user_instr_inatomic(inst, sufx, nip);
> > >                     pagefault_enable();
> > > -                   if (!res)
> > > -                           return !store_updates_sp(inst);
> > > +                   if (!res) {
> > > +                           analyse_instr(&op, uregs, inst, sufx);
> > > +                           return !store_updates_sp(&op);
> > > +                   }
> > >                     *must_retry = true;
> > >             }
> > >             return true;
> > > --
> > > 2.20.1
>
