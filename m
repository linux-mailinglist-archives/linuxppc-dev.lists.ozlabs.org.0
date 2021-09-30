Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A621C41D3CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 09:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKkfS46gzz2yxV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 17:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dp3NXw2A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dp3NXw2A; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKkdl3M7Mz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 17:00:10 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id z5so11004299ybj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 00:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hVec02aseOIaBrE6C4Ji1tsrfwWvMCxPkFYIxijXUys=;
 b=dp3NXw2Ad9fXRH8ezoPS6dj5V3dN81hc26Fnymh6osffPdpU7RzswbWYDEh4JkaxxM
 Fa2j/0rGbL95zVDPxJeNkZJ0iLCLSiSIuX53KYwaCUofgASN0qIb3ByIWYKQDNPey3XF
 Wa0lbbyKBZmSiCMjK9b7Gm/qQptINAMxYzx8DbdSOi0bi2wQbaIBGmFyhwwWtC6Mwq9z
 TsGim7Ujui62rD8NZCwvjJS9dfpeOLfAR+6kuq7jOnNgUgQzcOY5ujEnVLs0Xms54zbx
 hHJM9bk7cnoyPRGg7r8MI43QCrbA8le5RqsxaEhSqyTf+RMfKctMM3OmtR17kUEjsD9Q
 cMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVec02aseOIaBrE6C4Ji1tsrfwWvMCxPkFYIxijXUys=;
 b=Ss1ndk5nN5YBzuarZG3AK9ZNFlt4MTIzGHGbjhmC4131iCp3jKuPLSHo8UQeUjt4dU
 ejTrt3XbSDHePmNi8v9Lo316RRuUCE9aTf4oCviYBx7A4cECWj8MQBUXWbEE3nwVCOSr
 ozm5Cwskm/2NwhP+A1YQoiInc7AkIaHWBgTuy+Ou52/p1shpFyvxbC/5UzYKMCDBvBy7
 /euyNoPsSm+As05FQ9dpIJJYbH6c/rxUfcYgD9tjybNFXKlcexKou0I0u76Rwd3KhfdL
 c/ly8cYj00HauNsOAdM64GTNm1Klqo3M0Ls30Y1Z+/gvLQ6XtwkmyRcRDRqGyV4brbEt
 /QZw==
X-Gm-Message-State: AOAM530drj3hpRfrkCZX2k7w21DgkpnwzSITVh/fcKgQnXM1lccvCPPE
 I7ZHHaHVgdiM7csxit7khTOnBRbwLMaBqR0IEUQ=
X-Google-Smtp-Source: ABdhPJyec1yTSDFS1m3xyNy2AmbKdBwuWH54CD1U1mhqSifiyghz44dBGd18AzcnDJu0TfgG+6rSQ/ec4BxmCmG0fL0=
X-Received: by 2002:a25:2208:: with SMTP id i8mr4951754ybi.86.1632985207035;
 Thu, 30 Sep 2021 00:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210923151031.72408-1-mpe@ellerman.id.au>
 <87bl4a6182.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87bl4a6182.fsf@dja-thinkpad.axtens.net>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 30 Sep 2021 16:59:55 +1000
Message-ID: <CACzsE9q7Po-Pcc8nPyP8RyNFZ4M9tYUUO8aVJKXF_QBwO0uVLQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Use GLOBAL_TOC for
 kvmppc_h_set_dabr/xdabr()
To: Daniel Axtens <dja@axtens.net>
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
Cc: Michael Neuling <mikey@neuling.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 30, 2021 at 4:13 PM Daniel Axtens <dja@axtens.net> wrote:
>
> Hi Michael,
>
> > kvmppc_h_set_dabr(), and kvmppc_h_set_xdabr() which jumps into
> > it, need to use _GLOBAL_TOC to setup the kernel TOC pointer, because
> > kvmppc_h_set_dabr() uses LOAD_REG_ADDR() to load dawr_force_enable.
>
> This makes sense. LOAD_REG_ADDR() does ld reg,name@got(r2) and
> _GLOBAL_TOC sets r2 based on r12 and .TOC. .
>
> Looking at
> e.g. https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1610846.html
> it seems that we use GOT and TOC largely interchangeably... so assuming
> I haven't completely misunderstood, the change this patch makes seems to
> make sense to me. :)
>
> > When called from hcall_try_real_mode() we have the kernel TOC in r2,
> > established near the start of kvmppc_interrupt_hv(), so there is no
> > issue.
> >
> > But they can also be called from kvmppc_pseries_do_hcall() which is
> > module code, so the access ends up happening with the kvm-hv module's
> > r2, which will not point at dawr_force_enable and could even cause a
> > fault.
>
> I checked and there isn't anywhere else the functions are called, so
> this will now cover everything.
>
> > With the current code layout and compilers we haven't observed a fault
> > in practice, the load hits somewhere in kvm-hv.ko and silently returns
> > some bogus value.
> >
> > Note that we we expect p8/p9 guests to use the DAWR, but SLOF uses
> > h_set_dabr() to test if sc1 works correctly, see SLOF's
> > lib/libhvcall/brokensc1.c.
>
> I assume that something (the module loader?) patches the callsite to
> restore r2 after the function call? I imagine something must otherwise
> things would fall apart pretty quickly...
>
> > Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
>
> That patch seems to only affect the DA_W_R not the DA_B_R - how does it
> cause this bug?

Isn't it that patch which adds the LOAD_REG_ADDR(r11,
dawr_force_enable) to kvmppc_h_set_dabr() which is the problem?

>
> All in all this looks good to me:
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>
> Kind regards,
> Daniel
>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index 90484425a1e6..30a8a07cff18 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -1999,7 +1999,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
> >       .globl  hcall_real_table_end
> >  hcall_real_table_end:
> >
> > -_GLOBAL(kvmppc_h_set_xdabr)
> > +_GLOBAL_TOC(kvmppc_h_set_xdabr)
> >  EXPORT_SYMBOL_GPL(kvmppc_h_set_xdabr)
> >       andi.   r0, r5, DABRX_USER | DABRX_KERNEL
> >       beq     6f
> > @@ -2009,7 +2009,7 @@ EXPORT_SYMBOL_GPL(kvmppc_h_set_xdabr)
> >  6:   li      r3, H_PARAMETER
> >       blr
> >
> > -_GLOBAL(kvmppc_h_set_dabr)
> > +_GLOBAL_TOC(kvmppc_h_set_dabr)
> >  EXPORT_SYMBOL_GPL(kvmppc_h_set_dabr)
> >       li      r5, DABRX_USER | DABRX_KERNEL
> >  3:
> > --
> > 2.25.1
