Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC06F351B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 19:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q99Qt1Y6pz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 03:37:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SGPtOfZh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SGPtOfZh;
	dkim-atps=neutral
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q99Q06cHlz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 03:37:10 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-192798cf019so252340fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682962621; x=1685554621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+RNUTojqcUPndVpyqWpOuSnVDmC59OYTbJVhd//Jx0=;
        b=SGPtOfZhdGUU+ZHCjhpogENmGlqcrIFsO6IC4j1rJnJx+z+oeXxEkSakgTSWTyah4V
         qY+luQRpB0/HVcObyTBRx9o9YUZtdL6aqGVdZnDhnyQgGderOLZh0bq1Kk7hJfj0QIT7
         s8Uur9IZEoJfpREXxKL+8POpgmqyWL4HXPmLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682962621; x=1685554621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+RNUTojqcUPndVpyqWpOuSnVDmC59OYTbJVhd//Jx0=;
        b=OnVConaQK80BfL0ZKqgmnXN61iC8mcst3iuxKc/MvdEVvI+CmGpbCsu3OznZbDZnxl
         gXsVVZCK5oUfcW/sg9GDeUv5xS90Id5aoOG1JBgaF+Xyejglu1LhdNPgILQ/N8TOH2Wp
         GFpZLe38Md8o6ferJjcl7l7RKt7/63A+vr9wKipo7eF8tAdb5iKhYSvGu2a2BKpOC0cM
         rluSJf7BJ/gI6EgZRSf8mYbL/jBgGigY+VKErirhQuDigHb/KXtgpsXTd2LCPRtEXAJK
         j5mBoRdsL/adHfy3/H8s9StG6XuSnAeoRu4RwiiIBRLs7meGumKwTxHKfo1vLYG1VAdy
         f75A==
X-Gm-Message-State: AC+VfDz+Cbj08UqppdjkWwvQKc6C+NdEgRixsESCLKYiyV3RNeBPyBxp
	sFVZv8XupsGMHL9QF5LfdyP7OQrgu+/YYPhOfIThSw==
X-Google-Smtp-Source: ACHHUZ5XzcsgAa8GRXX68+uk50EPEHzWzbahgcaCtdc/PGcv5jrhheXxLvqaLlUQRPt9BEfvzskSXw==
X-Received: by 2002:a05:6870:a403:b0:187:9236:5ac9 with SMTP id m3-20020a056870a40300b0018792365ac9mr7781137oal.8.1682962621523;
        Mon, 01 May 2023 10:37:01 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id a3-20020a056870618300b001723f29f6e2sm10624235oah.37.2023.05.01.10.37.01
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 10:37:01 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-38e7ce73ca0so1713724b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 10:37:01 -0700 (PDT)
X-Received: by 2002:a17:90a:1543:b0:24b:2f97:9208 with SMTP id
 y3-20020a17090a154300b0024b2f979208mr14865070pja.0.1682962600487; Mon, 01 May
 2023 10:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org> <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
 <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com> <20230501-griminess-defiling-73b367bb2e47@spud>
In-Reply-To: <20230501-griminess-defiling-73b367bb2e47@spud>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 May 2023 19:36:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCsKKh7pSbYRu6=EbF4PL5UXk5gYpDTk3KzjzW9ni5Hc2g@mail.gmail.com>
Message-ID: <CANiDSCsKKh7pSbYRu6=EbF4PL5UXk5gYpDTk3KzjzW9ni5Hc2g@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Conor Dooley <conor@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Conor

Fixed on my branch
https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=
=3Db4/kexec_clang16&id=3D1e9cda9fa638cc72581986f60b490cc069a38f75


Will submit a new version after a while :)

Thanks!

On Mon, 1 May 2023 at 19:28, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, May 01, 2023 at 07:18:12PM +0200, Ricardo Ribalda wrote:
> > On Mon, 1 May 2023 at 18:19, Nick Desaulniers <ndesaulniers@google.com>=
 wrote:
> > >
> > > On Mon, May 1, 2023 at 5:39=E2=80=AFAM Ricardo Ribalda <ribalda@chrom=
ium.org> wrote:
> > > >
> > > > If PGO is enabled, the purgatory ends up with multiple .text sectio=
ns.
> > > > This is not supported by kexec and crashes the system.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_pu=
ragory")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > Hi Ricardo,
> > > Thanks for the series.  Does this patch 4/4 need a new online commit
> > > description? It's not adding a linker script (maybe an earlier versio=
n
> > > was).
>
> > Thanks for catching this. It should have said
> >
> > risc/purgatory: Remove profile optimization flags
>      ^^
> Perhaps with the omitted v added too?
>
> Also while playing the $subject nitpicking game, is it not called
> "profile**-guided** optimisation" (and ditto in the comments)?
>
> Cheers,
> Conor.
>
> > Will fix it on my local branch in case there is a next version of the
> > series. Otherwise, please the maintainer fix the subject.
>
> > > > ---
> > > >  arch/riscv/purgatory/Makefile | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/M=
akefile
> > > > index 5730797a6b40..cf3a44121a90 100644
> > > > --- a/arch/riscv/purgatory/Makefile
> > > > +++ b/arch/riscv/purgatory/Makefile
> > > > @@ -35,6 +35,11 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
> > > >  CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
> > > >  CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> > > >
> > > > +# When profile optimization is enabled, llvm emits two different o=
verlapping
> > > > +# text sections, which is not supported by kexec. Remove profile o=
ptimization
> > > > +# flags.
> > > > +KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile=
-use=3D%,$(KBUILD_CFLAGS))
> > > > +
> > > >  # When linking purgatory.ro with -r unresolved symbols are not che=
cked,
> > > >  # also link a purgatory.chk binary without -r to check for unresol=
ved symbols.
> > > >  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
> > > >
> > > > --
> > > > 2.40.1.495.gc816e09b53d-goog
> > > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> >
> >
> >
> > --
> > Ricardo Ribalda
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



--=20
Ricardo Ribalda
