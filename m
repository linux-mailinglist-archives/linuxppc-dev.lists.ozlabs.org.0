Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E669A3CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 03:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHwQs41vQz3cNR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 13:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HZ1MbnjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HZ1MbnjL;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHwPv1DqFz3Wtp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 13:15:13 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-501c3a414acso52377647b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 18:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gIW9E+wxkNTINaEXAot3lldoZz6sgaV4NvNtgjJaTFE=;
        b=HZ1MbnjL/We5C6AX8xTKc/NqTWr1JbNL6JlhMYjY4MPeRhcx4XZI09qb39bGwvRHpn
         8cDtil8U0r6ullafxJ+QwLrNcyZB/iYRlwQxWBWKusbbvKu5LjqUSwq9Ra4ShiIiGrEv
         AxeeaI71BN3x7atdH3dnzKmeE+EolPr5w0YLihfjx8Lqhfdtg4nJ/eIYXfAJrzuibZs7
         cByt+UC1cn5tWYrIXSmdfIJG8w44wiSxOwaDq0TQPCM1gjyd36andjC6MWF3zwokrgru
         63sqYZasEEiF/RtcTOEDIThAitqANjlx8nQcaAyiwezVllR+cWq9GK3mwpXFnbRC0O/W
         bLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIW9E+wxkNTINaEXAot3lldoZz6sgaV4NvNtgjJaTFE=;
        b=MGvB9Y2bQKA9Qpqh5HOeFN4GYjOHty/UQljhhXwbTXbERBEa/2gW4R9trVZv0s2qx9
         y+dUrDhZzrMzwlKlx3Da6tKbca1tTJ69S/bTGgWfHc8Tt0DrSeWyJztFL8WFORRvh0ZE
         3nNRneaxLyWlwRmD1sgf4YB03Xq7/ZQ0EznVFBZsxP+DYSpSbTcA6XMAVk5lsR1f7mft
         Hvz0PGclxqw4FwJOF+OmHJmv02pcsUQD5LRvGD34eoXQVr+d/THJxIg9fv9RuUcun3Oh
         zhCDgBuRSBD0slEVKLfZ18QAVuZw5qwG1dYoqooiOBte5R3xFLmf4ATvkcnRZhggiTnB
         bZ7A==
X-Gm-Message-State: AO0yUKUXz5ByCbK2S1RvLl3n3K2bPOOGpYU5R3ssOomDW0HcipUc2UVf
	MFnPNKzt3WXjwyRUw6izH8HCBYwu3nJfZGLjI4V0FA==
X-Google-Smtp-Source: AK7set9iDocdfaltT1vBZM1FfqGEUR3CgAtWXk18fjpJx7Nf/An2UuUbR7/i7tvhGQPyuOkqzQZqqs2JkP/rFvIUCdY=
X-Received: by 2002:a81:4ed4:0:b0:506:6364:fda3 with SMTP id
 c203-20020a814ed4000000b005066364fda3mr971621ywb.72.1676600110454; Thu, 16
 Feb 2023 18:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org> <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
In-Reply-To: <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 16 Feb 2023 18:14:59 -0800
Message-ID: <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com>
Subject: Re: [PATCH v3 26/35] mm: fall back to mmap_lock if vma->anon_vma is
 not yet set
To: Matthew Wilcox <willy@infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@goog
 le.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 16, 2023 at 11:43 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > > When vma->anon_vma is not set, page fault handler will set it by either
> > > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > > a compatible adjacent VMA and that requires not only the faulting VMA
> > > to be stable but also the tree structure and other VMAs inside that tree.
> > > Therefore locking just the faulting VMA is not enough for this search.
> > > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > > situation happens only on the first page fault and should not affect
> > > overall performance.
> >
> > I think I asked this before, but don't remember getting an aswer.
> > Why do we defer setting anon_vma to the first fault?  Why don't we
> > set it up at mmap time?
>
> Yeah, I remember that conversation Matthew and I could not find the
> definitive answer at the time. I'll look into that again or maybe
> someone can answer it here.

After looking into it again I'm still under the impression that
vma->anon_vma is populated lazily (during the first page fault rather
than at mmap time) to avoid doing extra work for areas which are never
faulted. Though I might be missing some important detail here.

>
> In the end rather than changing that logic I decided to skip
> vma->anon_vma==NULL cases because I measured them being less than
> 0.01% of all page faults, so ROI from changing that would be quite
> low. But I agree that the logic is weird and maybe we can improve
> that. I will have to review that again when I'm working on eliminating
> all these special cases we skip, like swap/userfaults/etc.
