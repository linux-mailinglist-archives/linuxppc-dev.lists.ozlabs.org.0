Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6442666594
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:24:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsggH6MGKz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AlFLNWR2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AlFLNWR2;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsgfK4kN1z3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 08:23:52 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4d0f843c417so98972177b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxCfhGNrfWy89W/U+pPUVQaJLaBqtZaaZxJq5wlMRbw=;
        b=AlFLNWR2lfiXPfEMGFqHZytcNNrUL9Uj9qeAqkeKRYgTrO2dCdhF9YPB5VkmKVyv2h
         kfDuyeZ0c2W077izhhNcCx4PzDF+gJ2VLHARsWGsxazXli8H8VYDDOjK5W34rgwB62i6
         iPyeCKiIhFaM471RKJFtueTSOvbG31VbMye+Z/zVohNQSHKqqi14CnP8+P7P3kEL3S5S
         nSBSCMQRiDK55LzhXVB3FSialBZ5FiyQBR4BCpnLtN7Eq2tXD30YcBcPHELpFHw7JPAU
         DceYtiB1wobFLb7CkOWU6Yuw9oTRkFdP/RRU8Wc5gMEB/DeAD4cvlXv4ZOBaAO+du5We
         xOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxCfhGNrfWy89W/U+pPUVQaJLaBqtZaaZxJq5wlMRbw=;
        b=4CA0S7+YG7mXYWEB4OWdmwxfTnsu/H3Ays49L24D/Oas1lespfoW9/59jrNls9MT/q
         zLcBq2kvV4oG7JvZGlleXBykftU6B+FozkTmv7OU3fAvr0OIORAWuFXIE2+b9neG9G6o
         auFEVL0Vxo8uWgy/hpk9hwmxUzAMeBeKpPex9axW3en6zs45eIASAbQNQHQLDmJG954O
         V5kfnDKzkMYU+9YfBme0uBkriKNaDrD2CieCcfM7NGBNQNQyGGC9ND/oY+oA/wRwFXMh
         KRoymdY0+3prk1fkswlhdOGomrkUxPgrIE27w5Ma/rWEWyhS1vfFgjBApCwge6Y6BAGY
         LPsw==
X-Gm-Message-State: AFqh2kp8p9mXOUleajDoGbH6AGLaaK+XRz1fb+vLjd+R4XFrs4vo9yfq
	28vsOckzDeM/TUM+ubbKlDd5heqbjoyUIXIG/2U84w==
X-Google-Smtp-Source: AMrXdXvkk9wMrdla5WxSOI7zrH4TdD8mYzSa58gnz4fRSmPZ7cdc+yy1/593wOoB6SdGGhG6a9NhgrILr9krFbI1xEA=
X-Received: by 2002:a81:c56:0:b0:490:89c3:21b0 with SMTP id
 83-20020a810c56000000b0049089c321b0mr6779232ywm.132.1673472227332; Wed, 11
 Jan 2023 13:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-14-surenb@google.com>
 <20230111154726.stadwtzicabwh5u5@offworld> <CAJuCfpFmO310qoFJr2EKHRavLx87k6tVkHO3-JCE0s4q5g+TCw@mail.gmail.com>
 <20230111195250.cj27sg4yoslbdjdp@offworld>
In-Reply-To: <20230111195250.cj27sg4yoslbdjdp@offworld>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jan 2023 13:23:35 -0800
Message-ID: <CAJuCfpEnJVcNXLrsu93b-Z5DkhgWfqgPxB1BNDoA1ohVV8hy5Q@mail.gmail.com>
Subject: Re: [PATCH 13/41] mm: introduce vma->vm_flags modifier functions
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, michel@lespinasse.org, 
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, willy@infradead.org, liam.howlett@oracle.com, 
	peterz@infradead.org, ldufour@linux.ibm.com, laurent.dufour@fr.ibm.com, 
	paulmck@kernel.org, luto@kernel.org, songliubraving@fb.com, peterx@redhat.com, 
	david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com, 
	jannh@google.com, shakeelb@google.com, tatashin@google.com, 
	edumazet@google.com, gthelen@google.com, gurua@google.com, 
	arjunroy@google.com, soheil@google.com, hughlynch@google.com, 
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 12:19 PM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> On Wed, 11 Jan 2023, Suren Baghdasaryan wrote:
>
> >On Wed, Jan 11, 2023 at 8:13 AM Davidlohr Bueso <dave@stgolabs.net> wrote:
> >>
> >> On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
> >>
> >> >To keep vma locking correctness when vm_flags are modified, add modifier
> >> >functions to be used whenever flags are updated.
> >>
> >> How about moving this patch and the ones that follow out of this series,
> >> into a preliminary patchset? It would reduce the amount of noise in the
> >> per-vma lock changes, which would then only be adding the needed
> >> vma_write_lock()ing.
> >
> >How about moving those prerequisite patches to the beginning of the
> >patchset (before maple_tree RCU changes)? I feel like they do belong
> >in the patchset because as a standalone patchset it would be unclear
> >why I'm adding all these accessor functions and introducing this
> >churn. Would that be acceptable?
>
> imo the abstraction of vm_flags handling is worth being standalone and is
> easier to be picked up before a more complex locking scheme change. But
> either way, it's up to you.

I see your point. Ok, if you think it makes sense as a stand-alone
patch I can post it separately in the next version.
Thanks,
Suren.

>
> Thanks,
> Davidlohr
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
