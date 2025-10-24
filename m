Return-Path: <linuxppc-dev+bounces-13278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC06C06C38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:47:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQjW43Jrz3bpS;
	Sat, 25 Oct 2025 01:47:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761317247;
	cv=none; b=mlIWx7MFpBcsu3ztxR46cwK/U8YDvCYP88bEeoILPf1qcy7a6SChTsaGfYXHi7MosWOryuyP0zsJ7VmeuoZQnFSeK/fA90Kb0VLc8hK0zKXUlfw9EDqHL3Lm8IZHTaVNDBb72TS1eurA8InNdi7BgBnBVEyAuBQKGI+U7V5Yubv3XhznRZQKB+5GCpAxeetCe4pTetIg1nT6Q/Lrz1OUqTj1q7twvzhNm2BZN2byCw246tXOfpL34N4PS+aa61wH2EnUG7sPDVJvAUTxgfPhIP0Tp0PaYkTb835RoJ3rMXEobJDryE75XV869HtWZbQkNZdSWx/nrfYVzfTLNf2QXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761317247; c=relaxed/relaxed;
	bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gO48p7w51JmtDLzPUzirFu/XdyvFIA4ZcNLNvsfXQe27Kont6osGuKbsYsxwByTJYalzwqtv24pdyCa4PhY0KxUfbwbrjYlwXqjocqs8tYH2vkgTQrdfIEaPfHmi9yAtS61yoRznn8hpBIijeEcylzw0GqWnyjfhUeG8TC88js9r4kKVI/J34H94cOQAT4ReCCeQBRRdf/aBru7Dnb2qlyPgcpe4/k4mJlWTYXIBXQuhCduyPCBAb+zz+JhqVS2pqJm+eqOxXphZa89gppiP4GybIZPtQhtPVrSRfZ59u9vpH6R6zmUTAwJ/fzOjmmSG6+hG3ruO5KSmZ7X2rIQycw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MQNeLjDL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MQNeLjDL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctQjT6qXVz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:47:24 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-427084a641aso1501154f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761317241; x=1761922041; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
        b=MQNeLjDL6zP3D0eeBa8LIBuYfvkkZhOgdybKfQYtBVmVL7ywR6SYVql91cr8WgS/Xu
         tMjraylCCg7npDc86FCIolZXRfLEW535kbA921uJMgCOVVT05B5i6y1owd3iFRmCexm3
         sn0bg1q7IX/O3lVtO3d00vsdVXOCWChanTThDsHCZ1zosVesEIuFR2SnybsVe6F69Nzs
         1mRTEPQEJ8JkFtRWomdqnhpJntKOugUZch+myz/+waCJUAdW22dbcEyx9huj/dSaCcst
         WMkLLZfNnE5Bj8sSA4Gedv93TcFalFKxo8dkH4ayavSmi6WHXz3d7rwB6C9i0KpZLYOC
         Hzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317241; x=1761922041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
        b=cgIYsGWM4V7CeBK8v+NULc/zGvwNgdtowpRTj+QgR8mQVlzCLfCc9S5h/qv+9EWVJ+
         CKEBAlHTcqksfEnXqEgaw+xmPJiVq2Rya/szFhj2H/1ah1vexc96yHRK7eOz98eLaBVn
         /JWtsf7JOoFFwgmfgjnDjZyQkjF7TWHLaQwiU4VkGc/TBoB+S2HPjJcfV0ZBqZcdac0f
         Xnpvqlz+/4t76Hx1anPKCZRXwHx03Z+S2XfDcNwNmLCrxegu26AL0X1W0A8O64yQ8HeH
         ahJPNagnXF+Ei2c62fKzSd57E55Js4ii9lJifviIGdxCxY61mGdE/u/xWplP/4Az30R9
         nxRg==
X-Forwarded-Encrypted: i=1; AJvYcCWjIZif0g8KW/NEwr/GWVlVK9/YklkEzzSCWdjfQ99/vLyNQPzMiKsEoQhTuDCepfC27kceLb9i5hIYJfk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIgaiRtkqGwMBBNGkQGgBVI7KKA9JHQSEtaSnceRc5HaoF18DT
	Wa/K2d7M+L0SlKNznIvRII0kyX6lle3kuU/HCd+mFykN0WY4fC2HNTii
X-Gm-Gg: ASbGnctJUwu7PFDO24XBnKt0XrPsM8HoHSg8iYjAWUHlQs9OTj7+wU0mtuwdlX9ZJ7E
	pUUkOngb1AwAkSlW/y7AbewD+ZFL6N2/y6OB3bqJJZufVgl7mG5Gw1oEuF6+D4PxHBGMQ1HmCeU
	FmLEGx4gZixrixqyBlpTyvf8VA7jBXBjM3/iNBOxYaon747HRcS+c2Qjtu/lFcgBLMT49H4OEaj
	Cftgn6d//0yK34x2r5+UOHAlP5QLi05gJItr93X+dXz65GXcF+P1THzD89skcIF+wGNCuz/TmO+
	IH3tzZNaiF5J+uPmwSWr3UAJDEBlufXsfCz12vmV892ZD6U+YSFgwJKIxxUQhCut0l2X8uXbQl+
	pj5L04DKsGmYHGuYizyNzsXoRj927mdubRcVIRCsGBriI+HZVJarBen8LV2FLUHq55BzMlPDib9
	UoRdR6ybdM3N3m1zidIYZ0hx4/URRTmsSoAd/dTgbcCmhMOWMDFQJQ
X-Google-Smtp-Source: AGHT+IHTEaO13+9fHR05oni62pNnB6SFZLHntJBdSUcQjV2Scfibpu0XNA7qJvhSpMY2WZf1fNFglQ==
X-Received: by 2002:a5d:584f:0:b0:428:52d8:9680 with SMTP id ffacd0b85a97d-42852d89820mr8617704f8f.18.1761317240510;
        Fri, 24 Oct 2025 07:47:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429932cbbb0sm514747f8f.35.2025.10.24.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:47:19 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:47:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, alex@ghiti.fr,
 aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, brauner@kernel.org,
 catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org,
 x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251024154715.577258ef@pumpkin>
In-Reply-To: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
References: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
	<20251024051653.66329-1-kuniyu@google.com>
	<ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 24 Oct 2025 07:05:50 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

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

access_ok() does contain a conditional branch
- just waiting for the misprediction penalty (say 20 clocks).
OTOH you shouldn't get that more that twice for the loop.

I'm pretty sure access_ok() itself contains an lfence - needed for reads.
But that ought to be absent from user_write_access_begin().

The 'masked' version uses alu operations (on x86-64) and don't need
lfence (or anything else) and don't contain a mispredictable branch.
They should be faster than the above - unless the code has serious
register pressure and too much gets spilled to stack.

The timings may also depend on the cpu you are using.
I'm sure I remember some of the very recent ones having much faster
stac/clac and/or lfence.

	David

> 


