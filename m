Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 073796724FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 18:31:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxt9447G2z3fGC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 04:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KHKCIU14;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KHKCIU14;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxt8630tTz3fB0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 04:30:45 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id t10so25914208vsr.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=45VTI8G2wI4nS2eH3K9pAMjugnugZ8TVFHXhCaZ9BN4=;
        b=KHKCIU14OK3pQZodreyf7cATu0CnBQ6Qp/eyFOrDD7AtFbqgOhemxuzdFJljGaeQVx
         fFRqwtRDmL31BGjxA2umkxBS2bzIUxJXG7wccQXsOU1uKFkErI9PWKf3gKBRSCN1cRFu
         fZ7h59H1HqHCAQh4z6y/0HqZ7cCPYHBKbh2DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45VTI8G2wI4nS2eH3K9pAMjugnugZ8TVFHXhCaZ9BN4=;
        b=BuEb2yw0BKNxh6uZm7HoM2TiJCx5A3KcTf450Udm6xVcqh71EIt17xvl9QcIzFKbXF
         hwkLnvpkkT19ySvRixd7kYmVqKe8e1I+0By3NTw41NQtiT9SVxs/J0TU1yNiFP+qCciz
         P23RoyRNEdh9dkSj4LbX2HBqg0uaxsGvelUGkHkjq3OX1THBqgSwn/ORvRjUfeudJ3Kj
         mkP5PaugPIfNuoNpU6Y7x8A0f78165GdgRcizpjU6cSkNsJsna6ubRTDvphYIS2L51Qm
         yUFxB/ZhArG6JQe+7TsRfs+jkVTlxrF6lSnpix9b9jj7EOTZbiBo+3vy1Jqt1O8/NI1J
         4YwQ==
X-Gm-Message-State: AFqh2kpqor91IHaFbosydUIp3j3DyVR1i5Q4FLo7tC+UrB+w6s3JXD87
	AfL0FeNpdSGSn/W05h//tBJJRUAwGPDtTY44
X-Google-Smtp-Source: AMrXdXvtWCxycqFIrRfcpJ7mEKD7xqWmEeebFIykYnylQapBP8xlN/TtkEwJHnkTTbDukoXEBXcJGw==
X-Received: by 2002:a05:6102:e93:b0:3d0:fad4:867e with SMTP id l19-20020a0561020e9300b003d0fad4867emr5839199vst.23.1674063039599;
        Wed, 18 Jan 2023 09:30:39 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id t2-20020a37ea02000000b006fb9bbb071fsm22554021qkj.29.2023.01.18.09.30.39
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:30:39 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id l1so18338366qkg.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:30:39 -0800 (PST)
X-Received: by 2002:ae9:efd8:0:b0:706:e593:2598 with SMTP id
 d207-20020ae9efd8000000b00706e5932598mr50927qkg.216.1674063038833; Wed, 18
 Jan 2023 09:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20230118080011.2258375-1-npiggin@gmail.com> <20230118080011.2258375-5-npiggin@gmail.com>
In-Reply-To: <20230118080011.2258375-5-npiggin@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Jan 2023 09:30:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiLaY7K6N4VF=wgS+AVsFi298fMA3Tx6rzbbP7xT+1Dqg@mail.gmail.com>
Message-ID: <CAHk-=wiLaY7K6N4VF=wgS+AVsFi298fMA3Tx6rzbbP7xT+1Dqg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
To: Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Adding a few more x86 and arm64 maintainers - while linux-arch is
the right mailing list, I'm not convinced people actually follow it
all that closely ]

On Wed, Jan 18, 2023 at 12:00 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> On a 16-socket 192-core POWER8 system, a context switching benchmark
> with as many software threads as CPUs (so each switch will go in and
> out of idle), upstream can achieve a rate of about 1 million context
> switches per second, due to contention on the mm refcount.
>
> 64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN, so enable
> the option. This increases the above benchmark to 118 million context
> switches per second.

Well, the 1M -> 118M change does seem like a good reason for this series.

The patches certainly don't look offensive to me, so Ack as far as I'm
concerned, but honestly, it's been some time since I've personally
been active on the idle and lazy TLB code, so that ack is probably
largely worthless.

If anything, my main reaction to this all is to wonder whether the
config option is a good idea - maybe we could do this unconditionally,
and make the source code (and logic) simpler to follow when you don't
have to worry about the CONFIG_MMU_LAZY_TLB_REFCOUNT option.

I wouldn't be surprised to hear that x86 can have the same issue where
the mm_struct refcount is a bigger issue than the possibility of an
extra TLB shootdown at the final exit time.

But having the config options as a way to switch people over gradually
(and perhaps then removing it later) doesn't sound wrong to me either.

And I personally find the argument in patch 3/5 fairly convincing:

  Shootdown IPIs cost could be an issue, but they have not been observed
  to be a serious problem with this scheme, because short-lived processes
  tend not to migrate CPUs much, therefore they don't get much chance to
  leave lazy tlb mm references on remote CPUs.

Andy? PeterZ? Catalin?

Nick - it might be good to link to the actual benchmark, and let
people who have access to big machines perhaps just try it out on
non-powerpc platforms...

                   Linus
