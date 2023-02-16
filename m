Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194D699D1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 20:44:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHlkp6r1pz3f3P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 06:44:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nQjhqTpW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nQjhqTpW;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHljx2jmkz3cdg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 06:43:32 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id x4so3492208ybp.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 11:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ecCMrPuH47M6x+7l+8oSjk53rrpfDEPsyzkbMwvMYGE=;
        b=nQjhqTpWmrsidiAuvoCcaH+1Nn+MdzCD0u1wOKp3+6nMie0EEOCShOkZxWAStmC0Z7
         0DAiGxaTX/84wos6YcnH4ZcBy4oFJENSMkSF4PKWKvGrLfFlv9miv6D1euEV3WJw2Bja
         U/Tc4VyRAp8gojN5lr+rESfLvTfTK5vezctBWGmB51gEhz9cXu1jwSFmGRSfVyIe7KJW
         9985FtKADC1PSU2QKatY5svbWvXHeK/lG4CpKBFBZzA8TlGvpIV5VpHjgkpocjYvo2Sn
         2t+SpqQDf8D5EE+w43rAN8WY2iOuZ6m2DhxKzx3UvSVmlCnkWCxNbjgkfk9I9fPsoDou
         rcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecCMrPuH47M6x+7l+8oSjk53rrpfDEPsyzkbMwvMYGE=;
        b=m9LpAeaFUnF9q0Dy8aYvdw6Y4d0oafSxFTwhfeBR8H5bD/mGXUrXePVFXpsbR9i8a/
         tWIS4cP3Yp61Azni+1up2HFcbsaHQ1NUh+9O+8Air8fnMgA1cBCpTwE/biHf7h43GQ6c
         78PmHEolcgmcIuD+HkIdykxGd2nmnWocoq65j7m6GHf3+qsIjDhF0guhRGyfIOpQEwEx
         idlWXuMUOqyrfhxqePUI1ll/1S3LaEe0Mi2Arv6UY2YCh9Ux1BpTWYYBkqxjmQAZ/UZJ
         tWuPQYVHBmouTsxU8of+aRzF9GRl1P2NiOQtnOwVjEZ90RW5rIn3Uh9a0x9KwkcDMd7X
         cGRQ==
X-Gm-Message-State: AO0yUKV5gBjF4+cGrf5fSuz9xn8dDA+ilSdu2ko94Ifru6Zdw1akHQ/x
	D0Wzsjo7ktx1LdG+WLSsl7LobxJkSik02rPn7aiuug==
X-Google-Smtp-Source: AK7set+GOKNhzuykRCoIMckW7I82pXv7V9YjFwgSjZ09J90OxeIVOanNo7rnoi+gq6vhCwETbxbWJ7fJFGy2XpbKeOY=
X-Received: by 2002:a25:9941:0:b0:90c:de27:7f15 with SMTP id
 n1-20020a259941000000b0090cde277f15mr876421ybo.428.1676576609777; Thu, 16 Feb
 2023 11:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org>
In-Reply-To: <Y+5Pb4hGmV1YtNQp@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 16 Feb 2023 11:43:18 -0800
Message-ID: <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
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

On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > When vma->anon_vma is not set, page fault handler will set it by either
> > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > a compatible adjacent VMA and that requires not only the faulting VMA
> > to be stable but also the tree structure and other VMAs inside that tree.
> > Therefore locking just the faulting VMA is not enough for this search.
> > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > situation happens only on the first page fault and should not affect
> > overall performance.
>
> I think I asked this before, but don't remember getting an aswer.
> Why do we defer setting anon_vma to the first fault?  Why don't we
> set it up at mmap time?

Yeah, I remember that conversation Matthew and I could not find the
definitive answer at the time. I'll look into that again or maybe
someone can answer it here.

In the end rather than changing that logic I decided to skip
vma->anon_vma==NULL cases because I measured them being less than
0.01% of all page faults, so ROI from changing that would be quite
low. But I agree that the logic is weird and maybe we can improve
that. I will have to review that again when I'm working on eliminating
all these special cases we skip, like swap/userfaults/etc.
