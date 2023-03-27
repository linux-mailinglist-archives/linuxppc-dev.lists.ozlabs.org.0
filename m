Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E796C9A82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 06:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlKS41PQ0z3chK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 15:23:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FrX2YzE6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FrX2YzE6;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlKR54k7Sz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 15:22:24 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id c18so7177097ple.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 21:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679890940;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbNEvqm/LgKf3xD8kfnZuqgmA6+B2XoCfN1MLRIliNE=;
        b=FrX2YzE6K9vXSpkUYkcZQiyK7N6fIFS3OjQWLayfmzfOGc+LhJKquKBQoX6zFPJBvz
         vY0nqJL+mWEQt7y8HkF4ru0z479ph1CR0WVvWPTTFhX8xvjslx2YRlyHw9g/XGz2RJe1
         CQTZp9fxIzdS19STF2ZbA5TcBwM6tt9+2lU9JaJMqzNafvCgwQmgTE20Uv1O+c3kmgdM
         nzoNu5uMYfYJ7ciyBIBHrsOfFdpdz3Z8bZhKLo28OofLeHJSk1ccle2nVUDHk4i4YvoW
         vBVknTAFMMF7/UyHwW5rv3LCytQM6d97GuUd/bTu1hSWW4n9XuV5ZFp4QXIyI/vYk80x
         gXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679890940;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zbNEvqm/LgKf3xD8kfnZuqgmA6+B2XoCfN1MLRIliNE=;
        b=4GjZNdrufKXbRG30+Tt4rZf0IbeQN6FDKhhnQ+OSbZGP4rMgXTz/IQFGOQlcGCzj3V
         ZwKyJ3d11WNYynAbQwOHEE38qgTGAr5KZ+5UuGPX2PQ3sHrMeJqlBUOULDi4Q6tG5XHh
         vKTg3YzjNX7zqyTopP/VU5LzEvX/Bc2jQL2Yi12Gbevlij2pWdUXbD3GKyYdvw7c37Yo
         IxweUsV1NiNx7Ze6hD8rEJ3N4qOQ9DUC/Wi5QBzerQCDF7qM+jhJj5ftz5BNXgjngxXi
         PVq1Gw16oF+O8v8lSurdTKaEIsbCBnveh51FTvgov2TRqmLib3xjtm7gjq3e/sxBYvZg
         Q5iw==
X-Gm-Message-State: AAQBX9dys56YpVSzsHwOC6KIuA5pRTybA+iXAbeSm+046LTnRS4h/4AC
	1UOS1kTRBPfApH78f0quxXY=
X-Google-Smtp-Source: AKy350aVt1YV2VYny4GqoNv4qxwnoK8ss5Uggj/slp+67Q24lhQbRk1Wlg8tiEQzxKeu1+LF49eNmA==
X-Received: by 2002:a17:90b:3e82:b0:23f:78d6:6ac5 with SMTP id rj2-20020a17090b3e8200b0023f78d66ac5mr11341150pjb.19.1679890940015;
        Sun, 26 Mar 2023 21:22:20 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090a134400b00233afe09177sm3403472pjf.8.2023.03.26.21.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 21:22:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 14:22:14 +1000
Message-Id: <CRGVMXJ46PPN.1VWRMA1IMPHW2@bobo>
Subject: Re: Memory coherency issue with IO thread offloading?
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jens Axboe" <axboe@kernel.dk>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
X-Mailer: aerc 0.13.0
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
 <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
 <9753c624-66e0-aace-6540-731cba9da864@kernel.dk>
In-Reply-To: <9753c624-66e0-aace-6540-731cba9da864@kernel.dk>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Mar 25, 2023 at 11:20 AM AEST, Jens Axboe wrote:
> On 3/24/23 7:15?PM, Jens Axboe wrote:
> >> Are there any CONFIG options I'd need to trip this?
> >=20
> > I don't think you need any special CONFIG options. I'll attach my confi=
g
> > here, and I know the default distro one hits it too. But perhaps the
> > mariadb version is not new enough? I think you need 10.6 or above, as
> > will use io_uring by default. What version are you running?
>
> And here's the .config and the patch for using queue_work().

So if you *don't* apply this patch, the work gets queued up with an IO
thread? In io-wq.c? Does that worker end up just doing an io_write()
same as this one?

Can the  queueing cause the creation of an IO thread (if one does not
exist, or all blocked?)

I'm wondering what the practical differences are between this patch and
upstream.

kthread_use_mm() should be basically the same as context switching to an
IO thread. There is maybe a difference in that kthread_switch_mm() has
a 'sync' instruction *after* the MMU is switched to the new thread from
the membarrier code, but a regular context switch might not. The MMU
switch does have an isync() after it though, so loads *should* be
prohibited from moving ahead of that.

Something like this adds a sync roughly where kthread_use_mm() has one.
It's a pretty unlikely shot in the dark though. I'm more inclined to
think the work submission to the IO thread might have a problem.

Thanks,
Nick


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 488655f2319f..417c0652dc66 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5180,6 +5180,7 @@ static struct rq *finish_task_switch(struct task_stru=
ct *prev)
        tick_nohz_task_switch();
        finish_lock_switch(rq);
        finish_arch_post_lock_switch();
+       smp_mb();
        kcov_finish_switch(current);
        /*
         * kmap_local_sched_out() is invoked with rq::lock held and
