Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F325C390722
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 19:09:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqLCY6jXfz30Ff
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 03:09:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dH4LRJFO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=dH4LRJFO; 
 dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqLC34Y5Kz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 03:08:45 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id s25so39106490ljo.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YvxwasV3o08S01uFdoV0qFUxStbZu24t5VWYL/Z5N0w=;
 b=dH4LRJFOr8DyI6tVC413uQb6bVgsUfNNN5GVOL87MHgyf4TmXf56f9BRmm/NaQriVi
 h42DXF9tDNN0dlGPcRoieAuWd3Ng45IUF+4ohUrgD33LPgMe4IXiB18IwNsLkctxOZJR
 BV4Lo39FBum7sIMlXElr5+/H7RdqM8MEZ4Qgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YvxwasV3o08S01uFdoV0qFUxStbZu24t5VWYL/Z5N0w=;
 b=EU0PKAFAE5ukyhLjIKPWQZzbkgjp0XXhYUzKKEgsWo0dFffVX2WtyXkH/Ql/cZCONX
 hfsgAAYfHI/oV/7N2dJd2E7epP+yNX0kXN6kZqDldf4Eu4MLurs90NiYKvRDKuae8trD
 F/XyUpaLOZc90SKpa1EXfC5cquAV0m9u0utAMSp1Pwrxlw78AtmX5EtCn32lqywm65cl
 p3V+dBLk+r0/FTTtJT2RCxqp/nPi2w86W7tKEkjFUkFnTnZ7dnFp90UgClD+Ad/L4tzj
 b7K296s1r18ZG3MLDSedNBmJ9SeWUsjjWdfO0Sdw1hBibizNhmcyrUAo2MhDxC4KQDiJ
 cf3A==
X-Gm-Message-State: AOAM532Sxn/z1G4sTzMCZ5+6TFA310VXRjn/XhuJl9yfSluUwvpBQIYQ
 wndWgXLhUMbsx8SpWpjXrvRoxd1GYznsAj+JP6M=
X-Google-Smtp-Source: ABdhPJyuFf2ZRsCJwGQ7ENlZ+w3XFJN8rPltnUogjo7c1KewYBt/m5rhVRmNhrZY7ewX9jYznk6YjA==
X-Received: by 2002:a2e:8417:: with SMTP id z23mr22309349ljg.487.1621962516463; 
 Tue, 25 May 2021 10:08:36 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id n10sm2147290ljj.42.2021.05.25.10.08.34
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:08:35 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id w33so39239225lfu.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 10:08:34 -0700 (PDT)
X-Received: by 2002:ac2:5e88:: with SMTP id b8mr1179529lfq.201.1621962514489; 
 Tue, 25 May 2021 10:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
 <20210524090114.63446-8-aneesh.kumar@linux.ibm.com>
 <CAHk-=wimLWeWmsdkGetYzaASqxdzHmZGXJ51_3qjqyXBAYaw6g@mail.gmail.com>
 <87mtsj6izo.fsf@linux.ibm.com>
In-Reply-To: <87mtsj6izo.fsf@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 May 2021 07:08:18 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgtB6zazfZ3i4_UHhJ_ONz63hJzP4rZYg89jNFs3uqBkA@mail.gmail.com>
Message-ID: <CAHk-=wgtB6zazfZ3i4_UHhJ_ONz63hJzP4rZYg89jNFs3uqBkA@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] mm/mremap: Use range flush that does TLB and
 page walk cache flush
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 25, 2021 at 3:28 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> How about flush_tlb_and_page_table_cache() ?

Honestly, I'd prefer it to be a separate function.

So keep the existing

     flush_tlb()

as-is, and add a

        flush_tlb_walking_cache()

and document that any architecture that flushes the walker caches as
part of the regular tlb flush can just make that a no-op.

Would that work for powerpc?

But:

> >  (b) is this even worth it as a public interface?
>
> But such a large range invalidate doesn't imply we are freeing page
> tables.

No. But it's what everybody else (ie x86 and ARM) does, and if you're
flushing megabytes of TLB's, what's the downside of flushing a few TLB
walker cache entries?

You already do that for internal powerpc errata anyway (ie
"mm_needs_flush_escalation()"), so I'm saying that you might as well
treat the page walker cache as a powerpc-internal implementation
thing.

Put another way: can you even _measure_ the difference between "just
make powerpc look like everybody else" and "add a new explicit page
table walker cache flush function interface"?

Now, from a quick look at the powerpc code, it looks like powerpc is a
bit mis-architected, and when you flush the walker cache, you flush
everything for that ASID. x86 and arm only flush the parts affected by
the TLB flush range (now, admittedly, that's what they do
_architecturally_ - for all I know the actual hardware just always
flushes all walker caches when you flush any TLB and so maybe they act
exactly like the powrpc RIC_FLUSH_PWC in practice).

So maybe it's measurable. But I kind of doubt it, and I'd like to know
that you've actually done some testing to see that "yes, this matters,
I can't just say 'if flushing more than a pmd, just flush the walker
cache too'".

Hmm?

                Linus
