Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB2939742
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 02:01:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lvyK8ljQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WScl63DHKz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 10:01:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lvyK8ljQ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSckN5yRhz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 10:01:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721692876;
	bh=1ee9dpsEkMVtwnazsE5jJi3meNyVdkAB7jjS0GvSPX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lvyK8ljQXrJ70+MKwGlDyyNdspRGaVFS8sTJqSGUEFVJFCJk6ofjy9aiockxrI8GL
	 VZlkQ5kA8ALnfJfPn+cTpikrO7xPMAAOQjqRIAOyl4sQpMahgTFtsjrfn21aaH0Uwe
	 CwBicMo9gCli+tVNjbgIF/unZGFWs1ntjB0DZCpKNajBMwCJdIxT+YkQqX6qy21gQB
	 WaZhYMEKjZi9UIHV9kAcn2vyPbSxGvCn+JMwFyTN94MiBkXQWjkt1RPAQ4nXiJlNwK
	 o1chsP9+/HDPycBcKeqAVXWSFlkgB4UsjbeU9bpQz9IXzUrVM5wdASAQBWyQbVdjhw
	 Uqhg6kHYSkoPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WSckM1pQBz4wcR;
	Tue, 23 Jul 2024 10:01:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2] cpufreq: powerpc: add missing MODULE_DESCRIPTION()
 macros
In-Reply-To: <20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com>
References: <20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com>
Date: Tue, 23 Jul 2024 10:01:13 +1000
Message-ID: <875xsxvuwm.fsf@mail.lhotse>
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
> Changes in v2:
> - Per Michael Ellerman updated maple-cpufreq.c and powernv-cpufreq.c
>   descriptions
> - Did not carry forward Viresh Kumar's Acked-by due to this change
> - Link to v1: https://lore.kernel.org/r/20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com
> ---
>  drivers/cpufreq/maple-cpufreq.c   | 1 +
>  drivers/cpufreq/pasemi-cpufreq.c  | 1 +
>  drivers/cpufreq/pmac64-cpufreq.c  | 1 +
>  drivers/cpufreq/powernv-cpufreq.c | 1 +
>  drivers/cpufreq/ppc_cbe_cpufreq.c | 1 +
>  5 files changed, 5 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
