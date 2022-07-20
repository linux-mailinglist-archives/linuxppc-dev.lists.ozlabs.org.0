Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C157BA89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp0Dv5p9cz3dyd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:37:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DYrPq68G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DYrPq68G;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp0DM1KqBz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:36:35 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id j29-20020a05600c1c1d00b003a2fdafdefbso1515605wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zFzxx0z8pNKG8GQJAfngz4sVC9qlk18q5vOjkBqe41U=;
        b=DYrPq68GLvItPSkdP1iRNBYH4r5u/VU/4hctkVb0AVbcaQWnJsmyhV+rknu569NDUk
         o7570gvxSR4qDT3uhb+ulSVY+WSiEdCJbZadpKchRpy6M635wQ9YE67mAnZUAWX1PnNI
         DjNpTzN0Y0TYNZC3PGOvGwGPqMFNmf4cPeuBrU+UtoTwmSoU4uFqkOb6Q23CbwC31DYm
         6Auh+eOKqXfChxALoWTNJB43P4J40PWWdA3VkjuZAUxIw8SVlAQTZTV1vhkY+PvURc4J
         UMWq3tKkmc5PYODk1J3VfQ1VSqbU6F5BnYiUhV36SYcKWKqn21Xj+zFl5lBXYXLRh/7e
         lihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zFzxx0z8pNKG8GQJAfngz4sVC9qlk18q5vOjkBqe41U=;
        b=6P7olivz1LE0KQRN6HWUKNNDlsSc6PBR86+V9dcdWoKfdzWCTT8OHkZbhD7Tl4nE70
         iOtUJm6s1O0enqjjIqJueVUryH2EJYMboKacK1glyervKKjLmCP5FwuiPBUhCJQttkl0
         XqKePjZkYrfiWjwYjTvmtEgqRy8Proow3VuatX4U6fUjdfaRQG3X6PwWQ8InQ7xrN0xm
         b2GnYaOMDSaXkkerWJ28m+BK+iVwjfIcPr+Rr7t9EYOUOuoA8NMP4X7jIxwfbKW6mIZN
         luJEo4M2+fxfFW8rxjDQ5qV4NWE9pEEw1DuN3KSv7MLvcPDB+Cj25fkebiui5/jF4fiy
         7l1Q==
X-Gm-Message-State: AJIora/xnP6gDl+FU17sUwevu8bS3YFfb5pobgAWuxz7mSuabzTiSFva
	JsJw4bhBWjuUrSnDoy/viXlZw0B/jUgp6ruseEAXZg==
X-Google-Smtp-Source: AGRyM1sLPBoh5pqmDtw4wPynZIZtaL2Bw4Asqc9TmCk9ZgFTDI88pTO3drYJSFHLXbjukiaxsv4+tBmZLSdj518/fak=
X-Received: by 2002:a05:600c:2854:b0:3a3:1551:d7d with SMTP id
 r20-20020a05600c285400b003a315510d7dmr4199687wmb.174.1658331391068; Wed, 20
 Jul 2022 08:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-11-elver@google.com>
In-Reply-To: <20220704150514.48816-11-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:36:18 -0700
Message-ID: <CAP-5=fX7DoS0eDk=FS14CRjU_UPinH2+0+uD1JPXFMtrb7o1eA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 4, 2022 at 8:07 AM Marco Elver <elver@google.com> wrote:
>
> Implement simple accessors to probe percpu-rwsem's locked state:
> percpu_is_write_locked(), percpu_is_read_locked().
>
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

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
