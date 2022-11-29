Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426763B9F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 07:48:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLtFn2wTpz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 17:48:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z1sgeeVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z1sgeeVv;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLtDt5RL6z2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 17:47:26 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id b11so11777085pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 22:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHS9z2qPXyQhSZFAwUELeOFhNItD6grVp08Zd8wCTEg=;
        b=Z1sgeeVvacDBikWek3xQ6Gcj6rzK4LroXLsxYJlh9daFvYmtBka6E0peNjFEyeg+os
         5EzjxI9BfmpFeL2iogMDVaBAtOQjKBj/f+m9QyLahiUd/6GFYwzC80MFPZjCRgiD5T6P
         P/LvJx2g8E2MTVK4hTHsQ2beqz7G5REjZifsbLgpZaNRrIJSpcsEJIl9En4SiYtTeL0g
         7BPSA8/i65wCcvSjwuR7Nza0llF1I4UZqDQ555X3mPo6dr6VW0XQ2Hq+MeFQ4jk70nxL
         jVUQKCi0La8Q5fikm1yjPnHPtt+oSSJ+TLp+GLv6aUQ9wDG3SHyFxVlUn0PWiLHkPjkS
         SAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHS9z2qPXyQhSZFAwUELeOFhNItD6grVp08Zd8wCTEg=;
        b=LvGWTKnMg5lzdJQCluGT9tjThGNjR6mQgyk1ZUkvG+fCHhCNKq9MzCiVgKCMai2adH
         KTxWC9SFGJ53vg4RHwe5NdZ4k7R+7vihThZ89S+PPg/KShqS4wT6J0yQKm8lyjvs3BEB
         rcL6n3l8sC9E3kOEIoJbJUsCBmDNoIgcY7M7m6kn/yZCj880wW8Bu75iHAHOYM4RLVno
         AOtWiLqGzGKSOmGBoldienpLK5btOntFVdcA36GlDq5g5IfXMwT3yOIev5Rh+4MC1eNe
         9v3c1vp01cziOuB9FRF2Z6OGJGqYtX+pt2V3sbu5OiUBDVykt/qDerRBSm61N0sf2+tl
         9k+w==
X-Gm-Message-State: ANoB5pmV+qLrAihkeKH9F45zBeZllBktJa/K7XI9Uz9xvumO2tvuC7Od
	SA0RzYDAo8slbToHhxA6Bk7Tq50AAPY=
X-Google-Smtp-Source: AA0mqf46su46WBRr6waj2byBjVRwDjCdCL6oD+5xIfFKP6A3TR9Y3ed4GFnx9OMVYC0tUIeGBz7FWQ==
X-Received: by 2002:a17:902:a703:b0:188:f47f:c82c with SMTP id w3-20020a170902a70300b00188f47fc82cmr44236445plq.34.1669704443779;
        Mon, 28 Nov 2022 22:47:23 -0800 (PST)
Received: from localhost ([1.146.90.162])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b00186acb14c4asm10043505plg.67.2022.11.28.22.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 22:47:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 16:47:17 +1000
Message-Id: <COOKTPAPKWXZ.2GIUNVQ3HOF6C@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 13/13] powerpc/rtas: place tracepoints in
 do_enter_rtas()
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-14-nathanl@linux.ibm.com>
 <CONLJ0VXR77H.JM4D75GQAF62@bobo> <87tu2i8x0e.fsf@linux.ibm.com>
In-Reply-To: <87tu2i8x0e.fsf@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 29, 2022 at 9:44 AM AEST, Nathan Lynch wrote:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>
> > On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> >> Call the just-added rtas tracepoints in do_enter_rtas(), taking care
> >> to avoid function name lookups in the CPU offline path.
> >>
> >> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> >> ---
> >>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> >> index 198366d641d0..3487b42cfbf7 100644
> >> --- a/arch/powerpc/kernel/rtas.c
> >> +++ b/arch/powerpc/kernel/rtas.c
> >> @@ -38,6 +38,7 @@
> >>  #include <asm/page.h>
> >>  #include <asm/rtas.h>
> >>  #include <asm/time.h>
> >> +#include <asm/trace.h>
> >>  #include <asm/udbg.h>
> >> =20
> >>  enum rtas_function_flags {
> >> @@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
> >>  static void do_enter_rtas(struct rtas_args *args)
> >>  {
> >>  	unsigned long msr;
> >> +	const char *name =3D NULL;
> >> =20
> >>  	/*
> >>  	 * Make sure MSR[RI] is currently enabled as it will be forced later
> >> @@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
> >> =20
> >>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
> >> =20
> >> +	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
> >> +		/*
> >> +		 * rtas_token_to_function() uses xarray which uses RCU,
> >> +		 * but this code can run in the CPU offline path
> >> +		 * (e.g. stop-self), after it's become invalid to call
> >> +		 * RCU APIs.
> >> +		 */
> >
> > We can call this in real-mode via pseries_machine_check_realmode
> > -> fwnmi_release_errinfo, so tracing should be disabled for that
> > case too... Does this_cpu_set_ftrace_enabled(0) in the early
> > machine check handler cover that sufficiently?
>
> I suspect so, but I'd like to verify. Do you know how I could exercise
> this path in qemu or LPAR?

I have some machine check injection patches for qemu but they never got
merged... I can point you to them if you need.

Should try get those merged again.

Thanks,
Nick
