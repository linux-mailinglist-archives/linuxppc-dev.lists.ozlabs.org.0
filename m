Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D09672F63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 04:05:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny6vY0JcKz3fDy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 14:05:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bhWSFtHF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bhWSFtHF;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny6tc3KYPz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 14:04:54 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id b17so1049674pld.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/gHZEBJUqbXfG5JX1H5lnam0IN6TNXNjBZYcdLB8wc=;
        b=bhWSFtHFWzg3KaP6hdKmTWRc+V9Fox21VYwUq0wTkIBSKY3ClnhvXUqHrGuuAvBhkz
         WCDVAI3Rzb79DGG3/FspTjpuS3o0BQV8+iwZDwbwkFhojO8Am0TFeO2AS4AJ/1Vpl/bu
         QOPOLbW6JtRWSdr3FGbSfDZEMf3D6AB4c9WZEho6CHb9N37dU4DdY5qfoaNQJkQZpR9+
         TZAo0/OD8U9HQka/hBfHIubzNBRsd14gwDKc0p+jI9ZVwweOmb7ZbrHA1AclDU2wwKPH
         9T1TQWRHh9PyQ0Qm/E2ioM7u0ztci3DrxDuMlwc1oQAKgRjh871aYDRUEITBu2ZxqsDS
         wMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/gHZEBJUqbXfG5JX1H5lnam0IN6TNXNjBZYcdLB8wc=;
        b=QnV1f47YEKFXBjK8CRkT6geqkP39mx4UP4Z2iPXcOIHl288dB7/wwcTHk7ICHuKuHa
         jHSLL3b7oY1laTjgOiDhYumTNajMHip9Uz5jJT8Yj4Mg1Wo4WUPgOZYweeQMlSAAsoyC
         lMHnB+M0OxzhP4wuEkOaALlfexaZUDQxV8RuAuPFqtXx4tAnxngM1zqCHUZ+Wt0ldvfD
         bclSmSFJoGUZ4ZkoNIxI9BbRE888bxxfNbErc0U9NUmVlmPNln97621AB6z01XfFXgoL
         dyNxBnFmEkNxscW5if7chbxUiDgOtXaxIOobldet1eejVyfN7KW4nhQEr+hgHy0Z8A7A
         XUuA==
X-Gm-Message-State: AFqh2krAeCAZjDk4OXQGJMu20nOlhZ1NXt7AECu+fjFyYd7JJeEeMqD9
	VrkGukaR9n5MGj9bFus+Bjw=
X-Google-Smtp-Source: AMrXdXvH7nWDObatVJJJ0rFrPx7ePH/E+zXu/f0VqlxwbgvnLGgalRPIiDu/+GlHLmvdgYcf9hqo9Q==
X-Received: by 2002:a17:902:8a8a:b0:194:480d:6afc with SMTP id p10-20020a1709028a8a00b00194480d6afcmr8663252plo.48.1674097491373;
        Wed, 18 Jan 2023 19:04:51 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902b49400b00194caf3e975sm227479plr.208.2023.01.18.19.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 19:04:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 13:04:44 +1000
Message-Id: <CPVU13AC1206.2SHGMTJDZK6H8@bobo>
Subject: Re: [PATCH v6 4/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andy Lutomirski" <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
X-Mailer: aerc 0.13.0
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-5-npiggin@gmail.com>
 <CAHk-=wiLaY7K6N4VF=wgS+AVsFi298fMA3Tx6rzbbP7xT+1Dqg@mail.gmail.com>
In-Reply-To: <CAHk-=wiLaY7K6N4VF=wgS+AVsFi298fMA3Tx6rzbbP7xT+1Dqg@mail.gmail.com>
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

On Thu Jan 19, 2023 at 3:30 AM AEST, Linus Torvalds wrote:
> [ Adding a few more x86 and arm64 maintainers - while linux-arch is
> the right mailing list, I'm not convinced people actually follow it
> all that closely ]
>
> On Wed, Jan 18, 2023 at 12:00 AM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
> >
> > On a 16-socket 192-core POWER8 system, a context switching benchmark
> > with as many software threads as CPUs (so each switch will go in and
> > out of idle), upstream can achieve a rate of about 1 million context
> > switches per second, due to contention on the mm refcount.
> >
> > 64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN, so enabl=
e
> > the option. This increases the above benchmark to 118 million context
> > switches per second.
>
> Well, the 1M -> 118M change does seem like a good reason for this series.

It was an artificial corner case, mind you. I don't think it's a reason
to panic and likely smaller systems with faster atomics will care far
less than our big 2-hop systems.

Benchmark is will-it-scale:

  ./context_switch1_threads -t 768
  min:2174 max:2690 total:1827952

    33.52%  [k] finish_task_switch
    27.26%  [k] interrupt_return
    22.66%  [k] __schedule
     2.30%  [k] _raw_spin_trylock

  ./context_switch1_threads -t 1536
  min:103000 max:120100 total:177201906

The top case has 1/2 the switching pairs to available CPU, which makes
them all switch the same mm between real and lazy. Bottom case is
just switching between user threads so that doesn't hit the lazy
refcount.

> The patches certainly don't look offensive to me, so Ack as far as I'm
> concerned, but honestly, it's been some time since I've personally
> been active on the idle and lazy TLB code, so that ack is probably
> largely worthless.
>
> If anything, my main reaction to this all is to wonder whether the
> config option is a good idea - maybe we could do this unconditionally,
> and make the source code (and logic) simpler to follow when you don't
> have to worry about the CONFIG_MMU_LAZY_TLB_REFCOUNT option.
>
> I wouldn't be surprised to hear that x86 can have the same issue where
> the mm_struct refcount is a bigger issue than the possibility of an
> extra TLB shootdown at the final exit time.
>
> But having the config options as a way to switch people over gradually
> (and perhaps then removing it later) doesn't sound wrong to me either.

IMO it's trivial enough that we could carry both, but everything's a
straw on the camel's back so if we can consolidate it would always be
preferebale. Let's see how it plays out for a few releases.

> And I personally find the argument in patch 3/5 fairly convincing:
>
>   Shootdown IPIs cost could be an issue, but they have not been observed
>   to be a serious problem with this scheme, because short-lived processes
>   tend not to migrate CPUs much, therefore they don't get much chance to
>   leave lazy tlb mm references on remote CPUs.
>
> Andy? PeterZ? Catalin?
>
> Nick - it might be good to link to the actual benchmark, and let
> people who have access to big machines perhaps just try it out on
> non-powerpc platforms...

Yep good point, I'll put it in the changelog. I might submit another
round to Andrew in a bit with acks and any minor tweaks and minus the
last patch, assuming no major changes or objections.

Thanks,
Nick
