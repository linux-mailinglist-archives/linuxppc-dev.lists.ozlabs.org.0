Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE255E56E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:45:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXS7h5xjWz3dx2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:45:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ht86O9eM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ht86O9eM;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXS710kQDz3cBp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:44:59 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id bx13so6584830ljb.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYNtEachczg7r/XXNrPpniIU6MTplkzQm/H7US5uhak=;
        b=ht86O9eM8J4P2PZl+KtFbHC+gZPW6NGiN4v8P9Rgy3+MOPpO2yYFyJgHvaOmDgiNgH
         /p5vSOz3x44RtyJLVLOWXHtd4RctYsU5AD77eH1lLYGzoJq1nXE6Wn1aS/nh9PsIqaSM
         SgZX0tkOqwnEOJQZtltTQjauhUHkZ+y8964HnCXWW/ZxxVAcJz9JkVyoEfND2Y4j0TCl
         jjtAfvyG4Y9kaCrb3/mP1aNnKNJTlHOByqk1r/9LFGYSktJmBW9fDRNUyV5C47qOh4LU
         EP1xu8f//aX5sdjOiopNc8mHWVwa45OZNsR0Yrue3dH93LCUvFB7lshaMpzR2gSAsFYP
         pdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYNtEachczg7r/XXNrPpniIU6MTplkzQm/H7US5uhak=;
        b=M9a0u6pUIFnkIskLThtbY9fl47IsdC9OSyPhaGQZshC8/fokMLg1MsQAiu7OW/Mww9
         XrHTfSjalqaW+jveA4Rz/RpfsjiBprZXM5YeWwzH+FTlS1P5i9pHzOJBBej+WXQIB3HP
         DI5p8x1R5Isv9yuH31mf+jT2TRSCPU133DtmsFLQlzkm2Z3xVqv7Oa8io2YjBlRJj18F
         dAU4LOTfz1NXZWSPPOIEqiKe2Dv70+/JPuO5YwTkb2jeoq2w0CE3oeTwQfGs0bjEOf93
         i3duzKTTp+WmONmP7CuyeFhbmEsVmA+9Q+TvHyrh1A0tEkXrSypUXGQhlNHMQ3+jBexg
         t9pg==
X-Gm-Message-State: AJIora8Vt92GGqvaYYjSk4kYqyVhByE2eevy7D9efi3LYnbDnanK8jw6
	5D1Lz/nbm1esDOGCItEDw/vWobgTro8S9AjpAAHypw==
X-Google-Smtp-Source: AGRyM1vkmnuA2FUnqSW9JeJGsv4yNApnR2Dfl5iKx6TmhoRHbVhtZKhKo6yaFA07EoXj3LStjfnAsF7IPGkdhQBdH38=
X-Received: by 2002:a2e:8ec9:0:b0:25a:754d:db39 with SMTP id
 e9-20020a2e8ec9000000b0025a754ddb39mr9908848ljl.4.1656427492555; Tue, 28 Jun
 2022 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-10-elver@google.com>
In-Reply-To: <20220628095833.2579903-10-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 28 Jun 2022 16:44:41 +0200
Message-ID: <CACT4Y+bzcWQUspDws-rKJNcOxceg-XOQzunuwsQBuPH5KMqJXA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] locking/percpu-rwsem: Add percpu_is_write_locked()
 and percpu_is_read_locked()
To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
>
> Implement simple accessors to probe percpu-rwsem's locked state:
> percpu_is_write_locked(), percpu_is_read_locked().
>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> v2:
> * New patch.
> ---
>  include/linux/percpu-rwsem.h  | 6 ++++++
>  kernel/locking/percpu-rwsem.c | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
> index 5fda40f97fe9..36b942b67b7d 100644
> --- a/include/linux/percpu-rwsem.h
> +++ b/include/linux/percpu-rwsem.h
> @@ -121,9 +121,15 @@ static inline void percpu_up_read(struct percpu_rw_semaphore *sem)
>         preempt_enable();
>  }
>
> +extern bool percpu_is_read_locked(struct percpu_rw_semaphore *);
>  extern void percpu_down_write(struct percpu_rw_semaphore *);
>  extern void percpu_up_write(struct percpu_rw_semaphore *);
>
> +static inline bool percpu_is_write_locked(struct percpu_rw_semaphore *sem)
> +{
> +       return atomic_read(&sem->block);
> +}
> +
>  extern int __percpu_init_rwsem(struct percpu_rw_semaphore *,
>                                 const char *, struct lock_class_key *);
>
> diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
> index 5fe4c5495ba3..213d114fb025 100644
> --- a/kernel/locking/percpu-rwsem.c
> +++ b/kernel/locking/percpu-rwsem.c
> @@ -192,6 +192,12 @@ EXPORT_SYMBOL_GPL(__percpu_down_read);
>         __sum;                                                          \
>  })
>
> +bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
> +{
> +       return per_cpu_sum(*sem->read_count) != 0;
> +}
> +EXPORT_SYMBOL_GPL(percpu_is_read_locked);
> +
>  /*
>   * Return true if the modular sum of the sem->read_count per-CPU variable is
>   * zero.  If this sum is zero, then it is stable due to the fact that if any
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
