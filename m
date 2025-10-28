Return-Path: <linuxppc-dev+bounces-13457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F319C15B5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 17:14:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwwRY36H1z3c55;
	Wed, 29 Oct 2025 03:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761668041;
	cv=none; b=PJidAU0vLCH29dIuU1rggobJ0aKwDJFJgQzsZePVX/nTIojKG4Q3oyZ6qpNFVryiOoHr0wKI7i2JdPUjbqFoNijdFPlI8toCMTB1KcaDajpRTOaYJE4cQnbamZDYhBIYw6SqZRyCAZ7UjbJM7Qz7sfuIhjpMjWi809sU1Byb97IJOkWYY2jBqchFgKLJNarSaR9DnR4HYG2djKenQPbwy52TJJJLxIfnnlcWLvJATcvQoLZYby63D0PPVNK4q4QHFY92mJCwZTJZ1bSKN4JiaD7DW3FVNA6JYo1CGyaCl/9PJg0i2VBesntDVGeUW/1hjt1ZI5SFqiW+z2Z+CNADww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761668041; c=relaxed/relaxed;
	bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSBFuDWzJzIBkugBlLwAtEfvTf88QfqgdZ9WtPvKSAFYj8zKDNp59Ng9sZOsrSTKKjUzzONWD+EVfOGeApjbjX5gMQlhsMYnmAF4hKHkCty4GLs/iOrwWW8Aq3UUc1C53ckfF6JPMb+5MefnEy5gbz5GmyuX+d3jGN3CQOo8MAwpQx4B0yogR6kqu46e0tl8SgjqyP7oXeI2abkZpE29gS7O2axUMrmBPIQSm7ZNcrzslSfOSTHM+v4kAbXmg4Czr7D0lBAKKVVtfj59s5zS66D6eESwH/L2rQ74ghMcCHeSY6BGBfzPNQyWA1pyw4D0lV7J/QFsRvBa3R0aRKZOHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=MtUAU3t/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=MtUAU3t/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwwRW61J5z2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 03:13:59 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b64cdbb949cso1407467566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761668035; x=1762272835; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
        b=MtUAU3t/rlaO8Uhyu/bwP3FcT7+tFoO5nqauZ1nWYOnNGDQwSxYiCc876D2Ypl3wIn
         ls7f7VA2Ss6QZdQydMTzcs/6thcQDxXGapmPiDgpA/9igCylGyN4GLtTuG4Iv0RH/W/B
         /pzcRp14v6Rdq54GKRL3vTYtOtYsibm3TR1Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668035; x=1762272835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
        b=bsJ/qmBJy0JpqHb8CrGCfeCcWgnaEM7K+72X/+n/ImNFDx2KxdYoq3ZJKUkETeXF9A
         b1yDEY8Yv+qwuImwszRqiV1RxPSZdo5x7ic008bS++tbqw2Yb1m4HCyfrVxeIzECwymZ
         5rjKxUrUgAhyjAW4HWbifv2wAz7hAtl6z7RstG3477FiJ4fFVbXgrLW8k1HoWLvPKY9g
         zESi5LTJqIt9J4KuWVhJWcGllB8G2f+NX9ONJltYbXSkGA0OHiK0J6AlTWryRZ3ShmEe
         wWFLbfTFW3iI31KsB23Tb4P+Hylb4iUO93DoKHbkjHQ6U19ugCX2mrk/gYB9+jGCr5aP
         gxzw==
X-Forwarded-Encrypted: i=1; AJvYcCWOPfnHQ8gLRV5ZuZHFeuYHupo20HL7MFJSjuCTjAvJeIC6eI+D6JndZ+66RzT05RSXrTM7JvtEDeBE3Q4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEFwySseDYIB5HXno/xpzVvgzRgPGpCEWWZD4/AALF3DBAC6MI
	e+m/ODp5zxM4Qx8beHN++nRUa3g7DtCKYaCbd5pNGYRh5o4M6pc+zAveyrhZhC/r2jink18uC1J
	R+hHSVkE=
X-Gm-Gg: ASbGncunXk4mDd17zKPKy5Tnnzx9bu2QfGqd8LphXFYQFL1hEBUqVZrkaMWIrbJzExR
	wzAqCxFQlLCpTzGc2jS9g0GD+vhZEk7CqDffiTQO2tWIFQLrOAi2o7ZBJqKykRsiPMnENhHsInP
	lp7qcuCDUk4S3AIPetxQZIjI1hvm3lqnk9lfDstl+Eucx7Ihhn6AHPiDe75hqfndIH5kwkS4+mS
	JVuwilzH9g0ejyhNM3HUtdWXKiJdlmP5ak3++OJDA/WNGpO/ruV+ZJlcCq1VNegmiwyWlAn5xn9
	QNHxj7+JZR7H6lWA762aCUutEC+pmCmS0yXPCkkU3ml4RX5JmuuKx9kp940j6gEwXGLEdt67kGl
	DWJyyDZ7jEn4CTPH5GuVeQE1FN0kQZV7lcO676Qwwkx3ND1wKYR5uxOy60KeJEcHtWETsgjN9W4
	V6GDmtiuYjznGRLNnSXVjtKXmLsY+qyv9W9QzS6QzKQSgDLpZzCA==
X-Google-Smtp-Source: AGHT+IGwyW+wwfb6fwlAIT8msZ1tP0/pbcC3W79AlRsJj+Gpfy9LqjD1ENPop5FueqLvX9ftZ96gTg==
X-Received: by 2002:a17:907:2d8a:b0:b6d:825b:828 with SMTP id a640c23a62f3a-b6dba492210mr473548766b.25.1761668035293;
        Tue, 28 Oct 2025 09:13:55 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8536cd11sm1137172266b.31.2025.10.28.09.13.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:13:53 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so11366113a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 09:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS74Pn8ituvxL44RX6LjVeXuSgMTMGohBM/IGWYStqaxj1DujGMBoytdh0tRii8NSXlWV/+QQfLLp9+18=@lists.ozlabs.org
X-Received: by 2002:a05:6402:358a:b0:63c:4d42:993f with SMTP id
 4fb4d7f45d1cf-63ed826ace7mr3748960a12.3.1761668033009; Tue, 28 Oct 2025
 09:13:53 -0700 (PDT)
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
References: <20251027083700.573016505@linutronix.de> <20251027083745.736737934@linutronix.de>
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com> <87frb3uijw.ffs@tglx>
In-Reply-To: <87frb3uijw.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Oct 2025 09:13:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ39CSZwN3W6n5kSAqL-OhJghygh3-dRsrJKpOa9nTwg@mail.gmail.com>
X-Gm-Features: AWmQ_bkZ4DVtg-fqS9oPLAcmx2bmXbpg5s6Qki9Q4422mgDG3jAT_1tXHLLXals
Message-ID: <CAHk-=wjZ39CSZwN3W6n5kSAqL-OhJghygh3-dRsrJKpOa9nTwg@mail.gmail.com>
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 at 08:56, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> There was not justification for the open coded inline either and
> converting it to get/put must be a completely seperate change.

Actually, there's some justification in the original: see commit
43a43faf5376 ("futex: improve user space accesses") which talks about
the original impetus for it all: avoiding the very expensive barrier
in __get_user(), and how __get_user() itself couldn't be fixed.

So then it was converted to the modern user access helpers - including
address masking - and the inlining was mostly incidental to that, but
the commit message does point out that it actually makes the address
generation a bit cleaner in addition to avoiding the function call.

But I doubt that the extra instructions are all that noticeable.

That said - this code *is* in a very hot path on some loads, so it is
entirely possible that the inlining here is noticeable. I$ patterns in
particular can be a real thing.

(There was an additional issue of just making those user accesses -
get, put and cmpxchg - look a bit more similar)

           Linus

