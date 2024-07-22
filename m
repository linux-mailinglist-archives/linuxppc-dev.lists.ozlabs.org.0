Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3572D9389DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 09:15:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ny7J4Qsc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSBPQ5fRcz30Wf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 17:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ny7J4Qsc;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSBN86dKXz3c75
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 17:14:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721632434;
	bh=6l9oTJbEcWGJwSJxH1MEdCIBrY+RHN7wzT3mRVNamcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ny7J4QscA7BWI6vcC412b5mW2ix1Qw4tkN2E38BJ+FhP4qi98iP3whWAw9ij4ef7w
	 k/HCMmakYVFo14Hr7bFOqI0hGaecjH/iInyXrTgrUqcg60CVvy5reHAeJHPrO6y8aZ
	 SCgmF8CCVTKQkIqnltNUcacpRqZsXbkXpm1tuGcC/8wADBekoihBEym035Mysdvexx
	 IVEBwrqucJup4aEHV56YodHDlRiNzzGEvV8ze4Ws9rdKa8bCKeIZQAdZqBONE7e6PB
	 XuDVU0bNcsOhSjI/j1dVhCJqci91ms8lG+uEY2Pw4Iu6sqQb0auP/MLSlSSsH9wQDc
	 /G5IuSysaiP5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WSBN070S7z4wxk;
	Mon, 22 Jul 2024 17:13:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
In-Reply-To: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
References: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
Date: Mon, 22 Jul 2024 17:13:51 +1000
Message-ID: <87bk2px5jk.fsf@mail.lhotse>
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes three additional files which, although they did not
> produce a warning with the powerpc allmodconfig configuration, may
> cause this warning with specific options enabled in the kernel
> configuration.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Corrections to these descriptions are welcomed. I'm not an expert in
> this code so in most cases I've taken these descriptions directly from
> code comments, Kconfig descriptions, or git logs.  History has shown
> that in some cases these are originally wrong due to cut-n-paste
> errors, and in other cases the drivers have evolved such that the
> original information is no longer accurate.
> ---
>  drivers/cpufreq/maple-cpufreq.c   | 1 +
>  drivers/cpufreq/pasemi-cpufreq.c  | 1 +
>  drivers/cpufreq/pmac64-cpufreq.c  | 1 +
>  drivers/cpufreq/powernv-cpufreq.c | 1 +
>  drivers/cpufreq/ppc_cbe_cpufreq.c | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
> index f9306410a07f..19ca7f874d28 100644
> --- a/drivers/cpufreq/maple-cpufreq.c
> +++ b/drivers/cpufreq/maple-cpufreq.c
> @@ -238,4 +238,5 @@ static int __init maple_cpufreq_init(void)
>  module_init(maple_cpufreq_init);
>  
>  
> +MODULE_DESCRIPTION("cpufreq driver for Maple 970FX Evaluation Board");
 
Can you change this one to:

"cpufreq driver for Maple 970FX/970MP boards");

It looks for both those CPUs in probe.

> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index fddbd1ea1635..e923f717e1d7 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -1162,5 +1162,6 @@ static void __exit powernv_cpufreq_exit(void)
>  }
>  module_exit(powernv_cpufreq_exit);
>  
> +MODULE_DESCRIPTION("cpufreq driver for the IBM POWER processors");

This one's tricky, because it probes based on the device tree, though it
is restricted to CONFIG_POWERNV. It also supports non-IBM CPUs in theory
at least. Maybe something like:

"cpufreq driver for IBM/OpenPOWER powernv systems");

cheers
