Return-Path: <linuxppc-dev+bounces-13184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF92BFF42B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 07:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csZYq69Y3z3bcr;
	Thu, 23 Oct 2025 16:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761197871;
	cv=none; b=omE/ml7O7l4NtdBnECbeCjl0UVPs4qqBpFdKzwhv+bzeoZdTAAnYQavN4L6dFq/Rq6B2RsUM8RFf4UDRW7bKEuxcFJV6r+TMhqj0YZn337vDS7fDtHomlx4AYE8xavyUhyY4+qRjI7R2vogVEkPy0+XhWLB6tA5dSqWVVJ3QiJZ5VX4b8RTd2oG1k1I5lPJA71sBjZDr39dwkprL51Kd1NYjtcJl0eBq9C8F4272FDrjKWQXoMiCBYrWasWwmiYsRMeORzz23iqwEIV7mgA/e5BU3m9kgQ2VRR5uZsItl3CyIiJEROaAvAzdCLeTev2+WubMqkQj1+xG0NvHjTGKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761197871; c=relaxed/relaxed;
	bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/WgdxLscfI50Zs8nHzHqTYpaJ+xCiLYvTk10MyNJ+Wn/26fX4z8OhU5GC6OX4OjbXQz+9kwMtW6K02uM7FubRgKFgaZVdz/8FtFOSw0SobtCiMgMAVNg/v2ieJhnQPlxcQTWUAgWJBjCwjjjDKQYY/WSC1kb6MzX04raqxwPBMr9MPw7lF4sSfFG6v+RlDdncQV/YI5vgN7XSknBoPC0FxEos/N+ApkI01o9RaAUP4qYqiTUudP+3BjQW29Lq8GUbCVlDxQvg1Tkds1mIEfh0LFD0G3JClJMmqdqLAgmV+roj03ewKxqqkggUbXOwCIKlJaLAH1nz2L9+XXr14Eaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NFRrriRq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NFRrriRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csZYp26xMz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 16:37:49 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3ee18913c0so88925966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 22:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761197865; x=1761802665; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
        b=NFRrriRqtMXoYE918xKqVCLr3dJS4QIw6QxgUryVA+prKoEPdxhYETmvenhrp28Q4A
         dq1X3LCnf+uYzfqExYeOgExwduqpmzS9p73VvnblQD76kLDaQq2u/9dvBzpu0pNmJaaV
         O4FszNFhNEqOeePx0u623e+SHGLUcWZN4DMFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761197865; x=1761802665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
        b=dE9/ni1vkMTOPCm8LHLj3bnQSj/RZgxQpaYEZNff7zdiWD20WoZrwgFZ2up+lBN4wt
         sqPVAd8tde1lUAabhvJMnT/ZF0+pXj7UAZ51WbuNAmIZTkk7BXl7pixOuZHrhyhdxigO
         R3h/5XsEfTy9REZHd9KzATqVn32RPLRJABeG0hUNBNH0za1bmj1Q5F5SG1hyUNCUTG5r
         GQE60JJBtKEXmgrX0I5+woBugNDWrXPjQT/MmX9Z7hjCYZMwV0X+3uDZABHpDNtvJAYn
         wWDzYVGVFz6Vq4e60uLzHmvy+HaJeYn83cWXEOpu7l4SKPVZ7no3vXYmXm44aoRCJDRm
         9cAA==
X-Forwarded-Encrypted: i=1; AJvYcCX4hpuxkwdDiU86dpaowVf0klaiUHmCPY9NmrLbGN/1qZk0tIgp7xEgD7SVzVMIL9GWTcX3lPEmYZtMw6Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZlm/Puk3f2I6T5UBnxOcYkJVnxg5BgzKb206HlumNdzmlgao3
	K42Oho11IeQH/NczZcTNzLANq8ya2jo7TETsgs3hYAt1h8vVFNZnbt5wwJ4JExjy2g2T4DKPR7E
	88psoVsY=
X-Gm-Gg: ASbGncuLWRps1sgJn5nNLRTMS3hgpQv4gN/oJcJUwJa8niJbou7IGRZjK7Jja1BRqxJ
	Tl5PxbsnRk4hN2LBSR6BE82dcUyaGypRW6T7Ve7WLpmR7pAu+ZCELrjdnr48hKX+t7Xhcy+xkVC
	1GTjbGDQHviVfSnPKPog0qrMWLOPMFyLgPeU9c5xoe1VAhLgHiuj5B2LIl1LfYO5HdNlNh1nQ73
	u7soUObagXOJZXvFnwBmraGTc2eb0Vhbxmr0YhitLojhq7f1AWCXq1wrp7Opog4thbO7j7/BFiK
	/aC0ImdCavgqPUBfSxNTCNZWCjuVKGDqD3xmXP8x2zUThC1uudRTHIW9jXHzCVh30OSxFabC8X+
	fHmhOtgouCFgX5fRNVr4UVyH2hU/6aM0CkaymGPLgfu13glH/MNYZOf2ks3vzHF9k2/PGZLOWYN
	nu0ElABbL8JlYWLG7E/SRwg85PfMaKw6aMmAI4n2UWrxM05G8tSDmh5WaVndmU
X-Google-Smtp-Source: AGHT+IF1Lyk78BD0urFZCUONhwn0y+ek+8Ac941URhXuG93LPvY5bjtzcKfsptmki+xExooIz/calA==
X-Received: by 2002:a17:907:86a0:b0:b6d:519f:2384 with SMTP id a640c23a62f3a-b6d519f2a86mr148349266b.46.1761197864857;
        Wed, 22 Oct 2025 22:37:44 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f876esm116007566b.30.2025.10.22.22.37.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 22:37:44 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3ee18913c0so88922366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 22:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6+wGWjtcXnzdzOj2C6kNTh6aqhzyv45wrmxeIF2j8MiOoLaYB2pSnxsJ3kAqVQVD8okQfAxArd60Yodg=@lists.ozlabs.org
X-Received: by 2002:a17:907:7ea6:b0:b41:c892:2c67 with SMTP id
 a640c23a62f3a-b6474940c41mr2905229266b.45.1761197863543; Wed, 22 Oct 2025
 22:37:43 -0700 (PDT)
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
References: <20251023000535.2897002-1-kuniyu@google.com> <20251023000535.2897002-2-kuniyu@google.com>
In-Reply-To: <20251023000535.2897002-2-kuniyu@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Oct 2025 19:37:27 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
X-Gm-Features: AWmQ_bk45WJyQfjQIDpRb59HoMm72eRtwroHiVS5YhkseklDQ1bsOMejpvZJz24
Message-ID: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> unsafe_put_user() can be used to save a stac/clac pair, but
> masked_user_access_begin() or user_access_begin() introduces
> an unnecessary address masking or access_ok().
>
> Add a low-level helper for such a use case.

I really suspect that you cannot actually measure the cost of the
extra masking, and would be much happier if you just used a regular
"user_access_begin()" (perhaps the "user_write_access_begin()"
variant).

The masking is very cheap - literally just a couple of ALU
instructions. And unless you can actually measure some real advantage
of avoiding it, let's not add another helper to this area.

We spent a fair amount of time undoing years of "__get_user()" and
"__put_user()" cases that didn't actually help, and sometimes only
made it hard to see where the actual user pointer validation was done.

               Linus

