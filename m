Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC382639FE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 04:01:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL9Gv4V9Qz3fGP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 14:01:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gjKhbvfX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gjKhbvfX;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL9G11RZdz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 14:00:56 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id io19so8885301plb.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 19:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uy6YGRvritBEn7bclT/hIoz2EnIirTxb7QGEsJahbiA=;
        b=gjKhbvfXQdlhbcWLdiqNKEw5y/kyA4/xTNlZENReDq9eIko0//yhBrdyjer64FZ4aB
         iedxGXaMsFDVarBgUflbjCuH4wB/DmofGZn5HETmQwuMlm44zG9BrXxwHdW8CQqDfD0N
         VHij7FAiJAnbRgQ6hSBc7n3X+1poQCjQEk35ZEx1F3A4Xix0nb/uJCLMpqYxKaN/YBS9
         A8/7q5zEwMRBMLv4ysZgIc0gFU4vo2wJbAG9T3TJuDnh4C30n5Xp6pc+KN9t9E0yRB21
         M5OrLd3zX91Y5RfwSOqRShPoldEPnTqNAf8BLrDSDrAkAzFDBknPgpK8BxYa+K4ROMxa
         wNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy6YGRvritBEn7bclT/hIoz2EnIirTxb7QGEsJahbiA=;
        b=bnhMgOx/rIb2+CpD15idGjcMrQEG2uA7QgpB9idDvKU2qFleLvkAMmqKqdCe5b54MX
         Y/8oxNLEKyzgbjO9saRYLI+EdAkUrzcW7DiI6w8uEYTKZfoZ9DBTaR79RTQIlcNyw1u9
         GadKTvxnMITxM9lcfCA5sg5CsKS4mRP1tnFr5LqnEL/MTNq+4bvoRIDEDnyNEh39ndAn
         X/pfbS4C9yZFuwMChocd6bU6V+upklDcvhqTZEPGtYM4JMqFu4fARlE4OH5PSxss5c0l
         c4s0G1VqCesBQk1MG3GkrmADpgq6y2/me3d0NfZqhW+++OQQB+MbK+MneYmaHayXBMcV
         94Tg==
X-Gm-Message-State: ANoB5pncY+v/YdkLqhCTnLRxzbyF8uIm3KoWeDOodiEH6MLDKj3SLVGJ
	W/vtzLyHEbXA82J2Uc9Br2qtSEK+wYuJK7V14HM=
X-Google-Smtp-Source: AA0mqf5UceNhbskqkrInTTeM7JNyAeJ4fd1bbUXMgGB0F4x0sTmk0lrYfEl5b+pqU0vPJePueSwPdJjV36pzrHU/lIY=
X-Received: by 2002:a17:902:70c9:b0:176:a0cc:5eff with SMTP id
 l9-20020a17090270c900b00176a0cc5effmr38862278plt.128.1669604453468; Sun, 27
 Nov 2022 19:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20221121035140.118651-1-zhouzhouyi@gmail.com> <87y1rxwsse.ffs@tglx>
 <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
 <87v8n0woxv.ffs@tglx> <20221127175317.GF4001@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20221127175317.GF4001@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Mon, 28 Nov 2022 11:00:42 +0800
Message-ID: <CAABZP2zj4B4P4D+3g7M8jdKSaj5qBVHuGtGJcdmLAfzBZiva7g@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
To: paulmck@kernel.org
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
Cc: dave@stgolabs.net, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank you all for your guidance and encouragement!

I learn how to construct commit message properly and learn how
important the role
that the torture test framework plays for the Linux kernel. Hope I can
be of benefit to the community by my work.

I am going to continue to study this topic and study the torture test
framework, and wait for your further instructions.

Best Regards
Zhouyi
On Mon, Nov 28, 2022 at 1:53 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sun, Nov 27, 2022 at 01:40:28PM +0100, Thomas Gleixner wrote:
>
> [ . . . ]
>
> > >> No. We are not exporting this just to make a bogus test case happy.
> > >>
> > >> Fix the torture code to handle -EBUSY correctly.
> > > I am going to do a study on this, for now, I do a grep in the kernel tree:
> > > find . -name "*.c"|xargs grep cpuhp_setup_state|wc -l
> > > The result of the grep command shows that there are 268
> > > cpuhp_setup_state* cases.
> > > which may make our task more complicated.
> >
> > Why? The whole point of this torture thing is to stress the
> > infrastructure.
>
> Indeed.
>
> > There are quite some reasons why a CPU-hotplug or a hot-unplug operation
> > can fail, which is not a fatal problem, really.
> >
> > So if a CPU hotplug operation fails, then why can't the torture test
> > just move on and validate that the system still behaves correctly?
> >
> > That gives us more coverage than just testing the good case and giving
> > up when something unexpected happens.
>
> Agreed, with access to a function like the tick_nohz_full_timekeeper()
> suggested earlier in this email thread, then yes, it would make sense to
> try to offline the CPU anyway, then forgive the failure in cases where
> the CPU matches that indicated by tick_nohz_full_timekeeper().
>
> > I even argue that the torture test should inject random failures into
> > the hotplug state machine to achieve extended code coverage.
>
> I could imagine torture_onoff() telling various CPU-hotplug notifiers
> to refuse the transition using some TBD interface.  That would better
> test the CPU-hotplug common code's ability to deal with failures.
>
> Or did you have something else/additional in mind?
>
>                                                         Thanx, Paul
