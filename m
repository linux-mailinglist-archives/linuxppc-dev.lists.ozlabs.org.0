Return-Path: <linuxppc-dev+bounces-2436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E979A577F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 01:35:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWvvR6Tmdz2yGC;
	Mon, 21 Oct 2024 10:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729467347;
	cv=none; b=fZMLcmFfYD21DjAOsWVnRxlMk8JK7n6FR8zLokUcmyziTy+Lj7zSQuLI/f1ygY4SWGPl8CELwPitw0hzmehk4VjMKqYSokUIIRLxIUDyQeYGyAHm0TYJesttRPO56CAKQ7U69ZLhjpat9jANPjEXI9+7vTFUVxEK47+YvOsooYLBnUf38TtZwYgBToVBFU4C77dCdOmwpLG/DF+oCuN4ZW+rDKC3ndAVDakgmvDGdG93QpBrQyOzrPN6+Lr2WS0ZYMSj3XIRL6vQUusvFF9oY/GqQXjz27/C98tuuxJ5Ker8QI0onhuJH2fctUjfA///ySBFC567hn0ytj9QSHaC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729467347; c=relaxed/relaxed;
	bh=vL6/ox1IGPOBPGAANUn25XPyQj8U8IFpD+XuC/FflFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGqdajes1syQOcaFoT0oGi9eEph59BZCS0iQkpAYwOCGv4Y+4Ob2XmfK497zw5p+lwYL1eIr4og1XN7zh5uzMWFH6K2r/0CjIfkN8IQo3Sv7j8laFykrfedzrdJi6tkPDfQL6sNnXJ5UhQPHDmG9LlAr2QMnNI5MYqsW+IicFJ3Fca1iXGYQwF8vQz5sp3nDuVETBulHKkzoVzWuWSnAF5PCyCP2aRyDhq+IpsiDHdzIxTJRYszj9Y54folI7GyDwbMCS2a7LA0Bd2fC2gfq2QEBKTMLtGlYSIft4kmCCle5vZCEBnL5W+3qe6xmM3uLQysnp1Bwo23liefxLqHKpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F7XtNgxR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F7XtNgxR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWvvQ0cwhz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 10:35:44 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4314b316495so36758835e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729467341; x=1730072141; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vL6/ox1IGPOBPGAANUn25XPyQj8U8IFpD+XuC/FflFg=;
        b=F7XtNgxRIY3SNYlSDEIqZcbdbCAB3A6YRTammSHuXNvMCoQ4UhnKi2k7m7pINNEAsv
         ushjg1+t74rxDmWjqLlJtpHvBa6dPgy1uYbQSd41GDAq3Z8wT33mJbfHe2NdhUNu6Crt
         PRBUK74uANLy61+8u2HRpz6+GHRhxHI5h24Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729467341; x=1730072141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL6/ox1IGPOBPGAANUn25XPyQj8U8IFpD+XuC/FflFg=;
        b=E6+alvOLVaVXIr0f+6WCFZ8KMmgNrJYpP52UsSBmBJPmDk7kPxP+i0HwSjdj1h5OOy
         yQ+WyKgyfOEFSXXFg/hboro91Bu8Nwf1cflK0zOqjxcIOhFx8ai2CLQrh6cb8cdV08b4
         6F1WwpvFlHDS80opRfvZhSR4ljhLJzuCUDgpi4hnyU1uV0WUmlVmAk12Sgo3Z3pCG0gA
         65rw8Ttd3p/0oNs5wUsQJChtU/fUFz+Gs6CvKUON2tseNo+QeXGH2tBPno0b2xFqSX1s
         AV0YicV0NjfAeDZWjwkDPkNUi2QMIj0k/lt+wMW7yxnhIzTO56JnJsJjM7iJyoRu5n8j
         sOCg==
X-Forwarded-Encrypted: i=1; AJvYcCU4LJqWSeCfYSSskRF7JIyTSYcKmfiNeOoElBGuasEwK27xgKHUi980C/iIiKgdU/kaXr6TH8kiML+Vdh0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxdJYo8qq3dNZzvXAoqCjZ7npUAMVrBz6wYnZAgb4k7zOltOhP/
	1YaVLKsJ15Jp6jc/I4kSaOxeyPFdOhP7nj09SrlIkO32xrP4BRpK1qbKaJS4Gh8VMnRZrKbt5Jl
	m82YD0Q==
X-Google-Smtp-Source: AGHT+IHrXRmAqF96RNWGLrHe9I0Z6I2Yk73OqYgBx9A/MHR7o+lIKVk2Vhc+bI1u4f+puLSDuKjfLQ==
X-Received: by 2002:adf:b112:0:b0:37c:cd0d:3437 with SMTP id ffacd0b85a97d-37eab73cf70mr4764788f8f.58.1729467340597;
        Sun, 20 Oct 2024 16:35:40 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913706d3sm137373266b.134.2024.10.20.16.35.38
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 16:35:39 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso7039334a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 16:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULI3WiKrYUiI987bCe74SZVSXsrVU/krW2Ul/K51HGDpHTCT1/mjeLZFSxzojwNpbLiEPG53knJQ0iPJQ=@lists.ozlabs.org
X-Received: by 2002:a17:907:9309:b0:a9a:20f9:a402 with SMTP id
 a640c23a62f3a-a9a6996a68cmr771073266b.13.1729467338458; Sun, 20 Oct 2024
 16:35:38 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com> <20241020231112.erso2jzqwkbin4kh@treble>
In-Reply-To: <20241020231112.erso2jzqwkbin4kh@treble>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Oct 2024 16:35:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
Message-ID: <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 20 Oct 2024 at 16:11, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> Until it's s/think/know/ can we please put something in place?

Honestly, I'm pretty damn fed up with buggy hardware and completely
theoretical attacks that have never actually shown themselves to be
used in practice.

So I think this time we push back on the hardware people and tell them
 it's *THEIR* damn problem, and if they can't even be bothered to say
yay-or-nay, we just sit tight.

Because dammit, let's put the onus on where the blame lies, and not
just take any random shit from bad hardware and say "oh, but it
*might* be a problem".

                 Linus

