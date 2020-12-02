Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8EC2CBFEB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:40:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmM8d132dzDqtV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 01:40:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Aqhw72Hv; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmM5p5mnQzDqyG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 01:38:17 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id o9so1353787pfd.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Dec 2020 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=2Fs7ai24DqkxtxArlzcoZyYT9VSvAAqY62xWW9SRJew=;
 b=Aqhw72HvwohUbOEi6rnKx9BddRB1CRUmPb2IMo1f4RmfGdCYe9u3D9NZMkRb5cU1z9
 LISZNoxZulsQN7YNMxLulCsAlKJOEQMKvvLepnYWweR/W8SfB45Oo+TxQCszPAHqrh5i
 CZVyU1HG1zQ7hcGKGrg29b/R262ttz0hQUkFOMg1ueTdqNO+383GrXT+zmcLFDoGR62C
 0WZlSNYpAfDgthqkbWr8bv7YVQBwj69qk36lnk770I4oA/ch2+oTwFY3Puqa/hkPiIcx
 AeUdypd4eqCRKXmdISsemrQKK2dBXuA4WNpYgABbMDy6tsRZjyQptpkHLMmFEMqy8I9M
 utMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=2Fs7ai24DqkxtxArlzcoZyYT9VSvAAqY62xWW9SRJew=;
 b=UpIsU33qlEmCyDhZMUF9DoMalB6ssBJk3jisauoR4dGZdCEKKF/ndfoL2ESKFQwRWC
 Bl16LtwJuXY/u5i2wgbUh+b92kIcKhwtb9JBI9a5LKBsGZYeykh9XsDYbeupJUPcELMQ
 JPh/K3Jj4E9GjSWDOSAAyYU35whjd/vhf7dSmETQe/FoeEkBDG6+vqgp/YTcbI4pmfZw
 wOhWBQZCkmyONBGsmXaox25saSEhiRlRBThoXQWmpoxjFNoV55SozGt8dX7ZUpIJO0sb
 N7NJQulsJEVLY9Nuo7gHLFxP9Sq2x49ksD8jsO2+GRT2FRiOK9wjgrBqJeRFlf4ZZ6KE
 oPoQ==
X-Gm-Message-State: AOAM532G+7aCfmyQIuI6MmMhfkP/IXOgLzVQebx7+A4qpnWcCadYVt9R
 HwGORIzLjgvewgQ2ava9JwYicg==
X-Google-Smtp-Source: ABdhPJwaO8pUqbasz2rROJKI5S5GnLlk3tolWP+I1H3Ly/oqX6s2LQgHUDIB7w1VUr6E/FfWpXKIQQ==
X-Received: by 2002:a62:2ec3:0:b029:197:6ca1:2498 with SMTP id
 u186-20020a622ec30000b02901976ca12498mr2880584pfu.32.1606919893717; 
 Wed, 02 Dec 2020 06:38:13 -0800 (PST)
Received: from [192.168.0.122] (c-67-180-165-146.hsd1.ca.comcast.net.
 [67.180.165.146])
 by smtp.gmail.com with ESMTPSA id x5sm20050pjr.38.2020.12.02.06.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 06:38:12 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
Date: Wed, 2 Dec 2020 06:38:12 -0800
Message-Id: <BA2FB4C0-55EA-481A-824C-95B94EA29FAB@amacapital.net>
References: <20201202141957.GJ3021@hirez.programming.kicks-ass.net>
In-Reply-To: <20201202141957.GJ3021@hirez.programming.kicks-ass.net>
To: Peter Zijlstra <peterz@infradead.org>
X-Mailer: iPhone Mail (18B121)
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Dec 2, 2020, at 6:20 AM, Peter Zijlstra <peterz@infradead.org> wrote:
>=20
> =EF=BB=BFOn Sun, Nov 29, 2020 at 02:01:39AM +1000, Nicholas Piggin wrote:
>> +         * - A delayed freeing and RCU-like quiescing sequence based on
>> +         *   mm switching to avoid IPIs completely.
>=20
> That one's interesting too. so basically you want to count switch_mm()
> invocations on each CPU. Then, periodically snapshot the counter on each
> CPU, and when they've all changed, increment a global counter.
>=20
> Then, you snapshot the global counter and wait for it to increment
> (twice I think, the first increment might already be in progress).
>=20
> The only question here is what should drive this machinery.. the tick
> probably.
>=20
> This shouldn't be too hard to do I think.
>=20
> Something a little like so perhaps?

I don=E2=80=99t think this will work.  A CPU can go idle with lazy mm and no=
hz forever.  This could lead to unbounded memory use on a lightly loaded sys=
tem.

