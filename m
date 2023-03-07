Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB46ADB3F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:00:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW9tN5KYPz3f3N
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 21:00:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mhZOA6o/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW9sR5q01z3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 20:59:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mhZOA6o/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PW9sR4kYbz4x5Q;
	Tue,  7 Mar 2023 20:59:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678183179;
	bh=7THoEtvn29Kb6nDK1Wq/6asVM/F4bcBIraAld5OwZd4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mhZOA6o/5MwL7qdkEZhudtoHgR5yygoR1vh8yJNnTSAweQDIHBx80N+6AD+UIxqnp
	 IbFOg0pAaZF5TcDmcKvYlhnjXQNomXIOSDrA/1qa0mEHLUszQ5kvktA+LYRjpstcjs
	 u91zyHX9zJPPcAj5CuEXSQnelcLLb62PYzVQCM+JyiaDLCwd4VMPU4LXYHf68H0xI1
	 z7XVeK8Pd8h6bF7BEGMfL39pEqDqXh8e22/lhII8F14/qdtX9IxDn82XOUgNue1cUo
	 pSFKpo+5uN/rZq4PlAsGY7JTbKFdDA76DBfgEhTLSm+Dxq3l0Wbo5aLJOMk8RESAFc
	 g423WKAO4oE1w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/5] selftests/powerpc/dscr: Add lockstep test cases to
 DSCR explicit tests
In-Reply-To: <20230307005515.174362-3-bgray@linux.ibm.com>
References: <20230307005515.174362-1-bgray@linux.ibm.com>
 <20230307005515.174362-3-bgray@linux.ibm.com>
Date: Tue, 07 Mar 2023 20:59:37 +1100
Message-ID: <87h6uw286u.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> Add new cases to the relevant tests that use explicitly synchronized
> threads to test the behaviour across context switches with less
> randomness. By locking the participants to the same CPU we guarantee a
> context switch occurs each time they make progress, which is a likely
> failure point if the kernel is not tracking the thread local DSCR
> correctly.
>
> The random case is left in to keep exercising potential edge cases.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  tools/testing/selftests/powerpc/dscr/Makefile |  1 +
>  tools/testing/selftests/powerpc/dscr/dscr.h   | 23 +++++
>  .../powerpc/dscr/dscr_default_test.c          | 87 ++++++++++++++++---
>  .../powerpc/dscr/dscr_explicit_test.c         | 87 ++++++++++++++++++-
>  4 files changed, 183 insertions(+), 15 deletions(-)
...
> diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
> index 2c54998d4715..903ee0c83fac 100644
> --- a/tools/testing/selftests/powerpc/dscr/dscr.h
> +++ b/tools/testing/selftests/powerpc/dscr/dscr.h
> @@ -90,4 +92,25 @@ double uniform_deviate(int seed)
>  {
>  	return seed * (1.0 / (RAND_MAX + 1.0));
>  }
> +
> +int restrict_to_one_cpu(void)
> +{
> +	cpu_set_t cpus;
> +	int cpu;
> +
> +	FAIL_IF(sched_getaffinity(0, sizeof(cpu_set_t), &cpus));
> +
> +	for (cpu = 0; cpu < CPU_SETSIZE; cpu++)
> +		if (CPU_ISSET(cpu, &cpus))
> +			break;
> +
> +	FAIL_IF(cpu == CPU_SETSIZE);
> +
> +	CPU_ZERO(&cpus);
> +	CPU_SET(cpu, &cpus);
> +	FAIL_IF(sched_setaffinity(0, sizeof(cpu_set_t), &cpus));
> +
> +	return 0;
> +}

We have pick_online_cpu() in utils.c, can you use that?

You probably also need to move bind_to_cpu() from pmu/lib.c to utils.c
so you can use it.

cheers
