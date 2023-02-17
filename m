Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676369B044
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:11:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJGz12znvz3fSW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:11:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BIBUTCtL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BIBUTCtL;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJGy366Twz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:10:50 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5365893236aso13203747b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 08:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PFNFpEQr/wV6J8ecu6kCjandJU8AZ1ItdrwAe6ofQEU=;
        b=BIBUTCtLGNgOeX/rJadBXrsOuJ2/WIKkC9LptUd9hTOMhrKGH223slhsaq0Tguv3Cz
         Dd/6NKwGbYiRd+Lsr7BWUqZMAVGTQndQiWRAjnZF/CVl/ouXTLLw4PAn6FQRq6iBv0tU
         Kq59V4SeBS77l3W8l+gCWEg6Thq32NdPyKYnxl/rggkX+eYdPw8uq/aICJQNdY1boKhQ
         tzoZZDlP6n6A1LERdgtiGjkEDNOJKXNN5pckjdMSabAlEFdNEb8P3sHqoWVlKwIvn9rI
         N7YHPIENcTPC+/lTUav4KcsUPXwypDmjOCi0dSgGJm4xjhpMDAqGbNQ64lDOBZ4AcKXm
         HHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFNFpEQr/wV6J8ecu6kCjandJU8AZ1ItdrwAe6ofQEU=;
        b=C+T0fKLzETgpv0iLKch6t3waZnaCp5ZjZ/ZCKJGcoSRlXMRJgPjOmR/o7rdrn2b+8X
         tcl/4IuzKsb+/eGvdTK4dN6i2dNXXhOQjFg4++/7sL7jRGEmiGe392jAs8uQJhdreYE3
         6V1KWAgV2tuJ19pPT0N1xybwupTZ+HlbSp8JvXodVDK+mLvGFbOHXNawVjGhf4XIr3i+
         BzjkxNKGkBwAGh8fLQsdXHMuELWvBQguWSjrdgYd0db3PfF9JHkkHISCd22TrxEAgBIT
         yT2hUn6PHMpLYK6y0qsDJSCXlKJFaMiO3nxGZuVKfThh/kVWchZmFvI0hERylSaNjyxk
         Lbbg==
X-Gm-Message-State: AO0yUKU6OGx0R+AzTNfTUE7gfFi2ViJx1cjp9juVq1wJb1PhoRBPFRCz
	hGXYGKmZnj6BydKmlZcOKxDC/Ezs7w1UAcd9M6LsqA==
X-Google-Smtp-Source: AK7set/f5GlkwKOfyDUfvguLjocwuuJ59RkVrqxPVxVbH90lYV8iKuA6tb3DgP9li1jq/Fv1wdtVUPHDZTSi27WK5tw=
X-Received: by 2002:a0d:d54b:0:b0:534:c230:ff14 with SMTP id
 x72-20020a0dd54b000000b00534c230ff14mr316390ywd.7.1676650247072; Fri, 17 Feb
 2023 08:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org> <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
 <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com> <Y++l181MMw+T70yt@casper.infradead.org>
In-Reply-To: <Y++l181MMw+T70yt@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 17 Feb 2023 08:10:35 -0800
Message-ID: <CAJuCfpG_ZWJs3mZkL0z7m-bBe1SmeoTZydfFocZaRbHob_89Hg@mail.gmail.com>
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

On Fri, Feb 17, 2023 at 8:05 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Feb 16, 2023 at 06:14:59PM -0800, Suren Baghdasaryan wrote:
> > On Thu, Feb 16, 2023 at 11:43 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > > > > When vma->anon_vma is not set, page fault handler will set it by either
> > > > > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > > > > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > > > > a compatible adjacent VMA and that requires not only the faulting VMA
> > > > > to be stable but also the tree structure and other VMAs inside that tree.
> > > > > Therefore locking just the faulting VMA is not enough for this search.
> > > > > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > > > > situation happens only on the first page fault and should not affect
> > > > > overall performance.
> > > >
> > > > I think I asked this before, but don't remember getting an aswer.
> > > > Why do we defer setting anon_vma to the first fault?  Why don't we
> > > > set it up at mmap time?
> > >
> > > Yeah, I remember that conversation Matthew and I could not find the
> > > definitive answer at the time. I'll look into that again or maybe
> > > someone can answer it here.
> >
> > After looking into it again I'm still under the impression that
> > vma->anon_vma is populated lazily (during the first page fault rather
> > than at mmap time) to avoid doing extra work for areas which are never
> > faulted. Though I might be missing some important detail here.
>
> How often does userspace call mmap() and then _never_ fault on it?
> I appreciate that userspace might mmap() gigabytes of address space and
> then only end up using a small amount of it, so populating it lazily
> makes sense.  But creating a region and never faulting on it?  The only
> use-case I can think of is loading shared libraries:
>
> openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> (...)
> mmap(NULL, 1970000, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f0ce612e000
> mmap(0x7f0ce6154000, 1396736, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x26000) = 0x7f0ce6154000
> mmap(0x7f0ce62a9000, 339968, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17b000) = 0x7f0ce62a9000
> mmap(0x7f0ce62fc000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1ce000) = 0x7f0ce62fc000
> mmap(0x7f0ce6302000, 53072, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f0ce6302000
>
> but that's a file-backed VMA, not an anon VMA.

Might the case of dup_mmap() while forking be the reason why a VMA in
the child process might be never used while parent uses it (or visa
versa)? Again, I'm not sure this is the reason but I can find no other
good explanation.
