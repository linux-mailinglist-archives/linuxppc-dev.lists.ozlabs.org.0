Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A705F9766
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 06:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm5TC35Hvz3dqj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 15:26:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MLxVgjqo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MLxVgjqo;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm5SD43fsz2yxw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 15:25:31 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso12049559pjf.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Oct 2022 21:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vAH4rya06AUuc9cGIVqpG9iUHugeEm5tYJ/niYtbVRY=;
        b=MLxVgjqoSNusMoE1FuWBp1q556Q//9g3yq35wJGCKcTbRZz58TywpUOayoe9r+tXBw
         6h2JKPPCtaG41E6WtcFxo2hexOQFb3i/eS968uKnerE9TPzv1J6xW28Y93kuTCpIV3he
         nrTiA91WghpRf0uEuHTfpYggCKaaZh9iq0mHIqQu9S3xs8wRCA0mRVPiFPCcZzu3c2ug
         9idRwLBqTgyNVhSh9lrTU5BuxcqVFJdYKE/PGpRorh0rgG457xKEDiPt121LjCcQ1lhw
         HO7ptOLO/EAQKfoH9Z8Mcl9k+522j0CFRDVsWPSMnPGA7UkRUnhZ4O9HDdzVxpu6/mEp
         JhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAH4rya06AUuc9cGIVqpG9iUHugeEm5tYJ/niYtbVRY=;
        b=vAil7m3/Vhv31LvcMIe4q5/ApSNaSr80ALyjtsgrvecYtBvcRh8/ON0+1Haix+hRkY
         ecoN+ZWCfpt/H0OFoAEx9cBiUZQZFnDvSDJRFz8GytGnXGi/3ozSfEtgfpj8I4L1SWRC
         x1uaAj/GXMxj/lwa2y8brKPzqBhPAfMtcHE/qubPSHiFluzU6r4sDWkQeHO6xn1Y4qrU
         vuvHN3bhN4oUsj/BJf1/cB6rjnAgk5X2v9EukvwcXcU9gTs4kDtqruSudbKxVCcadjKi
         nd1hY9ku4l8CtNvbhcejeqLwPFnEggp4eFcA/LU9k3pDqNFSFTlo86gtzke9V1aauR7K
         uHZg==
X-Gm-Message-State: ACrzQf2bZ1txiT2z9lffDqc3mLI38lZejlmFM/8UauJUTzM4hNNkai+A
	w7ipJsL1xM7IKjBsq02131JMFEyTamaIxhHEPQz117GaaNCsKlwi
X-Google-Smtp-Source: AMsMyM791DUqNXcf3i6ujvTKOJ/C4se8A3QyfbOhaEpB1pPQTDWb2jlQTE2LK/9Ih+qgalZofJvsvIMoB4YHVRaVP/g=
X-Received: by 2002:a17:90a:7305:b0:20a:6ffd:1f8e with SMTP id
 m5-20020a17090a730500b0020a6ffd1f8emr29173215pjk.69.1665375928676; Sun, 09
 Oct 2022 21:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220927014823.11439-1-zhouzhouyi@gmail.com> <CN6WCMKCWHOG.LT2QV3910UJ2@bobo>
 <CAABZP2wYcNXkTo=tgX-ARziwgD2rng+-wCZ-qfQ6M30+vmLEug@mail.gmail.com>
 <CN7OZ6TMLLFS.2HER50Q3SO480@bobo> <CAABZP2xu5w9Ec8LmTUrF31KhY3HCcBjQYSk4xo14bdB9mxOz+A@mail.gmail.com>
 <CNHXQ6R5IEHG.1D2WH96LGUA1I@bobo>
In-Reply-To: <CNHXQ6R5IEHG.1D2WH96LGUA1I@bobo>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Mon, 10 Oct 2022 04:25:17 +0800
Message-ID: <CAABZP2x7bc=fzEobjthMYYQcS2DsPtnyg0-rZLwVb-tYn0YDiw@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC] powerpc: avoid lockdep when we are offline
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
Cc: atrajeev@linux.vnet.ibm.com, paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lance@osuosl.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 10, 2022 at 11:49 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> On Thu Sep 29, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > On Wed, Sep 28, 2022 at 10:51 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> > >
> > > On Wed Sep 28, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > > > Thank Nick for reviewing my patch
> > > >
> > > > On Tue, Sep 27, 2022 at 12:25 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> > > > >
> > > > > On Tue Sep 27, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > > > > > This is second version of my fix to PPC's  "WARNING: suspicious RCU usage",
> > > > > > I improved my fix under Paul E. McKenney's guidance:
> > > > > > Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzhouyi@gmail.com/T/
> > > > > >
> > > > > > During the cpu offlining, the sub functions of xive_teardown_cpu will
> > > > > > call __lock_acquire when CONFIG_LOCKDEP=y. The latter function will
> > > > > > travel RCU protected list, so "WARNING: suspicious RCU usage" will be
> > > > > > triggered.
> > > > > >
> > > > > > Avoid lockdep when we are offline.
> > > > >
> > > > > I don't see how this is safe. If RCU is no longer watching the CPU then
> > > > > the memory it is accessing here could be concurrently freed. I think the
> > > > > warning is valid.
> > > > Agree
> > > > >
> > > > > powerpc's problem is that cpuhp_report_idle_dead() is called before
> > > > > arch_cpu_idle_dead(), so it must not rely on any RCU protection there.
> > > > > I would say xive cleanup just needs to be done earlier. I wonder why it
> > > > > is not done in __cpu_disable or thereabouts, that's where the interrupt
> > > > > controller is supposed to be stopped.
> > > > Yes, I learn flowing events sequence from kgdb debugging
> > > > __cpu_disable -> pseries_cpu_disable -> set_cpu_online(cpu, false)  =
> > > > leads to =>  do_idle: if (cpu_is_offline(cpu) -> arch_cpu_idle_dead
> > > > so xive cleanup should be done in pseries_cpu_disable.
> > >
> > > It's a good catch and a reasonable approach to the problem.
> > Thank Nick for your encouragement ;-)
> > >
> > > > But as a beginner, I afraid that I am incompetent to do above
> > > > sophisticated work without error although I am very like to,
> > > > Could any expert do this for us?
> > >
> > > This will be difficult for anybody, it's tricky code. I'm not an
> > > expert at it.
> > >
> > > It looks like the interrupt controller disable split has been there
> > > since long before xive. I would try just move them together than see
> > > if that works.
> > Yes, I use "git blame" (I learned "git blame" from Paul E. McKenny ;-)
> > ) to see the same.
> > and anticipate your great works!
>
> I was thinking you could try it and see if it works and what you find.
> If you are interested and have time to look into it?
I am interested! and I have time ;-)
Thank Nick for your trust in me!
I am going to submit my babyish work in about a month (counting the
rcutoture tests time), and thank you in advance for your patience.

Cheers
Zhouyi
>
> Thanks,
> Nick
