Return-Path: <linuxppc-dev+bounces-2926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071F9BF48E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 18:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkCNk58KWz3bfB;
	Thu,  7 Nov 2024 04:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730915302;
	cv=none; b=T8K0Y5B+DB6sQQdgaZU2ooO9N63X4RTZ942uH52C/mfJcEwxgs+7lB4/iC956lzO601B2bFpfXAEaTq+BnzZz/UCgxddYUgAWIy9//dBnffxSUmZSG9UZU3TNS+N/UPyZxsqMI0vq3CJ9xfXmqzvQeQt7YdxxZpVgP8U2ye0+ijthfrCvY3ZbcEe0YppZ+pLfb7jSS3utCXhTzDF2hptJJdqsyeaWLJ7Ext4EXRZXK1hdSbMxe+OKDuR25jH34r7i6R3QLimNn5Zfo3nFlQtCcaYuP/gR8wbqpW2abZ0KdBHBm059W58CZLPJfwXsI9D0+UQOlySg4HWLwni00dGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730915302; c=relaxed/relaxed;
	bh=kSRDhdffu4e2+4oYE1K3ibBkFCx+1qf9H7kDEjsKsEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B50xb9VwehJdEhTcjmYeRerayBpe0OwMExVMzPKWsxKAh9aR1u93fQ3MCDqWnJQ1a7ikWPEJy//lcw52GCCVqZ5dwm7dKb51peyPZXdol0VDfR3hXzPZ14NTJH6a7jBGs2akELltN3IsqwpipThEOE9H1E31RrhqiBeMfJ47ALwR9rfF64L0XECjEwjbeV7yhLVkxwf9JkAZxHuSY2imveV+HNbu8nW0rNUlOKAirOuWUyAzM/4jZczjzSODgtja1M+TJtG3pWyhTjiGnACs3iVZb1lQOsFoe9al+P4j7n8pANKdowdg034+C/i3R/A+pCI4GmmMcAgsUaX0Y/5YQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FZ6Urs6M; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FZ6Urs6M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkCNj10cKz30DR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 04:48:19 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a99eb8b607aso1234266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 09:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730915291; x=1731520091; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSRDhdffu4e2+4oYE1K3ibBkFCx+1qf9H7kDEjsKsEc=;
        b=FZ6Urs6Mf0q0B2P66yx0jtCz9jD0ZA0BLOSfyDv0uYwcnF1KYqaJlU8Z7bP9s3k8Q7
         WS9L7JPOpy80tlDySqG2/Zu2Q12QvWS+EAoSm0TvdcQ3+c4k7mtDTkUc3yqekyUl4oTn
         KxXtDjKFNYW2DrVhrY8XfHXjaGL5ZgWEd0uDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915291; x=1731520091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSRDhdffu4e2+4oYE1K3ibBkFCx+1qf9H7kDEjsKsEc=;
        b=b8YYX74yLEhJzAQoEPjtAS90yNzYe26f4U7ZGTSkGB9flnWLR2MiVn6uk3xm8s9Zb3
         qp4YbzoVkE7777HCWJSr4zo7MDwIEhxYBts8mBm1uwItd8KUW/LdAc+4Sv3eY3BbE9Oo
         Ds8CiToKpDkFdo2Z5rDpkNlE4WhRJHhUcpW+k5DReNrTmFzFhzWQz4iXAyFKMtkbtJIw
         Oz7bluOA86vL6uXP/TLjY+CoKX4rXSB112j5xccQ2SCqspm65eVWVFGsN2qWu0FdJdMr
         0IFawaOkJOSMan1x4GaSeB4CekPvR+OqPruoeZOJ54VlvOhma0s8210B0gsRpuLzfBRU
         PKfA==
X-Forwarded-Encrypted: i=1; AJvYcCUoZ2vl9aEN21hdopsdLiekn/H7nFYYO4YrN9rjoC+1oBbclIuU/oqpahO2eLzJlKdjX5rIpyjhxS4B4hw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzooTBSb+dTO5UYp+/weke6U/FFtEPciMeqIwvnuDKag+T62R9N
	7QXK28gACduwvGK5cmDYBU32/lzrt3xE6uVUUALDFw739hOSQ9wtlbYkgyByYHv4BQvlw9jH2IB
	e
X-Google-Smtp-Source: AGHT+IHC8NeeSuO6Qz3vIvRxpEmN8D0YR0KP2alP++aV5WxjhdIoQxkdAhYDu8DbhS1VupijpAsdNA==
X-Received: by 2002:a17:907:2d28:b0:a9e:c442:2c15 with SMTP id a640c23a62f3a-a9ec4423328mr355606566b.38.1730915291195;
        Wed, 06 Nov 2024 09:48:11 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a324fsm318143466b.23.2024.11.06.09.48.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 09:48:09 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99cc265e0aso990866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 09:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhMJcvnSolLJgxausKk4XbnBego2ZghOOlW7txDGW00BrnFzaij5xa0txma4zc1WjWuSaq6um+/fPaRcI=@lists.ozlabs.org
X-Received: by 2002:a17:907:9405:b0:a9a:1792:f24 with SMTP id
 a640c23a62f3a-a9de5ee19acmr4107136066b.24.1730915289172; Wed, 06 Nov 2024
 09:48:09 -0800 (PST)
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
References: <20241106140414.760b502c@canb.auug.org.au> <20241106100234.189029a5@gandalf.local.home>
In-Reply-To: <20241106100234.189029a5@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Nov 2024 07:47:52 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjSKCbbQHr7gm9G0z_hdjBSprCyMidi4LhYL7YECdRfqw@mail.gmail.com>
Message-ID: <CAHk-=wjSKCbbQHr7gm9G0z_hdjBSprCyMidi4LhYL7YECdRfqw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, 
	PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 6 Nov 2024 at 05:02, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> This fix looks fine to me. How should we handle this when we send our pull
> requests to Linus? I may forgot about this issue, and it also matters who's
> tree goes first.

So just mention the issue in the pull request - preferably on both
sides. Particularly for something like this that won't show up as an
actual conflict, and that I won't catch in my build test because it's
ppc-specific, I'd really like both trees to note this, so that
regardless of ordering I'll be aware.

And hey, sometimes people forget, and we'll see this issue (again) in
mainline. It happens. Particularly with these kinds of semantic
conflicts that are so easy to miss.

I've seen this report, of course, but I will have lots of pull
requests the next merge window, so the likelihood of me forgetting
this detail is probably higher than the likelihood of individual
maintainers forgetting about it when they generate their one (or few)
pull request.

                  Linus

