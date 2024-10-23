Return-Path: <linuxppc-dev+bounces-2526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CAF9AD553
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 22:08:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYg8n0cNCz2xnc;
	Thu, 24 Oct 2024 07:08:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729714105;
	cv=none; b=a4fUMl1eswUu0vYDgGipQ2mkVdmEq7c3XO3IoWZmD8985QGirPHXH9Te7lVwbFGTfeNMdMfH52AdoyZysJNT62FucdcZe0cKfWezuuwWhCFRpcH90wUPCBUCKW9EgydZgkc4+x8NZ4JVt19ZOIRPKeLX1+dxyyodUz8ZRn09KdELHlGDJhnXqNCaiNjlMuuN06WXjSg2/wMC9SDo9cP7CjkhSGaum0tbaxzgpGwCUOrzup0wiaxb0dlswesDhnrqJhYTjZcnbzReRoh1HLPdv20z6vFZ2BTrnPnRkiyREm/FrycPX0Zdj+75YVv3Wr475IdKkF3JHNgGUcKf0/r9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729714105; c=relaxed/relaxed;
	bh=TWVzIP6YsOAKgKqt7B09o5bEtCmeH4MlRPo0P+IyZcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY3/O2/RG0aiK2GipSCxGXyQjvZbQ4bY/+vh01+Upzm35R9qMYg90t+zzCjwcmrsdH0q4AZI8LsKCnUi3opQjrCe0cHo/Ohokmg0qade0zIW3d3NKCf2o83vC+57FfAG3lat7/vBFIb+ooooH1hATAB96+IaS649xTf/3unipAr8oFuEIzJ38YFxuVr+sc7WIeJuFVtiavYE8GZikP1gIkBbhGW4bNag2HAC+l3uPPSmjW7TIvIX02fn5WwYZvvtlgcxyy6b25WPaRJC+8XDprsT+yzPhF+a7gdiy80Ym4ao0NOi7ls2ZGU8Ldga6COFXrISUT4EJvuPO0JTqUkdEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FlZgRMLe; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FlZgRMLe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYg8l3d7Fz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 07:08:21 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so197760a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729714098; x=1730318898; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TWVzIP6YsOAKgKqt7B09o5bEtCmeH4MlRPo0P+IyZcg=;
        b=FlZgRMLeiRPEUS2qK2PLuO85kM4NBF4rGz4Corm4IlXWPmmx5xSi7iS6YqMpMXkop2
         MGFCO2ahovD/YmSYrpS0pGGJQt8bgohhrHCb3wzr3/5vUfR+cCyLtdWylHUIU8tvFelB
         6XJycjOVC4lzGnSCo22J1X5xlgMfL+KK39JhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729714098; x=1730318898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWVzIP6YsOAKgKqt7B09o5bEtCmeH4MlRPo0P+IyZcg=;
        b=ee2JHEDc1iWsqkiwkgpQl694nYknEd5o7VV+/xCjjWUqMgLL9XP3gmvA5XGbRNRf1Y
         wFTHpNs9RfrzzEiOBtbmjkGiEg809xffiZheGhe+36vDqmHUOpSkw70pZN0QWd6AvIu3
         0+3OwiilKd3mHmyH13nrXo14NOhWVGR8ZNQLrs/rORKclvq9ES1mnjqNYJOGk6UxalJf
         z9nNoUNAuqAEtDn6P23cLcUnxKXOqzJ+fF3fVRgQaWd21sZdIkfjfyvrrngNa2XOQwIq
         lNn2wiLesR91Pzw2PyysmizDYp7dcyhRfCGCDCHe3aOxPBGFR06yxHC2QQBe/fMTvlR9
         7d2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFypLmdBrV1n3JduGxdXWPZNNhxJORhc41TFa7zGEVO7KytJsQY1Yz0eMQ4bNksXEaD+GRMLKAWQ3IDlk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJuhMOXeTFlif+UpNZvRHj7B6bnJEas+EPHyeeJI6kJwdp2MQ7
	UZxdvCQSi1MNpXKas3ji8LZSh/Cz1FWVE/jqvmZY3tWYWL21JSaVAeSPR+z/vJwiOe+C+hq4sRL
	1tH7Bhg==
X-Google-Smtp-Source: AGHT+IEgISfR2XzXF2OZNrfYfKjysJwcG/mUoIpvaAK0S1skxsJ0YMZP+1fTdAs/OpxrMvTz9+vTJQ==
X-Received: by 2002:a17:906:c151:b0:a99:e505:2089 with SMTP id a640c23a62f3a-a9abf9219c3mr314319066b.45.1729714097997;
        Wed, 23 Oct 2024 13:08:17 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d631dsm527303566b.17.2024.10.23.13.08.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 13:08:17 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9aa8895facso16805466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 13:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzllS9VY27BDBJFlp6PSl1TFKDmq9kCyhybj8jAxlEDWR2227iyz0uhmZPg360yjPDPRH/zT/JHC9rzYU=@lists.ozlabs.org
X-Received: by 2002:a17:907:9720:b0:a99:43e5:ac37 with SMTP id
 a640c23a62f3a-a9abf86652bmr393002666b.15.1729714096793; Wed, 23 Oct 2024
 13:08:16 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble> <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
 <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local> <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
In-Reply-To: <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 13:07:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
Message-ID: <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Borislav Petkov <bp@alien8.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 23 Oct 2024 at 12:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> NOTE! This is obviously untested and I didn't check that it does the
> cmp/sbb/or the right way around.

Well, it boots. The code generation (from strncpy_from_user()) seems ok:

      movabs $0x123456789abcdef,%rcx
      cmp    %rsi,%rcx
      sbb    %ecx,%ecx
      or     %rsi,%rcx

where obviously that constant is the bogus pre-initialized value, not
the actual runtime value.

Which is not to say that the patch might not be horribly buggy anyway.

              Linus

