Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3B5ED32A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 04:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcgxn5HrBz3c73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 12:51:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kiu55Cn3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kiu55Cn3;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McgxB630Xz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 12:51:25 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id y20so610130plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=+40eESmYOvjZMnFgnPsqVau+djoaI2s0Id1GNYZnG9I=;
        b=kiu55Cn3QjxHheLqLLQ3AzG0MraH60AOhWJ2FaWSef2GyrfbY+Me8kZN30AoBMFd9R
         2ypClmIgnoNHA1smu9TuM5F82QHb/oJnfhX1K8zcI/FSarW5hfwlmHK9F+7luJ34n0KC
         3hmek/KdZEtSbT7SZJea4dhGVSoxv4u/oe624JgWlio4ShOrd5iRdgzYFVIrViVMMsJ9
         sL7+Gg8bvdT2rVXNClXSBzxoJZY2vKCvpDwAPf37Gw7DiWbV7nAsx1KoFzWK4yoFFSBM
         sFRtkx9c5Y8IFI7PbyX4UqU/vfcDHcTH4liPI5al+bz/fCKOIlplvCL4D7mrzf2fNCrb
         XfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=+40eESmYOvjZMnFgnPsqVau+djoaI2s0Id1GNYZnG9I=;
        b=BATb1BZng6dcCyon57UR6TuRwZaJ265dLOL44eTcFIhmDDX5D3cGwL+E9wzenHqBUO
         us2TxU/NcItRb/XgJg2k2StFwBeBXdP/X/5ehhUMuCSQGsChOCso7eV956iIxsfR4cTZ
         53xyr1qyYowO3So9nOPEKnldwoJE12JqrMBhlGJj7d7uPjbdX7HW2nPpqkjJT1Y/gOID
         G6Q5HoNlhtcGyijZk6NQcmQsNzz5Qod0ufXFpJesKZRBtCrZvjPtJpDjITvuDSFGcPc8
         E/x52M1hS6tLUpUOWaVqXLCh9T0sn4DJ1tvarMMheJQ7oY7nSPYCFWOcMjbWYYOvrobK
         upeQ==
X-Gm-Message-State: ACrzQf355eWEuIQwB3KxYMix0i3lu27YrAX5itoLJMJx70h3djilpyHs
	vDEIGIehzJ5k7TVcT8xb39o=
X-Google-Smtp-Source: AMsMyM4YSEEIuewM2BVTwLmiOMcH6j8zf/3xRUbLFvaXslf1ctP+VXvADSEQibqOc/qPTJIkexYBCw==
X-Received: by 2002:a17:90b:3804:b0:205:e70c:43fc with SMTP id mq4-20020a17090b380400b00205e70c43fcmr3655055pjb.2.1664333482824;
        Tue, 27 Sep 2022 19:51:22 -0700 (PDT)
Received: from localhost (193-116-92-8.tpgi.com.au. [193.116.92.8])
        by smtp.gmail.com with ESMTPSA id b10-20020a170903228a00b00177ef3246absm2371820plh.103.2022.09.27.19.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 19:51:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Sep 2022 12:51:14 +1000
Message-Id: <CN7OZ6TMLLFS.2HER50Q3SO480@bobo>
Subject: Re: [PATCH linux-next][RFC] powerpc: avoid lockdep when we are
 offline
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Zhouyi Zhou" <zhouzhouyi@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220927014823.11439-1-zhouzhouyi@gmail.com>
 <CN6WCMKCWHOG.LT2QV3910UJ2@bobo>
 <CAABZP2wYcNXkTo=tgX-ARziwgD2rng+-wCZ-qfQ6M30+vmLEug@mail.gmail.com>
In-Reply-To: <CAABZP2wYcNXkTo=tgX-ARziwgD2rng+-wCZ-qfQ6M30+vmLEug@mail.gmail.com>
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

On Wed Sep 28, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> Thank Nick for reviewing my patch
>
> On Tue, Sep 27, 2022 at 12:25 PM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
> >
> > On Tue Sep 27, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > > This is second version of my fix to PPC's  "WARNING: suspicious RCU u=
sage",
> > > I improved my fix under Paul E. McKenney's guidance:
> > > Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzhouyi@=
gmail.com/T/
> > >
> > > During the cpu offlining, the sub functions of xive_teardown_cpu will
> > > call __lock_acquire when CONFIG_LOCKDEP=3Dy. The latter function will
> > > travel RCU protected list, so "WARNING: suspicious RCU usage" will be
> > > triggered.
> > >
> > > Avoid lockdep when we are offline.
> >
> > I don't see how this is safe. If RCU is no longer watching the CPU then
> > the memory it is accessing here could be concurrently freed. I think th=
e
> > warning is valid.
> Agree
> >
> > powerpc's problem is that cpuhp_report_idle_dead() is called before
> > arch_cpu_idle_dead(), so it must not rely on any RCU protection there.
> > I would say xive cleanup just needs to be done earlier. I wonder why it
> > is not done in __cpu_disable or thereabouts, that's where the interrupt
> > controller is supposed to be stopped.
> Yes, I learn flowing events sequence from kgdb debugging
> __cpu_disable -> pseries_cpu_disable -> set_cpu_online(cpu, false)  =3D
> leads to =3D>  do_idle: if (cpu_is_offline(cpu) -> arch_cpu_idle_dead
> so xive cleanup should be done in pseries_cpu_disable.

It's a good catch and a reasonable approach to the problem.

> But as a beginner, I afraid that I am incompetent to do above
> sophisticated work without error although I am very like to,
> Could any expert do this for us?

This will be difficult for anybody, it's tricky code. I'm not an
expert at it.

It looks like the interrupt controller disable split has been there
since long before xive. I would try just move them together than see
if that works.

Documentation/core-api/cpu_hotplug.rst says that __cpu_disable should
shut down the interrupt handler. So if there is a complication it
would probably be from powerpc-specific CPU hotplug  or interrupt
code.

Thanks,
Nick

