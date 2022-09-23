Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06745E758D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 10:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYlPF3gtKz3chN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 18:17:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p8748LgI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p8748LgI;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYlNd2n60z3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 18:16:32 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id jm5so10109165plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=Z0xRXo05qfL3EBUon41EbvA3vzqw/Pd0dAy39CE17qw=;
        b=p8748LgIfqnjq4wB2bxJ+C6EeDFANVWa6IZ7IGHBaU5yghhDUQmtX/yZoXzZaNYbro
         aR2AE2DA2wmSBTlNa7q0+Qhtsvmq2DaD0248xboX4pCpWSOqK/HNkxycA6+3Zrn3/ONr
         r7IhiCwOPouf5o+m+0qK3CmCQUIUnFdBy46kiCltZoUgPFOY+O/AyytgAKO4ysE/mydj
         GyLIwxz8fdq6+/uLajoSTiA+g3HOPTMn1zzcv5urTK8kArNDKNxmx78HW9N+2s7ugLKu
         XcZR1+EZHJV9VsBVEMK7d2rmL9JgHzUbukr7ueH+U3W+PPdna1vqqvfjbjpbwvmu69yL
         guog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=Z0xRXo05qfL3EBUon41EbvA3vzqw/Pd0dAy39CE17qw=;
        b=153iLORFidmu9Miu5IPMFI8liAPyAy9KMxxdxX++Oz4+fCjZa2sgQjqRzbKM9wUOg8
         zQN7MVPyw+ajGofXBM7LMWmErqcuW3LtERavkymhq/aWJT/VVXxurTmdHDZZjB0Hbuje
         0QsrKyY4t5ccfY+5iBzh1pypx7jCUbFGHY+wmfjBcPrX1Lfa0tQGpN+yZLokDZC53eJ8
         UhUW3M381aXVnmCPnwxyT3xMRL/dgph2T+DrQSlE1xwqNpPNSE3odjl8SnIMCLWhhBP3
         00OENlSaZeiX0tCRA7IfbNtUOomQF4YVRNlb44cftepkpXwMViDKNHTbnM6/oEv/XLxu
         V23A==
X-Gm-Message-State: ACrzQf3GYHjjvoCsXn0GtP09U7d1ZTRVoJJXyIj9x6jAnF1zuGDudBVz
	G9UYgQacpx9fcyfHHBrkpx0=
X-Google-Smtp-Source: AMsMyM7WGhtu0xIg6xyfaKWkDafJHoxSLBF1VjLdIVGGUuy480AD0/pKOaoFr4jUfmcLfXvyx5h9KA==
X-Received: by 2002:a17:902:ca05:b0:177:324a:784d with SMTP id w5-20020a170902ca0500b00177324a784dmr7265592pld.11.1663920989541;
        Fri, 23 Sep 2022 01:16:29 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id c60-20020a17090a494200b001f216407204sm1039877pjh.36.2022.09.23.01.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 01:16:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 18:16:24 +1000
Message-Id: <CN3MRFI9GCO8.2JI4W3155ZPJ3@bobo>
Subject: Re: [PATCH 16/17] powerpc/qspinlock: allow indefinite spinning on a
 preempted owner
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Laurent Dufour" <ldufour@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-18-npiggin@gmail.com>
 <5b1ed668-15f2-414d-b491-b1677a6b5537@linux.ibm.com>
In-Reply-To: <5b1ed668-15f2-414d-b491-b1677a6b5537@linux.ibm.com>
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

On Fri Sep 23, 2022 at 1:02 AM AEST, Laurent Dufour wrote:
> On 28/07/2022 08:31:19, Nicholas Piggin wrote:
> > Provide an option that holds off queueing indefinitely while the lock
> > owner is preempted. This could reduce queueing latencies for very
> > overcommitted vcpu situations.
> >=20
> > This is disabled by default.
>
> Hi Nick,
>
> I should have missed something here.
>
> If this option is turned on, CPU trying to lock when there is a preempted
> owner will spin checking the lock->val and yielding the lock owner CPU.
> Am I right?

Yes.

> If yes, why not being queued and spin checking its own value, yielding
> against the lock owner CPU?

I guess the idea is that when we start getting vCPU preemption, queueing
behaviour causes this "train wreck" behaviour where lock waiters being
preempted can halt lock transfers to other waiters (whereas with simple
spinlocks only owner vCPU preemption matters). So the heuristics for
paravirt qspinlock basically come down to avoiding queueing and making
waiters behave more like a simple spinlock when it matters. That's the
case for upstream and this rewrite.

> This will generate less cache bouncing, which
> is what the queued spinlock is trying to address, isn't it?

It could. When the owner is preempted it's not going to be modifying
the lock word and probably not surrounding data in the same cache
line, and there won't be a lot of other try-lock operations come in
(because they'll mostly queue up here as well). So cacheline bouncing
shouldn't be the worst problem we face here. But it possibly is a
concern.

I didn't yet meausre any real improvement from this option, and it
possibly has some starvation potential, so it's disabled by default for
now.

Thanks,
Nick
