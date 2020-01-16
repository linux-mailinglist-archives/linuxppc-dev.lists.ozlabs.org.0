Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD013D3CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 06:36:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ytGb4632zDqVs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:36:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZgcbuRsf; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ytDS6Yb0zDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 16:34:32 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id x8so9309719pgk.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 21:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OjhLrwSUixWKfHPYVjag4pJ4Twky6Gk6dHImQohRolQ=;
 b=ZgcbuRsf2JHWAKem4b8L9QCIstpEILQ+LtgpSvVyEIFmuJkHkq4wV3UhW+NB3I/p7L
 g8PhhD9MkXc8GNcgMLwPiGkXbVvTxOXXqfpvUxWGjbrkeerRAqqt7CgHVi3clSMsX94r
 2eu6s/C0/gJJDbr9MjhIhO6KsPExdslbKPn1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OjhLrwSUixWKfHPYVjag4pJ4Twky6Gk6dHImQohRolQ=;
 b=o3Tz3ieRT4LumV76yia5Wnt/Q7gnWGzfVsRaP59hvSAEAMZiWirqtd1EBCzyPvbhgH
 boDfoSOPP48ASe25rAwdV1XcvezKrnByFZ8l3jcV3qwU6rZBlzeRuRWn+wdaDWywMEp6
 KYUPLVADhbV4w3ptclkR0QOgVBDC0UKQUn18TEmoBxiRzmedPX8VAuexR4Jved52sQz0
 lbsN6ttjKV86vfd51y6tSBTLp0pbX7YZHRCz7fyctF/AWbJaDtty+FuIfg9Q/3m+eKA5
 gPoTtEMkkNhuvn36BHfpqRgKxL+4HUbDmLSvSVt3g0uc8Pr8ZB46ScJmffH8/EYPnVaZ
 PqoA==
X-Gm-Message-State: APjAAAX+YNwRwSQVzu+fzYwWWKLCcJRmZ6W/ROOIKlwa1ms5rIwVyyfz
 lhQIs+zdgOHNbcUAF8ZPJxQhNw==
X-Google-Smtp-Source: APXvYqxrN0+qBEVUpua94Qb8xZteFhv2nkLn9S7EhrqzK/2c5Vhq+y51pzR4+MJYtOWvoNtguucHYw==
X-Received: by 2002:aa7:98d0:: with SMTP id e16mr34318946pfm.77.1579152866617; 
 Wed, 15 Jan 2020 21:34:26 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-097c-7eed-afd4-cd15.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:97c:7eed:afd4:cd15])
 by smtp.gmail.com with ESMTPSA id p16sm24333466pfq.184.2020.01.15.21.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 21:34:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Dmitry Vyukov <dvyukov@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/2] kasan: stop tests being eliminated as dead code with
 FORTIFY_SOURCE
In-Reply-To: <CACT4Y+Y-qPLzn2sur5QnS2h4=Qb2B_5rFxwMKuzhe-hwsReGqg@mail.gmail.com>
References: <20200115063710.15796-1-dja@axtens.net>
 <20200115063710.15796-2-dja@axtens.net>
 <CACT4Y+bAuaeHOcTHqp-=ckOb58fRajpGYk4khNzpS7_OyBDQYQ@mail.gmail.com>
 <917cc571-a25c-3d3e-547c-c537149834d6@c-s.fr>
 <CACT4Y+Y-qPLzn2sur5QnS2h4=Qb2B_5rFxwMKuzhe-hwsReGqg@mail.gmail.com>
Date: Thu, 16 Jan 2020 16:34:23 +1100
Message-ID: <87zheoj76o.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Daniel Micay <danielmicay@gmail.com>, Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> >> +/*
>> >> + * We assign some test results to these globals to make sure the tests
>> >> + * are not eliminated as dead code.
>> >> + */
>> >> +
>> >> +int int_result;
>> >> +void *ptr_result;
>> >
>> > These are globals, but are not static and don't have kasan_ prefix.
>> > But I guess this does not matter for modules?
>> > Otherwise:
>> >
>> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>> >
>>
>> I think if you make them static, GCC will see they aren't used and will
>> eliminate everything still ?
>
> static volatile? :)

Yeah so these are module globals. They'd be accessible from any other
files you linked into the module (currently there are no such
files). They're not visible outside the module because they're not
EXPORTed.

Making them static does lead to them getting eliminated, and 'static
volatile' seems both gross and like something checkpatch would complain
about. I'll leave them as they are but stick a kasan_ prefix on them
just for the additional tidiness.

Regards,
Daniel
