Return-Path: <linuxppc-dev+bounces-2210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E499C8A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 13:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRvtc5PmBz3bnJ;
	Mon, 14 Oct 2024 22:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728904872;
	cv=none; b=TpVJ2Qab/7XanOAAyz4fCf50qHp5OgSqCKZ7y4nCUztF7+ZZaXQNj2wgcjKP21HsVDrSZoV77XHT+JPmjlga/E6+x6rL/k2xS065r9lOM8BbRRfkygNN2cujYAgYl9utnpLqgMJHjjoIAgNhLRNfP0P89dQIwhbUvGb8RGNhi2Xn6/xL9FOwClSdw7pfnMcJCY4LCIslocAe8DrSEldgAw3HyAZJtz9/fonlPHroC7kdsyaiY+lpJmJVANwR0DEWDVRxZHgQmm4xun6A2Ef2/l/8wcExj5vRajDwkbqnsETL/SYr0Jz3vr3F46exQSr663lOVnxjhiGxSkZHCxrvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728904872; c=relaxed/relaxed;
	bh=8wZy7SaNm/lLo/O5nU8yHG8ZjpGC2jjE6kBdCpDv02E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3+YC6Dd59D4mzJjIRdk2WvknVQs0vf7LtjROnvdW37vDSDn0C5fD//JF3K/0K+xrdxFeIjCBcDyiZ5VhbXmznLn5GoIn43lsTxuL2iW7lxycG2Kkw7OKejg8t/4mLnnh6fAfw2GVxBpQGCwSWvP8fz8nism1WAO+mbtCkMiQAm/lqftZqYw9ZHFNXBP3P+onpHT7lVfSdlHg6rfE5cRaO/p9Mu2zwuD0Won+8qCBMcZaGbreV7C5AACil1kkyXwi2B7kW6HlnwdLWXDXtKArGYvYlfgnz2fpZ8Eh16zcmxA3MIZNhla39kibzLDyCQHLBwx/V+xjyQ2P0DB3IZLGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XW7tIDtG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XW7tIDtG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRvtX68Rzz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 22:21:07 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a7aa086b077so544423066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728904864; x=1729509664; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8wZy7SaNm/lLo/O5nU8yHG8ZjpGC2jjE6kBdCpDv02E=;
        b=XW7tIDtGuvYuCFtVITg0b5xgPyTvlCvRSoceVTpvSrZ8X0gHtfOlL/vtD5w1laCm6R
         7VygiTncCPVGMZmqLWz8E0JnuX9Le1m4bKaZ2IoprHoNFzs9OZ4ik3jEHkqeqlx3GVkb
         xS/JI0DvwKZJ7ZAlnK4OhVjpWGuE/dAqcTlmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904864; x=1729509664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wZy7SaNm/lLo/O5nU8yHG8ZjpGC2jjE6kBdCpDv02E=;
        b=Nhtqp0HkkpD8UOl21bdhLXbGT7tBp9qmy8DCIrcT8sSjVQgsIpTzZz/BcOpMwGeTiz
         +TSVbtHLHvn1jd67u0+FQfrVCmqlyzECMrYdkCICIga1gWFcwFIhwhwIOcTVWlA+qS8H
         PUJepG+/Mpo9NoVBn54pJpHRcGyRFsw48QD73v+I6NaZG+zhk8inJcahI8SbNeMvVM7N
         AaTEAytqzkdlwLHyPT4dPN9pu1y/tUJGgxQ48Ol9cqmXmlb6U/mk1LFwgWj60VtFidbj
         4koqCYoG5oAMKPTOQdsUhvRWd6L8tT+0AnBCp3P/gCwOLe1eVBURNBjmeGqH4cr5vMuT
         p5pw==
X-Forwarded-Encrypted: i=1; AJvYcCU9DM14f32x9VVY/3EwbYzgSSeV6g99DiH7hvUbQFoq0MbyUBMgxwcXmCoBmLBHDEKboBsnC4nlkUNJHWA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTITyPEE/CbkSnKkdnfP7ia6gOWYsH80WxNfRIaYpiQ49uK/JP
	4uCsMaMa0fLXN0pU7w30zRtXOpV04CQxmiEb7xPdd7Kjh94B0P4yCkBKEemBcNP22Dq/aIoc32V
	EoJirdg==
X-Google-Smtp-Source: AGHT+IFRLjHdOQc3ABA0kUP7ml7KaKSyoWN3XHQZCs2Zzr5WboPBQlxnS+wm6z+YXCiQBGbdC1kk2Q==
X-Received: by 2002:a17:907:360c:b0:a99:4162:4e42 with SMTP id a640c23a62f3a-a99b93fa0b8mr1014929866b.37.1728904863994;
        Mon, 14 Oct 2024 04:21:03 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a09b8d1b3sm177976966b.183.2024.10.14.04.21.01
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 04:21:01 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99f646ff1bso253272366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 04:21:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlOirLQO6G/6tm88o1YqN0voVvbdtjA93YpGYNUEQOmnM7790J/nVDQS+u+xcOt+qSxC/RMV+HJjSHG+w=@lists.ozlabs.org
X-Received: by 2002:a17:907:3689:b0:a99:5021:bcf0 with SMTP id
 a640c23a62f3a-a99b93cb817mr1193034566b.34.1728904861308; Mon, 14 Oct 2024
 04:21:01 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com> <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com> <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <5eef501ab10649c7823e34354dda401b@AcuMS.aculab.com>
In-Reply-To: <5eef501ab10649c7823e34354dda401b@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Oct 2024 04:20:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgtwBkgKbvshy4AnW+2+5OYHCOuTDdtZBWwE42qfu79Uw@mail.gmail.com>
Message-ID: <CAHk-=wgtwBkgKbvshy4AnW+2+5OYHCOuTDdtZBWwE42qfu79Uw@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: David Laight <David.Laight@aculab.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 14 Oct 2024 at 02:59, David Laight <David.Laight@aculab.com> wrote:
>
> Isn't LAM just plain stupid unless the hardware validates the bits
> against the TLB?

What? No. You can't do that. At some point, the TLB isn't filled, and
then you have to do the access with lots of linear address bits
masked.

> Doesn't ARM64 have the same issue?

Yes. They have different bits that they'd need to test for this. They
have top-byte-ignore, so they can't use the sign bit.

On arm64, the address masking might end up looking something like this

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d31e86ef6377

instead.

              Linus

