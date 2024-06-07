Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2E900B27
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 19:24:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sWq7wGNY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwp2s1TXbz3cWx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 03:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sWq7wGNY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwp263yG8z2ysW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 03:23:25 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f6a270d1b8so8725ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2024 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717781004; x=1718385804; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W7eNzUkVsvxh0fs7QApe4zLHB8YHFiMurfzjOn05Cc=;
        b=sWq7wGNYa6J2ig0x26/NTZUL9xUxbwPu+LSlF7aH64CGWlUZ7bOHd3zTzTrw4cRbG8
         6ighBLVV/hVWwZeT/KwBFH2lz9SI+jO4CUUCO/k7L7ftJRbzHqYv0pxotfMTQjXGZSAE
         AoEhUja0eVHm/21LFbPAynLYfiF92g1v+tJo5BBxtKKHF6PSJxkYpPUh+uvU+LYsVc2a
         nE2kvs9SZgBSmRKOLdautbPdHxns2m4iFWkpKNDcV+VcP8aCrambj+GNedV/YhcPAwj9
         xBp8NcA0nTF+VUD6gryeTSjV9FYmYG2L2jsoPl5qld2lln/ekT/y3ei3i6e64hrpafBc
         It7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717781004; x=1718385804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W7eNzUkVsvxh0fs7QApe4zLHB8YHFiMurfzjOn05Cc=;
        b=lx3kxglWAtp6IEwFlETIqjExOxOYO5x33oTK/qx55fkuh++/EH7IYsuX335ZnbAJ/q
         c9Sl5QlPZR0Fg5djvCI8IoJ90YSppkZSoHYLzda4Gee2F2Q3sOTO0Qe2d4MXYaLQYIWp
         TDNPPTaXVUKAjkNromVrDA7pe0wAQzUShd1xzTlyRgSiqgAMwT6h3nIGQY5fh4u7txXv
         X5HwaPsHnpdMMam0n4WuETS7rvcAzol8Si9iDRT1hgvUUcfMFXDmm50fIBt1zYYLSxxg
         OJd8msbjkThKz3y8utK/OOuvUZ74O2ePXJgLlfVynZVvlYcZZNsssCDGSTQgotWX/YyQ
         Pw3A==
X-Forwarded-Encrypted: i=1; AJvYcCUwG+YnbuGRNgRpxfXNhnUecxjP/Uz+Ah066zxMRoCkCIu4bFjZaaX2vUyJK4tUhPrDgsKpoXaXVkRF5yY//jqkm7UA6kZmQL3m8xVpyw==
X-Gm-Message-State: AOJu0YyA4rqWox54lWiOZBl56OHIi4jkdC7rtvLBoyFcQPadIk9rU3+b
	saRDim9wBMBY6gSRCuyWUz3f6uIcG8jhDGFzQ+9WuEtpRC0cUkDO9zsNy9Qroh+zCoQiIeXuTeV
	uRsIT7h8q8WpV/6U9Rp/UGlLHOFCZrVNsydxe
X-Google-Smtp-Source: AGHT+IF1kBumIybHOnEycCWnTnGC0ewzKueFu/6w+DPgOcUa8Oae8IA/SWiwu846ZjxfYxHaSpC5xnVHoTfKDKov8ws=
X-Received: by 2002:a17:902:6b03:b0:1e0:f525:a831 with SMTP id
 d9443c01a7336-1f6ba65584cmr7839045ad.28.1717781003038; Fri, 07 Jun 2024
 10:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240607044354.82225-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240607044354.82225-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 7 Jun 2024 10:23:11 -0700
Message-ID: <CAP-5=fVCXW1FEBra5aFLJm48f0-b4a+oTugTZt+VYEv1EySBKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] tools/perf: Fix the nrcpus in perf bench futex to
 enable the run when all CPU's are not online
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 6, 2024 at 9:44=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Perf bench futex fails as below when attempted to run on
> on a powerpc system:
>
>  ./perf bench futex all
>  Running futex/hash benchmark...
> Run summary [PID 626307]: 80 threads, each operating on 1024 [private] fu=
texes for 10 secs.
>
> perf: pthread_create: No such file or directory
>
> In the setup where this perf bench was ran, difference was that
> partition had 640 CPU's, but not all CPUs were online. 80 CPUs
> were online. While blocking the threads with futex_wait, code
> sets the affinity using cpumask. The cpumask size used is 80
> which is picked from "nrcpus =3D perf_cpu_map__nr(cpu)". Here the
> benchmark reports fail while setting affinity for cpu number which
> is greater than 80 or higher, because it attempts to set a bit
> position which is not allocated on the cpumask. Fix this by changing
> the size of cpumask to number of possible cpus and not the number
> of online cpus.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

For the series:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/bench/futex-hash.c          | 2 +-
>  tools/perf/bench/futex-lock-pi.c       | 2 +-
>  tools/perf/bench/futex-requeue.c       | 2 +-
>  tools/perf/bench/futex-wake-parallel.c | 2 +-
>  tools/perf/bench/futex-wake.c          | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.=
c
> index 0c69d20efa32..b472eded521b 100644
> --- a/tools/perf/bench/futex-hash.c
> +++ b/tools/perf/bench/futex-hash.c
> @@ -174,7 +174,7 @@ int bench_futex_hash(int argc, const char **argv)
>         pthread_attr_init(&thread_attr);
>         gettimeofday(&bench__start, NULL);
>
> -       nrcpus =3D perf_cpu_map__nr(cpu);
> +       nrcpus =3D cpu__max_cpu().cpu;
>         cpuset =3D CPU_ALLOC(nrcpus);
>         BUG_ON(!cpuset);
>         size =3D CPU_ALLOC_SIZE(nrcpus);
> diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-lo=
ck-pi.c
> index 7a4973346180..0416120c091b 100644
> --- a/tools/perf/bench/futex-lock-pi.c
> +++ b/tools/perf/bench/futex-lock-pi.c
> @@ -122,7 +122,7 @@ static void create_threads(struct worker *w, struct p=
erf_cpu_map *cpu)
>  {
>         cpu_set_t *cpuset;
>         unsigned int i;
> -       int nrcpus =3D  perf_cpu_map__nr(cpu);
> +       int nrcpus =3D  cpu__max_cpu().cpu;
>         size_t size;
>
>         threads_starting =3D params.nthreads;
> diff --git a/tools/perf/bench/futex-requeue.c b/tools/perf/bench/futex-re=
queue.c
> index d9ad736c1a3e..aad5bfc4fe18 100644
> --- a/tools/perf/bench/futex-requeue.c
> +++ b/tools/perf/bench/futex-requeue.c
> @@ -125,7 +125,7 @@ static void block_threads(pthread_t *w, struct perf_c=
pu_map *cpu)
>  {
>         cpu_set_t *cpuset;
>         unsigned int i;
> -       int nrcpus =3D perf_cpu_map__nr(cpu);
> +       int nrcpus =3D cpu__max_cpu().cpu;
>         size_t size;
>
>         threads_starting =3D params.nthreads;
> diff --git a/tools/perf/bench/futex-wake-parallel.c b/tools/perf/bench/fu=
tex-wake-parallel.c
> index b66df553e561..90a5b91bf139 100644
> --- a/tools/perf/bench/futex-wake-parallel.c
> +++ b/tools/perf/bench/futex-wake-parallel.c
> @@ -149,7 +149,7 @@ static void block_threads(pthread_t *w, struct perf_c=
pu_map *cpu)
>  {
>         cpu_set_t *cpuset;
>         unsigned int i;
> -       int nrcpus =3D perf_cpu_map__nr(cpu);
> +       int nrcpus =3D cpu__max_cpu().cpu;
>         size_t size;
>
>         threads_starting =3D params.nthreads;
> diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.=
c
> index 690fd6d3da13..49b3c89b0b35 100644
> --- a/tools/perf/bench/futex-wake.c
> +++ b/tools/perf/bench/futex-wake.c
> @@ -100,7 +100,7 @@ static void block_threads(pthread_t *w, struct perf_c=
pu_map *cpu)
>         cpu_set_t *cpuset;
>         unsigned int i;
>         size_t size;
> -       int nrcpus =3D perf_cpu_map__nr(cpu);
> +       int nrcpus =3D cpu__max_cpu().cpu;
>         threads_starting =3D params.nthreads;
>
>         cpuset =3D CPU_ALLOC(nrcpus);
> --
> 2.43.0
>
