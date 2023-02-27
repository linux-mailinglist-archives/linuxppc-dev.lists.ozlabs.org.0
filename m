Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5866A47DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQS5X58QGz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:23:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BRbX7Yid;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BRbX7Yid;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQS4f1bNDz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:22:57 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-536cb25982eso194847837b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTYModbuR59uTG8zS+hNzwQJ/9GBqPBIvenxOax1Cso=;
        b=BRbX7YidX86oPGQqKm8PfNLIDtGD5UMOuVUS6ca2zJd/iJo9olk+uOd3gMOLdYJ1n+
         uv4dAYbAKZ6OvWilSgdGG9qqbk4t9v7yKyC4gq4xIKFaBF8urvkclYPhGSSQRskBb/Sm
         srRvcLEWJDF34310EiPMnEEhsepBlNF8fGdo7RpnLSxlNxbKlwOEHxj4lD743FqmSeBS
         U5qu9Em33YrENcu1ujFHNSqcTtD88Kh9QmD0gIZm/PVez+Y96kqLFxl9mRtV94FAzyIO
         5DA7YEJptKOIfvIK28FNlMfn6NjxJW09FPV6Ouuznf6X3evlJxOWLuefpgmVhT8ddWIH
         LcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTYModbuR59uTG8zS+hNzwQJ/9GBqPBIvenxOax1Cso=;
        b=k8GaXKwkP2J7RgRlGjzST+ZyfOpEbWTIB6avuQW/an5hyzjFyl9l/K4JS4EiMCxMkk
         luzBQH5koJjLi7+DcoQTbt69A65ZdQTOLMVLN+sRRWO97OZOuwxYduWlUMOAEDrkFMeq
         OPTvc2yq285mf/+UHqlj2p4L6+tsGUz6Vz59o3IZSB3dQ1bDtxz5A1N2kWAFD5qLuMfI
         8o9N6FLk5DBN+/2zssZSNjQiFhKFcUFSDafNE8PEYRC+DxbOuZko+jtnIUgmKYAcn6vW
         63D9HkqiTPlHQOo2QW1cPhHZUx78FI20CQPH1RZMTrA0RoqqGMeUpK3eTe77nz/4tei6
         YB4w==
X-Gm-Message-State: AO0yUKXwSHKyEcD5oYBqOPWKB/lyIBFQDs38aOWVc220KUIQ5meZ78+0
	0yqBPD+3lc83IkQnKC9d4h1MneIEMhxLTX023JnPjw==
X-Google-Smtp-Source: AK7set8fe0yfu+y/XLo8ATPIQLkQ8N9RTHMEBSne/gxsKyen3VnvkrfyF/SuP2kGzz2URTq5dmSg95f/8tSKHp0rjKQ=
X-Received: by 2002:a81:b649:0:b0:530:bbd3:798b with SMTP id
 h9-20020a81b649000000b00530bbd3798bmr10565486ywk.0.1677518572008; Mon, 27 Feb
 2023 09:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230224092134.30603-1-michalechner92@googlemail.com>
 <20230227165032.taj24j4leu7dlbqc@offworld>
In-Reply-To: <20230227165032.taj24j4leu7dlbqc@offworld>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Feb 2023 09:22:40 -0800
Message-ID: <CAJuCfpH4QuX_BmZor5Gy9M9frwz0e3WP597b4q-W3xYHOqUB8A@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Per-VMA locks
To: freak07 <michalechner92@googlemail.com>, surenb@google.com, 
	akpm@linux-foundation.org, arjunroy@google.com, axelrasmussen@google.com, 
	bigeasy@linutronix.de, chriscli@google.com, david@redhat.com, 
	dhowells@redhat.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	jglisse@google.com, joelaf@google.com, kent.overstreet@linux.dev, 
	kernel-team@android.com, ldufour@linux.ibm.com, leewalsh@google.com, 
	liam.howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, lstoakes@gmail.com, luto@kernel.org, 
	mgorman@techsingularity.net, mhocko@suse.com, michel@lespinasse.org, 
	minchan@google.com, mingo@redhat.com, paulmck@kernel.org, 
	peterjung1337@gmail.com, peterx@redhat.com, peterz@infradead.org, 
	posk@google.com, punit.agrawal@bytedance.com, rientjes@google.com, 
	rppt@kernel.org, shakeelb@google.com, soheil@google.com, 
	songliubraving@fb.com, tatashin@google.com, vbabka@suse.cz, will@kernel.org, 
	willy@infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 27, 2023 at 9:19 AM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> On Fri, 24 Feb 2023, freak07 wrote:
>
> >Here are some measurements from a Pixel 7 Pro that=C2=B4s running a kern=
el either with the Per-VMA locks patchset or without.
> >If there=C2=B4s interest I can provide results of other specific apps as=
 well.
> >
> >Results are from consecutive cold app launches issued with "am start" co=
mmand spawning the main activity of Slack Android app.
> >
> >https://docs.google.com/spreadsheets/d/1ktujfcyDmIJoQMWsoizGIE-0A_jMS9VM=
w_seehUY9s0/edit?usp=3Dsharing
> >
> >There=C2=B4s quite a noticeable improvement, as can be seen in the graph=
. The results were reproducible.
>
> Thanks for sharing. I am not surprised - after all, per-vma locks narrow =
some of the performance gaps
> between vanilla and speculative pfs, with less complexity (albeit this is=
 now a 35 patch series :).

Yes, depending on the specific app we would expect some launch time
improvement (in this case average improvement is 7%). Thanks for
sharing the numbers!
I'll be posting v4 today, which is a 33 patch series now, so a bit better :=
)
Thanks,
Suren.

>
> Thanks,
> Davidlohr
>
