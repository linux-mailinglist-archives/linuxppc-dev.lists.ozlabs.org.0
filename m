Return-Path: <linuxppc-dev+bounces-13250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C606AC045DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 07:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctB3H39tkz30RJ;
	Fri, 24 Oct 2025 16:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761283019;
	cv=none; b=GzzVXydFRr3B11oKQL3aXiafcXfzquWR8/8vgp0gIOid6YHXRgeL06zG+9GAFKn/gUdG2k1Qew7y09VZoLeVERF2RCY+5DkR4q0x8FiPkAum86AcYa2ViDTk4AuG28jZ0PWE77yOGsTR/1nh+Cyu4+Lc9E+lWdyjNMpI8nqOYemFgvrIYjhloAkAHcHMecj76+RzmGAPq+FGIsUDRuLtAsNxhlPSCAsvKCyf8g/o658w3SeF5Hqen7f/0/SQSK6msIwbxiHgAQ9tx3MNFrZXwosLbkIdYzPNQbmpL8v05irrtYuJVSkxG0MZY4d6foWJ1Vr42Fnl3rfoXZMM2QrK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761283019; c=relaxed/relaxed;
	bh=1JwAfOvfHWiveHwG3B+VPqzu+ErYo2MF7kqHuEps3qs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ElMTYxsAxo/KPtXP8wXz2gjB3vWGX5ZC1hDYimZv8jl+o589jEbSRdbqdeevBWARLmHofRnp+88QCpXZVOvm8vHt5mV8LuEw6yDgy7x9ObPwYmWDzIse9m2pCHyr7ikdrVZ4/QMmbqWBQh6FfhjCtQbuTcwm1ZbuBqyCYoYsroQFuB8NEYUusDrSONvKtOK+JRcmANjKPcZmCuCz9Wpmo/f1+nWJ9sSIyII2IsDUS09wyagkcfxFocesDkOhER/ufFxh2cR62MS4XAkA9IYARCY4+O0eocZPL6Gj4AcX+yPwva/CCJ5sdhLWRtQQwXzFvqd/USSpTzasPBKKSx4jgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=seaotke7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3xgv7aaykdbk9jc7nj5dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=seaotke7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kuniyu.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3xgv7aaykdbk9jc7nj5dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctB3G0dSSz2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 16:16:57 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso2576271a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 22:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761283015; x=1761887815; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JwAfOvfHWiveHwG3B+VPqzu+ErYo2MF7kqHuEps3qs=;
        b=seaotke7hRnVFv+ltCSnRapIIKfW7viP8uuElGRVykhKKQJWB32WNVxoda2GB8lion
         aNQOzVrSz/FMkfzZGIRsO+hArh3YMnidAjQGfB1Ki8T4uR9rxkc0TQ2DSRx43Et59/p4
         JLi84VjK1qRlGwkg+cTldYHmW9fQ8Naz9pqBH+B44xWnsJoHd/mY0ezPsfQ6fSWQB0CR
         DPDY/DqgAm7VSkhzqWkfPqx3bJmkowfQsyBYcDD9LOtqi+tO3rcUg69TStJR1wS6yNs4
         4AH1MiVN02GroAcd0VhCfWkrYXg+e1lGUqUcVdt/6U/6m8sDSDXt+JTTjKKTx3YD3jZ6
         Cmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283015; x=1761887815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JwAfOvfHWiveHwG3B+VPqzu+ErYo2MF7kqHuEps3qs=;
        b=eot5XR57Hx0aoj4+SXrzZDum+ZoV7T4+6UISW+3Z40S5LSBxMie0EZnuaH8G7+ReHq
         uauOFfQtGOPSBi3QU2xQkv1BSXkiChu8laaaMbvI0lVa6Jfl+H0RxXWR4y0ds8FAuwIa
         Md269w0H9GEI6gZiUYhyGXYzjsD0o+2vhk+FlY2qVQ1jYwH2oBQb1sbsRfVABcuzJolK
         gNLVIqOoqzhb8UVnVHrEc8YQvHdtPasf8nyuwlhuCCuR+5rlEqgPK/869eUmySMEQdd0
         r8y+Kghd0GhEatsbCmN9viLZOqMe0hKbbmIAa9zjZeGr4w2/Q+uUqDAJO/DvpGpH5XLO
         xYig==
X-Forwarded-Encrypted: i=1; AJvYcCUE/Fu+0nNCW/Cgopr79MqucX7G8txOg2HICZKxh1M6OP52AUQu1Umx9wEuBNA0bxDfBfMcoDRuKOc7Yl4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyowqUEq2wrppXb8SZ+JItwcL5AbEk+P+FHhUARlX5AIFgA7Bjh
	IWcvKAzId1su5Dpw1n4dGDhnUyqHbgCeU1hDo0bPOYc3DAE4hJC4PvvqB8lgxeKhTVHZexwwVbW
	FryAgaw==
X-Google-Smtp-Source: AGHT+IFxT94+rQGdQ1s8VDmzk/KuJ8lt96XLnKSdy7VNhFGvy0hrjNSBNuZhWw/inI+IBcmkkRvS1vw5Cn4=
X-Received: from pjob8.prod.google.com ([2002:a17:90a:8c88:b0:33b:51fe:1a7a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d610:b0:33b:da53:d116
 with SMTP id 98e67ed59e1d1-33fd660fe13mr1382618a91.26.1761283014686; Thu, 23
 Oct 2025 22:16:54 -0700 (PDT)
Date: Fri, 24 Oct 2025 05:16:42 +0000
In-Reply-To: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251024051653.66329-1-kuniyu@google.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: dave.hansen@intel.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, 
	brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 23 Oct 2025 12:40:59 -0700
> On 10/22/25 17:04, Kuniyuki Iwashima wrote:
> > --- a/include/linux/eventpoll.h
> > +++ b/include/linux/eventpoll.h
> > @@ -82,11 +82,14 @@ static inline struct epoll_event __user *
> >  epoll_put_uevent(__poll_t revents, __u64 data,
> >  		 struct epoll_event __user *uevent)
> >  {
> > -	if (__put_user(revents, &uevent->events) ||
> > -	    __put_user(data, &uevent->data))
> > -		return NULL;
> > -
> > -	return uevent+1;
> > +	__user_write_access_begin(uevent, sizeof(*uevent));
> > +	unsafe_put_user(revents, &uevent->events, efault);
> > +	unsafe_put_user(data, &uevent->data, efault);
> > +	user_access_end();
> > +	return uevent + 1;
> > +efault:
> > +	user_access_end();
> > +	return NULL;
> >  }
> >  #endif
> 
> This makes me nervous. The access_ok() check is quite a distance away.
> I'd kinda want to see some performance numbers before doing this. Is
> removing a single access_ok() even measurable?

I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.

epoll_put_uevent() can be called multiple times in a single
epoll_wait(), and we can see 1.7% more pps on UDP even when
1 thread has 1000 sockets only:

server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp

Without patch (2 stac/clac):
Udp6InDatagrams                 2205209            0.0

With patch (1 stac/clac):
Udp6InDatagrams                 2242602            0.0

>>> 2242602 / 2205209 * 100
101.6956669413194


I also took a microbenchmark with bpftrace and we can see
more invocations of ep_try_send_events_ns() finish faster,
and 4% more total calls:

$ sudo bpftrace -e '
k:ep_try_send_events { @start[cpu] = nsecs; }
kr:ep_try_send_events {
 if (@start[cpu]) {
    $delay = nsecs - @start[cpu];
    delete(@start[cpu]);
    @ep_try_send_events_ns = hist($delay);
 }
}
END { clear(@start); }' -c 'sleep 10'


Without patch:

@ep_try_send_events_ns:
[256, 512)       2483257 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         850735 |@@@@@@@@@@@@@@@@@                                   |
[1K, 2K)          254027 |@@@@@                                               |
[2K, 4K)           26646 |                                                    |
[4K, 8K)            1358 |                                                    |
[8K, 16K)             66 |                                                    |
[16K, 32K)             3 |                                                    |

With patch:

@ep_try_send_events_ns:
[256, 512)       2844733 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         733956 |@@@@@@@@@@@@@                                       |
[1K, 2K)          166349 |@@@                                                 |
[2K, 4K)           13495 |                                                    |
[4K, 8K)             526 |                                                    |
[8K, 16K)             63 |                                                    |
[16K, 32K)             5 |                                                    |

>>> (2844733 + 733956 + 166349 + 13495 + 526 + 63 + 5) / \
... (2483257 + 850735 + 254027 + 26646 + 1358 + 66 + 3) * 100
103.95551329999347


> 
> Also, even if we go do this, shouldn't __user_write_access_begin() be
> called something more like unsafe_user_write_access_begin()?

Sounds good.

