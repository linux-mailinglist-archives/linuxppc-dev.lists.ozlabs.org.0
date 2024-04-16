Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B480E8A60C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 04:13:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GSYcvgN1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJSHv4CWsz3vYk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 12:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GSYcvgN1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJSH86J3sz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 12:12:35 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e6723c606dso13832395ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 19:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713233552; x=1713838352; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzOA+wt0X8aCHHsSPoEduHyHrUj8KEaZUQOdAl+3ktM=;
        b=GSYcvgN1oVchQ919OdtihdCTQxt11i+zH8aD8P1od4jqPMSv3znxy6QNnHCl6qddq8
         6WhAm+PdwQtWkdtB0i8CIZLfSXJej/ARmVlgqaSNZ6jSLLOxq71e6HKGZYvL/3YDu73+
         cWeoo06pRvoPTkgvlOuoufCMHbkg6JV3khXL4mlwBGfvlT5ra9bER6buNPBkoedSyV7v
         SJtlJT17R2K5XBBBROvWRS1GNweTXHi7CCCzX6i/NE3x2YQBhhfuRZnBalT/RFFtY/0p
         6UglVJDm0rlh19DMYBvK8aNyG2kmO5R06kPWjMdNNlRXA3w6rmb2Qs47YTDPWyNzkziu
         TGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233552; x=1713838352;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzOA+wt0X8aCHHsSPoEduHyHrUj8KEaZUQOdAl+3ktM=;
        b=YmQQzvMi2y9LL3nwwfo1M90z5h8bTNb4csdtElMkYvdt7lDdLnTfcLZoe6HU9RMhgl
         CxVF3zGXBCqX7rykLzbqvWXXLcKcCe22EGjkus2wi51Et8EdrXSy/VNWmFp82Ymb+rlS
         n6OM6sThfMJGHg8JeN9FUO94r1rIJUzp19N0IGSGjHnxQnUTeNhkDeCJ3GlCE9sMx/Lq
         kT0XIXqDS99SuF/9Hdtjh46zp3n6RH4yi2OtLpPPE73CyP6PVH+pauNUlmWHG9ahkvA3
         CtuPC1wyqryrv39cjmflXKWp1HTaZi02C14qRaimLceUVG2oJBm5CripPKnhcbl1QAHo
         ienA==
X-Forwarded-Encrypted: i=1; AJvYcCUYXACZXAhUE1wd3KIDDTlTv25QkMeK5tqipRXjJfJgz2MDeYkGvdvyGJWgop97wQeLMw26KeXWb3jDt/uG+KmtxpxPFz4t1Z/S/I8E/w==
X-Gm-Message-State: AOJu0YzyUlbaGPmU3rKIBJoOgpVvrRQuXCfTtd3lwlBDJEnhVqgaEciK
	acUuUGTrXmAl6KlgE2gS/1VELFE4Ib/G55+ZxyAgOfeOwJc98+F0k2g97Q==
X-Google-Smtp-Source: AGHT+IHzD/9/iOhR0nVKMBBlpSNw4ekCtqnKE/f/wR7+DsnfakEuQSTBzKaIKhodLHVYDEDSpsWxzg==
X-Received: by 2002:a17:903:40d1:b0:1e3:d0fd:236c with SMTP id t17-20020a17090340d100b001e3d0fd236cmr15915501pld.37.1713233552125;
        Mon, 15 Apr 2024 19:12:32 -0700 (PDT)
Received: from localhost ([1.146.24.97])
        by smtp.gmail.com with ESMTPSA id jj12-20020a170903048c00b001e2461c52c6sm8574212plb.149.2024.04.15.19.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 19:12:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Apr 2024 12:12:27 +1000
Message-Id: <D0L6LU8KAPN2.1PBOHAD6WL1TE@gmail.com>
Subject: Re: [RFC PATCH] powerpc: Optimise barriers for fully ordered
 atomics
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240412172529.783268-1-npiggin@gmail.com>
 <878r1hd24t.fsf@mail.lhotse>
In-Reply-To: <878r1hd24t.fsf@mail.lhotse>
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

On Sat Apr 13, 2024 at 7:48 PM AEST, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > "Fully ordered" atomics (RMW that return a value) are said to have a
> > full barrier before and after the atomic operation. This is implemented
> > as:
> >
> >   hwsync
> >   larx
> >   ...
> >   stcx.
> >   bne-
> >   hwsync
> >
> > This is slow on POWER processors because hwsync and stcx. require a
> > round-trip to the nest (~=3D L2 cache). The hwsyncs can be avoided with
> > the sequence:
> >
> >   lwsync
> >   larx
> >   ...
> >   stcx.
> >   bne-
> >   isync
> >
> > lwsync prevents all reorderings except store/load reordering, so the
> > larx could be execued ahead of a prior store becoming visible. However
> > the stcx. is a store, so it is ordered by the lwsync against all prior
> > access and if the value in memory had been modified since the larx, it
> > will fail. So the point at which the larx executes is not a concern
> > because the stcx. always verifies the memory was unchanged.
> >
> > The isync prevents subsequent instructions being executed before the
> > stcx. executes, and stcx. is necessarily visible to the system after
> > it executes, so there is no opportunity for it (or prior stores, thanks
> > to lwsync) to become visible after a subsequent load or store.
>
> AFAICS commit b97021f85517 ("powerpc: Fix atomic_xxx_return barrier
> semantics") disagrees.
>
> That was 2011, so maybe it's wrong or outdated?

Hmm, thanks for the reference. I didn't know about that.

isync or ordering execution / completion of a load after a previous
plain store doesn't guarantee ordering, because stores drain from
queues and become visible some time after they complete.

Okay, but I was thinking a successful stcx. should have to be visible.
I guess that's not true if it broke on P7. Maybe it's possible in the
architecture to have a successful stcx. not having this property though,
I find it pretty hard to read this part of the architecture. Clearly
it has to be visible to other processors performing larx/stcx.,
otherwise the canonical stcx. ; bne- ; isync sequence can't provide
mutual exclusion.

I wonder if the P7 breakage was caused by to the "wormhole coherency"
thing that was changed ("fixed") in POWER9. I'll have to look into it
a bit more. The cache coherency guy I was talking to retired before
answering :/ I'll have to find another victim.

I should try to break a P8 too.

>
> Either way it would be good to have some litmus tests to back this up.
>
> cheers
>
> ps. isn't there a rule against sending barrier patches after midnight? ;)

There should be if not.

Thanks,
Nick
