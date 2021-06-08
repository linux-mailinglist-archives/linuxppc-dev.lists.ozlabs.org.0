Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0C39EBCB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 04:14:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzYhW25p7z3bsB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 12:14:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KAKRqeqM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KAKRqeqM; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzYh36KB6z2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 12:13:53 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id v13so9778099ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 19:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=GN9OGsGoM5q2Wj6TkWBVaSNZ3ULcmdL6q8p7m1JsxfU=;
 b=KAKRqeqM/EnW/4UM54P+A9EJlb7HswqJaBECriEWn06A6AuPmgEhw53v2jNqs2UbU8
 +ipemHkdCeJ7hZf8DGPXqrGtSQiaUtrrBKnBPdJgYjyVozFXY41ptb5hYLJGLFvhNTev
 ewFaadk+5/gEhStXYpHg6FCtpMK8RgPstlt/1eAppeKlIpE6yPI9Bb4/UIxrHHPu8c2w
 X5/UbsWQsJ4ttdYqBvk9F53mVXHLXCMepOcCypsou/dkksQrag3RLdK7s6a5G5G5JjOS
 lXcVAZaZzBjqUyLDv8FhAI9Arq44OUf5eOICCTpZBJt15aYY9+zUAww9XM7MKW8Xp3eo
 AhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GN9OGsGoM5q2Wj6TkWBVaSNZ3ULcmdL6q8p7m1JsxfU=;
 b=Mcix72NT9oikGnx3V6N0yVT+2t4w+zZ5afBVrMkAR5cJjrbARFxuZcuhmsRogPwFTx
 LP9BMzZCcBl10wYx+68AMPKcS0lhBBog/uuuOvPuGS6nEKT7bXe0FYai8+H4z1sfen5D
 p05VyrgVEy9zLEMv3f9N9jVMhz8MnToXvtFMw2+FqvLezF6M0FGV55pKI+EDLxJwkUaF
 z58FawbL/iHvhs2xyNvDfigpJxvrQeOHz4iTeW4p7513DKJu4INjZlHmwFXe1xvIMYx9
 LOL0rhevQMZY4Z6cuGtTaq1llyAsbVL1qE8gUi5qmpGT7ZLxlN4TjI6Kh213+kGfOW3m
 gQ2Q==
X-Gm-Message-State: AOAM533ppk8oh2IpFFDgrvE3TgH7eHnMN79po/vrofcJr/SnLFiVrpww
 dtzN7QqPbL02qLrJenyc/i6yK2JujDg=
X-Google-Smtp-Source: ABdhPJwZostydn6bgzgZ5hc0R5uUZONrVbm87sBVNdPt/3RpSMRkRRnU2eGY1TzJGbBSLvRxXRgFUA==
X-Received: by 2002:a17:90a:ff12:: with SMTP id
 ce18mr23452289pjb.215.1623118430063; 
 Mon, 07 Jun 2021 19:13:50 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id r92sm637379pja.6.2021.06.07.19.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 19:13:49 -0700 (PDT)
Date: Tue, 08 Jun 2021 12:13:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 4/4] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-5-npiggin@gmail.com>
 <20210607165241.4dcd4cf63f96437c5650d179@linux-foundation.org>
In-Reply-To: <20210607165241.4dcd4cf63f96437c5650d179@linux-foundation.org>
MIME-Version: 1.0
Message-Id: <1623116405.kj57caxq27.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@surriel.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andrew Morton's message of June 8, 2021 9:52 am:
> On Sat,  5 Jun 2021 11:42:16 +1000 Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>=20
>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>> with as many software threads as CPUs (so each switch will go in and
>> out of idle), upstream can achieve a rate of about 1 million context
>> switches per second. After this patch it goes up to 118 million.
>=20
> Nice.  Do we have a feel for the benefit on any real-world workloads?

Not really unfortunately. I think it's always been a "known" cacheline,
it just showed up badly on will-it-scale tests recently when Anton was
doing a sweep of low hanging scalability issues on big systems.

We have some very big systems running certain in-memory databases that=20
get into very high contention conditions on mutexes that push context
switch rates right up and with idle times pretty high, which would get
a lot of parallel context switching between user and idle thread, we
might be getting a bit of this contention there.

It's not something at the top of profiles though. And on multi-threaded
workloads like this, the normal refcounting of the user mm still has
fundmaental contention. It's tricky to get the change tested on these
workloads (machine time is very limited and I can't drive the software).

I suspect it could also show in things that do high net or disk IO rates
(enough to need a lot of cores), and do some user processing steps along
the way. You'd potentially get a lot of idle switching.

>=20
> Could any other architectures benefit from these changes?
>=20

The cacheline is going to bounce in the same situations on other archs,=20
so I would say yes. Rik at one stage had some patches to try avoid it
for x86 some years ago, I don't know what happened to those.

The way powerpc has to maintain mm_cpumask for its TLB flushing makes it
relatively easy to do this shootdown, and we decided the additional IPIs
were less of a concern than the bouncing. Others have different concerns,
but I tried to make it generic and add comments explaining what other
archs can do, or possibly different ways it might be achieved.

Thanks,
Nick
