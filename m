Return-Path: <linuxppc-dev+bounces-13459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C622FC15E2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 17:42:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwx4f0b6rz2xR3;
	Wed, 29 Oct 2025 03:42:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761669761;
	cv=none; b=f5KrS+hQsQ7eT+6jRc18C9xLi1E0YXbhUNk0zB/wAnqPa4C8IOMuKvcuOHcU84Q0+degPvSRWds0uMDcF8PI2zPB/bGhDfEVmuy4v15KvRc4d+l4I/UHCI27qMhtAnn2XfqMB4XAQHO5vgC3Do0r3W/tuyDx8C/AgyK+0+Dv/f/iOHCX8ANTcmrv8QiyITF95yNakJwqjTLHL67zLJR4VUaQCgL1tb59/GqRPqZh9CO7ZgqwFIlp4i+xGcxJkqz/HC88q9pi5+1Mamwz9z0/fAPGf8xwuABc/mftvVbm9iyWPmiQV5PBaBvPfQ8RRr6faTqS595Vx5xLSSFvUTzbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761669761; c=relaxed/relaxed;
	bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnmBmSuKE9Flzd7yqoQorYQWcagFSfEl/DIsu4PZLL8QgtdwA3SthCVSmE16U8wnIdTOk2SjMe8Wsfs6IHnDJYgtX0T093a8RmG+q0PrIIyH8WKhyR3q0VeX79afcrZ2JUxTAVVKTenQuGdFWvNDRazz9bU6GY7v2lIjCdHPIHv37eW1H2xKd3rCCyvrERKfIft9yMZtfzSWNDf+3vH0tyZkgt9h5FR72iNEHa1sby51lAz5GeYd7+Z4DKGFqgLFOSUgz2/CAqpkm0FFy4fmWzPWBJE2FMilDn7K+ZCieSF5M7Zyq7ZTq3EYKsL3v4d+SAupke8YYyo8x4njXpJQjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=thFU9NLN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=kuniyu@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=thFU9NLN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=kuniyu@google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwx4c36QYz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 03:42:39 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso4280467a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761669758; x=1762274558; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
        b=thFU9NLN2yEH9f88MHLSO0THdqh6tIIwwf2C1WVwoqDRJ1csdjmLI4o11vueboY1Q9
         D66xniztceopcxBHLCATt5m4j6tg+gWfpN9nM89u+kSDeWkVIyJM3Uc9P9wv6gtYXbLZ
         vH6kg1TmHbSWhcORD2NjxyGFkPegAE3pKX3GLff71iMMbXSf7mQbp6OJ8LZuu0ErGdty
         j25zj5eUm9u7rcqTCeVZ1A0R2IpKsxmIZ3lSWfKez35IWEX3oXgbL4WcJhyGcjJAzmJ7
         RPu87Lw93Q7EYz+6yArkIluZGLxq9dvHTsTo2yYYFF2y2xUptPrn2SNWHCn8m7nepbWo
         my+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669758; x=1762274558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
        b=Q4bdcELRQ8NiT1oCUHMgzMavb0ofh3L7JaOlun4uoyJeSgnr3ucPzS8ewEF02uE67i
         WajK4dMJ0r2UJDKWSC5jy88z2ETzLeeUU99B2o6l3Ci1QN32t/gM9Oul+0DfAAnHM9Au
         zSHgRMuAfdC/8ubG7bqFExaLLtwws9Yhnl+w3nCtL//sJjQCffwOcRSAGCoT5LUQ3fJi
         PxjW26N6LNLQZXDn7uZ+B9rVxP5u7GRK+XZf9OKivZHJ7gHOvLcF9Ly6rRSi31E5HGLu
         zMIalPSqLd73X3mG7abqmJinEllt0BQynpCj7DgFyJrNiqWZJ2WVGehtd5vNP5jzbeFQ
         cpsw==
X-Forwarded-Encrypted: i=1; AJvYcCUKo5WNNKIkAi3/1eslS9b6Mr5fMeJAIZzQCrZzRWa0y5HbfPGPB4faY8M4wCzrD9QAOv3VhK3/HadlDe0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0JYwSJvcK86Uer0w12eMsNkYfHLGc/qSV0e5ilcntGeSyp+3f
	bDTAy32Tep2z+AZJ+eCB3rGB3ftDGUt2sqZCF3ahEleqtDURCVBbpQ2jfc2sfbVDCm0+aFD2x7B
	gHB1e2nWMVNqthDQa00xXplqBfpppeecwEq7eExSy
X-Gm-Gg: ASbGncs/taYGcbboDy84cOfmWktET3qEBoO61hNvsJDcpRdAq40+dvJoMQqARCnIlWK
	uOXVviAKEL3aGzFL4ej4WAI7D2A/3qh9zFww4JUD3GPevS6mSohucUObVFXgWCRv0vecjvS0pg3
	agvqoKIbfkLoS47hBJESenQjuldpLPYGZRTk/lXGTvvJZ3c7GenzrqfX78/MnACyXbzEU5wqK/J
	xRtgDBYnzQi4FZhOpWHdLkpt/pW2Jk5iQr7Uh7HyIZm98jgEs7dlDOlBCGfyjcNXUg7wIX/3nYL
	gWATJ1h4Dwr6T+smqShY+deH1Q==
X-Google-Smtp-Source: AGHT+IEA9HqIHKBrDRAdapOaEhdj5ptHdSYRpb4qWqp0AQjJ5Y7jaBBFwbe3KRRyVBlj5jpvCvwUbXxGS+XHLaIF4JY=
X-Received: by 2002:a17:902:d484:b0:290:c0ed:de3a with SMTP id
 d9443c01a7336-294cb522c8bmr51946525ad.30.1761669757359; Tue, 28 Oct 2025
 09:42:37 -0700 (PDT)
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
MIME-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
 <20251028053330.2391078-1-kuniyu@google.com> <20251028095407.2bb53f85@pumpkin>
In-Reply-To: <20251028095407.2bb53f85@pumpkin>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 28 Oct 2025 09:42:25 -0700
X-Gm-Features: AWmQ_bmNBvZgs1Mp1FllgTi4GNPibwKiayJAa04sxsmAaaKLfS_gUEVbDU0m9lw
Message-ID: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: David Laight <david.laight.linux@gmail.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com, 
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, edumazet@google.com, 
	hpa@zytor.com, kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 2:54=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 28 Oct 2025 05:32:13 +0000
> Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> ....
> > I rebased on 19ab0a22efbd and tested 4 versions on
> > AMD EPYC 7B12 machine:
>
> That is zen5 which I believe has much faster clac/stac than anything else=
.
> (It might also have a faster lfence - not sure.)

This is the Zen 2 platform, so probably the stac/clac cost will be
more expensive than you expect on Zen 5.

>
> Getting a 3% change for that diff also seems unlikely.
> Even if you halved the execution time of that code the system would have
> to be spending 6% of the time in that loop.
> Even your original post only shows 1% in ep_try_send_events().

We saw a similar improvement on the same platform by
1fb0e471611d ("net: remove one stac/clac pair from
move_addr_to_user()").


>
> An 'interesting' test is to replicate the code you are optimising
> to see how much slower it goes - you can't gain more than the slowdown.
>
> What is more likely is that breathing on the code changes the cache
> line layout and that causes a larger performance change.
>
> A better test for epoll_put_event would be to create 1000 fd (pipes or ev=
ents).
> Then time calls epoll_wait() that return lots of events.
>
>         David

