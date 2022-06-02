Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91253B1D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 05:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LD9lf6Jcqz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 13:01:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BcPcaVkL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BcPcaVkL;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD9l42schz3bk9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 13:01:19 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id n10so3712298pjh.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jun 2022 20:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tMGinz23KkASxMATGY3Si6S0LW84uNC+AaYbPGTBvw=;
        b=BcPcaVkLH4rMN8ZHbg5nlLP+1oCwum3obk1+BKwvEeTDK7UhcwFhCzMI6dSIcYuWSx
         qjnJbeNXcMY3tPbywtiww7Vdmb/JJ0e7CWgGAIB9Sygdw8oFRXfsmnUNQypk/I0+FvqA
         1saPRuldLa9Ukigaa4LrkY+lpbIVW7P8m0K5MU+aK6Fg4H7+G0mXu9IHbasPXKeWlB4h
         hPWesinhmrGgMy64gIs4shKCA/L6Xp6Tw6G1gQttJ1xBaePEpfUAFlP6190OXv3T0awb
         CO+BlCUe9X7DDUgI+DUAnRy8Ky2UwzKlmu+Dez7S5ohWo8aC+isxhceW6cgERBKLFYlh
         gKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tMGinz23KkASxMATGY3Si6S0LW84uNC+AaYbPGTBvw=;
        b=I+TRBZloqgjmq7gjOo3H7dDTlGZZ1h6tJDQirjsRghW9fZWr9aFi2GS2Aj3mz2KwMg
         oBZNtTZZa+nPMG/FpUmKxVft4frdj9bGKh8GHv4Dxa9arMSEHoXM5kmwnjYQZaoqz5sp
         ypGFPaALh/i7ECg5jVWxgSFqMTggtNXqsbk8c89nFTI1mLQTZbC4CiNoFzuZQKIeYcsq
         JGmm5CBbz/yT/sN/IhwpzW4FrNuYMlPII72N5SCc3ciD5Z7MPFuJ2Z7Q5sapp6qL2j5N
         dFo7n1cfW/YLcmn+UODDC9D+qX7bcINieqhFSg26d+xPWiMy56dMlECgjJQmxoluBDYZ
         j9/w==
X-Gm-Message-State: AOAM532p5KYmHIGIkAkGyiJhJzXziS9fUE+3LX5jKNDLo4xrtv3jaWz2
	aiCx8Q3KX/IPoAzsqK7QMLZ79V5w1SKXHv0wRxf7R1Mu/9I=
X-Google-Smtp-Source: ABdhPJzVHLte8/YCIMAn4Lt03utXKGcKfIAiKsYqgFpyty37TNyp8DveyvR3V1sc5GobwEza6UJe6DRSv0HKCyKehto=
X-Received: by 2002:a17:90b:3ecd:b0:1dc:945e:41b1 with SMTP id
 rm13-20020a17090b3ecd00b001dc945e41b1mr2769350pjb.208.1654138877479; Wed, 01
 Jun 2022 20:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220531065936.3674348-1-mpe@ellerman.id.au> <20220531222715.GT25951@gate.crashing.org>
 <87fskopsui.fsf@mpe.ellerman.id.au> <20220601162023.GW25951@gate.crashing.org>
In-Reply-To: <20220601162023.GW25951@gate.crashing.org>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 2 Jun 2022 13:01:04 +1000
Message-ID: <CACzsE9qZ0OTv07Tw8OM+K_Md904ZzW6mfnu-qb8OSwznWCgufQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 2, 2022 at 2:22 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Wed, Jun 01, 2022 at 08:43:01PM +1000, Michael Ellerman wrote:
> > Segher Boessenkool <segher@kernel.crashing.org> writes:
> > > Hi!
> > >
> > > On Tue, May 31, 2022 at 04:59:36PM +1000, Michael Ellerman wrote:
> > >> More problematically it doesn't compile at all with GCC 12, due to the
> > >> fact that it returns the char buffer declared inside the macro:
> > >
> > > It returns a pointer to a buffer on stack.  It is not valid C to access
> > > that buffer after the function has returned (and indeed it does not
> > > work, in general).
> >
> > It's a statement expression though, not a function. So it doesn't return
> > as such, that would be obviously wrong.
>
> Yes, wrong language, my bad.  But luckily it doesn't matter if this is a
> function or not anyway: the question is about scopes and lifetimes :-)
>
> > But I'm not a language lawyer, so presumably it's not valid to refer to
> > the variable after it's gone out of scope.
> >
> > Although we do use that same pattern in many places where the value of
> > the expression is a scalar type.
>
> It's an object with automatic storage duration.  Its lifetime ends when
> the scope is left, which is at the end of the statement expression, so
> before the object is used.
>
> The value of the expression can be used just fine, sure, but the object
> it points to has ceased to exist, so dereferencing that pointer is
> undefined behaviour.
>
> > >> A simpler solution is to just print the value as an unsigned long. For
> > >> normal instructions the output is identical. For prefixed instructions
> > >> the value is printed as a single 64-bit quantity, whereas previously the
> > >> low half was printed first. But that is good enough for debug output,
> > >> especially as prefixed instructions will be rare in practice.
> > >
> > > Prefixed insns might be somewhat rare currently, but it will not stay
> > > that way.
> >
> > These are all printing kernel instructions, not userspace. I should have
> > said that in the change log.
>
> Ah!  In that case, it will take quite a bit longer before you will see
> many prefixed insns, sure.
>
> > The kernel doesn't build for -mcpu=power10 because we haven't done any
> > changes for pcrel.
> >
> > We will do that one day, but not soon.
>
> Yeah, pcrel is the big hitter currently.  But with the extra opcode
> space we have now, maybe something else will show up that even the
> kernel will use.  I cannot predict the future very well :-)
>
> > > It is not hard to fix the problem here?  The only tricky part is that
> > > ppc_inst_as_ulong swaps the two halves for LE, for as far as I can see
> > > no reason at all :-(
> > >
> > > If it didn't it would be easy to detect prefixed insns (because they
> > > then are guaranteed to be > 0xffffffff), and it is easy to print them
> > > with a space between the two opcodes, with a utility function:
> > >
> > > void print_insn_bytes_nicely(unsigned long insn)
> > > {
> > >     if (insn > 0xffffffff)
> > >             printf("%08x ", insn >> 32);
> > >     printf("%08x", insn & 0xffffffff);
> > > }
> >
> > We don't want to do that because it can lead to interleaving messages
> > between different CPUs in the kernel log.
>
> Yuck.
>
> void print_insn_bytes_nicely(unsigned long insn)
> {
>         if (insn > 0xffffffff)
>                 printf("%08x ", insn >> 32, insn & 0xffffffff);
>         else
>                 printf("%08x", insn & 0xffffffff);
> }
>
> But it makes things much less enticing, alright.
>
> > In the medium term there's some changes to printk that might land soon
> > (printbuf), which would mean we could more easily define a custom printk
> > formatter for printing prefixed instructions.
>
> Yeah :-)
>
> What about the more fundamental thing?  Have the order of the two halves
> of a prefixed insn as ulong not depend on endianness?  It really is two
> opcodes, and the prefixed one is first, always, even in LE.
The reason would be the value of as ulong is then used to write a
prefixed instruction to
memory with std.
If both endiannesses had the halves the same one of them would store
the suffix in front of the prefix.
>
>
> Segher
