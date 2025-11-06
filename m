Return-Path: <linuxppc-dev+bounces-13884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FD9C3B550
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 14:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2NgG5HNqz2xdg;
	Fri,  7 Nov 2025 00:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762436586;
	cv=none; b=hwo7Z9jD4iQDXi4JGWcn2Frt3MxVqxeWJSROXUXHQE5oBWB71aE91Y6UJyIBu2CbcXBqfkUM6rLJiNyqOKKlA6NKjCdFdQyP+FMlFPMZPJCkzM5wcCMgrTXAB4JTR0Jx+W0wrK+TxZyqt1MhadJdgpMm2b8DuD8knTkAOBo1atlhUzrR+UcK9BwAHkst66CO4YJ2ryJSuqPymX28EH5S9NgEsLTbkyaGqPvgSaddEjGdQGYUvUShXYfSalSm8FZpATHr4mQh7F52nM03ys+QDKiwp6cCJuvJNlwF5AVkmeuqwn5ziqjly7NwH+h8gIo0jyhGWtJxKufdHYOo0227kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762436586; c=relaxed/relaxed;
	bh=Y4DaQeGVyB05KYzPS0LHKvWlhb6TnpUA8LWnzGCb6LE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KpXX30iJIVZUIpT+8yWHssES9E7SES1tHsTGdSOBT7LvxrD9JfJoQvAl4quxXgMcgzQkXHJ4RdfhubrNVjKzBrbj5Ha3WVLhO61r/iqtN1ifH4aHZ/pf8WNa59jGmPiHWL2atRg9hvVrLkOYPrQ9jfNNignUsv0a4Aoa4AhxkG+1WdqCiH2TnzBlQV0fCUi61zmfYRWk5Btx7ZaSLReREdpMQPwDI2LrTYl5q3Hv4thZFkyYKUDUnucJ7xZqJmczQBVPjKJWtNsRQu5poHQnMXmPBbnrdUm4VricnZWK6nCew6vcwybKpwuMmp0DidMw4jshj7sIf175P7nWCabBJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jNzYskpH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jNzYskpH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2NgD6LPCz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 00:43:04 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so735746f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Nov 2025 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762436581; x=1763041381; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4DaQeGVyB05KYzPS0LHKvWlhb6TnpUA8LWnzGCb6LE=;
        b=jNzYskpHwhNnP2/Q3nwwYssjhPW/LfgXWikN0iHEc2LZcP0A5++5tDlwYYwQsP9pir
         ESYLDQZYclmiM7efnBXUS77lZZSjPkVNzbsc8GiLHKMEoY5sSPZRyH1OqswlJm0Xzwk9
         exlPmvSf8Lm/f1YV+KT/Kh1pULrA+serwu6OHbGgrPKLc0zk0OMILB72n86/VbaQZ4m5
         mf6/rgq0Zwte0qqYlr0m7+t0EBcYIo2Py2HoY0S7AGix4wpRj3wKTX/BiFUZ/6Nbf3Mt
         SG/1rb0EVXMk9cmGj6PJf+hmGsq4zmDi2uU3R7Z2Z70R1Ol8krMBqVMtXNH8gkA9eSPZ
         r5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762436581; x=1763041381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4DaQeGVyB05KYzPS0LHKvWlhb6TnpUA8LWnzGCb6LE=;
        b=sJU60iR1A43pd2Nm0s2j1f78jbsxWE1O6vnumDwzCD8aroX1nwYBE5tdT+1qfhnTJC
         +8Yqn82VdwWWAht2acmMzC83fKGXanpQPqZXpgpfoI0OxiODgt6OFkphcH3yoLeuT9tX
         QYzuBbYRJBpTmAO4NbYOD4MSZakl3Fr9VLkuVnZcb9IP1e2yXjndrI2TahNGTI8i8COl
         PVsdXC6W2hsFmzxcpgf5s03BMa8uCt428UcoGnhrXTsgRUfJ/VuGyw8CpgWP2UmVaFC6
         p5pHndRQvWM4Af7MpnzFXsf3PccnnjU01HbsfCS8nr+ZWJFutNvXdhFMHdN7eSJ719Zl
         Q4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXV/rw/mtEBgyzUU8Z/3oGp5mwS1KqCh/NEc0LkTfxeRkqe40uHeIypwrlWCDYNlgvvkDy+5fPsdV1D/Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIX0b2JgWREpen9GpFEJWpFiXgJzv68DOzmr6chW9Wobj17YrI
	qSQxxA1NA/FLKwWlKk0lj+CeH3fl6wrmf7G++HGLKv9opTeZEE0Vnqtn
X-Gm-Gg: ASbGncsFTSdxWBOVLJisI8a+aF1ZOCRPXXhPCoIQxgLnndj9YCl74LsC/7ODAjqEJLx
	Yd3zbSwHmLzUiBzIePO3nROcfRqF0RlBdbj6oPyhHs2jdGOASw426/tJQ7K/aR+PXnx3Htjq0h6
	1PwLvOm7duL79mgd7NGEgF9ydsrg9j01p88mvf6MJ+N9YiVqrJdOkSqcF0CjQGbD9ZCmBJ0sVeQ
	iJdzJzTBIk6rpJKvFifZVWUZRRzxTVhfPhdjtuRVt/W1x3eqp2C2oG72uGuOmt2w0RzqR0Z4Bq2
	c24xj7LGZI/WAYbAchc0xOEISTncSia++wkuIuGnthPo2Pijmmgkg6ZH7zdL52xt2HUPZ/1r/fB
	Ud2QLrFwB1YjgKHyLKhbhjntRgfnpzYLCshz8KYRUZOp/GgLYsTXjup4NURKVr4WbiwFvZ9qpv6
	6woCgS3EUsRXL2CViRE1njnjd2SrpQggPUiJLwHqFTbeivmr1jAAU+PDDTSCyzL7w=
X-Google-Smtp-Source: AGHT+IHDsjJABGBM/pDAFp2o03YAq/Y+Phzta3DyuV5Jfm/SuLEOelkoMEjBy0TTBTORIGeE1uEwkw==
X-Received: by 2002:a05:6000:26c1:b0:426:d81f:483c with SMTP id ffacd0b85a97d-429e33088ddmr6854934f8f.33.1762436580431;
        Thu, 06 Nov 2025 05:43:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb42a354sm4888852f8f.20.2025.11.06.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:43:00 -0800 (PST)
Date: Thu, 6 Nov 2025 13:42:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de
 Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 10/10] powerpc/uaccess: Implement masked user access
Message-ID: <20251106134255.2412971a@pumpkin>
In-Reply-To: <20251106123550.GX4067720@noisy.programming.kicks-ass.net>
References: <cover.1762427933.git.christophe.leroy@csgroup.eu>
	<5c80dddf8c7b1e75f08b3f42bddde891d6ea3f64.1762427933.git.christophe.leroy@csgroup.eu>
	<20251106123550.GX4067720@noisy.programming.kicks-ass.net>
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

On Thu, 6 Nov 2025 13:35:50 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Nov 06, 2025 at 12:31:28PM +0100, Christophe Leroy wrote:
> 
> > On 32 bits it is more tricky. In theory user space can go up to
> > 0xbfffffff while kernel will usually start at 0xc0000000. So a gap
> > needs to be added in-between. Allthough in theory a single 4k page
                                  Although
> > would suffice, it is easier and more efficient to enforce a 128k gap
> > below kernel, as it simplifies the masking.  
> 
> Do we have the requirement that the first access of a masked pointer is
> within 4k of the initial address?
> 
> Suppose the pointer is to an 16k array, and the memcpy happens to like
> going backwards. Then a 4k hole just won't do.

I think that requiring the accesses be within 4k of the base (or previous
access) is a reasonable restriction.
It is something that needs verifying before code is changed to use
these accessors.

Documenting a big gap is almost more likely to lead to errors!
If 128k is ok, no one is really going to notice code that might
offset by 130k.
OTOH if the (documented) limit is 256 bytes then you don't have to be
careful about accessing structures sequentially, and can safely realign
pointers.
I suspect the mk-1 brain treats 4k and 256 as muchthe same value.

Requiring fully sequential accesses (which the original x86-64 required
because it converted kernel addresses to ~0) would require policing by
the compiler - I tried it once, it horrid.

	David


