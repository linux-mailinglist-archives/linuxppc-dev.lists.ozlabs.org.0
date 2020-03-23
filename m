Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B603318F1ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:37:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8Rp3DfNzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:37:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m0EHjJxa; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8Kk5sVgzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:32:10 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id k26so12720820otr.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKxoRUe56NJ8Ku7rl+tuwkJqV/073vwAR0/3YbNfPpI=;
 b=m0EHjJxalRbzDTqAHG+2tuX4I39OzXSc0o8jUL8x2r/JX+3Gll27M7C6FaUYYUTMAT
 94OZn1858aZ6r1GE7CcW/EG8G2H2X4WDA2mpv16FWlXmBf+KFJpGS5jR2+Q3VmNGLPtJ
 ajKw5Bh4wWg5/2+fhhgxzmo6DZjTlt+G1d6ItOKM6vzt/AE1hlU/5w2xi31Akby+3ufk
 Tfq3phJELLGOp3gLQ8pXaRc8HFicxInS1WUu5XOMEv5YE9t5y00SL3qWvvgGXAzrWQT6
 Q7chKFnW4ME+W5hXXo/wjKAVxNwjkZfDo2yMzAqjfMNma5tYomXJ2y1n0I8KISl8Xjv4
 xS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKxoRUe56NJ8Ku7rl+tuwkJqV/073vwAR0/3YbNfPpI=;
 b=l55hGySu8+a77AAcNWX4SFjF5zJs9O1m1e9CQu4yw0CPaHvzLa7gMmvX9ijoqmZ1kT
 MxmHwmrE1lkw132L+xjNm7kOcvM3ZojYPzdK+EmSWpN5tLhZNTWtbWcB3S2ZyVe6e1Lw
 8aGeL85G9yOTizcn6NZYedzZu7iHYDymMfFQhnB4/InAV+885QwM7gR9GUvOzdjAj3JD
 w21ei+Rr8weFnGfO4qSxs8I1nSPtPHnVxhLQ2S5hePWLrmCHVMiFib3jLJj8nrDXQFe/
 vECgX4nGVivHeZUPm+0JRv9HHN0fr4NRFS1z2lFLGz2NrPGka3iX3TUyhwp41EJs7Oh0
 k5Hw==
X-Gm-Message-State: ANhLgQ1SyiUaMzLYfsvre409YYPYyxP7yKRKNUP7470QUkE27xyPyiVd
 6C6Aize8sIkeIfDEdfZU56z6XL+7vRDJFNJeIFQ=
X-Google-Smtp-Source: ADFU+vsUh0GSV1fmijZM+XR756GX/z1rUZET+lQOxE8PLPedKlNLskTckJepG4QNbDBjGSzQq+NSK0d2t4IcdhIMfC0=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr4202066otk.155.1584955927793; 
 Mon, 23 Mar 2020 02:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-8-jniethe5@gmail.com>
 <1584945440.a20p67lxd6.astroid@bobo.none>
In-Reply-To: <1584945440.a20p67lxd6.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:31:56 +1100
Message-ID: <CACzsE9rsQA+HD-4zpdeMmBjEjavJUqHXh21cJKDv2Cf4syg0Gw@mail.gmail.com>
Subject: Re: [PATCH v4 07/16] powerpc: Introduce functions for instruction
 nullity and equality
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 5:46 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:18 pm:
> > In preparation for an instruction data type that can not be directly
> > used with the '==' operator use functions for checking equality and
> > nullity.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/kernel/optprobes.c      |  2 +-
> >  arch/powerpc/kernel/trace/ftrace.c   | 33 +++++++++++++++-------------
> >  arch/powerpc/lib/code-patching.c     | 16 +++++++-------
> >  arch/powerpc/lib/feature-fixups.c    |  2 +-
> >  arch/powerpc/lib/test_emulate_step.c |  4 ++--
> >  arch/powerpc/xmon/xmon.c             |  4 ++--
> >  6 files changed, 32 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> > index 1025a7a3b3a8..6027425a85f2 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -259,7 +259,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
> >                               (unsigned long)emulate_step_addr,
> >                               BRANCH_SET_LINK);
> >
> > -     if (!branch_op_callback || !branch_emulate_step)
> > +     if (ppc_inst_null(branch_op_callback) || ppc_inst_null(branch_emulate_step))
>
> Is an instruction null, or zeroes?
ppc_inst_zero() would probably be clearer.
>
> Oh, most of this comes from create_branch and things. Hmm, would rather
> see those functions modified to take a &insn and return an int err.
Good idea.
>
>
> > @@ -437,7 +438,7 @@ int ftrace_make_nop(struct module *mod,
> >        * then we had to use a trampoline to make the call.
> >        * Otherwise just update the call site.
> >        */
> > -     if (test_24bit_addr(ip, addr)) {
> > +     if (!ppc_inst_null(test_24bit_addr(ip, addr))) {
> >               /* within range */
> >               old = ftrace_call_replace(ip, addr, 1);
> >               new = PPC_INST(PPC_INST_NOP);
>
> test_24bit_addr shouldn't be passing a ppc_inst back, but a bool.
True.
>
> Thanks,
> Nick
