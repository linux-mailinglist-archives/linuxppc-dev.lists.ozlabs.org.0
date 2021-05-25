Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77233390773
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 19:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqLWv31Nwz305k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 03:23:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZomZk8u9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=ZomZk8u9; 
 dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqLWS45Hyz2yWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 03:22:58 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id s25so39167910ljo.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRx+VnzGk9dlAHv6Rxoyzid/pdiG6eDnf+v/WynSiE4=;
 b=ZomZk8u97bUZ1sx6MNxMxtSPcIPBjfeVr9LwuA2E6Lwg0hpueAm9xZPzT59HmBYmr6
 txikVNOjywwe9ND2TjgVuc6LOpOGqvvS1HeRvXp5cDL5wEx+S75UHAyTLTRiSQsEt+c/
 md6vwaw6NQ47hmX+pY/yQWvNGAiXGX2YRbtJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRx+VnzGk9dlAHv6Rxoyzid/pdiG6eDnf+v/WynSiE4=;
 b=T3CW4igWhMFNqdaJrxTbaS1C4fsmWVKuQzRHdypiRYZft1jSIxvYKq3NpuWnOWEBqp
 sceG217rgSe1smDlAqfAFJDIzk7a17gCZ6AqMBuS12iZV3xBetHI7PrSdXki1Yi46wG4
 YMHxZtNgvucB91A7cS1Bf+DscJBu1uvinwKfyL6+ZEO62vJJpti5JPofAJyGyIpIvx0M
 xp9iBojC5Z84TE7aOadktBGFluPv9O0h1NaAWy+A+Rp6/UJ4wCKOqpDiWy/8l1DucODm
 zClab/0g07qRygXg3qKjRmnUlzP8Mx/iTKNkeoqL5T/lGuW9h5SGVpXmi6/yGuvQEL0P
 afow==
X-Gm-Message-State: AOAM531cmFfWno2ued3JhG3uKEZVoJTM4its2fo5hZ8w2Xth8KHGw1jA
 cd4ivtnoSERE4cslyBvUzHlfmYbQFLQNqdGNGBY=
X-Google-Smtp-Source: ABdhPJxJLuqur+t94dKJH54CEzqT2/AQJlYQnMOHv6+8nEEufwN9MbIkLDUR20uzbuXG5Ua32i3/YA==
X-Received: by 2002:a2e:a482:: with SMTP id h2mr21681426lji.246.1621963372516; 
 Tue, 25 May 2021 10:22:52 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id u7sm2173385lja.4.2021.05.25.10.22.51
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:22:51 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id e2so32851001ljk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 10:22:51 -0700 (PDT)
X-Received: by 2002:a05:651c:333:: with SMTP id
 b19mr21270548ljp.61.1621963370856; 
 Tue, 25 May 2021 10:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210524133818.84955-1-aneesh.kumar@linux.ibm.com>
 <CAHk-=whtmtA0SC5pjoeJ5+nHeiroQen0bph1abMJyb6Ge1b_wQ@mail.gmail.com>
 <87pmxf6w4m.fsf@linux.ibm.com>
In-Reply-To: <87pmxf6w4m.fsf@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 May 2021 07:22:34 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgtu_CioNP0V3iv6AdSnfwrkxaibMBTTVHVqPUCLNaX4A@mail.gmail.com>
Message-ID: <CAHk-=wgtu_CioNP0V3iv6AdSnfwrkxaibMBTTVHVqPUCLNaX4A@mail.gmail.com>
Subject: Re: [PATCH v6 updated 9/11] mm/mremap: Fix race between mremap and
 pageout
To: "A lneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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

On Mon, May 24, 2021 at 10:44 PM A lneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Should we worry about the below race. The window would be small
>
> CPU 1                           CPU 2                                   CPU 3
>
> mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>
> mmap_write_lock_killable()
>
>                                 addr = old_addr
>
> lock(pmd_ptl)
> pmd = *old_pmd
> pmd_clear(old_pmd)
> flush_tlb_range(old_addr)
>
> lock(pte_ptl)
> *new_pmd = pmd
> unlock(pte_ptl)
>
> unlock(pmd_ptl)
>                                 lock(pte_ptl)
>                                                                         *new_addr = 10; and fills
>                                                                         TLB with new addr
>                                                                         and old pfn
>
>                                 ptep_clear_flush(old_addr)
>                                 old pfn is free.
>                                                                         Stale TLB entry

Hmm. Do you need a third CPU there? What is done above on CPU3 looks
like it might just be CPU1 accessing the new range immediately.

Which doesn't actually sound at all unlikely - so maybe the window is
small, but it sounds like something that could happen.

This looks nasty. The page shrinker has always been problematic
because it basically avoids the normal full set of locks.

I wonder if we could just make the page shrinker try-lock the mmap_sem
and avoid all this that way. It _is_ allowed to fail, after all, and
the page shrinker is "not normal" and should be less of a performance
issue than all the actual normal VM paths.

Does anybody have any good ideas?

> > And new optimization for empty pmd, which seems unrelated to the
> > change and should presumably be separate:
>
> That was added that we can safely do pte_lockptr() below

Oh, because pte_lockptr() doesn't actually use the "old_pmd" pointer
value - it actually *dereferences* the pointer.

That looks like a mis-design. Why does it do that? Why don't we pass
it the pmd value, if that's what it wants?

               Linus
