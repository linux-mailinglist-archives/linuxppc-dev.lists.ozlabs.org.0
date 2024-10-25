Return-Path: <linuxppc-dev+bounces-2583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B79B07BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 17:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZmcF3r8Rz2xWZ;
	Sat, 26 Oct 2024 02:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729869453;
	cv=none; b=Hm3ZRxs0uU71EujMITndlYfDS5pEjRgImSyccY/8F/tH5J7XLmONWpfoq7butqPHWoPBd2FelaQBxh1sC/sfCNgswFqsV+PjyUaMT5twew/VKNp1A1xJR7kC6zxXATDIzLZeLhIra2jaQytICVxvKdvS5rUjoioeCtnlbhRMdu0L+DeJ8w3tO9lNRcV5I/uRzlMZRO++G+nIptcx+uHgDUyttjR9GowSTLSDlziOjCAUckwhx90oJAPelrnZmOsb8ebIpkA2uAdCPdNa6axMBLbaaYvO3gsYCstdpKqT/qvzsfCQYmKajX2+4Igdw7kf/wyVnqe2vSq7rHl8/grlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729869453; c=relaxed/relaxed;
	bh=5+qZdWqWXtWylOyw2WfWUb01ZrPpEIVk78Q8a8ZQT7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKZDdg6wxrYFjMthuQkYJ8pg+TbttKXjhss7G4j8ZPt2LjwP7iQ/1LchupbuBs4tYVy5SBhHcSSLVWK3vihZaPvEhdkMkpazpkDp17zxkHY2Uhvshjsvqw6M6lGUT290A9eMoNkKXwJpbkB8QFzzuZ4oHQby0aL99CwA1cCSVpv0eHyWMEd03xS+KxE6ewYhdoz7CIvEa622Njv3uuqma+7YzXTa9M8uUq8CHFzjfgdOT4io1XaynReClHL+U2nqG8rI/CuDwWVN+Rdhozbq7Mzrau1ZJyBDWAfp3MYB7tBHLHoul2ut+VtJLAf8goEKpIW/jXjGUBbQVM+sByV8Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=y2b9FvxV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=y2b9FvxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZmcC2qqzz2xJy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 02:17:30 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43153c6f70aso196405e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729869442; x=1730474242; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+qZdWqWXtWylOyw2WfWUb01ZrPpEIVk78Q8a8ZQT7Y=;
        b=y2b9FvxV6Jp8gqvUhNM3hUP3Fj0ksvGqWTcqzpVmPAHvB2POLXXdu8h3cvBDxBs6w5
         g/DjV2lKga9imgCaAk0lkncvC5+a+igSMe7Lx7xzlVcPRFUJkwA12o4l54j8P5dNoatl
         dqDoRXeGe3fui+yfTid8VqPhkKSTDHkP+NlwPTko60E1w3uOtM92k/Q4orCeu1OdO3Jb
         g84oNpnQgATmCqxG28xzOhyJaBA7/iiXDrVfGbQ0n6TqXVFQDmuoEkdYNqgDcfL/fhgx
         +YUg35QCnCr1IVb5X7xOJclq4I1VFLpsF/DqfshqGJ6YYrdpc8UemsBhS5YVRcQL3JZs
         vG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869442; x=1730474242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+qZdWqWXtWylOyw2WfWUb01ZrPpEIVk78Q8a8ZQT7Y=;
        b=fLVxU++RDkEJvDTVebH/LStnnwF+Tm8+s/xzbAq9NXSI8qTzLFNzolH0Q27nVn0Rg5
         vXK2/rjBSM6wyaGXHMg7+pxq1/H62mm1G5psMrSDY1890PTJX5WxpBbunv9nBRU7Fc1W
         fqNBCaQm8JDda5R0jfc0zTjpyIYogpAs9iCTnKVYL1qMVna9MdLeUOkUbEpzNnqbY7Go
         SSc74ILDR0l6fDbzMv4Vlq6YeGssXRHLCW7SWHBkOuOCMpu+TQIjn+9wCFrhMESRW1lL
         0KmLfgPvfy1ebo3+pYMdYgYp48ZxvadXRl2AmiWC0jglsyhkCZ68nca77ISbaARIw7eE
         nCuA==
X-Forwarded-Encrypted: i=1; AJvYcCXcDjzHULDsn3EfmH9BXrkXNSrJqswvXQMJXMI9uilwCpEWsZTSz4ADpk40AO4UvPPCneZ7cAePzh13xQc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrUyzOdBNGe0yL7c/WkjbLNLIRM6js4IGzthzKD4T/aRN+KNrz
	tUnbSb7L27zg0hvjngDYrIFuo67JT75Bfvm4jrPczWKR/zHnE7Ubbg8NOq20JN6YbFTbs9WhiLR
	sbkongwUksiUtYE66Uz9VW+qOPwD94zookMwx
X-Google-Smtp-Source: AGHT+IEGaAp8MS7+26iNwYNpWISUUbwzO5Gpf75slOy8OxD2gSiQH/Cp9KNx7+Lhww385En/cRWbywx/almGe6T6PY4=
X-Received: by 2002:a05:600c:34c3:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-43191f8e5f8mr4966315e9.2.1729869441852; Fri, 25 Oct 2024
 08:17:21 -0700 (PDT)
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
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com> <874j50juyp.fsf@mail.lhotse>
In-Reply-To: <874j50juyp.fsf@mail.lhotse>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 25 Oct 2024 08:17:08 -0700
Message-ID: <CAGSQo03L--HDUBeo3xEUANbBcSf4GK5GUNGmHSBzL+ixpRGuqA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> Sorry I realise it's version 7, but although the above looks correct it's
> kind of dense.
>
> I think the below would also work and is (I think) easier to follow, and
> is more obviously similar to the existing code. I'm sure your version is
> faster, but I don't think it's that performance critical.
>
> static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> {
>         char *end = str_seq + size;
>         char *p = str_seq;
>
>         while (p < end) {
>                 if (*p == '.')
>                         memmove(p, p + 1, end - p - 1);
>
>                 p += strlen(p) + 1;
>         }
> }
>
> The tail of str_seq will be filled with nulls as long as the last string
> was null terminated.
>
> cheers

As you alluded to, what you're providing is potentially O(n^2) in the
number of symbols a module depends on - the existing code is O(n).
If leading dots on names are rare, this is probably fine. If they're
common, this will potentially make loading modules with a large number
of imported symbols actually take a measurable amount of additional
time.

That said, I take your point about complexity, and trust you to know
your arch's inputs/requirements, so if I don't hear back again I will
incorporate that into the next revision of the patch (to be produced
after the gendwarfksyms update comes out).

