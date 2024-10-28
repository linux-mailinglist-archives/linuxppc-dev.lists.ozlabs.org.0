Return-Path: <linuxppc-dev+bounces-2654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7909B3C44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 21:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xclrg5nmGz2xnc;
	Tue, 29 Oct 2024 07:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730148611;
	cv=none; b=AajXB8OjP8HtegqBdQUdPseXHHqjzvoy3UPvuiiN5X/LVTqbvvzStSe9BB8oABB3ZcgQsajI1SSsoaU8Qgg/fjw+1+qDnlOZR6UthsWHY/InMD0yryiKGTcPBLgsqXbD51JL0QsX5ThQSG+b15k+vZjPCDd7xfNAvRUdUiSnAWLANRpGB663Yl0bEz+jbQCZ+l5o0KJ4GrxczA/Z8HnoWrp65AOfyUI7AjoWXZMcIdHAK5cgFsE5zUEwFxx64syZIGCBCok/V1bZrvq+wMMvzVsUCy7ZrnkRkb10tlbGoErCNzGukUOzOJZo0+VC0BnVUo9TKMyXUDnbhdhj9gKcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730148611; c=relaxed/relaxed;
	bh=/pCOK+sWq3KvGxEiplT09HDtt0a2Jr7uX+2/ZJn5I0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBmptKQuZ6cEl8qTf4+xDLG0UBweZ7IIUPW2CSAmZCVdNWpZRReLXi+JBqQOCvldQwRazKgnTL03R2CLbltSjcLm3Qq9WIiOVOVQwRDwPyeQybnSgFdtdlhic5qcx+nrATcYb5sgH9dRt2hAuUm1ggoeBvzniki0PDCw+6moJzHdfz+HM22dU6pjx/8vxTrQUcsehBLikLV6k+E6lnC5EsDi48WR+OA8h+ACawZUsFs+WGAXzRQeedfrCTaPGEU4N0wIuEI1vMfKHFltrGUMfyglvjUB2lEWNET/+iAr/nCn2ht/f4EGATs/5aQGFQLQUFdFXegb+EimEAIqdfZElw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=V1W9cXS0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=V1W9cXS0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xclrb2pZ2z2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 07:50:05 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so6025453a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730148598; x=1730753398; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/pCOK+sWq3KvGxEiplT09HDtt0a2Jr7uX+2/ZJn5I0k=;
        b=V1W9cXS0345GdpMNdAJT5q9KtxvH+5Ck7Nw5rw47U0N7IKfpZJpbtspgxzfSQdMBdG
         ESbMcZLUglFQr7GaaNCZD2RnnJPaH2NPxbAc+mM2Og3PYmboYkI+8KmFbJknrl/K4Rg6
         ifsYj/kqY5m6m0GH8WXMk5KLqIJHTLSOzBKWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730148598; x=1730753398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pCOK+sWq3KvGxEiplT09HDtt0a2Jr7uX+2/ZJn5I0k=;
        b=ef+CcDHP9eO3PaZADoYG8tLcws3UJPmpger/IDJXJVotD6x8m4p5tRr7QdAgh9EMqd
         2VViDHfICHoDnR6U8steCX3yEYgY2cLzkZNGSAPUo6PCyubiqUE2T/REDn+vWeddo78g
         rU4bpRCwmZWwnzEPs3yXD9UPKh7ref8sz5HmRReHdJKDEKIX0juYCoF3t1PQc8XxnnYb
         rocOKT8gM0WXO6vRGeJi4x+gPbirAciI7cevV6+6VXE2II2Vt106wLhIWFq/xvbR+1RC
         BGaiEQb34wpb9LQXegtqCPN+WHL98kz63G5nsoj4VZfgF69PoITQQAqV02yQvwo/9GbN
         1dEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGKBoc1mGo7vXuN27TvbojQjWf0ds25wTQGZ8jpc+TgsSBirCAooefaYVdfuRsZMtSmQylgiUd3WM7WVU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwU7khjiMIwL9pWhmdEfWZuh0xEb8kqFWrpOYyvNM2Jt6wIB2Up
	2MU40e3p5AqORXxDlxU4d36Sh5X5DG/ifB86rXcD/7A6DyMNEc3GGrQU8BcZn+9MQBUpJhIncyn
	D0AZoYg==
X-Google-Smtp-Source: AGHT+IG1AjPgVWlb2T42YWfMsawPbnqWbFStUbHcTH6hHdH5CdT6M1WUK5sCmB8NFpV2Z5LTOajCjQ==
X-Received: by 2002:a17:907:86a5:b0:a9a:6847:e82c with SMTP id a640c23a62f3a-a9de5d95e17mr891453866b.15.1730148598015;
        Mon, 28 Oct 2024 13:49:58 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08496esm405150766b.198.2024.10.28.13.49.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 13:49:56 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so6424509a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 13:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWz0GhoOi6/X9aP8dCXT0wSbP5gKVTkfOwi5Rq8uevhWDH64ZuIkC0Qrg5k5dQjgKuMD6jMyeFRw0UZW94=@lists.ozlabs.org
X-Received: by 2002:a17:907:a41:b0:a99:46dd:f397 with SMTP id
 a640c23a62f3a-a9de631e84fmr988846066b.64.1730148596238; Mon, 28 Oct 2024
 13:49:56 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
 <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com> <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
 <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com>
 <rjjwtpbxal4glznnkp6a65rtbynn3plrrcgwdg2ucaacmjrnqd@5otngejwtuzu>
 <CAHk-=whhLqN9SQ++JbLWbWv+oaWYtwrikbUGD0W7sq=BfasZrw@mail.gmail.com> <jor77iq2gudlv2iaflnw7vknvi5z5zswgcho73yq4trbnevnm2@cwnkb76pxtsx>
In-Reply-To: <jor77iq2gudlv2iaflnw7vknvi5z5zswgcho73yq4trbnevnm2@cwnkb76pxtsx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Oct 2024 10:49:39 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgtYDbkMxwnxHe7ChRqonabS3sh+XbbpEEXgE2BOo9x_w@mail.gmail.com>
Message-ID: <CAHk-=wgtYDbkMxwnxHe7ChRqonabS3sh+XbbpEEXgE2BOo9x_w@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 28 Oct 2024 at 10:31, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Mon, Oct 28, 2024 at 08:44:10AM -1000, Linus Torvalds wrote:
> > I The *hardware* presumably uses either bit 47/56 because that's the
> > actual hardware width of the TLB / cache matching.
>
> It is a guess, right?

Yes, I have no idea what they actually do.

> The bug makes more sense to me if the bit number depends on the active
> paging mode: this bit naturally used for indexing in top level page table.
> The mistake is more understandable this way.

If I were a hardware designer - which I'm obviously not - I would
*not* make the TLB lookup be based on the paging mode at all.

Only at actual TLB fill time would I care about things like 4-vs-5
level page tables (and the canonicality check would then obviously
cause the TLB fill to not happen, so you would never have a TLB entry
that could clash with the 4-vs-5 level page table model)

So I would assume that hardware that supports 5-level paging would
just unconditionally use bits 0-56, and older hardware would just use
bits 0-47. Why put extra pointless logic in what is arguably the most
critical path of the most critical piece on the CPU?

But I have zero inside knowledge, so yes, it's all a guess.

               Linus

