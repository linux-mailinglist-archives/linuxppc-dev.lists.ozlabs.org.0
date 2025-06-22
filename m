Return-Path: <linuxppc-dev+bounces-9625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1BAE31EB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 22:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQMxP0FQmz30Vr;
	Mon, 23 Jun 2025 06:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750623544;
	cv=none; b=hziKjkJix4AfgLaDbeVKbhS72wSjZvuUZA296WxWCjwajKdtJSFPomgdHO0/eOmgz9eM8f//DpYb7XsV+I5vSCQcyhTRgroWdI5BYaiKHj6o6qGnCiogtLZ6WO8VeM8e3nwXFiKXvIl+07dbhzt9qD4UU32S9KBpg/7XA8dak+frQ93D+CG+pQY3ws1Ku1MRirab/87eYXtkfbLFQfzIwruAgA2gnEz9sDHsy3DAoeUxcRyV6zhgdhMWcWAqO7HFRxbKQkLlYkBWfAPX70bJskZlO/F0PG4XjxpRrOgh0BAAPH2H++8V0VtFZXMuiUYCRXG4rUCnV+qyUcuK8tOjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750623544; c=relaxed/relaxed;
	bh=pr4/VSOPhXARWL+bOVMhVKBcRaNKG6LoHmVnJev7O/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gua5GyobiBHlaIi5RbLu9DSLw0vzv/HVRJr9F+vRt8CkKnc20DI1PLYmUNZ/OuONoosrnkrMuSL4pzeTqRq5W/k4agzVn/Aj2oSLX6eWa7aT3WLkcFPEADCR3PvOVO+xx5UYme0bFOcjAYPOwsT4D2vl8JSxVAMjX0fJeRVAqPMQ9yA/5Fa7eHIFWYE5XrzUhe+vTpzPPpmm6pxDEzWzRg4VFPv+JzMuJzAKLgHwZ8m0OmHAogOnceZEeyXkbLxK83GSRHrjW7FcGFG7JIfxWEZnNMIDjMJ1BU0avKpN51ee54RSRKdqqiv2H3mrvgc9JdN5CcPEJWZWqdOOuhGwsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SfYLAOQ4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SfYLAOQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQMxM1ffGz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 06:19:02 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-453643020bdso19030675e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750623537; x=1751228337; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr4/VSOPhXARWL+bOVMhVKBcRaNKG6LoHmVnJev7O/o=;
        b=SfYLAOQ4cn+kTGbucAbwPfOpqXKGYqRQuq1o2NPc9oJ2duOsMgjDW+N0IXefEw1Hvb
         hyG7T9csGyZU09giPgCiLgKexc4luBzSe+osREMquCQxpqhvRZG67cVlE0i+hztFbmQE
         rCGBQSk+HdemD8xrV2qKCNAWCZhJpjCVLxo0VLI8wLY7dQMLYgKi1mnP6I5zo4DeFHqW
         gWLNbecVcYb+lFBMmDP3LfH3yUB+mU1WQoy93oLsDOmUtQ0PTTWt8x55u1bzVO7DYOoB
         Oz17YVMQZbl8KPpqX0bnJQnIp2H6ET7zyJc0YkdheeOdJS3lS0gy4hRL6N5JiVpV/dF1
         tSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750623537; x=1751228337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr4/VSOPhXARWL+bOVMhVKBcRaNKG6LoHmVnJev7O/o=;
        b=kPjRvoUIuMLSihgbxZT6Y4PLZxYuq6CfGByCaqEQdTwJOFkblZQr7wMDLtNdHClY25
         y061grgKVLjzokm33EkNaE5popvW0LOz33w1lQJe9zEe7GwBmdiruYgQkLBcHxGts9V0
         dsKPF4gpiwhqEBatmsbxd0kblH4W5+j8N472ccQ5zfPRi7JoA81gOU5ECFFbBYyLb074
         MnkT0UqNRJnNvtGPFHuKV4FaDuZIrsWY3m7fA3MeLOf6d7hrD1gBl0/Z2dYJwGfaGKxb
         Z7jfr6DdHuT7qE0h1GjqwO27vHdK8agsWR1Jzd8D0lstqJ04yy3wQjdCFGKDiruUTy64
         0QUg==
X-Forwarded-Encrypted: i=1; AJvYcCW2GrYJ4VzzeDzGk/EjaZyImyehOdH9A81ODxSQmLulTBCMmcjDskhPshNuNccRfRsBZwtZrwi/uRl2ZqQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyX9KVNfBLxAN3WtkCdxg+2UWyslJFlVKSTlKXJKCI+zsf+dVsi
	YgzF+Fd+NCFv8AZUoFwHF/ngPXNhlCla8zx8hCnit7kgb5040RFA8n+V
X-Gm-Gg: ASbGncvQ0TjpazzENPzvRDnsfQOfEtdyIalmCOPvv9vgvH+P6Dyof+MSsMQIO6rTWK4
	D4TSEkaSojDtyFtB8SqB4qkxmBlQdj532zXpiQMNiaL9YljN/g3QLdhn4ZvJ2XrhRFfu/HL2loX
	MxeZbgFq8atlerQD7Jh+Fu4BKWZyhPgvVb4Pa0XcKHmdeaQLnBe7t74yjWr4SKwcy+D1HYNGS1Y
	pBt8CsPavuJyIGStQkgy29mfD7qElAA/W4qUawHSoA9Dq/E10FbTFjlVK8jGe/UX5XIy2EnRH7H
	P3Kg2fwimFDvquBk634UiCTxHqm6g9WA2vBPCV33Nb0jS9n3z9RIBF91bD3FHOMFfvinW7NH2qw
	J6pxi60JzABmDBU+BZYaWFFFK
X-Google-Smtp-Source: AGHT+IElsMZ2fJjwqKXfyVpdKdO8zPbMehF7uv/JZtWl4fvT4tyhNfUZ6+9Rb0gPk0YEsBVPO/RZ8A==
X-Received: by 2002:a05:600c:4452:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-453716b567bmr20424905e9.7.1750623537213;
        Sun, 22 Jun 2025 13:18:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b48asm123388755e9.16.2025.06.22.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 13:18:56 -0700 (PDT)
Date: Sun, 22 Jun 2025 21:18:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to
 copy_from_user_iter()
Message-ID: <20250622211855.7e5b97ab@pumpkin>
In-Reply-To: <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
	<CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
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

On Sun, 22 Jun 2025 09:57:20 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 22 Jun 2025 at 02:52, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> > The results of "access_ok()" can be mis-speculated.
> 
> Hmm. This code is critical. I think it should be converted to use that
> masked address thing if we have to add it here.

If access_ok() is mis-speculated then you get a read from the user-specified
kernel address - I don't think that matters.
The hacker would need to find somewhere where the read value was used
in a test or memory access so that side effects (typically cache line
evictions) can be detected.
But copy_from_user_iter() is pretty much always used for 'data' not
'control pane' - so you'd be hard pushed to find somewhere 'useful'.
Not only that the cpu would have to return from copy_from_user_iter()
before correcting the mis-speculation.
I can't imagine that happening - even without all the 'return thunk' stuff.

The same might be true for copy_from_user().
It might only be get_user() that actually has any chance of being exploited.

> 
> And at some point this access_ok() didn't even exist, because we check
> the addresses at iter creation time. So this one might be a "belt and
> suspenders" check, rather than something critical.

IIRC there was a patch to move the access_ok() much nearer the use copy.
But it didn't go as far as removing the one from import_iovec().
Although removing that one might make sense.
(I've also looked about whether the 'direction' is needed in the 'iter'.
98% of the code knows what it should be - and may contain pointless
checks, but some bits seem to rely on it.)

	David

> 
> (Although I also suspect that when we added ITER_UBUF we might have
> created cases where those user addresses aren't checked at iter
> creation time any more).
> 
>              Linus


