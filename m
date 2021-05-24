Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615438F1F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 19:03:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpk7f3XGsz3btr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 03:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UZHr8V7L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=UZHr8V7L; 
 dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpk793Bs6z2yXF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 03:03:16 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id i9so41633473lfe.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/3QAeeo+yJfow6zXtHKCA2dbIrupeoaFFnfqnOlK/s=;
 b=UZHr8V7LSADLVqxm6hb+ra375MOhHTRpeGl1cvJtNJ3WUk1zRopV1440omxMNqsAiE
 w04yAYotzc3uyyC93jZmFR5z6IF+Yd/jP4Y3VPqKXoJbmk4RH7E03b2791j5zNPTAfhj
 io7WFsrh6qL1+wzbS4RcZe9gpWK22qs9TCY94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/3QAeeo+yJfow6zXtHKCA2dbIrupeoaFFnfqnOlK/s=;
 b=MmK3wyFFixb0/XjiuLatAlwk4X3/qm6LVczKV0wXg+YkYx3IMky6CMWBVEHUBB/NUx
 MHL815uhhg8k/7oBG/vhVNqAkq0aR6uD9hbgiLEqPpD/T7DNkwZeegOcLBz6b4Vo4+gw
 l1HehIL6t4f4HbBw0Bi+ZsLJ4PVdFfe1IwF8moHchPLd/qoZfUzCeOWUFrhm8hkA1Vyt
 6a5sE2Ut0wra28g9sCzYPJQ6ks7wgYZ3AaFjBYkAh70GlgqeizEw7jOQBgGrRS1aYzHz
 JqOu8BV4a/fVewc0gBuvi24GNTwAW+BpuioGwxI/4viKfiytYANrQoeeBk66e/BnHeIZ
 QeKw==
X-Gm-Message-State: AOAM530xKJiQWoGZ77q75xg5PQJCeEeSSubfEuP7npY1KNBffjxUkbmB
 mPawl/EvfoeIF1XhKFOytGQx5ud6CAIPGJZ4n3w=
X-Google-Smtp-Source: ABdhPJzA1VgN9S55shzJHNoYAgMqd+4gJS+6O0bpQySGXOmPZasaJoWeoNq4VvMyxm9xmej5+gSCjA==
X-Received: by 2002:a19:c397:: with SMTP id
 t145mr11305570lff.307.1621875791835; 
 Mon, 24 May 2021 10:03:11 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id c8sm1822157ljd.82.2021.05.24.10.03.11
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 10:03:11 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id c10so20617821lfm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 10:03:11 -0700 (PDT)
X-Received: by 2002:a05:6512:1047:: with SMTP id
 c7mr11373591lfb.253.1621875790824; 
 Mon, 24 May 2021 10:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
 <20210524090114.63446-8-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210524090114.63446-8-aneesh.kumar@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 May 2021 07:02:55 -1000
X-Gmail-Original-Message-ID: <CAHk-=wimLWeWmsdkGetYzaASqxdzHmZGXJ51_3qjqyXBAYaw6g@mail.gmail.com>
Message-ID: <CAHk-=wimLWeWmsdkGetYzaASqxdzHmZGXJ51_3qjqyXBAYaw6g@mail.gmail.com>
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

On Sun, May 23, 2021 at 11:04 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Add new helper flush_pte_tlb_pwc_range() which invalidates both TLB and
> page walk cache where TLB entries are mapped with page size PAGE_SIZE.

So I dislike this patch for two reasons:

 (a) naming.

If the ppc people want to use crazy TLA's that have no meaning outside
of the powerpc community, that's fine. But only in powerpc code.

"pwc" makes no sense to me, or to anybody else that isn't intimately
involved in low-level powerpc stuff. I assume it's "page walk cache",
but honestly, outside of this area, PWC is mostly used for a specific
type of webcam.

So there's no way I'd accept this as-is, simply because of that.
flush_pte_tlb_pwc_range() is simply not an acceptable name. You would
have to spell it out, not use an obscure TLA.

But I think you don't even want to do that, because of

 (b) is this even worth it as a public interface?

Why doesn't the powerpc radix TLB flushing code just always flush the
page table walking cache when the range is larger than a PMD?

Once you have big flush ranges like that, I don't believe it makes any
sense not to flush the walking cache too.

NOTE! This is particularly true as "flush the walking cache" isn't a
well-defined operation anyway. Which _levels_ of the walking cache?
Again, the size (and alignment) of the flush would actually tell you.
A new boolean "flush" parameter does *NOT* tell that at all.

So I think this new interface is mis-named, but I also think it's
pointless. Just DTRT automatically when somebody asks for a flush that
covers a PMD range (or a PUD range).

              Linus
