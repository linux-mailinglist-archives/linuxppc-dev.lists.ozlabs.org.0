Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A75C4F6F44
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 02:36:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYj9b6TPYz2xtp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 10:36:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lSGGwciF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=lSGGwciF; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYj8x6gTmz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 10:35:44 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id q19so5550534wrc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5w7pUYCbRdBoHa23cUuLdtaiZ1u8JBOmoeVCOxsIYc=;
 b=lSGGwciFyhcHxHrK4MGsKqf6mYWIK7XeAV9X6Ge2D0VhNLhHx/gwJMXF5BH0DpP+GB
 h73rtZ1tJpdS9PcVsl0FK+qGEKypM3oVDcY3ixChg8X9yh4eXf1lj9CRUJQK/Q7k931W
 XbeoeUtd5dTImccrVaZWtNTL6d2CrdVolvKnTIkElTjmUweaJYw6yk4Wl+hv8gzYnmCF
 P655omeQrQL24Ge/kIrFpnU1vYiYFb3YyZwkI1Y/jQxvEeRAcQaQpI0ziuKqLYRQYWW3
 elSZl3U9nXUTl5715B+AfHf7fYqqQmGzgcinnHH2DekdU7jqdp9DfE5At+p1s5zM6sEl
 5mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5w7pUYCbRdBoHa23cUuLdtaiZ1u8JBOmoeVCOxsIYc=;
 b=I9d/Zz0EsgIEGH26G2lN7ncAsAAgzVCj0hKsVGEK7eh4Ui/aqn9kkj+jTHT0xSmtQm
 pDMAGQ6Jq4AKS2Y6hasnIr0ii72B9LSYQHFxPu4wEmttFJZCs7Ou7rsWutOo2McGmlDY
 U7OL/XiHYyzJGfgv9ONKLhy4BECKhL8BTgJh6o5t+5qOGCtrH++0y8MkDwRr6yE3t/Or
 ObR5bJbHiJlIuDdoHjNVWFh1EGtJ6jSvkSAuMSF7gTEZR+ItGvsZLTbWUYS0OZBSn7py
 hxbSlGozg7RePIWLdTu1L5lBIMXoxP47dvzoqGT8VT1QL068rtA8BdCiRPKMfQKvSvmh
 pYPA==
X-Gm-Message-State: AOAM5304JoLQ+FmEpeqlx1On45/0q1iLsCFg4SlAlZfTABTh4vft3nL6
 4nJJnXJ+qnYkvBZ+pU+N5GnbxFKVUtvp7m7P8Oh1hw==
X-Google-Smtp-Source: ABdhPJxwQ7LbJWlplVesSThlFIU2SvtGMkR+Qg5qKG4mzVo/T1gr9HGXrn3Kr1VLtJhXRSOIM2LowYeaqh2FwAaDhCE=
X-Received: by 2002:adf:8123:0:b0:206:1759:f164 with SMTP id
 32-20020adf8123000000b002061759f164mr8827189wrm.654.1649291738024; Wed, 06
 Apr 2022 17:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 6 Apr 2022 17:35:24 -0700
Message-ID: <CAP-5=fXRphB0gU6CxAuj9Fy40sbwub23RbLLo=5LEY=-_D=3+g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix perf bench numa, futex and epoll to work with
 machines having #CPUs > 1K
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
Cc: maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 6, 2022 at 10:51 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> The perf benchmark for collections: numa, futex and epoll
> hits failure in system configuration with CPU's more than 1024.
> These benchmarks uses "sched_getaffinity" and "sched_setaffinity"
> in the code to work with affinity.
>
> Example snippet from numa benchmark:
> <<>>
> perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
> Aborted (core dumped)
> <<>>
>
> bind_to_node function uses "sched_getaffinity" to save the cpumask.
> This fails with EINVAL because the default mask size in glibc is 1024.
>
> Similarly in futex and epoll benchmark, uses sched_setaffinity during
> pthread_create with affinity. And since it returns EINVAL in such system
> configuration, benchmark doesn't run.
>
> To overcome this 1024 CPUs mask size limitation of cpu_set_t,
> change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
> allocate cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.
>
> Fix all the relevant places in the code to use mask size which is large
> enough to represent number of possible CPU's in the system.
>
> Fix parse_setup_cpu_list function in numa bench to check if input CPU
> is online before binding task to that CPU. This is to fix failures where,
> though CPU number is within max CPU, it could happen that CPU is offline.
> Here, sched_setaffinity will result in failure when using cpumask having
> that cpu bit set in the mask.
>
> Patch 1 and Patch 2 address fix for perf bench futex and perf bench
> epoll benchmark. Patch 3 and Patch 4 address fix in perf bench numa
> benchmark
>
> Athira Rajeev (4):
>   tools/perf: Fix perf bench futex to correct usage of affinity for
>     machines with #CPUs > 1K
>   tools/perf: Fix perf bench epoll to correct usage of affinity for
>     machines with #CPUs > 1K
>   tools/perf: Fix perf numa bench to fix usage of affinity for machines
>     with #CPUs > 1K
>   tools/perf: Fix perf bench numa testcase to check if CPU used to bind
>     task is online
>
> Changelog:
> From v1 -> v2:
>  Addressed review comment from Ian Rogers to do
>  CPU_FREE in a cleaner way.
>  Added Tested-by from Disha Goel


The whole set:
Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  tools/perf/bench/epoll-ctl.c           |  25 ++++--
>  tools/perf/bench/epoll-wait.c          |  25 ++++--
>  tools/perf/bench/futex-hash.c          |  26 ++++--
>  tools/perf/bench/futex-lock-pi.c       |  21 +++--
>  tools/perf/bench/futex-requeue.c       |  21 +++--
>  tools/perf/bench/futex-wake-parallel.c |  21 +++--
>  tools/perf/bench/futex-wake.c          |  22 ++++--
>  tools/perf/bench/numa.c                | 105 ++++++++++++++++++-------
>  tools/perf/util/header.c               |  43 ++++++++++
>  tools/perf/util/header.h               |   1 +
>  10 files changed, 242 insertions(+), 68 deletions(-)
>
> --
> 2.35.1
>
