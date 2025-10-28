Return-Path: <linuxppc-dev+bounces-13421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A74BC12F31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 06:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwfDc2rzRz3frK;
	Tue, 28 Oct 2025 16:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761629616;
	cv=none; b=eGDruton0zcEH9Uipy22K6LIN8NCGqtirE4YW3l2jf8GOkDGhAd3+Sf2JYyBS+HXknmFO7ayk4MgzMXlAjIVIV0KrhADY2FNjk/sYgyK087S5aPJq8JCyeLqNB7hw08fADsBfhHXuLR/Du0di+7P6tV/XrkmNnzuVGYQ2PxWeTlctyrhflbDhMM+S6pYEAbxE7uJvThcVFpZF7G1f73xOY4C0XJ/Fk73RRl2ThixnKGANlmrrqQghaPmKjHR8o315cmVhAX+z9S78N6BiC9OE7ejI1tdv1/+9C0rrelIADfdDX1THjgd0/HnssSxi7lSTVwDRekuEQCdGBwDEd2Hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761629616; c=relaxed/relaxed;
	bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PFEIuRhwes9yJVniuahoKCoAZWn1XBA7ZrtnQWDg2mGJGW4pvqagfBtbYAyDRhDyCjF4IlkeENJWh8bBWgl9ihGUoLq5MvlDNR1r9hrZK54CpHlt6iG5zAmVkL6rMlNB4PdPcZLcKiRAjNcz9ysG1UgsQrIeaw+KG7z5wNcxLSIFrs8ro7/zMe3qzJvPf+cZSSusbA1vKcxz/Pt2HFLzs7olNvwoEzEolLKRcLDXllOciSmKg6EltYXkPn+hVl0EgJXrwJmP2EaD7MVWasr7Eg5AvKsC19190oQMRZDOzOtvbyovVI9lAin80F/JhNbdx+6Cof7hBH+TWltRECuXzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZodR+HCG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3rfuaaqykdkcrbupfbnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZodR+HCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kuniyu.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3rfuaaqykdkcrbupfbnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--kuniyu.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwfDb0P0Vz3frH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 16:33:34 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so9650725a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761629612; x=1762234412; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
        b=ZodR+HCG7qHqcM8CANgJBOmmVT3TCdMdOjVwbYyenkYgBdvgROQpT5XWdoeal0DPDg
         sQxJex8U5qrZwJVnQoCZ3gpL1OlgPmEOJZPjkKTXf84P+/icxhIgthJxX68/iBui/IaM
         f5Qpa1yaKDOchziFC5013UhMcx3+oQA1l5p6YEDzFwrtrEOpa55eO5mJujWc8/fvTxbZ
         6mRV0ODfOvFqPCAjKV5DSiDDQ0p8mpvNuung0TRM0YpMKK5+X3w1akekXPCowx0DK3OY
         ayY4tPHKe7gWUryVpZvtp4soO0gswMVx7AD0F5CanL/OXOqd7YRCXnX0T7spo/doE7+6
         S93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629612; x=1762234412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
        b=OzBGDsZ3OE/lcPDI4rmqQZKrAkjY+rgRqcMeIEKHXHbLXdcIYy0dJ+lTaqyRHxLB4g
         t9QBYw8agQUsL1hGMfhlBpX1Qw0GymsP2t+GXfxP7wrs41UIDgslHvt6e8DRWW104+We
         ai5Y0Wwu4QKfOdxpenSM1QXJRgZZdvbaLqTvpxaPzWUEpHWGjahTg240XJyNc5KKhcV5
         kMpghm75SaqN8YmsNlqfmx7KNgpQ6qAFwmLpE3GvvZwQOCme2/5p8cT1INsllyGIdTcF
         Afb8O3eJPtoNqgFSVTuJmUTutyrLvA7qdzFsWQQ4rNXzxY1cA5hgwXFxzUGSxYyA2dZj
         b9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhiNPkN6qWlwc2f/3PjFPk4Q5NXXfH/dBJYORasb3ZVa1k1gk0GwC4ffA8sYgNmtmxxCvHNO78Z2I3yNA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKLs09KGmgY8/7njARCne+JAvCkSsUE22HENLTcGtO87rxc5Hb
	UMyyiWP0JGu3H75SAFGP4FaQ/QizhiL/X4sXM9n/ZfCWs9KohJo6uVupDJBxtOTDVHRquvTBbyw
	zQGJ0dg==
X-Google-Smtp-Source: AGHT+IEgPd1Vro8jar4YuvbY14ALahZ9RGAW96D7MCTDGrIDbCO1GDP/qete02Qehy0msaJmFvHad1jiwWY=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:33d:98cb:883b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2290:b0:273:ab5f:a507
 with SMTP id d9443c01a7336-294cb394740mr35360685ad.21.1761629612502; Mon, 27
 Oct 2025 22:33:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 05:32:13 +0000
In-Reply-To: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
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
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251028053330.2391078-1-kuniyu@google.com>
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
Date: Fri, 24 Oct 2025 07:05:50 -0700
> On 10/23/25 22:16, Kuniyuki Iwashima wrote:
> >> This makes me nervous. The access_ok() check is quite a distance away.
> >> I'd kinda want to see some performance numbers before doing this. Is
> >> removing a single access_ok() even measurable?
> > I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.
> > 
> > epoll_put_uevent() can be called multiple times in a single
> > epoll_wait(), and we can see 1.7% more pps on UDP even when
> > 1 thread has 1000 sockets only:
> > 
> > server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
> > client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
> > server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp
> > 
> > Without patch (2 stac/clac):
> > Udp6InDatagrams                 2205209            0.0
> > 
> > With patch (1 stac/clac):
> > Udp6InDatagrams                 2242602            0.0
> 
> I'm totally with you about removing a stac/clac:
> 
> 	https://lore.kernel.org/lkml/20250228203722.CAEB63AC@davehans-spike.ostc.intel.com/
> 
> The thing I'm worried about is having the access_ok() so distant
> from the unsafe_put_user(). I'm wondering if this:
> 
> -	__user_write_access_begin(uevent, sizeof(*uevent));
> +	if (!user_write_access_begin(uevent, sizeof(*uevent))
> +		return NULL;
> 	unsafe_put_user(revents, &uevent->events, efault);
> 	unsafe_put_user(data, &uevent->data, efault);
> 	user_access_end();
> 
> is measurably slower than what was in your series. If it is
> not measurably slower, then the series gets simpler because it
> does not need to refactor user_write_access_begin(). It also ends
> up more obviously correct because the access check is closer to
> the unsafe_put_user() calls.
> 
> Also, the extra access_ok() is *much* cheaper than stac/clac.

Sorry for the late!

I rebased on 19ab0a22efbd and tested 4 versions on
AMD EPYC 7B12 machine:

 1) Base 19ab0a22efbd

 2) masked_user_access_begin()
    -> 97% pps and 96% calls of ep_try_send_events()

 3) user_write_access_begin() (Dave's diff above) (NEW)
    -> 102.2% pps and 103% calls of ep_try_send_events()

 4) __user_write_access_begin() (This patch)
    -> 102.4% pps and 103% calls of ep_try_send_events().

Interestingly user_write_access_begin() was as fast as
__user_write_access_begin() !

Also, as with the previous result, masked_user_access_begin()
was the worst somehow.

So, I'll drop patch 1 and post v2 with user_write_access_begin().

Thank you!


1) Base (19ab0a22efbd)

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2184011            0.0

@ep_try_send_events_ns:
[256, 512)       2796601 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         627863 |@@@@@@@@@@@                                         |
[1K, 2K)          166403 |@@@                                                 |
[2K, 4K)           10437 |                                                    |
[4K, 8K)            1396 |                                                    |
[8K, 16K)            116 |                                                    |


2) masked_user_access_begin() + masked_user_access_begin()
97% pps compared to 1).
96% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2120498            0.0

@ep_try_send_events_ns:
[256, 512)       2690803 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         533750 |@@@@@@@@@@                                          |
[1K, 2K)          225969 |@@@@                                                |
[2K, 4K)           35176 |                                                    |
[4K, 8K)            2428 |                                                    |
[8K, 16K)            199 |                                                    |


3) user_write_access_begin()
102.2% pps compared to 1).
103% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2232730            0.0

@ep_try_send_events_ns:
[256, 512)       2900655 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         622045 |@@@@@@@@@@@                                         |
[1K, 2K)          172831 |@@@                                                 |
[2K, 4K)           17687 |                                                    |
[4K, 8K)            1103 |                                                    |
[8K, 16K)            174 |                                                    |


4) __user_write_access_begin()
102.4% pps compared to 1).
103% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2238524            0.0

@ep_try_send_events_ns:
[256, 512)       2906752 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         630199 |@@@@@@@@@@@                                         |
[1K, 2K)          161741 |@@                                                  |
[2K, 4K)           17141 |                                                    |
[4K, 8K)            1041 |                                                    |
[8K, 16K)             61 |                                                    |


