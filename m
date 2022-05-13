Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9F526960
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 20:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0HPF2tnRz3c90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 04:34:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f2A4SIp5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2f;
 helo=mail-vs1-xe2f.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=f2A4SIp5; dkim-atps=neutral
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0HNf28fRz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 04:34:10 +1000 (AEST)
Received: by mail-vs1-xe2f.google.com with SMTP id w124so9259826vsb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxaAhTM7z7ZXAcsBxj173aYKUbXdWRM6Ctvy2Vo1MV8=;
 b=f2A4SIp536wPkDPMvn62DM+ukUpqK2CvHmbKz3bIo6KqP004+abgMpMcG57+7cpmmM
 QAhsnzVEQDU34hQTs1zeb8dZsZ9EBmN7BqIOfTlTRi18K+R3Kb9OIy8yLO7YeIxYEPKs
 Q8JOQx+js3N5E/mH+LWaNdt2nMv2sPpy5IcVUh5xm1hUVxxJLbgjxV1WOqTGFwmBOJqA
 zm96PP5nwSUCGMb8paUZ/mGdoE5tMa3ea5YQRjJhZMa5o2ByJlvXg950Kq38BJLS1JK+
 jDgPwlCbZhevgvJqeQrjGrQczx4tGKnCg++6iHVWjsHFVZYbBL3jt3i6cYNGIOIGJUR5
 i1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxaAhTM7z7ZXAcsBxj173aYKUbXdWRM6Ctvy2Vo1MV8=;
 b=TY/Pup/18sJ3uNxmKQy2mfdKmpJdgzN8zUhRT6z3COemVAw5NtSuXzQwbd1afDGXOz
 gxcyuqnyXTLU1lDPWyl28ZtCzYTB52R68yzzQ8YLE+d6UEGcsWLM9pOqHlaeKl438quW
 INE6Ft3AjCDe1NRryPs4lRa/XVhkZ8n10FyHal7q0IO+YaWGa5dcVxqW1fdIF9dX9wDD
 7glBXsBzMdmU5ZlS+VkUu8oQcbpklCKV7O/DRKr8iJQrPRlupPtipC8rdnBYVhxWPkOy
 FYKLNSGeMQkDHlGkef404M7he9y4XA2AyPMZWgZ0Cn4k64U2qhexMrbBjMvQ9IYtwZ2h
 pCcQ==
X-Gm-Message-State: AOAM530g3IfVxO+5iSHGhJSAVXCEy9bU6Rlyo5sg8+MzMQZCDkZALOBv
 kIwFds2PZOk5xM5TzKqgiQ535v2Idf/1ZdlCFCKIxg==
X-Google-Smtp-Source: ABdhPJzSCnp+qEb5zTwkmlHIVcD1jGMriYVuqe1xvpRO2qBWeUcfYknco+S9NCOq7kjF7fo89nwRrNSz+TIYD6wqZH8=
X-Received: by 2002:a05:6102:2929:b0:32d:6662:72e2 with SMTP id
 cz41-20020a056102292900b0032d666272e2mr2943899vsb.56.1652466846453; Fri, 13
 May 2022 11:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
 <151b1538daf92259702242dbf734230aea3199fe.camel@linux.vnet.ibm.com>
In-Reply-To: <151b1538daf92259702242dbf734230aea3199fe.camel@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 May 2022 11:33:55 -0700
Message-ID: <CAP-5=fVAfjUHvhLF2E2UZo+BwneSex0GV5BgbHAV6bvdUxj_9w@mail.gmail.com>
Subject: Re: [PATCH V2] tools/perf/tests: Fix session topology test to skip
 the test in guest environment
To: Disha Goel <disgoel@linux.vnet.ibm.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com,
 acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com,
 jolsa@kernel.org, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 12, 2022 at 11:18 PM Disha Goel <disgoel@linux.vnet.ibm.com> wrote:
>
>
>
> -----Original Message-----
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> To: acme@kernel.org, jolsa@kernel.org
> Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, irogers@google.com
> Subject: [PATCH V2] tools/perf/tests: Fix session topology test to skip the test in guest environment
> Date: Wed, 11 May 2022 17:19:59 +0530
>
> The session topology test fails in powerpc pSeries platform.
>
> Test logs:
>
> <<>>
>
> Session topology : FAILED!
>
> <<>>
>
>
> This testcases tests cpu topology by checking the core_id and
>
> socket_id stored in perf_env from perf session. The data from
>
> perf session is compared with the cpu topology information
>
> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
>
> physical_package_id. In case of virtual environment, detail
>
> like physical_package_id is restricted to be exposed. Hence
>
> physical_package_id is set to -1. The testcase fails on such
>
> platforms since socket_id can't be fetched from topology info.
>
>
> Skip the testcase in powerpc if physical_package_id returns -1
>
>
> Signed-off-by: Athira Rajeev <
>
> atrajeev@linux.vnet.ibm.com
>
> >
>
> ---
>
> Changelog:
>
> v1 -> v2:
>
>  Addressed review comments from Arnaldo and Michael Ellerman.
>
>  skip the test in powerpc when physical_package_id is set to
>
>  -1.
>
>  Dropped patch 1 from V1 since current change doesn't use info
>
>  from /proc/cpuinfo and rather uses physical_package_id value.
>
>
>  tools/perf/tests/topology.c | 11 +++++++++++
>
>  1 file changed, 11 insertions(+)
>
>
> Tested the patch on powerpc and powernv, session topology test works fine with the patch.
>
> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>


Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
>
> index ee1e3dcbc0bd..d23a9e322ff5 100644
>
> --- a/tools/perf/tests/topology.c
>
> +++ b/tools/perf/tests/topology.c
>
> @@ -109,6 +109,17 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map)
>
>   && strncmp(session->header.env.arch, "aarch64", 7))
>
>   return TEST_SKIP;
>
>
> + /*
>
> + * In powerpc pSeries platform, not all the topology information
>
> + * are exposed via sysfs. Due to restriction, detail like
>
> + * physical_package_id will be set to -1. Hence skip this
>
> + * test if physical_package_id returns -1 for cpu from perf_cpu_map.
>
> + */
>
> + if (strncmp(session->header.env.arch, "powerpc", 7)) {
>
> + if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) == -1)
>
> + return TEST_SKIP;
>
> + }
>
> +
>
>   TEST_ASSERT_VAL("Session header CPU map not set", session->header.env.cpu);
>
>
>   for (i = 0; i < session->header.env.nr_cpus_avail; i++) {
