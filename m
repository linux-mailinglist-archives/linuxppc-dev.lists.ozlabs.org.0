Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27115BA380
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 02:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTFM531M2z3bWM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 10:29:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b+W571Nk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b+W571Nk;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTFLP42svz2xtV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 10:28:59 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id e5so19670641pfl.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 17:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=pRr+lltLGQMhx8klx0NoKEq8l1FmcSf72sejMqC4PhU=;
        b=b+W571NkAPWidJkbClHuqOX4zMhF3F6LVNHzEzrd9HuctmJMfYdxX6tNx1vwV9SgJf
         XqXH2NPJ7ihaDY9eVzVz62wIUm2hE/tirWrHeRXlHtfrjIuTTMrE1bYeTkrmHf/6mR9D
         ARM2tu3HjvxgldG87JvYPGUqgkcrtGQwDPXhA/1SJ1KtCWBJ64LNWdS0FK4PZVQKnYmt
         mLpcQYsfLumyNuKNT7KtsjrvIYcrrxwMdNknATxOeNU5XJiBwjOSaLHTu/j3ypVb1XgF
         hM38ubrdoNWKJFoU35ZjckAkiYRKoKUiICqXaRe0mMtvEiKrhaQ+ORIIgH40+E2Woih7
         azag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=pRr+lltLGQMhx8klx0NoKEq8l1FmcSf72sejMqC4PhU=;
        b=UNm/l87C5pJvo2IdLMnRApg3YE84BZTvthJJDaXyRpqYEFsKeShwXZEX0es7tcGC8w
         dOlP6XtdoB4BsW7dk6YV1MEOH8JscZs+VmSIwVg6RRWD/w2qtSALTsprLxEdiohGp/Ii
         /gau95SfiHD2kz/hiEUkjuCwByuL+ouw/7Yz7bHHt0Ah3/wwuolG9dh+qOAcBM5Oh8Gi
         Cj34yrc2KdC/hNwL/Owo7OV+h7BxZvf9txGEx1D1ds7Wf0mGRaIehlm0gmZu/0dFI/pX
         K69Gmd2HUpKOAs5z9ZNIjbN529EJwOxKPsRi7GnP6dleINdgnnR6N+FbxPrOfGdS7gG3
         5hDw==
X-Gm-Message-State: ACrzQf2fJm6EZlrUF6Ui2HgN8zq8fltBPNBGO0rqxoGynd6BH/egUy9G
	Vy+t9oxkhx4sEMmUnSrHGM1nqhD8MxQ=
X-Google-Smtp-Source: AMsMyM6+31iVF8EJu15pYKje3pLfX13J5M5iGseXxQBi9Cw5pPERkg9780cABngI7W8NU5bL3cwkrA==
X-Received: by 2002:a63:581d:0:b0:42b:399:f15a with SMTP id m29-20020a63581d000000b0042b0399f15amr2158145pgb.337.1663288136980;
        Thu, 15 Sep 2022 17:28:56 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902d50100b0017550eaa3eesm13638228plg.71.2022.09.15.17.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 17:28:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 10:28:51 +1000
Message-Id: <CMXEFN5FQ3F8.3QA0U4XPG6JN0@bobo>
Subject: Re: [PATCH 2/7] powerpc: move __end_rodata to cover arch read-only
 sections
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220914154746.1122482-1-npiggin@gmail.com>
 <20220914154746.1122482-3-npiggin@gmail.com>
 <877d24n6rt.fsf@mpe.ellerman.id.au>
In-Reply-To: <877d24n6rt.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 15, 2022 at 10:47 PM AEST, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > powerpc has a number of read-only sections and tables that are put
> > after RO_DATA(). Move the __end_rodata symbol to cover these as well.
> >
> > Setting memory to read-only at boot is done using __init_begin,
> > change that that to use __end_rodata.
>
> Did you just do that because it seems logical?

I actually was looking at moving init so runtime code and data is
closer.

> Because it does seem logical, but it leaves a RWX region in the gap
> between __end_rodata and __init_begin, which is bad.
>
> This is the current behaviour, on radix:
>
> ---[ Start of kernel VM ]---
> 0xc000000000000000-0xc000000001ffffff  0x0000000000000000        32M     =
    r      X   pte  valid  present        dirty  accessed
> 0xc000000002000000-0xc00000007fffffff  0x0000000002000000      2016M     =
    r  w       pte  valid  present        dirty  accessed
>
> And with your change:
>
> ---[ Start of kernel VM ]---
> 0xc000000000000000-0xc0000000013fffff  0x0000000000000000        20M     =
    r      X   pte  valid  present        dirty  accessed
> 0xc000000001400000-0xc000000001ffffff  0x0000000001400000        12M     =
    r  w   X   pte  valid  present        dirty  accessed
> 0xc000000002000000-0xc00000007fffffff  0x0000000002000000      2016M     =
    r  w       pte  valid  present        dirty  accessed
>
>
> On radix the 16M alignment is larger than we need, but we need to chose
> a value at build time that works for radix and hash.
>
> We could make the code smarter on radix, to mark those pages in between
> __end_rodata and __init_begin as RW_ and use them for data. But that
> would be a more involved change.

Ah, yes Christophe pointed out it's broken too. We could just align
__end_rodata to STRICT_ALIGN_SIZE for this patch?

Thanks,
Nick
