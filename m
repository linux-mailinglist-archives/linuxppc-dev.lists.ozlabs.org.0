Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E34F3D11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 19:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXwMl2TBgz3bXG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 03:57:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cUte+H4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=cUte+H4u; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXwM55SQsz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 03:56:49 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id w21so20550567wra.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Apr 2022 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XSThWl+PZUFMqLNS/uIAi3vardfLBgaW6ejdi55O/w=;
 b=cUte+H4u04BPbzs34V5G9+eJ8SNIxiDkuEWGf9is+YEzzGQ1EQLCqjro2iuE13EjWj
 gb3LzQki1bDzDpCyY2ius2D4+lnxAiWW0sYAG/aWFuf7fiKPERTTBngWGzHURX2T+Vbs
 LDz6QTd04M8Pdo55/3O20fxWoUryj88TNBgE2RotkPuEP4q4mXu+WFb58s/tSt60V8hQ
 O8aau9ebEUA0DSzTsDbDOs61Jts3776a+roSFGgfgfKKzIzgZBOb8JhvPWYaw/hvkwFM
 n5Dd29H6nUhwPcIRceG5Qw6YgcZ/yJ9Q9a/n81R1KbqtUhR6cdZ6KVIXLgehN2oWrLKj
 xPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XSThWl+PZUFMqLNS/uIAi3vardfLBgaW6ejdi55O/w=;
 b=UMZISJzSq7q95AopVOyAMepSU+RpuJ65LwICzFxXpUvh8Ie73IqhpNlE9wB3kMqdrJ
 4aLRTKjEpBBX++sYTDo1AHMevmnhWG/Bb8BE9yEt9FS64/5qZlk8aKYrq0kTjYVJ5NQZ
 PndtzsuDjmwDX7usujvTUi/FcMfWmciezr8y/3dbP1fq1knuwupbybLfF/Bjr5hWGk6C
 3hFZb7lWOkwVronRfkdDrQK/vgair+uf0EZOgHapn7G13Y7WpAvc7uva2ouSuMfThlpX
 a2Md68xeKUHiH65vNtmI3ymOdx7lC8lZHfCvJm6XYgvEcsZrpPVYIK51hmHAk+i6vHvj
 /rVA==
X-Gm-Message-State: AOAM533GxPPVkuMw6Nyz24yUp6AQNB+g4SJOnaWweRpdnmLVZ/4FF25T
 bhFs4QOGJKmfMxKDt1vVfLwcr13sN8CTLj5aGT9eUw==
X-Google-Smtp-Source: ABdhPJzgP8n462gwm0RE72/GPAAxZDwFiRP42trNQDTRiMZwhcAjJ/cAqmlG07N1+jK4G+ZtJKxhfg6D6nQqdMWrGK0=
X-Received: by 2002:a5d:50c3:0:b0:206:179f:1143 with SMTP id
 f3-20020a5d50c3000000b00206179f1143mr3674128wrt.343.1649181406206; Tue, 05
 Apr 2022 10:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
 <20220401185853.23912-3-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220401185853.23912-3-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 5 Apr 2022 10:56:34 -0700
Message-ID: <CAP-5=fUi9f5V+kEgNJQyHDVxivxz-kEXY3-pdaLwf6wJhqyO5Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] tools/perf: Fix perf bench epoll to correct usage of
 affinity for machines with #CPUs > 1K
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 1, 2022 at 12:00 PM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> perf bench epoll testcase fails on systems with CPU's
> more than 1K.
>
> Testcase: perf bench epoll all
> Result snippet:
> <<>>
> Run summary [PID 106497]: 1399 threads monitoring on 64 file-descriptors for 8 secs.
>
> perf: pthread_create: No such file or directory
> <<>>
>
> In epoll benchmarks (ctl, wait) pthread_create is invoked in do_threads
> from respective bench_epoll_*  function. Though the logs shows direct
> failure from pthread_create, the actual failure is from  "sched_setaffinity"
> returning EINVAL (invalid argument). This happens because the default
> mask size in glibc is 1024. To overcome this 1024 CPUs mask size
> limitation of cpu_set_t, change the mask size using the CPU_*_S macros.
>
> Patch addresses this by fixing all the epoll benchmarks to use
> CPU_ALLOC to allocate cpumask, CPU_ALLOC_SIZE for size, and
> CPU_SET_S to set the mask.
>
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/bench/epoll-ctl.c  | 25 +++++++++++++++++++------
>  tools/perf/bench/epoll-wait.c | 25 +++++++++++++++++++------
>  2 files changed, 38 insertions(+), 12 deletions(-)
>
> diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
> index 1a17ec83d3c4..91c53f6c6d87 100644
> --- a/tools/perf/bench/epoll-ctl.c
> +++ b/tools/perf/bench/epoll-ctl.c
> @@ -222,13 +222,20 @@ static void init_fdmaps(struct worker *w, int pct)
>  static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
>  {
>         pthread_attr_t thread_attr, *attrp = NULL;
> -       cpu_set_t cpuset;
> +       cpu_set_t *cpuset;
>         unsigned int i, j;
>         int ret = 0;
> +       int nrcpus;
> +       size_t size;
>
>         if (!noaffinity)
>                 pthread_attr_init(&thread_attr);
>
> +       nrcpus = perf_cpu_map__nr(cpu);
> +       cpuset = CPU_ALLOC(nrcpus);
> +       BUG_ON(!cpuset);
> +       size = CPU_ALLOC_SIZE(nrcpus);
> +
>         for (i = 0; i < nthreads; i++) {
>                 struct worker *w = &worker[i];
>
> @@ -252,22 +259,28 @@ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
>                         init_fdmaps(w, 50);
>
>                 if (!noaffinity) {
> -                       CPU_ZERO(&cpuset);
> -                       CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +                       CPU_ZERO_S(size, cpuset);
> +                       CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu,
> +                                       size, cpuset);
>
> -                       ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
> -                       if (ret)
> +                       ret = pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
> +                       if (ret) {
> +                               CPU_FREE(cpuset);
>                                 err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> +                       }
>
>                         attrp = &thread_attr;
>                 }
>
>                 ret = pthread_create(&w->thread, attrp, workerfn,
>                                      (void *)(struct worker *) w);
> -               if (ret)
> +               if (ret) {
> +                       CPU_FREE(cpuset);
>                         err(EXIT_FAILURE, "pthread_create");
> +               }
>         }
>
> +       CPU_FREE(cpuset);

A nit here you could CPU_FREE right after the ret = pthread_create...
to make it a bit shorter.

Thanks,
Ian

>         if (!noaffinity)
>                 pthread_attr_destroy(&thread_attr);
>
> diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait.c
> index 0d1dd8879197..9469a53ffab9 100644
> --- a/tools/perf/bench/epoll-wait.c
> +++ b/tools/perf/bench/epoll-wait.c
> @@ -291,9 +291,11 @@ static void print_summary(void)
>  static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
>  {
>         pthread_attr_t thread_attr, *attrp = NULL;
> -       cpu_set_t cpuset;
> +       cpu_set_t *cpuset;
>         unsigned int i, j;
>         int ret = 0, events = EPOLLIN;
> +       int nrcpus;
> +       size_t size;
>
>         if (oneshot)
>                 events |= EPOLLONESHOT;
> @@ -306,6 +308,11 @@ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
>         if (!noaffinity)
>                 pthread_attr_init(&thread_attr);
>
> +       nrcpus = perf_cpu_map__nr(cpu);
> +       cpuset = CPU_ALLOC(nrcpus);
> +       BUG_ON(!cpuset);
> +       size = CPU_ALLOC_SIZE(nrcpus);
> +
>         for (i = 0; i < nthreads; i++) {
>                 struct worker *w = &worker[i];
>
> @@ -341,22 +348,28 @@ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
>                 }
>
>                 if (!noaffinity) {
> -                       CPU_ZERO(&cpuset);
> -                       CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +                       CPU_ZERO_S(size, cpuset);
> +                       CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu,
> +                                       size, cpuset);
>
> -                       ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
> -                       if (ret)
> +                       ret = pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
> +                       if (ret) {
> +                               CPU_FREE(cpuset);
>                                 err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> +                       }
>
>                         attrp = &thread_attr;
>                 }
>
>                 ret = pthread_create(&w->thread, attrp, workerfn,
>                                      (void *)(struct worker *) w);
> -               if (ret)
> +               if (ret) {
> +                       CPU_FREE(cpuset);
>                         err(EXIT_FAILURE, "pthread_create");
> +               }
>         }
>
> +       CPU_FREE(cpuset);
>         if (!noaffinity)
>                 pthread_attr_destroy(&thread_attr);
>
> --
> 2.35.1
>
