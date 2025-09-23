Return-Path: <linuxppc-dev+bounces-12545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A88DB97189
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 19:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWSCk06lBz304l;
	Wed, 24 Sep 2025 03:49:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758649761;
	cv=none; b=kZVBZu+mFI+xPekunrCz3eBvDbNCemQ9upyYuYyuC+gg10uyHS0e58JwxlJ9EOqtqVDwqu510GcMXEIQx6+2xfcoe/vCYCqttOdyKa6JzlrMMl4xCbRQZEFEQFBycg8jUgMHYBfeyNq7B02QqPs3sgb6kAeb/S5PtR8H7fF/SskqtBOMzEf4ZoLXvFgE+95J/35uEGM1MbgAWcWpcTkqiJhpinspok8MHWmsLiXeXfYQtv9enC5570hEsxKdBMBifQS/rs4nBik5JbSQsCVT+b5yG7sI06m1tlXnEOe+69grXJpxSCxoxEO90xBX5WTUhhSR58LNwLDrsN8Uk5/V+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758649761; c=relaxed/relaxed;
	bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJkT3ng9awUzBTNKFp0qIhWm3zpnJBrBD+yOda/lY1DWp0/Sw1mf9Cxs9M/tK644TS9HwaiiAkYLMS50SMegaiMjfBnmTW0Vk1GUDhCeQz8fZjqGE8hft5+Bj+Z/IXfyl/v+5kP9wDh8iohk0A57lgsZdJMigoctKp6vKrItml6d/4IDY2VVjmiF21EjVZW7PRCaoi1AAX/q/+4pENaBu1R70HhZp32tG7TGfBI4fsA/CeqZy6HY7Nq63fGK43oAgFKVBf2nLMb1E8n/Rk+OX0gehgBY2Y4joa/5XDkJI03b18UvEz2wS8d6gE0mhD8XLQ+oR0mZSS//Ez204nHPkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nnFhZsNV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nnFhZsNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWSCh0ZmFz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 03:49:19 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so5524002f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649755; x=1759254555; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=nnFhZsNVRGcPocf/vHJrAoq5AsjQSlyh/Z7GfHSjvwnHredbOC4Vmy8ByNEpQn8Crn
         ccTeUGxhXs1KygOKF8423Nh1sWAe+eYj1Z1MduLkxanmF0GfsSrPZJScNhkXXl2MvYie
         t+w19k4LdV9C914qOpvyg9DduuOVU1k/Y5g+qKSAbvvMXtrocgvgX1Mg3CLAuG2px6L2
         rlAAT7ycBlOIoB8IsaoeGRhg633OoysNrspDn9CFH3lG0nMKkG/8GDFqlM4oBAx24Dpw
         m+A+1z/lIjQO3NIQJiJKXSnzF3QnW5ZQaZUoJgZLI7cdDh9Ss3jPlBEbI6boUyzNU/NY
         kdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649755; x=1759254555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=oNraaIj1Mio6mW3StIP9jcuHPBoywvZvm9jL7sF84fQtQ9ANwRjLFwILXFTfWa/SHs
         oqyyyLUA/GhFnkjDgRn7USAagyxlCqCVd/zGdRHf+aKJ7xzpUUmoLvc9ZX7K2y12Xs0f
         mbQHXBseQSZfuRkWatcd9uDtJTAO6FHZkINAU9VCLqEKYXagbJr+eXXyaPDVFIYB5Evu
         NW0Nh6lUgTugL2rU2epPlQQCChJ70xS3BgVM9gKKKVF94LHN92WrpmLMUlDKgPD1cKQU
         3VDMlKMUdpVhoBMykZmSoHyAO5+EPjNeYssyMdzi0qhsBUcgUDw4h72bavDEhavQLMmB
         /86w==
X-Forwarded-Encrypted: i=1; AJvYcCVDdT7S+J4843G2JPfrK/Ycpbe9ggxcGfSFH3vcjtyMHnj5s23eBGMUifRPNvXtDkCang+aFkGMimjinDk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3UXNBfRrfnLqUY5jrageRphBYhROQmJZW9fTZv1H7P8Njtyu4
	B6dMLJpbgayM85HFXDR1iKJO0SZjXSDVKxqUWd518tuzwkCh8d+n6yd23OuzU7wYY0nGFQU1K0R
	8y64/9eI9MFhks3QP4sv9qBPnyppdjIM=
X-Gm-Gg: ASbGncsse9uj5fOk4rAEEfozoUp3xvNTureUxSLLRZy8W0hn5CXP6tFEWvUSj1Uop5o
	5ixdeYgBsQcePmJsNp9dkV5G3qcLJpDlg5pKiV5e2sNF5W26bW6YwGtgelEJtuUCTmxAvn315wt
	FKP98VEO7ePhO3aEwxCoDMF6ppnpAPKDR74vXIJIv6vrEFyPiHWdzLcTAxBkm97SVZcpPFTjiDo
	nRD8try8Q==
X-Google-Smtp-Source: AGHT+IFSBc+NBD1jZsd0LSs+Pw95eV8L2vwpY4rCb+CqA5TPaGXD6Axn8yxp6z29u7E5i0MPRJJiZRdC/VoVJA9DlfM=
X-Received: by 2002:a05:6000:2585:b0:3ea:c7ea:13da with SMTP id
 ffacd0b85a97d-405c4a9734bmr2645479f8f.9.1758649754815; Tue, 23 Sep 2025
 10:49:14 -0700 (PDT)
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
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com> <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
In-Reply-To: <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 23 Sep 2025 19:49:03 +0200
X-Gm-Features: AS18NWAo7UnIsKkvCh16EnxIlUsef04XXrIh6VHPmyIq2HZ6eh0cMjqVLlDuPQw
Message-ID: <CA+fCnZce3AR+pUesbDkKMtMJ+iR8eDrcjFTbVpAcwjBoZ=gJnQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 6:30=E2=80=AFAM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> > Why is the check removed here and in some other places below? This
> > need to be explained in the commit message.
>
> kasan_arch_is_ready which was unified with kasan_enabled, was removed
> here because
> __kasan_slab_pre_free is called from include/linux/kasan.h [1] where
> there's already kasan_enabled() check.
>
> [1] https://elixir.bootlin.com/linux/v6.16.7/source/include/linux/kasan.h=
#L198
>
> Please let me know if v7 is required with the change in the git commit
> message only.

No need, but next time please add such info into the commit message.

> > What I meant with these __wrappers was that we should add them for the
> > KASAN hooks that are called from non-KASAN code (i.e. for the hooks
> > defined in include/linux/kasan.h). And then move all the
> > kasan_enabled() checks from mm/kasan/* to where the wrappers are
> > defined in include/linux/kasan.h (see kasan_unpoison_range() as an
> > example).
> >
> > kasan_save_free_info is a KASAN internal function that should need
> > such a wrapper.
> >
> > For now, to make these patches simpler, you can keep kasan_enabled()
> > checks in mm/kasan/*, where they are now. Later we can move them to
> > include/linux/kasan.h with a separate patch.
>
> Yes, I'd like to revisit this in the next separate patch series.

Great!

But for now, please send a fix-up patch that removes the
__kasan_save_free_info() wrapper (or a v8? But I see that your series
is now in mm-stable, so I guess a separate fix-up patch is preferred).

I don't think you need a kasan_enabled() check in
kasan_save_free_info() at all. Both the higher level paths
(kasan_slab_free and kasan_mempool_poison_object) already contain this
check.

Thanks!

