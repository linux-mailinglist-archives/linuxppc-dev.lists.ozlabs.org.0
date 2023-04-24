Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB46ED4EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 20:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4vVP1dSgz3cJG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 04:56:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=IGjUxbT7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=IGjUxbT7;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4vTY3sTcz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 04:55:28 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54f9b37c634so58020557b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682362523; x=1684954523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+OurL083Y0c7KcWuiM8+QJcAaGH1Ky8yKAH2N6jmoc=;
        b=IGjUxbT7u2aSvTarjgGfvCfroYNT55WCysowQjHYPRa2hsHqrIV3OadCNlyHtELr9c
         0rr4fIruJvnpyMdCGFIKrWrfoe89L5D5M/e8cXeHhj2p/B60yfqV8ulddcFu61rSKE3a
         OM8BiAvVw7M/eJ96SVn6xXCT+T9iUqLnoGbBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362523; x=1684954523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+OurL083Y0c7KcWuiM8+QJcAaGH1Ky8yKAH2N6jmoc=;
        b=DvKuxeCOM35hCaD7FYrXa/RLmTwMXIRLLjKenKE2OoyVBZUhyah3k5mLOaYL+apa0g
         SKIdbKLIeP8CHUwlgq6EKff67kze38Bgw5aq5BhH+KfnA+qvLHHM+vVnZihOFjhOnzZ5
         7gpQ/FWpnsOuusG9pLNuyuK6mV7L7UzKlviw+aYikmh0YwUNhJtnd0x4EFBvFMQEI5sN
         oeXtDSBRuIkGIHXn4243Pn7pxsT+FIYsgLs6uxk3CcYaykaPyswF7WG0pPtDGW1EMjxO
         QtGrZY5Qs8yKQ9AMiqQ2xm4dY/Milzc2T25YSI0P0xcA+TqFfJYLua49jBnCRWC0pT4+
         tfVQ==
X-Gm-Message-State: AAQBX9eK2ODWdY//AY+ef3G2iDxVUlC7+a7Be9jYSE/4YQWB7dqbFsJG
	dphTYR1rnPOaWaxEIAjlUDojmbcv4+y2C5mpP5TEbw==
X-Google-Smtp-Source: AKy350aoe2Cg48zE3WTOUfu7kvGjK5v9r+0PwXZqQIgRDlnb/sqo4ljedyjlVhmhjgkFZt6oSOdWn0hsMSQrP78RGPg=
X-Received: by 2002:a81:4f12:0:b0:541:66e8:d4da with SMTP id
 d18-20020a814f12000000b0054166e8d4damr8695111ywb.29.1682362523439; Mon, 24
 Apr 2023 11:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
In-Reply-To: <ZEagN1jJwg+rUzX4@boqun-archlinux>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 24 Apr 2023 14:55:11 -0400
Message-ID: <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is amazing debugging Boqun, like a boss! One comment below:

> > > Or something simple I haven't thought of? :)
> >
> > At what points can r13 change?  Only when some particular functions are
> > called?
> >
>
> r13 is the local paca:
>
>         register struct paca_struct *local_paca asm("r13");
>
> , which is a pointer to percpu data.
>
> So if a task schedule from one CPU to anotehr CPU, the value gets
> changed.

It appears the whole issue, per your analysis, is that the stack
checking code in gcc should not cache or alias r13, and must read its
most up-to-date value during stack checking, as its value may have
changed during a migration to a new CPU.

Did I get that right?

IMO, even without a reproducer, gcc on PPC should just not do that,
that feels terribly broken for the kernel. I wonder what clang does,
I'll go poke around with compilerexplorer after lunch.

Adding +Peter Zijlstra as well to join the party as I have a feeling
he'll be interested. ;-)

thanks,

 - Joel
