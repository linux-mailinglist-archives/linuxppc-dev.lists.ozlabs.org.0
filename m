Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C336633DE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 23:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrT3F6Ht4z3cCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:22:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iZkHJUsy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iZkHJUsy;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrT2K6y4Gz3c3m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 09:22:00 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso14421113pjt.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 14:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lYRWg/J0ttDlaWM6UjZHnwN9ihNosYMSn3gAowHT2M=;
        b=iZkHJUsyXNwcsEHrsbTJYu+zqyvldkM3q+Jfocy7lLDq1f7yOgQS1qKFoy5t4X5pG9
         Lf/ZF8NRkoj5rP8ngrUbICNDbgpVxXPWsloJhs+CgsIOpuTXQJYx9vidSOSymo+S/Ije
         ZRdYM3E+gr4cegsnPR9y6mWYIIos6agegktTw69vzRhPWvB31/70485UOuHiIZt7kvKI
         SBA2Oyi6BTPPCUvJIXk/eECcarBR62uD3hPBv+usIaj97tq7BVt+dtDkYzmI7cQtyels
         t9bd4Aphg7YAQPz0VZdAi/yap0q2tswAhG4V+3glGwKWobeSKDbnEQsQ3A5njX97VoCm
         NCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lYRWg/J0ttDlaWM6UjZHnwN9ihNosYMSn3gAowHT2M=;
        b=0Vvzvhilrb61PoW3zIKvZkCDeyLPHP/DhYQD72He9FoEH7+6Y3ppveDOgpNQvFIhuX
         oKRtcnJ/8myW5+di3wblqvtivtDet90Yzg6VnK0zLxzZpQLfSgrbPNwTpv6u2CdaqiVs
         QjmByGgxE9EqHV5zQoWCymiKXGnyhWYHZOTOke4g9a2ocWlFNLeBaap9xEGNNzY65uVf
         +8pUTz/PPOmWAb0GsUgbSc2y/EHdr7TS2ttsoX+MjubiUW8kvezCjbsBCUIGxKYLa/FN
         B+EWujs+gHDqzrwG3kEqU0LH3g7OndbONNP2HtrIaJGR5sact9CexVYuXDgpQ4+hehi2
         +8UA==
X-Gm-Message-State: AFqh2krXkWpBIN4SYl4BxoQSyIdXNnMVRwgeQuk6JWGeHn/CjoehHEt+
	Rhfd6DC3vLcR6kIFwjPt22jTis6DyWeIVmkmjXSOiw==
X-Google-Smtp-Source: AMrXdXucbZiJrH1ZgxnLhDID88TWaIKL8fHclfX+Cw9XnW12o2dLaMix9Djfz5cY+2Sta5hP/Ikhd0ti7JTVF7GsPaw=
X-Received: by 2002:a17:902:c94d:b0:191:24d1:3b31 with SMTP id
 i13-20020a170902c94d00b0019124d13b31mr2860808pla.94.1673302917777; Mon, 09
 Jan 2023 14:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
In-Reply-To: <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:21:46 -0800
Message-ID: <CAKwvOdn5Wmi+b7x9DniE0=aCqFfLFwusAi2Ny-bfMNfncp5dUg@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 9, 2023 at 2:15 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > > is unused.
> > >
> > >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > >
> > > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > > and it is ignored for the powerpc target so just drop the flag
> > > altogether, as it is not needed.
> >
> > Do you have any more info where you found this?  I don't see -s
> > documented as an assembler flag.
> > https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> > https://sourceware.org/binutils/docs/as/Invoking.html
>
> Sure thing, sorry I did not include it initially. See the section from
> line 1284 to 1291 or search for "case 's':":
>
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-ppc.c;h=9450fa74de1b61542c9a18babf8c8f621ef904fb;hb=HEAD
>
> > The patch seems fine to me, but what was this ever supposed to be?
> > FWICT it predates git history (looking at
> > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
>
> Right, I could not figure it out either, it has been there since the
> vDSO was introduced back in 2005 (I was three days away from 10!) and
> there is no comment about it so *shrug*:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=054eb7153aeb84cc92da84210cf93b0e2a34811b
>
> If someone else's archeological skills are better and can provide more
> information, I am happy to include that.
>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Thanks as always for the review! I'll include this and a note about
> where in binutils I found that information for v2.

Yeah, I think the comment from binutils sources would be good to add
to a v2 commit message. Thanks!


-- 
Thanks,
~Nick Desaulniers
