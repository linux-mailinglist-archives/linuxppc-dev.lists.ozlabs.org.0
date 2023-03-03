Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB66A9B6D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 17:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PStPC4DF5z3f4V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 03:15:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DBUjHTuC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DBUjHTuC;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PStNG1gLhz3bg8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 03:14:52 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id i6so2424415ybu.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Mar 2023 08:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677860088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+HigpCH+Z2DmMB8BhdGZnkGJxtK6UAghULTuYAvBYII=;
        b=DBUjHTuC6OLAOEFQL/9SnCUwEjvU7+kYaOKx7lUZ2rsDkdc7y/weciI+YncXMe6yPq
         6v7NyE0keu/sVTwXjsJ4KB5s6vKWaOGP/EGn2Ts18q4AM6xKHTTAs+FzN7P89jEGoSXx
         Rn4xQV9h2vkZ7UOsVGBeGNj5DXmqTpDFn5+Gz2eRhQI6AJYkNZmXOzKQfRNBCpuBXRbB
         POdcu+EOJT60kluX5CyxfEYIr7GmvmSf36YIDXysgZHS203zORKBRmpggPYflvsN1n8+
         9lgiQHv8LJxYXWINdHGrRhDw3uhYq9n1+bTj6MIZ0yhPAuvCWKEBstJYeMFnHvnJVk+B
         rlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HigpCH+Z2DmMB8BhdGZnkGJxtK6UAghULTuYAvBYII=;
        b=rLNeHLtcbh3x0Zen4292d5rrAi76ptNRWjLyf7v2ju4XVWnQfTYBgJPYLiuSz2iCNs
         h4eR/I0WBHmXBoFAYRqUfXclwzHP1EtMzRhlnSoeLLz8f9CYqsptE32nDSdOu4P9hD32
         FJuZwOCsuQGnX3jj1kXjqFmNhgay1q5nNWI/KICLTtcBRhy0a1YdQvvnvFOs4REpIQer
         Wot893MD2Vwya5TZ7Wh9TT6iToR8NdhHrulVs2uqnfWcBpWPlMU2UVjSzw4hr5YVsEtO
         m93YclTgPFuVDUR8mKZck4FmlmfBT525fiXsOSpx+9WD6GGS2+Q5orY7K6NnTzUbyhTd
         MW3Q==
X-Gm-Message-State: AO0yUKXuiB4qjcol/+02pLUoUIwPNTtykapGWIJYDQy0Ko85pIA4AvN8
	coT0PFNdwCuE1VeEGfeZapDwdFSFjUderTCEe423Cw==
X-Google-Smtp-Source: AK7set8tjuuaCGJxS2xjbV3oET8sl7sgczITsPDeROrOkb0RgwsUNDHjDBMroxTBST8vYw0SK0MsoSZi2W21t2t+4Gw=
X-Received: by 2002:a05:6902:524:b0:ab8:1ed9:cfc5 with SMTP id
 y4-20020a056902052400b00ab81ed9cfc5mr1287342ybs.6.1677860088329; Fri, 03 Mar
 2023 08:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20230301190457.1498985-1-surenb@google.com> <31a88065-063a-727e-52fd-9fbc7d17fb5c@redhat.com>
 <CAJuCfpGKK5SwxQr_BKrqnn0ZeaLVtX=n31MbKUwdnSSd4umB3A@mail.gmail.com> <787e7d9a-fcf4-ad5f-97f1-c0e1c1553c2d@redhat.com>
In-Reply-To: <787e7d9a-fcf4-ad5f-97f1-c0e1c1553c2d@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 3 Mar 2023 08:14:37 -0800
Message-ID: <CAJuCfpH83Wq7RK2Xv9ipZFTv4epNJPfhsqzZCXOLJ1D83ih3zA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/nommu: remove unnecessary VMA locking
To: David Hildenbrand <david@redhat.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, 
 akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 3, 2023 at 1:05 AM David Hildenbrand <david@redhat.com> wrote:
>
> >>
> >> Just a general comment: usually, if review of the original series is
> >> still going on, it makes a lot more sense to raise such things in the
> >> original series so the author can fixup while things are still in
> >> mm-unstable. Once the series is in mm-stable, it's a different story. In
> >> that case, it is usually good to have the mail subjects be something
> >> like  "[PATCH mm-stable 1/1] ...".
> >
> > Ok... For my education, do you mean the title of this patch should
> > somehow reflect that it should be folded into the original patch? Just
> > trying to understand the actionable item here. How would you change
> > this patch when posting for mm-unstable and for mm-stable?
>
> For patches that fixup something in mm-stable (stable commit ID but not
> yet master -> we cannot squash anymore so we need separate commits),
> it's good to include "mm-stable". The main difference to patches that
> target master is that by indicating "mm-stable", everyone knows that
> this is not broken in some upstream/production kernel.
>
>
> For patches that fixup something that is in mm-unstable (no stable
> commit ID -> still under review and fixup easily possible), IMHO we
> distinguish between two cases:
>
> (1) You fixup your own patches: simply send the fixup as reply to the
> original patch. Andrew will pick it up and squash it before including it
> in mm-stable. Sometimes a complete resend of a series makes sense instead.
>
> (2) You fixup patches from someone else: simply raise it as a review
> comment in reply to the original patch. It might make sense to send a
> patch, but usually you just raise the issue to the patch author as a
> review comment and the author will address that. Again, Andrew will pick
> it up and squash it before moving it to mm-stable.
>
>
> That way, it's clearer when stumbling over patches on the mailing list
> if they fix a real issue in upstream, fix a issue in
> soon-to-be-upstream, or are simply part of a WIP series that is still
> under review.

Thanks for the detailed explanation, David. I'll post fixups to
mm-unstable patches by replying to the original ones from now on.
Interestingly enough, I have another fix today (internal syzcaller
found a potential deadlock) which might be interesting enough to be in
a separate patch. So, I'll post it as a separate patch and we can
discuss whether it should be squashed or kept apart.
Thanks,
Suren.

>
> --
> Thanks,
>
> David / dhildenb
>
