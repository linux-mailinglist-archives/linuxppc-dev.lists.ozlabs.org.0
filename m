Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDAA21DDDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:50:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B58lC67hBzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 02:49:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R+6LRuLZ; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B58jP21LgzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 02:48:24 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id e18so6270236pgn.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=INPs3nxni2V4l7Wi5FNDIFPFwYguU/xf1qgvb0BuhC4=;
 b=R+6LRuLZbvncOfmOwYY5q8IVDwZiV+RDPEu6DkwQ7DghW24zrjlhrUTVAvXZR3UUHH
 mkBdeBPq/GcwQRrBAUjLvieWEIgcEhNfLRhInWKe9n46bjAtdCWUhOcKDGBJWiwjkxgR
 6Rj9VkbiyOt3ADuG2ZXGxNQKLMZBBmZCoDqbFodM2xjHs/iLWVOY/Bl5KLgNhYdeleLA
 edC+A3d9UvHuGkddJK37cHRQypGFRiX+ha42c3w/yAXtJr1q/VMTuk7Vb7ki7dk5K3bW
 ZS52GW3lsY3/2uK3rwUG7dp8gk5XfTe7av83x249Xfkf9EShHRcn4+fBVSnTnIstdvKZ
 5a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=INPs3nxni2V4l7Wi5FNDIFPFwYguU/xf1qgvb0BuhC4=;
 b=EWt2p0A5tvbqpLuEsCLWYBw+bibcThuJPLfx2DRe9zXWK1+PDNndvTvpFjRBEjJnyJ
 e4WZLmt4Wu6DGQr5AIJvTgMcyxojcovSzchxFTI+SFr2cdk9nu32+DtoxUCL7AXKOpo+
 kBZ0XwDu3iTquVYL2RBRoDOQODxTFrZzWt7Vs3N2882nSpqkHDRKe0yQ9O7z8Fv44/QO
 eQr0qs0ZDpOqRZndaMVEOVf3RCzTZNn9uux6KDs8sV+PErO2HnWprCPJSe54CRLeBwiV
 AYcMwTZYkXyhm3JE+VO3uJ6BFcEAayKNovckQWh85wIE/y2GKMkICyaOxNoCd4N/cbOw
 7w0g==
X-Gm-Message-State: AOAM530P0GAmCbMdO67gH6hCrmc3M2lpUjz9qrqiBnLqtYgqkWk/5nFa
 0lWNR9c6NtTptI9T/GrzxCcFuV7t
X-Google-Smtp-Source: ABdhPJyzYE/gbgNRIvd8T1nEKwOmWyQ0D6wBLrY+CaPnFOU0pgGH0kYtLwOHfmaSiihyfPeLfiiMRg==
X-Received: by 2002:aa7:8ac3:: with SMTP id b3mr723937pfd.45.1594658901764;
 Mon, 13 Jul 2020 09:48:21 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id m68sm121909pje.24.2020.07.13.09.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:48:21 -0700 (PDT)
Date: Tue, 14 Jul 2020 02:48:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies, a non-refcounting lazy
 tlb option
To: Andy Lutomirski <luto@kernel.org>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-8-npiggin@gmail.com>
 <CALCETrWbD=3SUOuq9P7Syb+a1DoBjjem8hq9_HCvn7wyqETkpw@mail.gmail.com>
In-Reply-To: <CALCETrWbD=3SUOuq9P7Syb+a1DoBjjem8hq9_HCvn7wyqETkpw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1594658283.qabzoxga67.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of July 14, 2020 1:59 am:
> On Thu, Jul 9, 2020 at 6:57 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> On big systems, the mm refcount can become highly contented when doing
>> a lot of context switching with threaded applications (particularly
>> switching between the idle thread and an application thread).
>>
>> Abandoning lazy tlb slows switching down quite a bit in the important
>> user->idle->user cases, so so instead implement a non-refcounted scheme
>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
>> any remaining lazy ones.
>>
>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>> with as many software threads as CPUs (so each switch will go in and
>> out of idle), upstream can achieve a rate of about 1 million context
>> switches per second. After this patch it goes up to 118 million.
>>
>=20
> I read the patch a couple of times, and I have a suggestion that could
> be nonsense.  You are, effectively, using mm_cpumask() as a sort of
> refcount.  You're saying "hey, this mm has no more references, but it
> still has nonempty mm_cpumask(), so let's send an IPI and shoot down
> those references too."  I'm wondering whether you actually need the
> IPI.  What if, instead, you actually treated mm_cpumask as a refcount
> for real?  Roughly, in __mmdrop(), you would only free the page tables
> if mm_cpumask() is empty.  And, in the code that removes a CPU from
> mm_cpumask(), you would check if mm_users =3D=3D 0 and, if so, check if
> you just removed the last bit from mm_cpumask and potentially free the
> mm.
>=20
> Getting the locking right here could be a bit tricky -- you need to
> avoid two CPUs simultaneously exiting lazy TLB and thinking they
> should free the mm, and you also need to avoid an mm with mm_users
> hitting zero concurrently with the last remote CPU using it lazily
> exiting lazy TLB.  Perhaps this could be resolved by having mm_count
> =3D=3D 1 mean "mm_cpumask() is might contain bits and, if so, it owns the
> mm" and mm_count =3D=3D 0 meaning "now it's dead" and using some careful
> cmpxchg or dec_return to make sure that only one CPU frees it.
>=20
> Or maybe you'd need a lock or RCU for this, but the idea would be to
> only ever take the lock after mm_users goes to zero.

I don't think it's nonsense, it could be a good way to avoid IPIs.

I haven't seen much problem here that made me too concerned about IPIs=20
yet, so I think the simple patch may be good enough to start with
for powerpc. I'm looking at avoiding/reducing the IPIs by combining the
unlazying with the exit TLB flush without doing anything fancy with
ref counting, but we'll see.

Thanks,
Nick
