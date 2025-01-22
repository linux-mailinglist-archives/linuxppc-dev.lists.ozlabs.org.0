Return-Path: <linuxppc-dev+bounces-5473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54168A188FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 01:35:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yd4pp4wvjz2xfW;
	Wed, 22 Jan 2025 11:34:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737506098;
	cv=none; b=Q57kR80/79sYb8mUgQi3n6gefR3IPJQvoDKwRVX2Bji2w85YdZubSpgnzD2xrCGM3stxUQZXTFFhLOBu6XmpAhbaIZ15076SxW98Fn5jF45YcWe8i7sYNVUFi+gtU0RgEC3+I334Z+iWFiMN+SZx7/8YCHORhkOTxwfmd3RFoJK7ivo7dbQrHiF5CpTmdqZozdZYwb8gS/RZWqB8D1WVXqKImdMZ+XjhU1BmbqCDssbh2LFiYgzi08L6t5GmVmo+4woxc7h7pKsx9VXWVvER4GRzcLwgyqOMm+POX4wb/104aoLws6/xnGQZtE8bk7XHBxJPxYALkJzPrSkTtQdftw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737506098; c=relaxed/relaxed;
	bh=daf22PMeH0fhpfBSdtKkVNzRBRMJC8LiKopMmfuqrAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEbozxv3sfPemurm8QwGGOJE6uz8AW4nm8KbZ2mCNemXAbYTIYT2dsZpzQMUq3YMT/Y6uKIiDxFXIGs8XvVf4q8hQzljQ5QIGcmwnpqwv3Vb2AGK2Wk1SNuwh8KNJPsXkIOzUlNbNBZF77s2Xl9AIvw/1b6sw0rbripI3jURaDUJVVk8uT+sCEJzi0x10LxDfCdKbw580XbeEKE52wd1ze4xCYC2BKcA3Z6uBzZwdkCrrtQNH8S6xmAUck3B5USrXSbM6I8cY4Cs6R0MRsP8/0lKubfnSsEOGK+P7kT2PF9u66P7A7K7FFMi7mpJA2gN0KvSCKsynY3cJtB7T2rxtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WKLdyrow; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WKLdyrow;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yd4pn1fXmz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 11:34:56 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso13133283a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 16:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1737506090; x=1738110890; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=daf22PMeH0fhpfBSdtKkVNzRBRMJC8LiKopMmfuqrAI=;
        b=WKLdyrowj/Tw5Zu4V0ad1ZYnWSuNB5q7N5EofgjrHBk48b/YjgW80OIoxNWZoran/D
         ZZh7uEE4VrUWs70MCcGyV9wICLxyeFG9/rKhfB5C/9g1JiqoZYQa5QTqwryGpWo86Mfu
         jEadek+fSWNBpXCQCPxkow1/eOtvAjlzlIYMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737506090; x=1738110890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daf22PMeH0fhpfBSdtKkVNzRBRMJC8LiKopMmfuqrAI=;
        b=xIID88tG9MLWijs3HHbhQWqWA5P5CMVAboLanG5D8gj+GxAj3xV9KBsMwaC8y0dPnM
         Jn0inoDXns7EPQYcgJVBOwJdLJXiYGrqXXfqGWH9jWS1Z8cVvtAqasUCyNApKkZpeACy
         5urdEM1BDknqJXGkRGEhHPZo6ziysQ2tZPHmk/BuQOv0bXnqc5CbNUaNorxBjSm3Weo0
         njCvk+q1L0a0dxDe8JQ7uEUhcFiOCZBr0sc4w00h/GlWl2Uaj2WI3AO8aYdnXgzTZIij
         iilmmbBtpQYgtnmgGFi3ntpxT5ektV8a9vlomzzTwqWV0BMklE4Zhi0HafDkvLqsmxbs
         2Ahg==
X-Forwarded-Encrypted: i=1; AJvYcCVSniA4X5tKzFpB9e51iYEg8qOhCjakaKw3XVNV9eYBJ9yLfp+GSNSsK3jCvzeapVpAvGMvP2Gt/ke2YXc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0IUI25/l9CMwdEv8U+k18FLEdHAjUf9AzNK+sFsQHTvwnNl7V
	OcpCN2X3BXoGItPkml9YwmLEjzas7UD6KFGeGYWRzbBxattQVAnjo3PicKd49w3SYmNqIpz/wCv
	nAUo=
X-Gm-Gg: ASbGncvDJj3pgmcvaXMcBtbJbLogCeoE36k8ds6k/564+HDMpe1YI2p4mTrxh4oaHH3
	ayPTEuBQPXOzgmU8l/naCRB0Anj0zM7UMXQ48HyimxdiqyjbMQi9v928wypwLLTGFl3GBQ1SP4Q
	1ZedKmyIbq/FmAjJ3kGza0fKldQGVLVVw0lJtNNNemIrWP5OxF9ewA2iQ7lWKNnP0y2z8mBUt5d
	FPJrJiJV8TZLo7mQSDlgmppSZJOiWNlL2ZjvfNQrmadTiV873+3KTmiWwT89/4FLYJV3DMPhg0E
	kWtVimDBqOsTmzqamqk+XfHhJiJBWhIRheWLqtp+CMsEMkzZWko70LY=
X-Google-Smtp-Source: AGHT+IFBrdEQhAMgLyqggUmcE0ZpP4aoM7dy99raO17OX9IW1mrPqlwrJNF7yN7A3f8ZxWB9VOjvPw==
X-Received: by 2002:a05:6402:270b:b0:5d9:fc81:e197 with SMTP id 4fb4d7f45d1cf-5db7d2f1048mr16439748a12.8.1737506090205;
        Tue, 21 Jan 2025 16:34:50 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db8942cad4sm6633644a12.60.2025.01.21.16.34.48
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:34:49 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso1175182266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 16:34:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwLCCV4tYq8phpglsPUj1uiBKVlKCbS8WxY0ObRNEo+iPSOa1QaJ84VWG6xfwZvXXZF1wkbm6u8Bu1Udw=@lists.ozlabs.org
X-Received: by 2002:a17:907:9723:b0:ab2:b77e:3357 with SMTP id
 a640c23a62f3a-ab38b10badamr1774465066b.18.1737506088040; Tue, 21 Jan 2025
 16:34:48 -0800 (PST)
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
References: <20250112135832.57c92322@yea> <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
 <20250121220027.64b79bab@yea>
In-Reply-To: <20250121220027.64b79bab@yea>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Jan 2025 16:34:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgO6+x=TkEWxr8tKoxUe5rUY7C_pA_YQx5czoiBAeR6=w@mail.gmail.com>
X-Gm-Features: AbW1kvaOs-LFNzR8XNlZlhgzHvDrJfg3TBTNkKuHBh_QZt3OkJKRHCBqitHqRuw
Message-ID: <CAHk-=wgO6+x=TkEWxr8tKoxUe5rUY7C_pA_YQx5czoiBAeR6=w@mail.gmail.com>
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
 (v6.13-rc6, PowerMac G4)
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
	christophe.leroy@csgroup.eu
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 21 Jan 2025 at 13:00, Erhard Furtner <erhard_f@mailbox.org> wrote:
>
>
> Meanwhile I bisected the bug. Offending commit is:
>
>  # git bisect good
> 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d is the first bad commit
> commit 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Dec 9 10:00:25 2024 -0800
>
>     futex: fix user access on powerpc

Heh. As Christophe said - very funky.  All that commit does is fix the
user_access_end() to be a user_read_access_end() so that it pairs
correctly with the user_read_access_begin().

On other architectures is a complete no-op, but even on powerpc that
literally just changes a

        prevent_user_access(KUAP_READ_WRITE);

into a

        prevent_user_access(KUAP_READ);

unless I'm missing something. So it's really not a big change even on powerpc.

If I'm parsing your config file correctly, this is the 32-bit "book3"
case, so we're talking about the prevent_user_access() in

  arch/powerpc/include/asm/book3s/32/kup.h

and those things end up being no-ops for non-write cases:

        if (!(dir & KUAP_WRITE))
                return;

but it *used* to do - before that commit - this:

        current->thread.kuap = KUAP_NONE;
        uaccess_end_32s(kuap);

but this all pairs with the user_read_access_begin(), which does

        allow_read_from_user(ptr, len);

which in turn is

        allow_user_access(NULL, from, size, KUAP_READ);

which again is a no-op in that book3s/32/kup.h case because KUAP_WRITE
isn't set and it returns early.

As Christophe says, there's a few 'sync()' calls sprinkled around. So
maybe the inlining and some odd compiler issue is causing problems?

Or maybe the old (incorrect) uaccess_end_32s() ended up hiding some other bug.

               Linus

