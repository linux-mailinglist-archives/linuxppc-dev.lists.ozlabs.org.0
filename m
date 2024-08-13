Return-Path: <linuxppc-dev+bounces-45-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2A94FEF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 09:41:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g3u6x2Gm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjjxz39Y0z2xPY;
	Tue, 13 Aug 2024 17:41:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g3u6x2Gm;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjjxy0X5Vz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 17:41:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723534901;
	bh=HADWfDzMp04GGptzdq/izw7iCG7iWe0aK2JW4OGIX/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g3u6x2GmJgmwseBPqEFiJU6QSAsQ1JEOnc0i547A/EudElq6JUJ6CBZSD/Wkp4BPY
	 nPlqArhJFiTwgvbg21halm4oxxLHDAH40TTwEDhaUDrRDWCOBttwcj/ykT/eUM3hVj
	 7uF2DjEb7A0NlSusrSuMA+fAg3OwRyea8VCfbDAMwILgZs1E56S+YU5W7eg/pfS5kd
	 H6/80Gg7AUMj6mQlqA5A+Z+J4ftytXK1iu8Lt4JxKiZ7kQ55A0zcKy1G+zeAzjVwH1
	 /nF+lnMhsGctaJOn1oK1lg8enNq7oz21oRZnuMKQbeIRLS8GToemBu1r+3VUVlVxXI
	 E2gJIiTp58f+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wjjxx5kbMz4x1s;
	Tue, 13 Aug 2024 17:41:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Madhavan
 Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2] selftest/powerpc/benchmark: remove requirement libc-dev
In-Reply-To: <20240812094152.418586-1-maddy@linux.ibm.com>
References: <20240812094152.418586-1-maddy@linux.ibm.com>
Date: Tue, 13 Aug 2024 17:41:41 +1000
Message-ID: <87wmkk27ka.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> Currently exec-target.c file is linked as static and this
> post a requirement to install libc dev package to build.

I think specifically the problem is that the test requires a static
libc, which is packaged separately in some distros from the regular libc
headers, am I right?

On Fedora the package is glibc-static, as opposed to glibc-devel, which
the tests still require.

So this patch removes the requirement to have glibc-static installed.
Any idea what the package is called on Debian/Ubuntu?

cheers

> Without it, build-break when compiling selftest/powerpc/benchmark.
>
>   CC       exec_target
> /usr/bin/ld: cannot find -lc: No such file or directory
> collect2: error: ld returned 1 exit status
>
> exec_target.c is using "syscall" library function which
> could be replaced with a inline assembly and the same is
> proposed as a fix here.
>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Chnagelog v1:
> - Add comment for clobber register and proper list of
>   clobber registers as suggested by Michael Ellerman and
>   Christophe Leroy
>
>  .../selftests/powerpc/benchmarks/Makefile        |  2 +-
>  .../selftests/powerpc/benchmarks/exec_target.c   | 16 ++++++++++++++--
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
> index 1321922038d0..ca4483c238b9 100644
> --- a/tools/testing/selftests/powerpc/benchmarks/Makefile
> +++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
> @@ -18,4 +18,4 @@ $(OUTPUT)/context_switch: LDLIBS += -lpthread
>  
>  $(OUTPUT)/fork: LDLIBS += -lpthread
>  
> -$(OUTPUT)/exec_target: CFLAGS += -static -nostartfiles
> +$(OUTPUT)/exec_target: CFLAGS += -nostartfiles
> diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
> index c14b0fc1edde..a6408d3f26cd 100644
> --- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
> +++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
> @@ -7,10 +7,22 @@
>   */
>  
>  #define _GNU_SOURCE
> -#include <unistd.h>
>  #include <sys/syscall.h>
>  
>  void _start(void)
>  {
> -	syscall(SYS_exit, 0);
> +	asm volatile (
> +		"li %%r0, %[sys_exit];"
> +		"li %%r3, 0;"
> +		"sc;"
> +		:
> +		: [sys_exit] "i" (SYS_exit)
> +		/*
> +		 * "sc" will clobber r0, r3-r13, cr0, ctr, xer and memory.
> +		 * Even though sys_exit never returns, handle clobber
> +		 * registers.
> +		 */
> +		: "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +		  "r11", "r12", "r13", "cr0", "ctr", "xer", "memory"
> +	);
>  }
> -- 
> 2.45.2

