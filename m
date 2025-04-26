Return-Path: <linuxppc-dev+bounces-8027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14DA9DBCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 17:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlCyL2ftYz2yKq;
	Sun, 27 Apr 2025 01:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745680682;
	cv=none; b=GlAUmKw1L3TiXKnIcRaLFHRd03qZggfcz0T3Ijtr0MRORoPIBtEK59ycq0kIacdL+5x7Ci5qWrtexv47jqmipila9csxadnTcbwOVoCzS0p750KkHxJhToIf9JgUcIQwtYER8Bn6lQ7z+LrOiL+W6ng7DxcgPQL1E4jXE/H8gNgsry0sVSLlkwrdN8tVzu96ujny2gsECWaE5l24EDHc+YvB1dr+MQGX3GY0uFxzm/XKtPXDRs+9i6YEJ/tggcfymlbgmysb0J1J6LQyO+3GYSMfMFexjqFMXcT+GJhPU+19TlDqvTukNPa3lTKe86MzWsy8YSqbxGRlABoYSacwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745680682; c=relaxed/relaxed;
	bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZdyK3WdY9dXsaGsdbbrI1OrQIxEn6cAfHMgBVEPZqLKVV5WQIx09/t3jL60/DBRaktB83vMFEKMFe/bULFS4iJ+vUi9f0hezZOE+fjcsf8vcNzQxGv3RMKUeBsh/AyBGbQ+nJMcbn08hrS1Xqk6M3T3vZPWZTqWEFx3DYSF54KiY/2/RGEGg65w5wGvjN+UEqj0DHgjrV0Yo8zYNXmwlxf77sFnx5VcvvlX27Yn/XNi+SK+p5FnmA1QkpkzfOb34GpTm8x2Blp6W92LUAXTJmcsPWVNCSmwd8ExmcCy+CPYUX0p8mFAmoYyHuQH4p7Dy7M9tGMbC3KKXsN6W8mHxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QcCtdz9i; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QcCtdz9i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlCyH20H0z2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 01:17:57 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so6003313a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745680673; x=1746285473; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=QcCtdz9iVdCYmHY8nm6Ju1Ok/lhvz8PHsev3mhZuE01sYsXGsDDciS5O1oILysmEq1
         s3hWBh2qdu1wGLtnvxf6G4ceMupqG2I7hZArCYbvuMk4v13rw6DIWfqMnyTvnS/TU/Hg
         qQ5Q3hgSiB3gci1hyXvRAgfd41qLYc4t1o4PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745680673; x=1746285473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=Zlg5SU7OQGicx8vc6UT+rglD7Aty1WlemSrnekIhdU/TbbP5s23HkJDvwaplZkBEpZ
         ZI6nTp6PYv48V0xXHho997PqBd4Yxe/UF9T+eU7DrVD8JkThshGXVX3J2EB7DmIMUlHO
         TO0keBJ6FIaSINzTetuOO+Nzmai0SzPT7Kg3q5aT4KWKsKc3pSe8+ALjQxXdXParN2V0
         l7bjmrY0Nx6c5Vknk+yyN5TCCwh+oiCfUgFXye7RIuNx/BJ4ZkW4OrauVIo1fvKYIRCE
         NAXeyTCo183rhfUK7o9Fk+XojvpMSRQi9LPxQ6HmKWwmRQqu6C0RWxHsByxfRDFIPVLI
         /nTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8R9wBQ5j5VwnRHt+K4LLjgUdHxhK23EkvpqjY5j8KSMNV3BrSmVUlVtYf+4hmc1qudFBLUKIjloTP6jU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCdtyCl/QWhA+wLigMwz8YKmGIRZMhZ49amchG+MBTEBLj/Axz
	ASeYciMOR0bSQo8zbnYsk/Q31B0gncef3P3bi/pCzevaIM5zRvg+jB9msBzF+5C785GEqTFbeHL
	2iGA=
X-Gm-Gg: ASbGnctQXKQ3bVv7dLHh/B4zGWEvB5qQXZFffy0tIybkCYuewyEzDzG63RO4ABuyNdA
	iaDL8v0zdsLq1rbK/WvCgh7kmR7nYLmq+bjxMnk6+w5FX3bbFCbHWeY5uVushUNLOum/Mkm906u
	Q+EdSLr4bRYSdYz1oJNJTcZotQepdsSOh1DZrq5RtHGIKA5zZZ8sObmpuMyO6SVniob/aYL7lwj
	NCTCrywh+31YXj0EXvyWDny2PxVL/SZjVVzVX8PJc4N3FTrdMQBwwRKRYJiYy4QQfRUn3WGI/Gv
	4jCxmKv6p8P/F7jFAjHYLjdCKNJogqij2HQzxlMIhFKufRNNLzhRQoxDSN7faDmqLlCP5V0BxKZ
	T9uFiS7Uc0GJJq5Y=
X-Google-Smtp-Source: AGHT+IEuD1PzSGwrYVRKENOqit3zjLbra/XN6yAcpF7mSy9+SBF60W1oHvKYwRzrKmOAvqRmJ/jA7g==
X-Received: by 2002:a05:6402:4301:b0:5f4:d605:7f5c with SMTP id 4fb4d7f45d1cf-5f73982b705mr2853442a12.22.1745680673349;
        Sat, 26 Apr 2025 08:17:53 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc36dsm2789423a12.4.2025.04.26.08.17.51
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:17:52 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so4310889a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAuG3DuDTBpYvABXSOSRh0+8OwQoYEug6ZDcKwC9n/Lv9n+IE4sstZEJd2985qVLJr/YTAp3cmZ95qtN8=@lists.ozlabs.org
X-Received: by 2002:a17:907:7e95:b0:ac3:8895:2776 with SMTP id
 a640c23a62f3a-ace848c0439mr259814066b.5.1745680670908; Sat, 26 Apr 2025
 08:17:50 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:17:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
X-Gm-Features: ATxdqUFbLPq86s-2TFMi3kWckNkp7TWtoBPlYGSlRtiuXxSXCOJQKui7bzYM-j0
Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Architecture-optimized SHA-256 library API
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 25 Apr 2025 at 23:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.

Well, this certainly looks a lot simpler, and avoids the duplicated
crypto glue setup for each architecture.

So this very much seems to be the RightThing(tm) to do.

               Linus

