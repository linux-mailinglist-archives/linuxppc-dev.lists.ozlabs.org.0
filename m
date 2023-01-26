Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522F67D0D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2lpN1dyrz3fDY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:02:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=h9de1i7T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=h9de1i7T;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2lnJ6dShz3fJD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:01:24 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id m199so2527033ybm.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7iT09H71Dme3Q3L2MGkwR4iQszyIGWWfBf0bjQrq8xA=;
        b=h9de1i7T+L/7qnwBfp1S8fAzJvvQC2x2oi3vaG0TabJnrPiEBHWMEBUMQXNE++gvMw
         0tvtDLc0gqU4SRrHQyLqiExsMlL/VWO5wXXXCyd4EfosvDm71I8QvFY9h9dh4v0odaek
         rqxRskgYYgAwXV/VpRufMlPSe3KjlzDDMsziRrkBRXl9kqFNnahRRoF7T3nsICDVigSD
         M9djwB9/VxsVfyDOcI98ZfLuT3Eimz5ul1kQFCbvVp6FsrPyT95Rr+ConemDfB7nun1a
         z0oNevShUsT5s5sUR+jodRgmCNuCA3ig4D6U+61xYKrnx3Cx6jPyfSahl9izAuY1q4Iw
         /Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iT09H71Dme3Q3L2MGkwR4iQszyIGWWfBf0bjQrq8xA=;
        b=fbkvr5/8XjyC5k3W2z2Vtmgbxch4R60Ngve+eTGlWrOiQW7w1MVk8k78LYk1550wUt
         hi3Pqt7iYO5auQpGB3j6KFacTTj3P44XGzsheb1+sZUX8nIjFu+Dxbozdl83NYhnp4Bs
         TICANTLVyIMjxuAx8hCJyRqYekosbPxujDIwajnyupz+C/CmUxsLcts77/8/hDuvally
         leuhBwHlhkcz+mk4chVkqJUKWV51gmLxANVJNen3lnYj91/GWEjJB+bls3+GFVwaFWUx
         bjzHpiPZWv2GOf7FpJq83AbdHWHZPWIJ5CMDgLJ64id4MzYse1wbYOC0k3vKpeRtkJhy
         jI/A==
X-Gm-Message-State: AO0yUKXFq53EYRUJzkxLvl5VPUEvxxp0LDXW2YKL//+m8r0oN8liBYHZ
	Kd7a9PSZrUHEuFqShvt2odyoSOnow1sXTtJ9tArpoA==
X-Google-Smtp-Source: AK7set99qRZVqRtIv3KrfALWAP/G2LmVplScKaMgMWNFGGAbZHIOd3N3iLzS8k8hn4NEwWK4eNRhXhPnLf2Bk2V7g6Y=
X-Received: by 2002:a25:5209:0:b0:80b:5988:2045 with SMTP id
 g9-20020a255209000000b0080b59882045mr1083640ybb.59.1674748881333; Thu, 26 Jan
 2023 08:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-3-surenb@google.com>
 <20230126135815.7hjwrrv77y2en2ku@techsingularity.net>
In-Reply-To: <20230126135815.7hjwrrv77y2en2ku@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 08:01:10 -0800
Message-ID: <CAJuCfpHvz8tbgQU_15nxQu2vTjRv9OWjOg5cXBkS_whUC92nxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mm: introduce vma->vm_flags wrapper functions
To: Mel Gorman <mgorman@techsingularity.net>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 5:58 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Wed, Jan 25, 2023 at 03:35:49PM -0800, Suren Baghdasaryan wrote:
> > vm_flags are among VMA attributes which affect decisions like VMA merging
> > and splitting. Therefore all vm_flags modifications are performed after
> > taking exclusive mmap_lock to prevent vm_flags updates racing with such
> > operations. Introduce modifier functions for vm_flags to be used whenever
> > flags are updated. This way we can better check and control correct
> > locking behavior during these updates.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> With or without the suggested rename;
>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>

Thanks! I'll make the renames and repost the patchset.
vm_flags_init(), vm_flags_reset(), etc. sounds like a good naming for
this.

>
> --
> Mel Gorman
> SUSE Labs
