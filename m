Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2961F33B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Vtr486nz3dtw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gTRDjg8J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gTRDjg8J;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5Vst5LBWz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:29:38 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id k7so10914786pll.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 04:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2X8WhWV7sHuTI5yM30XZFwxAaegBC0+t1ruBtthnfnI=;
        b=gTRDjg8JImtjvF33xgKotleK2bx1JphAUadnyauwOfXiZv0Pq62JYhfeqN7PFulD8T
         wbVQwl4/NLh6PJ+qTOgJxK0IHFsJSeTqlD6yFf3Cq12/B/olxzLcxQr3Uid+oslH9kSm
         XkxuY/F+Jr7ZUOUEESbvaH3KRTLaafmDPDnQKjOdQAPSSndK7pwxL7l/ixm6Raqungos
         7AOAbNotIjb/CVHI9NcLEE6o3y1E7WORj7pUGpwItD+ows2lGvSxz2VguXCOYQnzTFIQ
         EYub8usCMu6DWF8eQ2l/vnasCNlQ4at89nR/6SOGlM2LlG284U2aQozKGr/khPXOC2BK
         M2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2X8WhWV7sHuTI5yM30XZFwxAaegBC0+t1ruBtthnfnI=;
        b=dhFIa2YOEe5XtcTvLqrEef216qBSZUYUxlvaFCB48nCBylM8BS6luur87PvYBFh/IE
         L6IG7Prp3SnnatZ+1gVeIHbO6Q1UORugL/rmMAk0y4aCYMsYA/IS1dwJBXfdEsjlCxeX
         zFK2tTBAvAKZVAKAJoJZfCb7ucAJ/qT0aywHlytmfQccd4Wr+aB6ymjRIVlPYDg7i56y
         9Ebz/jfkSWrHlrOBBARSiKCJ4meN8H9LV+C8EPmr8Quzd4oz2WquePLfWlNuQC3SSLOh
         rDVoFDXz5eTQvQYy2qwbgYkJS3xxOglT+RE1jpXYeJ/lOPsENNYwVN1G3w5iiZqElNqn
         SWTA==
X-Gm-Message-State: ACrzQf279AHMHFfDn++SsWLZgHqP6PZ1RtWkB4/ntY39afbSslXYITte
	/4W6Ua79x71mlFnmQoifpxlg58YWxnY=
X-Google-Smtp-Source: AMsMyM5YYU8foQ0UgySPs83S4GHhKj8pDLTnGy0yyFNkTT1cDSh3VdBL3ZYM9udZAtFMOz3QjWxamg==
X-Received: by 2002:a17:902:690a:b0:17a:32d:7acc with SMTP id j10-20020a170902690a00b0017a032d7accmr50906086plk.18.1667824175757;
        Mon, 07 Nov 2022 04:29:35 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id q23-20020a63cc57000000b0046f6d7dcd1dsm4094406pgi.25.2022.11.07.04.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:29:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 22:29:31 +1000
Message-Id: <CO62BR5B1ODI.23N0I58THF6O2@bobo>
Subject: Re: [RFC PATCH 14/19] powerpc: split validate_sp into two functions
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Russell Currey" <ruscur@russell.cc>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221031055440.3594315-1-npiggin@gmail.com>
 <20221031055440.3594315-15-npiggin@gmail.com>
 <8bed40278721e31ce89d0d2f82d926ed7b1e5717.camel@russell.cc>
In-Reply-To: <8bed40278721e31ce89d0d2f82d926ed7b1e5717.camel@russell.cc>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 7, 2022 at 10:58 AM AEST, Russell Currey wrote:
> On Mon, 2022-10-31 at 15:54 +1000, Nicholas Piggin wrote:
> > Most callers just want to validate an arbitrary kernel stack pointer,
> > some need a particular size. Make the size case the exceptional one
> > with an extra function.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> > =C2=A0arch/powerpc/include/asm/processor.h | 15 ++++++++++++---
> > =C2=A0arch/powerpc/kernel/process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 23 ++++++++++++++---------
> > =C2=A0arch/powerpc/kernel/stacktrace.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> > =C2=A0arch/powerpc/perf/callchain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 6 +++---
> > =C2=A04 files changed, 30 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/processor.h
> > b/arch/powerpc/include/asm/processor.h
> > index 631802999d59..e96c9b8c2a60 100644
> > --- a/arch/powerpc/include/asm/processor.h
> > +++ b/arch/powerpc/include/asm/processor.h
> > @@ -374,9 +374,18 @@ static inline unsigned long __pack_fe01(unsigned
> > int fpmode)
> > =C2=A0
> > =C2=A0#endif
> > =C2=A0
> > -/* Check that a certain kernel stack pointer is valid in task_struct
> > p */
> > -int validate_sp(unsigned long sp, struct task_struct *p,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng nbytes);
> > +/*
> > + * Check that a certain kernel stack pointer is a valid (minimum
> > sized)
> > + * stack frame in task_struct p.
> > + */
> > +int validate_sp(unsigned long sp, struct task_struct *p);
> > +
> > +/*
> > + * validate the stack frame of a particular minimum size, used for
> > when we are
> > + * looking at a certain object in the stack beyond the minimum.
> > + */
> > +int validate_sp_size(unsigned long sp, struct task_struct *p,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nbytes);
> > =C2=A0
> > =C2=A0/*
> > =C2=A0 * Prefetch macros.
> > diff --git a/arch/powerpc/kernel/process.c
> > b/arch/powerpc/kernel/process.c
> > index 6cb3982a11ef..b5defea32e75 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -2128,9 +2128,12 @@ static inline int
> > valid_emergency_stack(unsigned long sp, struct task_struct *p,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0}
> > =C2=A0
> > -
> > -int validate_sp(unsigned long sp, struct task_struct *p,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nby=
tes)
> > +/*
> > + * validate the stack frame of a particular minimum size, used for
> > when we are
> > + * looking at a certain object in the stack beyond the minimum.
> > + */
> > +int validate_sp_size(unsigned long sp, struct task_struct *p,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nbytes)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long stack_pag=
e =3D (unsigned long)task_stack_page(p);
> > =C2=A0
> > @@ -2146,7 +2149,10 @@ int validate_sp(unsigned long sp, struct
> > task_struct *p,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return valid_emergency_=
stack(sp, p, nbytes);
> > =C2=A0}
> > =C2=A0
> > -EXPORT_SYMBOL(validate_sp);
> > +int validate_sp(unsigned long sp, struct task_struct *p)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return validate_sp(sp, p, ST=
ACK_FRAME_OVERHEAD);
>
> Hi Nick, I assume this supposed to be validate_sp_size()?  Did you get
> this to compile?

Oops, yeah I think I sent a slightly stale version of the series. I
did fix that one.

Thanks,
Nick
