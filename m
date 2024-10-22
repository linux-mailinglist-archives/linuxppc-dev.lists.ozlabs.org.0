Return-Path: <linuxppc-dev+bounces-2478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A519A964D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 04:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXbtR3yjDz2yRD;
	Tue, 22 Oct 2024 13:37:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729564639;
	cv=none; b=G0zUg90VguAee3KtUpD7I/3EG8rkNhgkIDfxt3+Fxq9xUvtWD4og1U0oRuvHL9b++2ir88ZPInAtUFGF4nBt9302fV2NR0Lyyejg/m9RVSVZf1AeJMmZ+My97WXKOFyDS2uQapV7aaoKzqyyjLDRgWv9DAyRXAiNk341DKIBNGfB+zOZ2qNfZ7UPXORqQFWv5aeY0/blEfq0pxz0txGiOrJx7l+l1b7op8nXBv1KyZRHta6dYWGwwB8mybrvMVEMFIYfV7TGVtucq46WE8Rc2IEYwyUhOJY/+q1MG7qfc/46SH1+hUdoyijK6dr2NRbcDgz7m6H3zRJZRSnRifSFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729564639; c=relaxed/relaxed;
	bh=YAjrGEOSOplZNJVXmtK+bUqWu7jz3ygPeiQp+Re/23A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwVjeuXOqDztmui1eqZ4mHMSLAHaXF3Y855gIFloKxnMzNfQEYO6nokw5L+4SYKFNYqY1O60F9XX69tJZOIcNf89kgo5W/fx6bvqTF1kUJqrJBb9HP30vQe768Ne1QFBeohy9Hkspy6mARiCCIhKR3zyQWTst1gw+bPa26OKkJQ8icW5V4GdGIGFPZEQ67T0Sh3lmXFgAwc4MRYITDG5a8STRJcoOqPxNCpk5BrAz8NW/zdiem0QvvAkTty2juvrTaBHfvm8q9SgtJI1HjvM187I2iKcqrD+EGgNJrvB/9Vgqw2OFd7LASRlIBD78zlGnjTfE4pA6JwWFjN1wmBe+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Mx/4A87t; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Mx/4A87t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXbtP473yz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 13:37:15 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso402211566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 19:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729564630; x=1730169430; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAjrGEOSOplZNJVXmtK+bUqWu7jz3ygPeiQp+Re/23A=;
        b=Mx/4A87tyI4C7apzy3IL506K+G6G39MhK442oVX172aDXp7femiJBG7pmrnyy2Ygzz
         WcSqrb6+MdUvvXG+OHLMA78IwvaETe7kdK0qLFiwH04yxO81KEx/UdcwWIu0AsPjj4md
         lJMb+zFEV5PGDpRoBSWBqivMSskHgW8hKYHPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729564630; x=1730169430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAjrGEOSOplZNJVXmtK+bUqWu7jz3ygPeiQp+Re/23A=;
        b=Ry/P8PYmArcqtHRdYatsByxciYaC0aOLkU1Ju3WEgsm3cgxaYtlm+Pawj62OQ/Bca1
         o+KMZJ+V4ziGzVun+fnIA1aCqKOLUZKkUaDH6xe+hY29O+BulRFGCUBLhWYqV6zoOaTc
         WmmNpMKFZCOl4PwggehfOOtYEvTjQGqT9+qK1NE61a+pIIC89Y855H2qHbkg8PeWFTMS
         GOQNMuOvG5pvWjRSFY8ic0kj5yPBn+UVxUXtsC4Kt2++McaPPVFTZfekNl9mzsi8tkeF
         dShsbsub9PL7d6Y3m+yR5GF06SH2gRm71I86ZaaS+OBQrt1kMzaTDLe8D6MxGVyOQ5Dg
         gtfA==
X-Forwarded-Encrypted: i=1; AJvYcCUDAdDa+YH7KatUAtiNV2ib1zSW30v9uKhS2gfIL5F8U1iagbqMN5i3RuhxK3JIRudzWqslLmf7EtYcU6o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywc7hq5Spmg7fVQydKk1pdiR0PSymy7QUT3LafI/0yoEXgi/2x6
	60qDj0UVVI6GwUJyxyB3i7ZoMt8o8CWQaYp6GMB2ls83jibCWA7oZRddMeL2rjl+uTWav0gGkjX
	1baZy/g==
X-Google-Smtp-Source: AGHT+IHJidEK/HjtTD0K8crlukV/A4uxM3vGNtTrtF1jvLOoaKXmZusTeWnrs8if+03PTSc3s9Szog==
X-Received: by 2002:a17:907:1c9d:b0:a99:499f:4cb7 with SMTP id a640c23a62f3a-a9aace3a726mr82501766b.23.1729564630041;
        Mon, 21 Oct 2024 19:37:10 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6307sm277396766b.33.2024.10.21.19.37.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 19:37:09 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86e9db75b9so658733366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 19:37:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeAD6f1kScWur9PuF/rJGh/i+qAgpzwUUBp5JofIaF/qVUYkThnwOppvQ9bfPPUlDUhxLfjKgHJBwaXWo=@lists.ozlabs.org
X-Received: by 2002:a17:906:c10b:b0:a9a:6bd:95dc with SMTP id
 a640c23a62f3a-a9aad3715ccmr81144666b.46.1729564627971; Mon, 21 Oct 2024
 19:37:07 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com> <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
In-Reply-To: <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Oct 2024 19:36:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whPey51gZ1N_pBGAOfc=7uRf6vq9vxPFhYSCOT7Sc_Ogg@mail.gmail.com>
Message-ID: <CAHk-=whPey51gZ1N_pBGAOfc=7uRf6vq9vxPFhYSCOT7Sc_Ogg@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 21 Oct 2024 at 03:48, Kirill A. Shutemov <kirill@shutemov.name> wro=
te:
>
> LAM brings own speculation issues[1] that is going to be addressed by
> LASS[2]. There was a patch[3] to disable LAM until LASS is landed, but it
> never got applied for some reason.

Bah., I think the reason was that nobody knew what - if any - any hardware.

I did find an Intel "Product Brief" for "Intel=C2=AE Xeon=C2=AE 6 processor=
s
with E-cores" that claim both LASS and LAM, but that one puts LAM as a
"security feature", so that seems a bit confused. That's Redwood Cove
cores, I think.

I guess that should mean that Meteor Lake ("Core Ultra") should also
have it? Or is it then turned off because the E cores don't do it?

I do find LASS - but not LAM - mentioned in the "Intel Core Ultra (PS
series)" datasheet.

And there's a Intel Core Ultra 200V datasheet (1 of 2) that does
mention both LAM and LASS. So I guess now it *really* exists.

Can somebody confirm?

But yeah, I guess we should just do this:

> [3] https://lore.kernel.org/all/5373262886f2783f054256babdf5a98545dc986b.=
1706068222.git.pawan.kumar.gupta@linux.intel.com

for now.

                  Linus

