Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B078EA94D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 03:41:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473V2n4149zF4HM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 13:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473V0Z3M7zzF5JW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 13:39:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Ru6HuP4N"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 473V0X52pSz9sPl;
 Thu, 31 Oct 2019 13:39:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572489598;
 bh=kh7Ij8wGLE85JmfMZDo7nA07OV4ozZTfqMQZHKEtQog=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ru6HuP4NQURWTF/ppIf+4JjYsUi+3s1xPD/DtHVEhoqzV1uNWtu8tlfTJIGLLmi8P
 Md3r6FH2F89VJddOWBfm7OYCJfR+uJdkEUQt2Wp0EGYCw4ErS3Da5J66exxhHwyLyt
 6oeyDj0vl1y8dO7HUCKdJbC3l3Sake7GZC8zuTxyF+c+A9hhe5YSgK//ic6oWDlhdW
 txuj0rpXoIT/DKKyyOBCtfTC15zN7Q/mPf4Y6jV+a5kvoaFV+Fnr3qL6EkHPsnBLnH
 d2BrByItD5GHFBsBbyuqnQi5IxLk8jJFddYBYtb1OCkzSalGGbctcNyctq54CNBKDn
 ilDrQteDWD8dQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Hubbard <jhubbard@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] cpufreq: powernv: fix stack bloat and NR_CPUS
 limitation
In-Reply-To: <20191018045539.3765565-1-jhubbard@nvidia.com>
References: <20191018045539.3765565-1-jhubbard@nvidia.com>
Date: Thu, 31 Oct 2019 13:39:55 +1100
Message-ID: <87pnidbptw.fsf@mpe.ellerman.id.au>
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
Cc: linux-pm@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi John,

Sorry I didn't reply to this sooner, too many patches :/

John Hubbard <jhubbard@nvidia.com> writes:
> The following build warning occurred on powerpc 64-bit builds:
>
> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Oddly I don't see that warning in my builds, eg with GCC9:

  https://travis-ci.org/linuxppc/linux/jobs/604870722

> This is due to putting 1024 bytes on the stack:
>
>     unsigned int chip[256];
>
> ...and while looking at this, it also has a bug: it fails with a stack
> overrun, if CONFIG_NR_CPUS > 256.

It _probably_ doesn't, because it only increments the index when the
chip_id of the CPU changes, ie. it doesn't create a chip for every CPU.
But I agree it's flaky the way it's written.

> Fix both problems by dynamically allocating based on CONFIG_NR_CPUS.

Shouldn't it use num_possible_cpus() ?

Given the for loop is over possible CPUs that seems like the upper
bound. In practice it should be lower because some CPUs will share a
chip.

cheers


> Fixes: 053819e0bf840 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
> Cc: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: linux-pm@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Changes since v1: includes Viresh's review commit fixes.
>
>  drivers/cpufreq/powernv-cpufreq.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 6061850e59c9..5b2e968cb5ea 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -1041,9 +1041,14 @@ static struct cpufreq_driver powernv_cpufreq_driver = {
>  
>  static int init_chip_info(void)
>  {
> -	unsigned int chip[256];
> +	unsigned int *chip;
>  	unsigned int cpu, i;
>  	unsigned int prev_chip_id = UINT_MAX;
> +	int ret = 0;
> +
> +	chip = kcalloc(CONFIG_NR_CPUS, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
>  
>  	for_each_possible_cpu(cpu) {
>  		unsigned int id = cpu_to_chip_id(cpu);
> @@ -1055,8 +1060,10 @@ static int init_chip_info(void)
>  	}
>  
>  	chips = kcalloc(nr_chips, sizeof(struct chip), GFP_KERNEL);
> -	if (!chips)
> -		return -ENOMEM;
> +	if (!chips) {
> +		ret = -ENOMEM;
> +		goto free_and_return;
> +	}
>  
>  	for (i = 0; i < nr_chips; i++) {
>  		chips[i].id = chip[i];
> @@ -1066,7 +1073,9 @@ static int init_chip_info(void)
>  			per_cpu(chip_info, cpu) =  &chips[i];
>  	}
>  
> -	return 0;
> +free_and_return:
> +	kfree(chip);
> +	return ret;
>  }
>  
>  static inline void clean_chip_info(void)
> -- 
> 2.23.0
