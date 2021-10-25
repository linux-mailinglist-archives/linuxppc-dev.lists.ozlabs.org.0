Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28388439AB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 17:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdK6B6430z2yNT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 02:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gxmadbL1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gxmadbL1; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdK5W5HwNz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 02:44:47 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21D9C60F70
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635176684;
 bh=t/cG3NYZufoQXI80MvoVKxbOhh2gfbNI54UCGBT3C9s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gxmadbL12O9CP1CNjr+LPFEaW4SzKdMH7wBlnUxy2TzbQ9gtUNV7DEu1WSahSAdvL
 u/BXtC5jblBxPTnpfFqJLIzEtCppyKyls5mNlnSUYhZum9GY/TH9dg/+vSn7xHICbC
 GLEZE6+WCHun6enc8dfKsjr2kBQWjDquNQv9BmuqxtjICcILdqOVO5TSfQnsQr7pUo
 9mokyel9t8DVcl3p+kpJ5J3zE1W6ObHH5vLJl7Mp+ES8XFxHce3uPgJ/Mf77S+X4Hm
 jYNewKS1aqWHMc6o18eqCgLn8SvSOXBCAmZWVHf49oAPQY46Q6rUNL5PhVtyNchEfn
 6muiFFPGVzArQ==
Received: by mail-wm1-f46.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so13582970wmc.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 08:44:44 -0700 (PDT)
X-Gm-Message-State: AOAM532wm5KV8vDshX7WAapH2KbbnXX/x7Vlsn8/SnpdX37a/aRhqYU6
 POiFPJWQAzD7bzVsB7SitXsVkkX64M7FetFj0Sw=
X-Google-Smtp-Source: ABdhPJwVwah/t3YoUqrQSaMsXvLvLT7cunG21zPbQEpZN6hLw+z/xKNabDoDNkoQgi86rA+/qLopU3mOKvl8de4bOgo=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr7749701wmj.98.1635176682689; 
 Mon, 25 Oct 2021 08:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
 <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
In-Reply-To: <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Oct 2021 17:44:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
Message-ID: <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
To: Waiman Long <longman@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 25, 2021 at 5:28 PM Waiman Long <longman@redhat.com> wrote:
> On 10/25/21 9:06 AM, Arnd Bergmann wrote:
> >
> > On s390, we pick between the cmpxchg() based directed-yield when
> > running on virtualized CPUs, and a normal qspinlock when running on a
> > dedicated CPU.
>
> I am not aware that s390 is using qspinlocks at all as I don't see
> ARCH_USE_QUEUED_SPINLOCKS being set anywhere under arch/s390. I only see
> that it uses a cmpxchg based spinlock.

Sorry, I should not have said "normal" here. See arch/s390/lib/spinlock.c
for their custom queued spinlocks as implemented in arch_spin_lock_queued().
I don't know if that code actually does the same thing as the generic qspinlock,
but it seems at least similar.

       Arnd
