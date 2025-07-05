Return-Path: <linuxppc-dev+bounces-10123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBCCAFA130
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jul 2025 20:33:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZJzl4nHDz2y06;
	Sun,  6 Jul 2025 04:33:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751740419;
	cv=none; b=BrxMRmmVYe10bA9Pwb3A4EAEuFQowoN0mNBUaRUUhKjfBv74VVrAQF5nEN5bWtesM424hXZ5Tt0EYVbA73GeFK30KQ7RwKWS41vyDWPcvYN0Sk5gVeOR+TDgXX7BmJfFduLbL7ez/J0NllVTq4lPe1dP2Yr6eLislykoutPw02X/ZiwFKQ9UHx58M+cR9Vrf08jFzdCHTJuyPwRSL1Wpb5CQcvzww6KjdtD9msBJog5U1ssC7w+m5eFh60cFKdzX6f7QtGZeKtnzk6GkuyVHmxufVBDdlyBd7YQ5P4ZK7Xpw/CdQ/yel0d94cS+cmKx0S5xT4RFbt/CikzhiroJ8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751740419; c=relaxed/relaxed;
	bh=EBiXD1gpNqEKHSH9dRs/IIiAb96ceShYwWC9AuMfQh8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFHQbMQMFIcDt6feXG6hS1luArsx+s2M+piuo2WrHhamFQSmzvLs9T/gbWSoZDRUczqe9FFvndJUe19CoppYC2bCNliXKFGWXS2NQHZSHIb8mtyIkrF4nIKqCN1CuogON0U8u7zh8aJCA4WVGjct0T7yHi3qzO988/VtRYEZ+LFY4l2JLAdptdmLVeBuTuIoYgKov3oR7FkvjytvDu7314UfFmG102BU+YkUa/HSU5eZv28UeSpPGEsG9e9SVj4sTh0gL03H7YcuAJYmCdhzPxMyMT8LUNikFWZ+5Gd2D+H7Zr/fFcUWmLxRAwToE5dXPUEnWcxxjOCcq29Mf7F9eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gS9E+ox8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gS9E+ox8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bZJzk0GLNz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jul 2025 04:33:37 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso11050055e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Jul 2025 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751740414; x=1752345214; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBiXD1gpNqEKHSH9dRs/IIiAb96ceShYwWC9AuMfQh8=;
        b=gS9E+ox8gMbN1FGabjybmmhnqPO5f/sdpd9puxaCZG6RJofJs0ZJ691Et9eLJvoiO3
         iSfkUPzrvBkZY09fVh5SMGyk1On8Prf7efPXolGt2LK7Lmi6D72+E4i/Lo9MRTpYpmji
         QMIOrnX2xrSDn3+QwOUR8+dhrThvoQuMjl2bKbG99ckYtqEu93JZo4CfaSH2xyTQT4tx
         HSPl1y1AJ50SsDKs9h3myUL0u0g2brKTxVmhoMYwHj/Ru1WJXqLwr/7wQw2kfXBD6mEu
         Ywlj7wGYzFJcfxDmbXtkhjTMa7bwau9sbsyfvNGuy1am6bs0QexEkrXUTFxwNTvgdbCp
         yp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751740414; x=1752345214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBiXD1gpNqEKHSH9dRs/IIiAb96ceShYwWC9AuMfQh8=;
        b=N+v28Hw0slfsTYsWksCCxWFhK4sOxpC/Hep5ZuWzg9nd9mqT+v4SYJ4BVE0mKwlRgT
         K9T+SKE5ZriQn31Rb3n8sB+q7ECI9ifxx5U88R2VRIlFSoAsBhPndc80XKZTQEWtuwBH
         tiAJsq/B+KI6tWXFaCJQiNfcP0DyGBeqrXiy8y4IJkX4J/tHN4iX/u1/pU1v+C6Qc4aT
         jbXkBiAVFUtUkAp0U8Wbow7K0B6mbBu8OXQWdLUCUa5GkDHqk9DUX6dWGFXJgDmDadWg
         xjUpydCuVGRWvkFqhDfX6CoA7teMdllXhIO2zedUzCsS6Fcb49yGDUX3Vta5MnJGgYta
         g9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWIwRIT0N/birrotaRC5WtxbUVaKQtGaNQP7Kv3ehEM362UHsQLXTEiSYzuMMJ5fDlTvU+VTZWHaY8HaEs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0xk1Kc3sMF1sfbABB3Bo7ONvccDvRV8gMJ4SrcWcrQFu7iC4h
	uPw/d1jxnj1kPvykmvO/ivvNNLFptPsineDxEB/euKEvT0PqF/n+D49Z
X-Gm-Gg: ASbGncsrtj5f5hCzm4Tnw/CqsSEWhpjtbQDE41rfGt+Eg77qvGz5IUqdgcjNAmaSnOS
	OQpMxlEMLdGUP6zhz2UTXe6PMHnH9vbKFP4fa07Z9mqvR3Og2fA+6WWJ5xwJIop5vLMJ0jf3MK2
	QpVi0ZhLTTvmNEheriMRi1ZGMFq1dIuGdOGTHyt3MEMQrG4kbo/6F3bpQJsux7WGT1W4Ly7ic47
	h1ZnCTRkOQelgp2CrHuhYIleR59yj+z6yQHwT4blUOFJY/ijQwTb5SpOewhE3NV5b4D6qp2VxA4
	+aVJGT509iyeIIAfyfIBSesTZraNRrjSSykais+oiqUo8oTpnNtLKJsCL2r61bDkxdPCl+b+9ww
	XxyH2nQXCfIcVzaW4Vg==
X-Google-Smtp-Source: AGHT+IG4wXxZJ5hURR9oKdPo1xtppRKhWiRw6KIdA9TlPv/AhIuF4jp+AN7AyHaQ8S9c1NeQJys0UQ==
X-Received: by 2002:a05:600c:3f1a:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-454b4ec2132mr69540735e9.30.1751740414244;
        Sat, 05 Jul 2025 11:33:34 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b168664bsm61780085e9.20.2025.07.05.11.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 11:33:33 -0700 (PDT)
Date: Sat, 5 Jul 2025 19:33:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <20250705193332.251e0b1f@pumpkin>
In-Reply-To: <20250626220148.GR17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622172043.3fb0e54c@pumpkin>
	<ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
	<20250624131714.GG17294@gate.crashing.org>
	<20250624175001.148a768f@pumpkin>
	<20250624182505.GH17294@gate.crashing.org>
	<20250624220816.078f960d@pumpkin>
	<83fb5685-a206-477c-bff3-03e0ebf4c40c@csgroup.eu>
	<20250626220148.GR17294@gate.crashing.org>
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

On Thu, 26 Jun 2025 17:01:48 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> On Thu, Jun 26, 2025 at 07:56:10AM +0200, Christophe Leroy wrote:
...
> I have no idea why you think power9 has it while older CPUS do not.  In
> the GCC source code we have this comment:
>   /* For ISA 2.06, don't add ISEL, since in general it isn't a win, but
>      altivec is a win so enable it.  */
> and in fact we do not enable it for ISA 2.06 (p8) either, probably for
> a similar reason.

Odd, I'd have thought that replacing a conditional branch with a
conditional move would pretty much always be a win.
Unless, of course, you only consider benchmark loops where the
branch predictor in 100% accurate.

OTOH isn't altivec 'simd' instructions?
They pretty much only help for loops with lots of iterations.
I don't know about ppc, but I've seen gcc make a real 'pigs breakfast'
of loop vectorisation on x86.

For the linux kernel (which as Linus keeps reminding people) tends
to run 'cold cache', you probably want conditional moves in order
to avoid mis-predicted branches and non-linear execution, but
don't want loop vectorisation because the setup and end cases
cost too much compared to the gain for each iteration.

	David

