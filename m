Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F99578565E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 13:01:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaLv1hyy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW3Df2wBVz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 21:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaLv1hyy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW3Cj69T6z3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 21:00:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB10E62251;
	Wed, 23 Aug 2023 11:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53631C433C8;
	Wed, 23 Aug 2023 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692788428;
	bh=145vx0TVt+huLKZKmow/nDxEuc+RGDcQOQiyklZqCuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaLv1hyywY6GxHQYm7UkTbyuFM5OYBaRPUpyxpjAAAO4P03kNp5gpdzUtfppjOXS0
	 YyFtYwl0S7xY2ZhxDMbyX0bm5/Fmq2vJW0z6fVs+KQvc1rvecRW4lNE7d26h3s7Jmx
	 AuYitMHtJWAU1flFJ4NGmO9agk8XFDQsDrtuw07UOT5nPpv4KJ5ZsWvlcOqdg3m5yy
	 UBGfIPl+EQgOdaHjlkxg0ZwIrhc+KYRbt+yZNbT078p//VgpM80+LaCQx/kCe5TemE
	 P3btYp2iuZOJ6rQuZMPyVe/XRN+6cIhIbxi5MT5JaPPN3KDfL1oM6RmJcddgQYu0ZB
	 YIbLE5fejZPWA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Aug 2023 16:28:41 +0530
From: "Naveen N Rao" <naveen@kernel.org>
To: "Kajol Jain" <kjain@linux.ibm.com>, <acme@kernel.org>
Subject: Re: [PATCH] perf test: Skip perf bench breakpoint run if no
 breakpoints available
Message-Id: <CUZVDJPWI4GL.NVVOJTWE6U5S@naverao1-tp>
X-Mailer: aerc 0.15.2
References: <20230823075103.190565-1-kjain@linux.ibm.com>
In-Reply-To: <20230823075103.190565-1-kjain@linux.ibm.com>
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
Cc: irogers@google.com, atrajeev@linux.vnet.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kajol,

On Wed Aug 23, 2023 at 1:21 PM IST, Kajol Jain wrote:
> Based on commit 7d54a4acd8c1 ("perf test: Skip watchpoint
> tests if no watchpoints available"), hardware breakpoints
> are not available for power9 platform and because of that
> perf bench breakpoint run fails on power9 platform.
> Add code to check for the return value of perf_event_open()
> in breakpoint run and skip the perf bench breakpoint run,
> if hardware breakpoints are not available.
>
> Result on power9 system before patch changes:
> [command]# perf bench breakpoint thread
> perf_event_open: No such device
>
> Result on power9 system after patch changes:
> [command]# ./perf bench breakpoint thread
> Skipping perf bench breakpoint thread: No hardware support
>
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  tools/perf/bench/breakpoint.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)

Thanks for fixing this to not report an error. A minor nit below, but=20
otherwise:
Acked-by: Naveen N Rao <naveen@kernel.org>

>
> diff --git a/tools/perf/bench/breakpoint.c b/tools/perf/bench/breakpoint.=
c
> index 41385f89ffc7..dfd18f5db97d 100644
> --- a/tools/perf/bench/breakpoint.c
> +++ b/tools/perf/bench/breakpoint.c
> @@ -47,6 +47,7 @@ struct breakpoint {
>  static int breakpoint_setup(void *addr)
>  {
>  	struct perf_event_attr attr =3D { .size =3D 0, };
> +	int fd;
> =20
>  	attr.type =3D PERF_TYPE_BREAKPOINT;
>  	attr.size =3D sizeof(attr);
> @@ -56,7 +57,12 @@ static int breakpoint_setup(void *addr)
>  	attr.bp_addr =3D (unsigned long)addr;
>  	attr.bp_type =3D HW_BREAKPOINT_RW;
>  	attr.bp_len =3D HW_BREAKPOINT_LEN_1;
> -	return syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> +	fd =3D syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> +
> +	if (fd < 0)
> +		fd =3D -errno;
> +
> +	return fd;
>  }
> =20
>  static void *passive_thread(void *arg)
> @@ -122,8 +128,14 @@ int bench_breakpoint_thread(int argc, const char **a=
rgv)
> =20
>  	for (i =3D 0; i < thread_params.nbreakpoints; i++) {
>  		breakpoints[i].fd =3D breakpoint_setup(&breakpoints[i].watched);
> -		if (breakpoints[i].fd =3D=3D -1)
> +
> +		if (breakpoints[i].fd < 0) {
> +			if (breakpoints[i].fd =3D=3D -ENODEV) {
> +				printf("Skipping perf bench breakpoint thread: No hardware support\n=
");
> +				return 0;

Should we instead do 'exit(0)' here to stop further benchmarks? Perhaps:
  err(EXIT_SUCCESS, "Skipping perf bench breakpoint thread: No hardware sup=
port");

EXIT_SUCCESS looks weird, but should help document that this is not an=20
error.

> +			}
>  			exit((perror("perf_event_open"), EXIT_FAILURE));
> +		}
>  	}
>  	gettimeofday(&start, NULL);
>  	for (i =3D 0; i < thread_params.nparallel; i++) {
> @@ -196,8 +208,14 @@ int bench_breakpoint_enable(int argc, const char **a=
rgv)
>  		exit(EXIT_FAILURE);
>  	}
>  	fd =3D breakpoint_setup(&watched);
> -	if (fd =3D=3D -1)
> +
> +	if (fd < 0) {
> +		if (fd =3D=3D -ENODEV) {
> +			printf("Skipping perf bench breakpoint enable: No hardware support\n"=
);
> +			return 0;

Here too.

- Naveen

> +		}
>  		exit((perror("perf_event_open"), EXIT_FAILURE));
> +	}
>  	nthreads =3D enable_params.npassive + enable_params.nactive;
>  	threads =3D calloc(nthreads, sizeof(threads[0]));
>  	if (!threads)

