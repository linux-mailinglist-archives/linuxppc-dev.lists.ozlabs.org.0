Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3853907AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 19:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqLfs3Ddvz30G8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 03:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KjhTMVML;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=KjhTMVML; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqLfR6mwQz2yX4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 03:29:01 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id v5so39173300ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Awn1jrbHF/Zxi4xU3ZBefrWifN2nb443oHAbF3a28Sk=;
 b=KjhTMVMLE1xfq+kEMrGnKZYRc5SvwE4wiKk3QCs6PtoNwldJQm531i+4lWJioOithT
 g+yfEBedNJKHP14CN6PhsRXQo3616Ed6HiQyUDE+a0IXNEA4UoHwgEH+zYo8ih7uCeid
 H0EMSRGYoMyZL74a6vWalUOSYyI3pxcAhmoEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Awn1jrbHF/Zxi4xU3ZBefrWifN2nb443oHAbF3a28Sk=;
 b=BaHAna+7b/WdK47rHGdcybxbvHz1EB0YaY0PnJspd65zl5RPIv3xxFonXVGWsCjK3Q
 Y9zHibruRWW33dRR3SuohXtB9/jXozid5sHm2VNxt/gYOACfWBX74d4J7pkhyKIZOApl
 XcjIUJxUJc2s7EsLKEyjTvxdEuPA6E9efNSgHk4TlfToHbqFi2i8U4IU3+pTZA6JgCfL
 kJC2qniXVuQvq3NJ89oJLG8jvdoaHSkc2ORU0QHqiORdjkLwhGrFkqE9wKN+M7Koflz2
 nhvrnu1ZveGu+oVhkaM9rQ07i9qWTD2v4/ahU58SsP4D43e/gpeUvAZZ9PPRFrOs1uzd
 EsJQ==
X-Gm-Message-State: AOAM530DiqxtxC8zEqjhX1M5cKONpNj7lL8q9/7eFU4GU2n7ouYkchXA
 AdLhk+j+vCYVjfQ16/7UzsWWF+UYLbUuX3w8sm0=
X-Google-Smtp-Source: ABdhPJxOMzhk2aoJ+kixMMAE3704B8f/UyTrnV6olpJCgcV+Qc5w8OkGGK5aL9KdJKZnREfa4apZvQ==
X-Received: by 2002:a2e:502:: with SMTP id 2mr21636266ljf.384.1621963736682;
 Tue, 25 May 2021 10:28:56 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id p33sm1787706lfa.43.2021.05.25.10.28.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:28:56 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id o8so39271323ljp.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 10:28:55 -0700 (PDT)
X-Received: by 2002:a2e:c52:: with SMTP id o18mr21000635ljd.411.1621963735464; 
 Tue, 25 May 2021 10:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210525083344.162377-1-aneesh.kumar@linux.ibm.com>
 <20210525083344.162377-2-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210525083344.162377-2-aneesh.kumar@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 May 2021 07:28:39 -1000
X-Gmail-Original-Message-ID: <CAHk-=whH4AxQ=84dPDtooDUS9PPLz0ar7YaEoE=qGoksBtuCng@mail.gmail.com>
Message-ID: <CAHk-=whH4AxQ=84dPDtooDUS9PPLz0ar7YaEoE=qGoksBtuCng@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mm/mremap: Fix race between MOVE_PUD mremap and
 pageout
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
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 24, 2021 at 10:34 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> @@ -221,6 +222,9 @@ static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
>                 spin_unlock(pvmw->pte_ptl);
>         if (pvmw->pmd_ptl)
>                 spin_unlock(pvmw->pmd_ptl);
> +       if (pvmw->pud_ptl)
> +               spin_unlock(pvmw->pud_ptl);
> +
>  }

You have this habit of adding odd whitespace..

But yes, this seems to be the right way to fix the races properly. The
pageout code is special, the pageout code is normally not critical, so
it's the pageout code that should go the extra mile to make up for the
fact that it doesn't hold the mmap_sem like good page table
modification codepaths do.

                Linus
