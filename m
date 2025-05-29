Return-Path: <linuxppc-dev+bounces-9021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62970AC8319
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 22:15:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7czh6cYXz2xQ6;
	Fri, 30 May 2025 06:14:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748549696;
	cv=none; b=alcNlD/kw2vYJkv35w/+d0SAjpvJfT3JcKF4w2JWv6MaiBvd6BRw0FoSvP2y1+LkJKolH7A5q5JxEywuKsswJO5BZbD6bVUzmzhY79iaTwk1dlpzbypXfWxwVP73aRr3Q+hdiRvP01CP1LxQE320WO0rTGBBNyQTyeYW/VJHJkKhByRLhqaWLqfogxzqr+QsQThZ/opDtQGko4hxpw0kuY+JdEhnozbUl0W/QV9I9FUPz8wIOgo1X0fMrj2txpk2hpUzhl6AkG9lQuzctf8/MyQm4w/hMx+tNo5DieB2Ze7CW5JvfFbFWowizucQsAVoSNAwBCbAXDhTF22Zjw7KTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748549696; c=relaxed/relaxed;
	bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwqp8RCMnNPEG7hwOdp88ucWG4WWfbSwSBeJHRH/5w0qDLagBzhvB/tn5k7kQGZ5be8e/eNU8gGeIFAf4gAEidjSa3kJTQZbxE9VOQ5NP07HzuNRob7c4D1kKTRDrz833wAkyKcEMmRGXAaNdh89J+oiXgTHboVrsTRULJ0zwIxnIVEaL7cj9OlDypkOZL7RBRsvEY3PH1aU/ASy1BdJbkwDY4ch7htQuuJ0y41LMmXA/Bgauu1h/sJkyUZRX/uCR5h1elNAkZ4F+F6D0UiBvz3E0zUYknXCRKMJyaBaCkwmYPA/kWzRdueOY+yXZH/ZHlfFbO48pL+xWVQ2IvEvCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JN7t+tQI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JN7t+tQI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7czg0fdWz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 06:14:53 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so2399381a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748549690; x=1749154490; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=JN7t+tQIyH1ZYaJDFpEl477obc7a/LXUzB1FT7LjGWO+5YP4S95S+blNY4vkVvsVhb
         C/T18Yh1BmpyykBXGkUhu+xrqyggd5RNYNjnklb+O7Sz4DzhEab9kAAfT1FP4ERC1ns6
         3P4Td+N9X9hLfIcxbnt7Ve5FX6AaB0iRdiG1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549690; x=1749154490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=iBPF3xNmS+pYeCbQ1KPoWXpy6kPKLeXpFsX59i6Ma9n5ljxHO6Ihuald6ZKWFaoe5U
         M6yQHWRpw3NAN+uSEzuTfGT1nlFPi5j3PQReCKjS93RFA6BbE+Pae1f1CS9TkOuxm+tm
         IUZ/zhhneTo5efIXWu9oR9n41JAB/ih53a/eaODVfLp8CIUwkdYLwlH44Eq1Jc9Y+4Ds
         5kyTZVx3ll64vFPd1enyEDiyBPgClVanQj4qGHND+wxRi/DG8Jyyt5eSSZ0BP7PVavJB
         nx4B6aH1rfoxaa0Ryoz3Yv+dSc6uZpBnyFkHbC2IrSgFavlScZL3lOlwcb2HiAPXdvPt
         7EWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuAa/o17TX/pTeNKyayqM/JjKTF4HyRhiX48udsX9yVQvYTPQa/UFG0ooX4l+MEokg1u1jR/t1+iOEk2Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPnoruUcZcusA9VwE2bwyU788+JnFJNHihpptmgWkRdBYPSeO5
	CwBQD7QieU7U/cPfVOrbg8vORSbvJwWmEhRPIw2tdy40OhDuqwMM0kPaLbYz+tZJDeb2VGZEhtl
	cRKN3hW8=
X-Gm-Gg: ASbGncs/c4CMzCVx/r/Mg9913A261WlOmIQiOA87VHzHZLb7h/6O3xgOFSYUmjcfzZl
	PM/NFDMuHGXmBZXK7Kv1oXhTZcDq8nm3Ij+Cn7UKzhT0asLtsv0xODsNUfiUI78/PV7nElwanKi
	WtHRAFwokbS01UYttb7XOIaeLvLJgqFlSsiOzVdLpbqjpkVJ60ekZn+gwQ5dYQVXtPAeRocLppE
	fc++jcbVJND5jMT2H/KuhuaA/WG9Dy6AwZoRX5zU1/6V2Gdoyqdm4lILmnqsVi3m8PekR01cdEa
	XAYhHIF7KhaBd8yLm8UJniUpofn/G0bFlKarNS7LGQmS63kE3+j+/MzH4vdhn61tkIa9Uk5QCLx
	Fv9prXIWCgjoZFtsdjGGmVUJ4qLf3rrOuWmZM
X-Google-Smtp-Source: AGHT+IGUdixOrzPtV6Xb43A3sU96+1BgVG6jpnOHCl5TKq8qKEpe0LJBQQLtE6SYPnMB1TM8lnsq6w==
X-Received: by 2002:a05:6402:1ed5:b0:5fb:455f:ac40 with SMTP id 4fb4d7f45d1cf-6056db1191dmr611076a12.4.1748549689601;
        Thu, 29 May 2025 13:14:49 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5a758sm463092a12.19.2025.05.29.13.14.48
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60462e180e2so2549832a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 13:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2x4SSPye43kw99OyBg9pc+gfxZosvtunpSVNA1fqPbrdJeGUwBjed3HOhWNYYAcLGhBT4wn2v+/c344U=@lists.ozlabs.org
X-Received: by 2002:a05:6402:2346:b0:602:1d01:2883 with SMTP id
 4fb4d7f45d1cf-6056db10b4emr581444a12.1.1748549687775; Thu, 29 May 2025
 13:14:47 -0700 (PDT)
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
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
In-Reply-To: <20250529173702.GA3840196@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 13:14:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
X-Gm-Features: AX0GCFuiJcryO_X7sE1ePk8yCEY5HNa9j_jPT14Gm93VGY22kOHLk2kIn44ZkWY
Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 29 May 2025 at 10:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.

No, while I think the current situation isn't great, I think the "make
it one single module" is even worse.

For most architectures - including s390 - you end up being in the
situation that these kinds of hw accelerated crypto things depend on
some CPU capability, and aren't necessarily statically always
available.

So these things end up having stupid extra overhead due to having some
conditional.

That extra overhead is then in turn minimized with tricks like static
branches, but that's all just just piling more ugly hacks on top
because it picked a bad choice to begin with.

So what's the *right* thing to do?

The right thing to do is to just link the right routine in the first
place, and *not* have static branch hackery at all. Because you didn't
need it.

And we already do runtime linking at module loading time. So if it's a
module, if the hardware acceleration doesn't exist, the module load
should just fail, and the loader should go on to load the next option.

Not any silly "one module to rule them all" hackery that only results
in worse code. Just a simple "if this module loads successfully,
you'll link the optimal hw acceleration".

Now, the problem with this all is the *non*modular case.

For modules, we already have the optimal solution in the form of
init-module error handling and runtime linking.

So I think the module case is "solved" (except the solution is not
what we actually do).

For the non-module case, the problem is that "I linked this
unconditionally, and now it turns out I run on hardware that doesn't
have the capability to run this".

And that's when you need to do things like static_call_update() to
basically do runtime re-linking of a static decision.

And currently we very much do this wrong. See how s390 and x86-64 (and
presumably others) basically have the *exact* same problems, but they
then mix static branches and static calls (in the case of x86-64) and
just have non-optimal code in general.

What I think the generic code should do (for the built-in case) is just have

        DEFINE_STATIC_CALL(sha256_blocks_fn, sha256_blocks_generic);

and do

        static_call(sha256_blocks_fn)(args..);

and then architecture code can do the static_call_update() to set
their optimal version.

And yeah, we'd presumably need multiple versions, since there's the
whole "is simd usable" thing. Although maybe that's going away?

                   Linus

