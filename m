Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758B5BDAFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 05:52:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWngf1t6kz3bN6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 13:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O2O5MQHZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O2O5MQHZ;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWng10lmDz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 13:52:11 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id e5so1565047pfl.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=Y5ta4QdyeXNtfSOMpNLsSzxGDlEKG54VPWWrX/O8jbw=;
        b=O2O5MQHZ/zBUV4FzZVwqUp50ucmQykdPspsjZ89VAotp7Asne0Ty93/d8HbiZYmLiY
         t3lH/xtShruuPmJsAnf8dq4vscG3oM+vgQeLSwxoBWqZdjimpEtpjJIy4eut4UPLrx/I
         z5CO6e2PFqDJqFQJTY6VLmVGBq6nd+0ycGGQN5UY+fi+MWjnAFFo+wlHqM63JW3WV4DC
         xrMxgzrZqEQ8T5AMkUyho5p+8marCtL1LdhH6e6OHBlFIGRMyHJnEm3vN4sZNivDKHc8
         KYGaMTWKja++t4YF+QV8/36otVoQvCSk676XYE5C7GeHPH8JoEdSqHuqwEYgvlZUzpMB
         HDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=Y5ta4QdyeXNtfSOMpNLsSzxGDlEKG54VPWWrX/O8jbw=;
        b=IPjrozYaW3h6cx2eJIWsta6bwm4txOOYhQTsDsPoPz61u5X1HCy4trNBGp2MPrDwPM
         aaNrOywvolmsXcBRfbbhYcKePLJAhAaz55ywt4oBmksjDaqQ2Lb74q94IjyTGspc5dP8
         p8XqB6qv5+/Ij/45NsLNJqtzDLdq5jFfRxm4vPvbA3WbNP3bUElTPfwNzE4jwc2MGZIq
         bwo7Jjn0c8k+szYBpXcf+NUe+vike782lhzzCd2y7AhNBH3t1XePKTkLBOcxJGrpgHjd
         Em0CPiOiiicz2Pj0Oq3x5s1Goduc+luyn2OsxCXkM3v9OYhxUuRSbSo+EN0kCiP5zmLM
         iQzQ==
X-Gm-Message-State: ACrzQf3Uq9NnI7qEj+82ICLZg64mEPxncmB0RkRJr8a5zeOLtZNxxLTR
	xxjzX/8cHyQVN0U8yGuSFu6LR8ubP+0=
X-Google-Smtp-Source: AMsMyM75wIDBbFQwKCCvmH6yL8oH9JpVJA01Fx3q8PdYM75zrnTxIHaMmzxNTxEGXVZsFUHlZgTiSg==
X-Received: by 2002:a63:4965:0:b0:439:7a97:383c with SMTP id y37-20020a634965000000b004397a97383cmr18242670pgk.462.1663645926352;
        Mon, 19 Sep 2022 20:52:06 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id 20-20020a631154000000b0041d6d37deb5sm220797pgr.81.2022.09.19.20.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 20:52:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 13:51:59 +1000
Message-Id: <CN0X9CSRA9D7.ZZVYTCRQ0EWE@bobo>
Subject: Re: [PACTH v2] powerpc/pseries/mce: Avoid instrumentation in
 realmode
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Ganesh" <ganeshgr@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
 <CMPVP7RZXP5G.2D3ZNQPWARIG8@bobo>
 <895f4387-582a-6d60-a176-e2112f506e12@linux.ibm.com>
In-Reply-To: <895f4387-582a-6d60-a176-e2112f506e12@linux.ibm.com>
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
Cc: mahesh@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Sep 19, 2022 at 4:03 PM AEST, Ganesh wrote:
> On 9/7/22 09:49, Nicholas Piggin wrote:
>
> > On Mon Sep 5, 2022 at 4:38 PM AEST, Ganesh Goudar wrote:
> >> Part of machine check error handling is done in realmode,
> >> As of now instrumentation is not possible for any code that
> >> runs in realmode.
> >> When MCE is injected on KASAN enabled kernel, crash is
> >> observed, Hence force inline or mark no instrumentation
> >> for functions which can run in realmode, to avoid KASAN
> >> instrumentation.
> >>
> >> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
> >> ---
> >> v2: Force inline few more functions.
> >> ---
> >>   arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
> >>   arch/powerpc/include/asm/interrupt.h | 2 +-
> >>   arch/powerpc/include/asm/rtas.h      | 4 ++--
> >>   arch/powerpc/kernel/rtas.c           | 4 ++--
> >>   4 files changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/=
asm/hw_irq.h
> >> index 26ede09c521d..3264991fe524 100644
> >> --- a/arch/powerpc/include/asm/hw_irq.h
> >> +++ b/arch/powerpc/include/asm/hw_irq.h
> >> @@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
> >>   #ifdef CONFIG_PPC64
> >>   #include <asm/paca.h>
> >>  =20
> >> -static inline notrace unsigned long irq_soft_mask_return(void)
> >> +static __always_inline notrace unsigned long irq_soft_mask_return(voi=
d)
> >>   {
> >>   	return READ_ONCE(local_paca->irq_soft_mask);
> >>   }
> >> @@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_=
return(void)
> >>    * for the critical section and as a clobber because
> >>    * we changed paca->irq_soft_mask
> >>    */
> >> -static inline notrace void irq_soft_mask_set(unsigned long mask)
> >> +static __always_inline notrace void irq_soft_mask_set(unsigned long m=
ask)
> >>   {
> >>   	/*
> >>   	 * The irq mask must always include the STD bit if any are set.
> > This doesn't give a reason why it's __always_inline, and having the
> > notrace attribute makes it possibly confusing. I think it would be easy
> > for someone to break without realising. Could you add a noinstr to thes=
e
> > instead / as well?
>
> Yeah we can add noinstr. Missed to see your comment, Sorry for the delaye=
d reply

Okay that would be good. I would prefer to avoid changing the
inline-ness of things in a fix patch if possible.
>
> >
> > What about adding a 'realmode' function annotation that includes noinst=
r?
>
> You mean to define a new function annotation?

Yes, a powerpc specific one that has the necessary adjustments. I
think it would be helpful documentation for the code and possibly
something we could use to do additional debug checking with at
some point too.

Thanks,
Nick
