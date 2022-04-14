Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA06F500CE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 14:16:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfJNk5PNhz3bdB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 22:16:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u7cS44DI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u7cS44DI; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfJN52Bg2z2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 22:16:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 645FA61ECB;
 Thu, 14 Apr 2022 12:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A300C385A1;
 Thu, 14 Apr 2022 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649938577;
 bh=FhgNB6nGbaSWR1zWFLwWKZoR5zU6ItbocIB/M0guKZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7cS44DIt07c6L3jcxE/iVa6IXQhSan6yRWtDkGh1YmxN4Gdrx0eJ1QAreNHEOyOY
 DgJthEblm6HoCZddYZgv2uG8bOgkKQJ1awacUOuvnalwf07bmnxIP6OrA8h7X0Ccge
 unClZKOikWRFVCSX/sljCl09QBdiGXQlohTPvtywJtOyyP/e+tQuehr4CbO5iVq1PN
 t9pXbreKhwsNRIyNCwF+0ZPYaFgQtbWKWV8KkW6fulHsmgHSwSjbcW30l632jXHcDN
 ut9CcnFPyYuwf/IQ1eDo02idh7baPZt9aY1fGQn71S/gJBjxWyW3CYdhcPsvweD1ur
 I7kKPV0LsyWfw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 621BB40407; Thu, 14 Apr 2022 09:16:15 -0300 (-03)
Date: Thu, 14 Apr 2022 09:16:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 0/2] Fix perf bench numa to work with machines having
 #CPUs > 1K
Message-ID: <YlgQj40R3so8xz50@kernel.org>
References: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Apr 12, 2022 at 10:10:57PM +0530, Athira Rajeev escreveu:
> The perf benchmark for collections: numa hits failure in system
> configuration with CPU's more than 1024. These benchmarks uses
> "sched_getaffinity" and "sched_setaffinity" in the code to
> work with affinity.

Thanks, applied.

- Arnaldo

 
> Example snippet from numa benchmark:
> <<>>
> perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
> Aborted (core dumped)
> <<>>
> 
> bind_to_node function uses "sched_getaffinity" to save the cpumask.
> This fails with EINVAL because the default mask size in glibc is 1024
> 
> To overcome this 1024 CPUs mask size limitation of cpu_set_t,
> change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
> allocate cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.
> 
> Fix all the relevant places in the code to use mask size which is large
> enough to represent number of possible CPU's in the system.
> 
> This patchset also address a fix for parse_setup_cpu_list function in
> numa bench to check if input CPU is online before binding task to
> that CPU. This is to fix failures where, though CPU number is within
> max CPU, it could happen that CPU is offline. Here, sched_setaffinity
> will result in failure when using cpumask having that cpu bit set
> in the mask.
> 
> Patch 1 address fix for parse_setup_cpu_list to check if CPU used to bind
> task is online. Patch 2 has fix for bench numa to work with machines
> having #CPUs > 1K
> 
> Athira Rajeev (2):
>   tools/perf: Fix perf bench numa testcase to check if CPU used to bind
>     task is online
>   perf bench: Fix numa bench to fix usage of affinity for machines with
>     #CPUs > 1K
> 
> Changelog:
> v2 -> v3
> Link to the v2 version :
> https://lore.kernel.org/all/20220406175113.87881-1-atrajeev@linux.vnet.ibm.com/
>  - From the v2 version, patch 1 and patch 2 are now part of upstream.
>  - This v3 version separates patch 3 and patch 4 to address review
>    comments from arnaldo which includes using sysfs__read_str for reading
>    sysfs file and fixing the compilation issues observed in debian
> 
>  tools/perf/bench/numa.c  | 136 +++++++++++++++++++++++++++++----------
>  tools/perf/util/header.c |  51 +++++++++++++++
>  tools/perf/util/header.h |   1 +
>  3 files changed, 153 insertions(+), 35 deletions(-)
> 
> -- 
> 2.35.1

-- 

- Arnaldo
