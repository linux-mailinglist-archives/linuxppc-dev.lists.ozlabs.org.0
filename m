Return-Path: <linuxppc-dev+bounces-9620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D633AE30E7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 19:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQHdF5rtWz30VR;
	Mon, 23 Jun 2025 03:04:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750611886;
	cv=none; b=FpqVt0Yr44wkG3Se1AsI5VlmqDoDPXIOG/8K50BwNuuQg9pW0knWA+iNeqewEMzQPO1LzD3e5J4FXYpEmvy2PYkqQDNeM57URDLQRVEgTPQ0gQXsDEqsnCkK8ERguAYOg4APwxF5fWKzxvkUBqF42gNPAvvvLtgVdHgFYA9XPszE89XWRNpxzU3cgdGGAY/8JANxoQo/vQAJbFc3qNyOErYfbvLt3on4b0/kfVIYDgRCRLtrBwH3B/aKnqg8wzr9ZXHy8yf72a2ozIfROj768nHwsBJfCr+8nB2H5qef+lO0W7RTOl9L54Hvv/NYuJiD2c9Jf4VJdju07tl0UqiKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750611886; c=relaxed/relaxed;
	bh=kH6SnANQ47m1wSFT64o9y3OjbbEmJRBS7PRTptJ1lvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=II2d3fEZ7uA9ku2AQR5ZtKxyaf23GFgcKZHEmLvRpl1gnc8tsu8z2azvOZnZPAa89LbqwqdvqwRoszSfb1OqteGmdpVeIi3zPWnZfjnYDrAVCmDOCyvQBx+E3y2jdL/1eKICYBH4D0TrtH+Jkb5Vx7OFB/zGArVIXHpRN6jr9oUy0X1hHlo4ir9TmxocWJ1I75sgSnPEzSYih0iRXDDnr3zefynXU0Xu9R4KhD+eEJzBwwJW1siFQEAK6+Nd/w3ptWskerO9ZhiZBPuQ927UcXWYACdWgKu8Wfe7Rwv28mkYtjIzjincPq7d6+lU3YArTUvUrgCEXuuMySJspQpAOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CuYZjTn3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CuYZjTn3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQHd926Z6z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 03:04:44 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so5875823a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750611880; x=1751216680; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kH6SnANQ47m1wSFT64o9y3OjbbEmJRBS7PRTptJ1lvQ=;
        b=CuYZjTn3nwTuOq+zYgzaZAPcLf9ENlUGcChGNd0409OqJhjdUy4RBsqzPGwfEv0IGx
         Z0fUgCjoRa4K53NraKiWV94mjKII3sawIbtccRrG5OgzHS/1aiWpeJAA0o7voasM1cVT
         G4ge9XmU8SbJCiLcQhBRipXv4snZU3TvRyxW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750611880; x=1751216680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kH6SnANQ47m1wSFT64o9y3OjbbEmJRBS7PRTptJ1lvQ=;
        b=q+6x8SrC3G3G0lqU+Xu+RWbRGWluU8MrVAb98cWLsFSjG/QCbS5dD3oUbSgExSaDTt
         lciNWNR8Gf+FwqzAD84dkHxdg5M3ifClDuE6MAETC+nKkskGJpl39IPYpFDQOe2OaLZ2
         xGjngLB0FctO3yzBEIkKn9tyPEPej76iak3JbdIZfHMGrOF7u++LDumJMtBlM3y068h8
         7u+BfSAAa4QtAPgtvnXedhZDKC7BU3Fa5beMfEdnHKXgtpkprzCz3gsJ+di9qQTgGToO
         T5b4kO2uxKOBoW65ICEf4Jc7cuZALnZ5SDNHH4k8VlHUIJZYFgt0jWVnFKxzXGD6aWCd
         R6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoQSBbsTtgfahDEXDekDyQj1m/zCt6/mqQc5wzydeR5sDir1hOrvJjwCtm4dLAFgCo6uBThQ9dNKw2b8s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3CgWxw10nygE2vBJ225qm5NPOuJ9k6b3K9ud0FYCTb16bTKym
	2ye8fQ2VsI4Z9X6MKZbfNRd0ABAj0G95OGUFGMS30gT3KvfFYwz0MHO/o5bzhcqErXG3C0lNG0u
	te7Ow3kY=
X-Gm-Gg: ASbGncsTJcuXtpLV2EXgwADdjHmE4A3EtlBmlpvPsKW48+i3jV9RMEOPKDezM0cddf4
	BwW7o4hHPE/MwEyYkp7uZau5SCyy8YU5bp5EZbWHdTjfBpTC0Lq7Vpk3dsIOMRSquXcM6SqqCCt
	NZlSs4zvVUiRpKUgg5AdE78hUMdj8wh3KMbUbZmNVdAHeXD39m4PhnRD/+4GCEcfqeB3I7HzynE
	xSNeFkyRAO05/FcfQSom8MdBCOyUUN6o/Phw6AcU6zUM0YrWsJ/csSDaujVVah//mArj2Kfs9Wb
	3qS3+8xWW1JSm2JKuslN2iYMMj36+fVk/sRPKO8Uk2sfJ/OJi9vkY9dBCOK+inapegL27PMLHLt
	pwv3GNFqEmPZXwNB152AjE/tI1I3p39UzufxZWLcTQLbp4/M=
X-Google-Smtp-Source: AGHT+IGuHmergLDticSO59V+CW73aXOTI7yLRvDXjxw5RLFlsalNWOUoT2yJlLa827g78RI6gdspRQ==
X-Received: by 2002:a05:6402:2695:b0:601:89d4:968e with SMTP id 4fb4d7f45d1cf-60a1cd33336mr8621897a12.27.1750611880111;
        Sun, 22 Jun 2025 10:04:40 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504eafsm4889684a12.10.2025.06.22.10.04.38
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 10:04:39 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade4679fba7so662818166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 10:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpJu004VX3ynCL+jzSVKmggv5dCRPZW1An9mL8pRaUO+NVmwHgEcIE4tYhpgArgcWIOKdAtlcbR5mpX/A=@lists.ozlabs.org
X-Received: by 2002:a05:6402:1e90:b0:608:3571:6942 with SMTP id
 4fb4d7f45d1cf-60a1cca9d65mr7384121a12.1.1750611456313; Sun, 22 Jun 2025
 09:57:36 -0700 (PDT)
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
References: <cover.1750585239.git.christophe.leroy@csgroup.eu> <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 09:57:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
X-Gm-Features: AX0GCFts7S7trAg95_9iRhGDGkpXCnUtzlq1LLaD_2GFvkl-rWcgRNFXTCHwODg
Message-ID: <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to copy_from_user_iter()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 22 Jun 2025 at 02:52, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> The results of "access_ok()" can be mis-speculated.

Hmm. This code is critical. I think it should be converted to use that
masked address thing if we have to add it here.

And at some point this access_ok() didn't even exist, because we check
the addresses at iter creation time. So this one might be a "belt and
suspenders" check, rather than something critical.

(Although I also suspect that when we added ITER_UBUF we might have
created cases where those user addresses aren't checked at iter
creation time any more).

             Linus

