Return-Path: <linuxppc-dev+bounces-2433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B579A5767
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 00:59:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWv6156J7z2xmh;
	Mon, 21 Oct 2024 09:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729465193;
	cv=none; b=oPr506ehldpi5c5e3gATSokUVnH/6DFS3jJOuOUJRpHZz1AFHcNNOfht1MqZ9PrpLN4G9iJJ8gfiSSKtH1jQZVQ73hYQt/WqOa8WK1aWMDEOyTCjcGXtfeZJY6kyrp3iZl5shLQlWjz+5/v44VZukOhOK+Obbx3IQz9mzaXRMZYv3n1bGAocoef3MA+BxfFmRrtxa1WrWpueJPMb6ERuH7L3v0wafoj6BWmr8a5h7U6YzOlZcoGKDtpXikBN/tuho5tJWCF1Zy/hrtmS9haWuhU8iwrSo7HgvoVmhmMk6b1D4YEmbtSwHjgKyMfptxiPaHS8x5SntR64mf6+YaKhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729465193; c=relaxed/relaxed;
	bh=H3Hkl/WE/LhAWPPh/Xp9MR1zuZ7+jFvm9goyGv4nUgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ds3wqxLjKclqX2r1ZHLgjSbZY6XVwEAasn/e0Bj4kX4g8ayRTnCtqUqW2BZZgq1hUDRPwpEMo9i96T57+xDc0PUk9NtgC54Oowco8Z7XgBUn5qwOXfhuPSNV5SDmP8BhqLzChlSQ+An/sQ2vk9GJ1vmPswe1sGHZdpvccpzsL8Qst3Fzogel+VI78IUT8BxYWsAAqAbuj4RNtCHUJXU3WiPH+QvYrF8Xa8xWGU+IaEjI5qHK6p6MBPaQxPhqCsMlCsU7K2spPdrdAhXm0CCXyVxWt0zLK+tsHSFqNVX5rPl8EZ/KrI/kmhA/uL0v9Wt1olt2hNMxIV6CbafAB/9mDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VLGvhfWx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VLGvhfWx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWv600LsLz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 09:59:50 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso4341751a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 15:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729465184; x=1730069984; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3Hkl/WE/LhAWPPh/Xp9MR1zuZ7+jFvm9goyGv4nUgA=;
        b=VLGvhfWxeVHztIwuyt2DAQI51EVVndsu1Jm8mnfLRyFfx6nxZsV4YSRMrUW6WG4FYz
         LUkYVvmHnp8+Z0djASqtB3171L21gNoPdbuc0oi5EN7HYnu2bwpn5Lq68iR5bvLXSU51
         x7EPBV2BaXbVoUvjzx8h8xbrt6Em9fJnEbymA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729465184; x=1730069984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3Hkl/WE/LhAWPPh/Xp9MR1zuZ7+jFvm9goyGv4nUgA=;
        b=oKFxrvZBd94i+pUclnlH8ivMULgYSpPDDKx26SfVa2pGDp+2pwC22n+9RDUru3FSkE
         UY5tnRv7P19M2C8OGCH+HtG2/AG+fH7hLR2bcx7N3LPsANIc7cZjBixR1PsqGQum150R
         5dSESvuCtHpOOI6XfTDeb7Nyz5Jj2M4b1qsIeJJ9g39yw/Se9BKJwAZx5J3JDuVcZuba
         3IOcUw4oXCWdegmfVmN5QhB/f8Cyl7RQXY/b8ssXRKWp2KwKumGrAoQLrpIN4iHcEeBV
         3sXeZ27Uf4NWsBjTmMPgluK092cRimyc/bZA8dx40e0twxuNOGky5hPYjz8gU4vGk8yc
         QHNw==
X-Forwarded-Encrypted: i=1; AJvYcCVShQW/Is9XolfC4hQi5Ka+ZXRkSBQdwEYSVVh54LEBkDYQR/tfsEsOpkXb87ezync+reGclnfYSDdJoLY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhrx2OhSIwq6SrIu4NvmLuKvcFgCUfcrvXItTPnVGLENcuRnLS
	QRls0GqAfPVwaVk92IGDojwCzz0yhNsiv7TJYH6NQl1TgkxlJfbRcfEE1CxaH1PehqS0ah8/HWj
	MYQjnkA==
X-Google-Smtp-Source: AGHT+IHfwf59HoxJ3F875oxMq4Ig56YHx/WYgZ3IzLRuyjJzKR2loqov7jAZtPLIlOqX1Pyh/oj8OQ==
X-Received: by 2002:a17:907:9303:b0:a99:7539:2458 with SMTP id a640c23a62f3a-a9a69cdab98mr806902166b.65.1729465184174;
        Sun, 20 Oct 2024 15:59:44 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91575894sm133291166b.185.2024.10.20.15.59.42
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 15:59:43 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c9552d02e6so4830847a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 15:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxwsXqQCzlj7YrVHMEiCQVeVnADmNU7OhJm9F3TVaip7e3Mi2C7vQuw2JgH34lV2PqU1D60djoIHb0fD8=@lists.ozlabs.org
X-Received: by 2002:a17:907:e8a:b0:a9a:8ee:5951 with SMTP id
 a640c23a62f3a-a9a69a6a3b4mr909460066b.25.1729465182596; Sun, 20 Oct 2024
 15:59:42 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com> <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
In-Reply-To: <20241020224444.zhoscljpe7di5yv3@treble>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Oct 2024 15:59:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
Message-ID: <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 20 Oct 2024 at 15:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> Anyway, I'd really like to make forward progress on getting rid of the
> LFENCEs in copy_from_user() and __get_user(), so until if/when we hear
> back from both vendors, how about we avoid noncanonical exceptions
> altogether (along with the edge cases mentioned above) and do something
> like the below?

That doesn't work for LAM at _all_.

So at a minimum, you need to then say "for LAM enabled CPU's we do the
'shift sign bit' trick".

Hopefully any LAM-capable CPU doesn't have this issue?

And I still think that clac/stac has to serialize with surrounding
memory operations, making this all moot.

           Linus

