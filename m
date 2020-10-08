Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37869287A99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 19:08:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6d2N40YBzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 04:08:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=PfQfZsaR; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6d0k0PGZzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 04:06:58 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id w11so7361081lfn.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9iELUOUH2gSDZ+KGxu3KnkYY6SG+fTRDi1yjPRUUik=;
 b=PfQfZsaRVICKvNpGp8G6VluglndK7J962ZsTyDyp+zMzCpT9B3UMJ6Az1pLJiM3CdK
 tRPwiZiCoybF02TW+zofVU0z33pqqhrcdVmCdeOr/S4loUhaK/tr3d732BrwXy7lp/kE
 CrdZUBHPup88/Mbm0F9HHuMiDptpUy0ZlGqiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9iELUOUH2gSDZ+KGxu3KnkYY6SG+fTRDi1yjPRUUik=;
 b=cZyo44B4uMRN8ra2XsXiX3ye2dEjdWRtQYBSaVIGI+XBx76dYdK/9i7+N4c/do89bU
 3KXrOxRHWwwd8QEK6BtUEXRSCq2FPx/DBG7UgvSvvw8EKvC4yUfcvlCbfkzLMwquoUMr
 s4+pSPpG74+XhN2GZUZg46R+puTASSFomXMqTTrQRMTk2u/BujNU7V95ECUbYbpM1LqW
 nWMY1b1ybyjmBNDdbg1oPnXCQ6ucSn4XDBxk9fne1B+uXl7pnXQgpdQ3Bc7C/kTojYIs
 7lEtFe6mi2Le7rkoq7c7QBLaSxI3+yHITvcndpS3vOwZCE9aa1JGq8b5v/1WATKGh9Zl
 sSPQ==
X-Gm-Message-State: AOAM533eEW5K8Y2K7R4De4dg12hUMAB6CdVAEgJ8evqX2pXZfg8a/QIp
 VQwZ9NCJcw3ZQBOGAV4yBBe087+2bTcPbQ==
X-Google-Smtp-Source: ABdhPJxj3U0kDYXPrs+8EaIT2FonnO2yrSBXXxURvgqk/eK4KqiqsHmdQFY4qbWspR0IHzBxfwlJzQ==
X-Received: by 2002:ac2:5e72:: with SMTP id a18mr2838581lfr.69.1602176813493; 
 Thu, 08 Oct 2020 10:06:53 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id 73sm891406lfn.303.2020.10.08.10.06.51
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 10:06:51 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id y16so5395927ljk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:06:51 -0700 (PDT)
X-Received: by 2002:a2e:994a:: with SMTP id r10mr3514705ljj.102.1602176810912; 
 Thu, 08 Oct 2020 10:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201008092627.399131-1-aneesh.kumar@linux.ibm.com>
 <CAHk-=whwY0WT046fqM-zdHu9vamUjgkvmd36gCd4qSaeYy98nA@mail.gmail.com>
In-Reply-To: <CAHk-=whwY0WT046fqM-zdHu9vamUjgkvmd36gCd4qSaeYy98nA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Oct 2020 10:06:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0q-_n_uEwgvjHNeVsj=j4Z+wY8_dYNwDPVrpfJi6wRA@mail.gmail.com>
Message-ID: <CAHk-=wj0q-_n_uEwgvjHNeVsj=j4Z+wY8_dYNwDPVrpfJi6wRA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: Fetch the dirty bit before we reset the pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Linux-MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nick Piggin <npiggin@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Kirill Shutemov <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Just adding Leon to the participants ]

This patch (not attached again, Leon has seen it before) has been
tested for the last couple of weeks for the rdma case, so I have no
problems applying it now, just to keep everybody in the loop.

             Linus

On Thu, Oct 8, 2020 at 10:02 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 8, 2020 at 2:27 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
> >
> > In copy_present_page, after we mark the pte non-writable, we should
> > check for previous dirty bit updates and make sure we don't lose the dirty
> > bit on reset.
>
> No, we'll just remove that entirely.
>
> Do you have a test-case that shows a problem? I have a patch that I
> was going to delay until 5.10 because I didn't think it mattered in
> practice..
>
> The second part of this patch would be to add a sequence count
> protection to fast-GUP pinning, so that GUP and fork() couldn't race,
> but I haven't written that part.
>
> Here's the first patch anyway. If you actually have a test-case where
> this matters, I guess I need to apply it now..
>
>                    Linus
