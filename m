Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB139DB5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 13:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzB4f3QGKz3brv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 21:30:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=l3tb4Ti3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l3tb4Ti3; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzB450yKTz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 21:29:56 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so16360370otl.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 04:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ouJCJpb+cVjhmk8j2qfxiU2PiYqfLkfly1jYgo8fmy4=;
 b=l3tb4Ti3/ESiVNC9be61igb7NBBFLs9+KwCCmS9OlfdmYt9uey00TQd3qX11GWioZN
 1+ht04CVQrf0UM6VxgqDaPTArSmodK3BYXWL0udJ10T612ebj1W+0ybZrwUKDjsQuhz9
 aWq1IA6ZVklOffOiHORlXUO69XDw1ADiZSo4idLvQ6h12ToQK4a3jHvnbUEDNlOV7+01
 LHmOyaDW05UPY+c5NgwRVD0iUH0Ay+szsy6qGJttnnxPj4TS8L4kte71gGZfk7PUgjGH
 YTpNlsQaMR01+gfrJZDGC4WLAe6ZtK5ULr1ZXOXZv/AUuicjXaRdIFWza8lUe7VY4EFm
 7eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=ouJCJpb+cVjhmk8j2qfxiU2PiYqfLkfly1jYgo8fmy4=;
 b=NDQSkNdeAVywKnh/R7z1j4ejBIL+rpjbQGgeEyyWMlhY+62E7UOVA/37JQYpEw+YWW
 MxVgZr+HfUQM5x4u8rOWI799inMbW4S+ja/HnauVLgJeRUtqec8jKjWUh+Jhiflsx7L1
 vWzKcNCwRj9r6OeUW3vy71zEhV7IcoUKSk7huif/O8+zCOTHSeI/x7pFXZQFN5HxPv7D
 0SFH2HK8RlLzYL6wBAIYLm5K8ZBUFbMOIwu9RMxrIDdTHr1kHYNyb/2Hz+1QwkkV8Aba
 LUxbGYcHWJfC8E/4SkGtCW9KbBIJh6GbGgh7VsWjCAMXJILN+mx7AjF7f/jbSI8OUH3e
 9ydQ==
X-Gm-Message-State: AOAM533DVJ2f53FZN8igon3cg2qFmYbs3i0I4ip6VUqeFaPL+oDFMX9j
 TzVWWDIV3z4zrPctps1NwAc=
X-Google-Smtp-Source: ABdhPJwfGgFpT8BfA9ywyPV9GozhTIyRKAxRs5/zwSlum7MqzjvC9UecMC6ghRBNcLEBwvai1toqHQ==
X-Received: by 2002:a9d:560a:: with SMTP id e10mr13685889oti.353.1623065392393; 
 Mon, 07 Jun 2021 04:29:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l9sm2105274oou.43.2021.06.07.04.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 04:29:51 -0700 (PDT)
Date: Mon, 7 Jun 2021 04:29:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] watchdog: Remove MV64x60 watchdog driver
Message-ID: <20210607112950.GB314533@roeck-us.net>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu>
 <31d702e5-22d1-1766-76dd-e24860e5b1a4@roeck-us.net>
 <87im3hk3t2.fsf@mpe.ellerman.id.au>
 <e2a33fc1-f519-653d-9230-b06506b961c5@roeck-us.net>
 <87czsyfo01.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czsyfo01.fsf@mpe.ellerman.id.au>
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
Cc: linux-watchdog@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linuxppc-dev@lists.ozlabs.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 07, 2021 at 11:43:26AM +1000, Michael Ellerman wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
> > On 5/17/21 4:17 AM, Michael Ellerman wrote:
> >> Guenter Roeck <linux@roeck-us.net> writes:
> >>> On 3/18/21 10:25 AM, Christophe Leroy wrote:
> >>>> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> >>>> removed the last selector of CONFIG_MV64X60.
> >>>>
> >>>> Therefore CONFIG_MV64X60_WDT cannot be selected anymore and
> >>>> can be removed.
> >>>>
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>>
> >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >>>
> >>>> ---
> >>>>   drivers/watchdog/Kconfig       |   4 -
> >>>>   drivers/watchdog/Makefile      |   1 -
> >>>>   drivers/watchdog/mv64x60_wdt.c | 324 ---------------------------------
> >>>>   include/linux/mv643xx.h        |   8 -
> >>>>   4 files changed, 337 deletions(-)
> >>>>   delete mode 100644 drivers/watchdog/mv64x60_wdt.c
> >> 
> >> I assumed this would go via the watchdog tree, but seems like I
> >> misinterpreted.
> >> 
> >
> > Wim didn't send a pull request this time around.
> >
> > Guenter
> >
> >> Should I take this via the powerpc tree for v5.14 ?
> 
> I still don't see this in the watchdog tree, should I take it?
> 
It is in my personal watchdog-next tree, but afaics Wim hasn't picked any
of it up yet. Wim ?

Thanks,
Guenter
