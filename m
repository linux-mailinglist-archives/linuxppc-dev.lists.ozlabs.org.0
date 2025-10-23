Return-Path: <linuxppc-dev+bounces-13222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD1C032CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 21:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cswy457mTz3bfF;
	Fri, 24 Oct 2025 06:26:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761247596;
	cv=none; b=WdqWlARvvl5F4pZQ9DmJ07KziU/v3phqfdxrcux2RFXn/EDknAnS5dqAGl2bap1TixZPe+iqD2BlzbOCHsvV2xrGqCsc7nlQfLm3pIYPGBi5+IHmIiO+XnZUXv5ovMwFNYwJJEBvoxZK78WiAGYShRAyrvIAAc5B+jfxIKCFWqoDE6oTuLTvWrwzsrWV3BBrI7WbjnDbhGbmB94CIAjcHrsYv4grUlWuolhKC8GAPsd6xLQv3oxwSI22Hxt5biRL1419Ot32cJv2EANitA7UytJ+QEl6PS4FJWCqaeW/4dozhRBLhwWv2EYeDnnELfpOBClGiEi8vwkuHxzkSz6fkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761247596; c=relaxed/relaxed;
	bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIq0pi4LCm92M+jsfKfI+i9MKVQ/cwdyK5D2kfcF+io/2mmtluWQmJcfzEkydbWpFI5317ISJ0nkFosklyqZkIOoA1n4OpX5sgx2S/Io73thQRs40eFRD2jOEge6IgLUWgQCKq1hlvyOUpllcfQRhhqSmzJmlbjfrnxl4KR4kzaH/mgqPP1gz5FMtXUR4D3CeAkotK2oKfNZy7KTN3WyjLEqXl875eelqtxJJv8fbJ5Rl6QdCntRfQ8+Uw6ravLavJKb5vqHxj64pefUzRqcDwUsUMvShbxy9Mh+l6muHZvLzw0wxxk5ecQR1heFygYLAe7M5dJO9MBf3qSl8kcqeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P99mQwvi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P99mQwvi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cswy32mz3z3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 06:26:34 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b5c18993b73so217577666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761247590; x=1761852390; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
        b=P99mQwvi8MTrtciLveEnpsu6x3rX5JCUzhHFH4FjELodTCAjxNGOxTOJtGY2SuMFFS
         qhz+jtD79A7GhHO8KDtgr0/mcNRpwx0bjKbF1JMtzTKc95MZqxPJlF4RdfAzPR8qrjQp
         vmr0/aNbQt6pD8lvaF8eAhLKS1mAT3Am9WNPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761247590; x=1761852390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+nka1o0UKTB6+YPro/AThdj4Pv3gE7VXwEkULP704E=;
        b=FKaSURPSMjZy60r/8E5jVSFaxksMa+0aaXRAYZzq/7xlRLbZ3BSFdTPjLPmaEMG6Ca
         Bu2X8NqBm8KDaW7PKEgnNFZzz/RK/PIa7/qlEWrRNgUomN9mmgF8QqffScKGu+L4QLjA
         Gz1eK76H6sx53hiielMoUKaiKik1K+0YjJ5isEEnS0eE2EECgar26WVPjR8f+gWQpWr4
         vtPIkiC+KJhnMqFfnK/vgG3P/AxawEWXRnhnawShNw+wAwYvkxLrDzLwOw1nEUmGnNHb
         iV54+owtXSB7pG5D7eefPn2QKmYJXxhSUsGb2R8SqCJUrzy8xXqK/lsAhV15+z4hJJ58
         OYig==
X-Forwarded-Encrypted: i=1; AJvYcCV8X2SHwldM/tPM0mfie93A48GpY80AEa63FaCYi8H7KgsyVWecsgb2kIXcJYBSe1JVhpUSsFn/hrWBC6c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdxbgVMWmV/mF0BUXrJyTEtpN67oTT/m69H7mBVbZZdBswOgon
	vXn6d/jPGJEpKVxABsLC8lIkZJXSuZvA7450QhXVmeafc/sED2sDfZgXzWDxjoLzfvNwO0Zgdr1
	WSOFF3DpadA==
X-Gm-Gg: ASbGncvsXaQhqhFL4j9NzsDKwzCSIEXMJAiOMBY227CZuNeHW6fe7XfXqigifEtzzsY
	fnddyy3t/drGAvIAeo4SS+QRzmYcmLeG5oATBKVM3ufOURF30TOnbRwOjDZVHnAO/Fdp+5YhOTW
	dXT2jSU5IMRF2LlN0+XFJxQlYYIqAOxFwMityhYCZZV6xPdoZYtYpCNN2xiOK2WvS4XNkawQemQ
	Nourew5Av51FxWlE8y5tPRGDZy/7YlWvPSuUg4TCVUvLNSxOE3LH+5y2v6x1KD6yPkxeSzEigpk
	nuG2UFSw5EybSpzzREG1KuzKU8uEtHDlm3ctiYCE0QSGBjFi8kiEYTak3qDKC857XMz9A7EpL3k
	fsyhrq2fyMFIf7RHG6iOha5SCdC0zVU+QF27kqcBkDzz2WfpmsH9hO5NUK4SIZzuS2wpIKaMy9T
	rng7VGuLe+bizEIKT71DNY0JoLi5wzEBdlLCtPKx4XZBtJoPhnSQ==
X-Google-Smtp-Source: AGHT+IGMUMatfwF+XVyVpADlDC6lEY3RM5DgkD5iXihLJUxOijAwcvN9FVBtclGL4GQyiEs3JuwNJg==
X-Received: by 2002:a17:907:a893:b0:b3c:200b:4364 with SMTP id a640c23a62f3a-b6473732cbfmr3436223666b.27.1761247590233;
        Thu, 23 Oct 2025 12:26:30 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d6a799dd0sm23710266b.12.2025.10.23.12.26.29
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:26:30 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so2199264a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 12:26:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTPQLQdZ/XZSJzdYJlSirgCiWjM+EROtCPZqoX7vmfgKv1/3XNQ4so7x9IFzmg52RX69DzsG3nBJs13TU=@lists.ozlabs.org
X-Received: by 2002:a05:6402:2681:b0:634:ba7e:f6c8 with SMTP id
 4fb4d7f45d1cf-63c1f6d5e1bmr24956720a12.34.1761247589536; Thu, 23 Oct 2025
 12:26:29 -0700 (PDT)
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
References: <20251022102427.400699796@linutronix.de> <20251022103112.478876605@linutronix.de>
 <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com> <873479xxtu.ffs@tglx>
In-Reply-To: <873479xxtu.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Oct 2025 09:26:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmaCluDq9_Xyq5CJoakX9a-PwfYiYDMZ1KnC-jDJR9ceAw_ALWfx9Y5hW4
Message-ID: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 23 Oct 2025 at 08:44, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But as you said out-of-line function call it occured to me that these
> helpers might be just named get/put_user_inline(). Hmm?

Yeah, with a comment that clearly says "you need to have actual
performance numbers for why this needs to be inlined" for people to
use it.

           Linus

