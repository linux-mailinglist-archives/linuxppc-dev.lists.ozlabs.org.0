Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C44F3D0A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 19:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXwHQ4lBLz3bbV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 03:53:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qZ4GjDNJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=qZ4GjDNJ; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXwGl3d70z2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 03:53:03 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id r13so20484426wrr.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Apr 2022 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rfQvZQAVT5MbUjtOudkNp0xxDlMhGlQ+Xf2K1QkwOE0=;
 b=qZ4GjDNJV/h/60dOw6GpN8omhAC5g1vtQbt421s+ZJboD4OP2tI/iQf7pfU5TkLm2p
 C0pd8V6pxkfdDdiaKud41mh6hW6j38+YgVHknQjqXxW+5Amhg5XZmg4JJjeSyvNdAWFS
 yVvoc5EKg75qAIaT8I7kP/j0fo0wLq7BYO5dn7qaGKiJYFxUlmYeqCUHRjekm0Kk3J5G
 hfRV+aXUPKTt26J+I5lGqy2oeg63oy/Vz0jssiOkAcAIO/27qK4hFeKf0Pn/KAD+CJ5Y
 yL2TtvXHE22+BleKJtNKui/7DtqpAWIsn6hX/V49j/waBBUmbyWnGO6+KapwAK0nfsdk
 cSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfQvZQAVT5MbUjtOudkNp0xxDlMhGlQ+Xf2K1QkwOE0=;
 b=1fQZiokzS8fSnjvPV1oI0dIQjnLfnPLB7H80/cAWFcfktEdWo/MTin7QlCdcUw67vI
 UxCdaRsgBoEKgX8BZe1FkpKwezzRvze0uH33+bsmcaHsGJ1iIwqsLID1TuEBeRhV+S7f
 8X1zw1fDrsNB49HeXoBUF/wK56Kv1gnatOak6ztn9CsFT4GZ9F6QSWpHiJbPFQASnC20
 GRFwoMUKFecP8tlj+d1mHsZ0kj4WmGwyDXee2dxg67A8SwXtJt4Z38cCejlQEHAYj5A7
 SkWGHVw0Uu34HF/FWeC/CBrccYSVrXZnV6LrokJM7m6293a5LdWTZJ0ts5qscOau/tbA
 TbVw==
X-Gm-Message-State: AOAM533ET2q040exkORcoG/qQLucCZBpk2283+tGqZvr1zTyE1URD7dN
 vCyHU5u4OIZz5BnnRf1Qop3GYm0Q6eE8fgVjvMFW4Q==
X-Google-Smtp-Source: ABdhPJw3X0Yex6ZhSiSoN3kyUGsdkSsuWXqiOwUMcIHUzAwCI1i0OSioKpRdtv2iFVaqSH9kgCZYI3sTxr9nhekK79s=
X-Received: by 2002:adf:8123:0:b0:206:1759:f164 with SMTP id
 32-20020adf8123000000b002061759f164mr3733847wrm.654.1649181175492; Tue, 05
 Apr 2022 10:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
 <20220401185853.23912-4-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220401185853.23912-4-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 5 Apr 2022 10:52:43 -0700
Message-ID: <CAP-5=fX6n-VkQWAxLm4YHCkfUAvB+dwiaTJyD5Xpowv-OE9z8g@mail.gmail.com>
Subject: Re: [PATCH 3/4] tools/perf: Fix perf numa bench to fix usage of
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

On Fri, Apr 1, 2022 at 11:59 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> perf bench numa testcase fails on systems with CPU's
> more than 1K.
>
> Testcase: perf bench numa mem -p 1 -t 3 -P 512 -s 100 -zZ0qcm --thp  1
> Snippet of code:
> <<>>
> perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
> Aborted (core dumped)
> <<>>
>
> bind_to_node function uses "sched_getaffinity" to save the original
> cpumask and this call is returning EINVAL ((invalid argument).
> This happens because the default mask size in glibc is 1024.
> To overcome this 1024 CPUs mask size limitation of cpu_set_t,
> change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
> allocate cpumask, CPU_ALLOC_SIZE for size. Apart from fixing this
> for "orig_mask", apply same logic to "mask" as well which is used to
> setaffinity so that mask size is large enough to represent number
> of possible CPU's in the system.
>
> sched_getaffinity is used in one more place in perf numa bench. It
> is in "bind_to_cpu" function. Apply the same logic there also. Though
> currently no failure is reported from there, it is ideal to change
> getaffinity to work with such system configurations having CPU's more
> than default mask size supported by glibc.
>
> Also fix "sched_setaffinity" to use mask size which is large enough
> to represent number of possible CPU's in the system.
>
> Fixed all places where "bind_cpumask" which is part of "struct
> thread_data" is used such that bind_cpumask works in all configuration.
>
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/bench/numa.c | 109 +++++++++++++++++++++++++++++-----------
>  1 file changed, 81 insertions(+), 28 deletions(-)
>
> diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
> index f2640179ada9..333896907e45 100644
> --- a/tools/perf/bench/numa.c
> +++ b/tools/perf/bench/numa.c
> @@ -54,7 +54,7 @@
>
>  struct thread_data {
>         int                     curr_cpu;
> -       cpu_set_t               bind_cpumask;
> +       cpu_set_t               *bind_cpumask;
>         int                     bind_node;
>         u8                      *process_data;
>         int                     process_nr;
> @@ -266,46 +266,75 @@ static bool node_has_cpus(int node)
>         return ret;
>  }
>
> -static cpu_set_t bind_to_cpu(int target_cpu)
> +static cpu_set_t *bind_to_cpu(int target_cpu)
>  {
> -       cpu_set_t orig_mask, mask;
> +       int nrcpus = numa_num_possible_cpus();
> +       cpu_set_t *orig_mask, *mask;
> +       size_t size;
>         int ret;
>
> -       ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
> -       BUG_ON(ret);
> +       orig_mask = CPU_ALLOC(nrcpus);
> +       BUG_ON(!orig_mask);
> +       size = CPU_ALLOC_SIZE(nrcpus);
> +       CPU_ZERO_S(size, orig_mask);
> +
> +       ret = sched_getaffinity(0, size, orig_mask);
> +       if (ret) {
> +               CPU_FREE(orig_mask);
> +               BUG_ON(ret);
> +       }
>
> -       CPU_ZERO(&mask);
> +       mask = CPU_ALLOC(nrcpus);
> +       BUG_ON(!mask);
> +       CPU_ZERO_S(size, mask);
>
>         if (target_cpu == -1) {
>                 int cpu;
>
>                 for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
> -                       CPU_SET(cpu, &mask);
> +                       CPU_SET_S(cpu, size, mask);
>         } else {
>                 BUG_ON(target_cpu < 0 || target_cpu >= g->p.nr_cpus);
> -               CPU_SET(target_cpu, &mask);
> +               CPU_SET_S(target_cpu, size, mask);
>         }
>
> -       ret = sched_setaffinity(0, sizeof(mask), &mask);
> -       BUG_ON(ret);
> +       ret = sched_setaffinity(0, size, mask);
> +       if (ret) {
> +               CPU_FREE(mask);
> +               BUG_ON(ret);
> +       }
> +
> +       CPU_FREE(mask);

This all looks good, a nit here it could it be a little shorter as:
ret = sched_setaffinity(0, size, mask);
CPU_FREE(mask);
BUG_ON(ret);

Thanks,
Ian

>
>         return orig_mask;
>  }
>
> -static cpu_set_t bind_to_node(int target_node)
> +static cpu_set_t *bind_to_node(int target_node)
>  {
> -       cpu_set_t orig_mask, mask;
> +       int nrcpus = numa_num_possible_cpus();
> +       cpu_set_t *orig_mask, *mask;
> +       size_t size;
>         int cpu;
>         int ret;
>
> -       ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
> -       BUG_ON(ret);
> +       orig_mask = CPU_ALLOC(nrcpus);
> +       BUG_ON(!orig_mask);
> +       size = CPU_ALLOC_SIZE(nrcpus);
> +       CPU_ZERO_S(size, orig_mask);
> +
> +       ret = sched_getaffinity(0, size, orig_mask);
> +       if (ret) {
> +               CPU_FREE(orig_mask);
> +               BUG_ON(ret);
> +       }
>
> -       CPU_ZERO(&mask);
> +       mask = CPU_ALLOC(nrcpus);
> +       BUG_ON(!mask);
> +       CPU_ZERO_S(size, mask);
>
>         if (target_node == NUMA_NO_NODE) {
>                 for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
> -                       CPU_SET(cpu, &mask);
> +                       CPU_SET_S(cpu, size, mask);
>         } else {
>                 struct bitmask *cpumask = numa_allocate_cpumask();
>
> @@ -313,24 +342,33 @@ static cpu_set_t bind_to_node(int target_node)
>                 if (!numa_node_to_cpus(target_node, cpumask)) {
>                         for (cpu = 0; cpu < (int)cpumask->size; cpu++) {
>                                 if (numa_bitmask_isbitset(cpumask, cpu))
> -                                       CPU_SET(cpu, &mask);
> +                                       CPU_SET_S(cpu, size, mask);
>                         }
>                 }
>                 numa_free_cpumask(cpumask);
>         }
>
> -       ret = sched_setaffinity(0, sizeof(mask), &mask);
> -       BUG_ON(ret);
> +       ret = sched_setaffinity(0, size, mask);
> +       if (ret) {
> +               CPU_FREE(mask);
> +               BUG_ON(ret);
> +       }
> +
> +       CPU_FREE(mask);
>
>         return orig_mask;
>  }
>
> -static void bind_to_cpumask(cpu_set_t mask)
> +static void bind_to_cpumask(cpu_set_t *mask)
>  {
>         int ret;
> +       size_t size = CPU_ALLOC_SIZE(numa_num_possible_cpus());
>
> -       ret = sched_setaffinity(0, sizeof(mask), &mask);
> -       BUG_ON(ret);
> +       ret = sched_setaffinity(0, size, mask);
> +       if (ret) {
> +               CPU_FREE(mask);
> +               BUG_ON(ret);
> +       }
>  }
>
>  static void mempol_restore(void)
> @@ -376,7 +414,7 @@ do {                                                        \
>  static u8 *alloc_data(ssize_t bytes0, int map_flags,
>                       int init_zero, int init_cpu0, int thp, int init_random)
>  {
> -       cpu_set_t orig_mask;
> +       cpu_set_t *orig_mask;
>         ssize_t bytes;
>         u8 *buf;
>         int ret;
> @@ -434,6 +472,7 @@ static u8 *alloc_data(ssize_t bytes0, int map_flags,
>         /* Restore affinity: */
>         if (init_cpu0) {
>                 bind_to_cpumask(orig_mask);
> +               CPU_FREE(orig_mask);
>                 mempol_restore();
>         }
>
> @@ -589,6 +628,7 @@ static int parse_setup_cpu_list(void)
>                 BUG_ON(bind_cpu_0 > bind_cpu_1);
>
>                 for (bind_cpu = bind_cpu_0; bind_cpu <= bind_cpu_1; bind_cpu += step) {
> +                       size_t size = CPU_ALLOC_SIZE(g->p.nr_cpus);
>                         int i;
>
>                         for (i = 0; i < mul; i++) {
> @@ -608,10 +648,12 @@ static int parse_setup_cpu_list(void)
>                                         tprintf("%2d", bind_cpu);
>                                 }
>
> -                               CPU_ZERO(&td->bind_cpumask);
> +                               td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
> +                               BUG_ON(!td->bind_cpumask);
> +                               CPU_ZERO_S(size, td->bind_cpumask);
>                                 for (cpu = bind_cpu; cpu < bind_cpu+bind_len; cpu++) {
>                                         BUG_ON(cpu < 0 || cpu >= g->p.nr_cpus);
> -                                       CPU_SET(cpu, &td->bind_cpumask);
> +                                       CPU_SET_S(cpu, size, td->bind_cpumask);
>                                 }
>                                 t++;
>                         }
> @@ -1241,7 +1283,7 @@ static void *worker_thread(void *__tdata)
>                  * by migrating to CPU#0:
>                  */
>                 if (first_task && g->p.perturb_secs && (int)(stop.tv_sec - last_perturbance) >= g->p.perturb_secs) {
> -                       cpu_set_t orig_mask;
> +                       cpu_set_t *orig_mask;
>                         int target_cpu;
>                         int this_cpu;
>
> @@ -1265,6 +1307,7 @@ static void *worker_thread(void *__tdata)
>                                 printf(" (injecting perturbalance, moved to CPU#%d)\n", target_cpu);
>
>                         bind_to_cpumask(orig_mask);
> +                       CPU_FREE(orig_mask);
>                 }
>
>                 if (details >= 3) {
> @@ -1398,21 +1441,31 @@ static void init_thread_data(void)
>
>         for (t = 0; t < g->p.nr_tasks; t++) {
>                 struct thread_data *td = g->threads + t;
> +               size_t cpuset_size = CPU_ALLOC_SIZE(g->p.nr_cpus);
>                 int cpu;
>
>                 /* Allow all nodes by default: */
>                 td->bind_node = NUMA_NO_NODE;
>
>                 /* Allow all CPUs by default: */
> -               CPU_ZERO(&td->bind_cpumask);
> +               td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
> +               BUG_ON(!td->bind_cpumask);
> +               CPU_ZERO_S(cpuset_size, td->bind_cpumask);
>                 for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
> -                       CPU_SET(cpu, &td->bind_cpumask);
> +                       CPU_SET_S(cpu, cpuset_size, td->bind_cpumask);
>         }
>  }
>
>  static void deinit_thread_data(void)
>  {
>         ssize_t size = sizeof(*g->threads)*g->p.nr_tasks;
> +       int t;
> +
> +       /* Free the bind_cpumask allocated for thread_data */
> +       for (t = 0; t < g->p.nr_tasks; t++) {
> +               struct thread_data *td = g->threads + t;
> +               CPU_FREE(td->bind_cpumask);
> +       }
>
>         free_data(g->threads, size);
>  }
> --
> 2.35.1
>
