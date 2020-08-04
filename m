Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4085123BA16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 14:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLYJD0chFzDqPl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLYGF28kGzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 21:59:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iMawBPZU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLYGD6kPyz9s1x;
 Tue,  4 Aug 2020 21:59:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596542389;
 bh=0LLKTVUasb5sVdSVDL8cbhTOnBRmxUheVnCgQ4hSNkg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iMawBPZUMdHxANYWP0jNdOL1CNyThhMenS+aM3PHCzaA6zjMNtbeL9M4wf8Tgcyhc
 7LIKch0OzzKiCT0Q/hNpeS/K2btZiuMOhI9JVmZnLqZXO4Kh8nRF03Dzh5EL7fSaBY
 dcnTJ+Rq7COpwxfkRb3CVxsHhOOW6shdpvP82Aia6mdE4lqLHsDjM52dS/52Nt1p6B
 i6+oayNRygmg7eRTgh6XEb8Z8NEeDAdWKlbS5/V5SStfo0q+uSu9AW0G/RRV3LO1Ir
 0rHBsWp0TcUT9IIMn8ZpSBrH6Z9qeXgMLcxuiuLhZ+r7hfCiA2TjDQeE7Q6PuUili8
 UazTmt1HLVeog==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: Warn about use of smt_snooze_delay
In-Reply-To: <20200630015935.2675676-1-joel@jms.id.au>
References: <20200630015935.2675676-1-joel@jms.id.au>
Date: Tue, 04 Aug 2020 21:59:44 +1000
Message-ID: <87eeomzknj.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.
>
> Fixes: 3fa8cad82b94 ("powerpc/pseries/cpuidle: smt-snooze-delay cleanup.")
> Cc: stable@vger.kernel.org # v3.14
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> --
> v2:
>  Use pr_warn instead of WARN
>  Reword and print proccess name with pid in message
>  Leave CPU_FTR_SMT test in
>  Add Fixes line
>
> mpe, if you don't agree then feel free to drop the cc stable.
>
> Testing 'ppc64_cpu --smt=off' on a 24 core / 4 SMT system it's quite noisy
> as the online/offline loop that ppc64_cpu runs is slow.

Hmm, that is pretty spammy.

I know I suggested the ratelimit, but I was thinking it would print once
for each ppc64_cpu invocation, not ~30 times.

How about pr_warn_once(), that should still be sufficient for people to
notice if they're looking for it.

...
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b3259697e..ba6d4cee19ef 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -32,29 +32,26 @@
>  
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>  
> -/*
> - * SMT snooze delay stuff, 64-bit only for now
> - */
> -
>  #ifdef CONFIG_PPC64
>  
> -/* Time in microseconds we delay before sleeping in the idle loop */
> -static DEFINE_PER_CPU(long, smt_snooze_delay) = { 100 };
> +/*
> + * Snooze delay has not been hooked up since 3fa8cad82b94 ("powerpc/pseries/cpuidle:
> + * smt-snooze-delay cleanup.") and has been broken even longer. As was foretold in
> + * 2014:
> + *
> + *  "ppc64_util currently utilises it. Once we fix ppc64_util, propose to clean
> + *  up the kernel code."
> + *
> + * At some point in the future this code should be removed.
> + */
>  
>  static ssize_t store_smt_snooze_delay(struct device *dev,
>  				      struct device_attribute *attr,
>  				      const char *buf,
>  				      size_t count)
>  {
> -	struct cpu *cpu = container_of(dev, struct cpu, dev);
> -	ssize_t ret;
> -	long snooze;
> -
> -	ret = sscanf(buf, "%ld", &snooze);
> -	if (ret != 1)
> -		return -EINVAL;
> -
> -	per_cpu(smt_snooze_delay, cpu->dev.id) = snooze;
> +	pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
> +			    current->comm, current->pid);

Can we make this:

	"%s (%d) stored to unsupported smt_snooze_delay, which has no effect.\n",


>  	return count;
>  }
>  
> @@ -62,9 +59,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
>  				     struct device_attribute *attr,
>  				     char *buf)
>  {
> -	struct cpu *cpu = container_of(dev, struct cpu, dev);
> -
> -	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
> +	pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
> +			    current->comm, current->pid);

It has as much effect as it ever did :)

So maybe:

	"%s (%d) read from unsupported smt_snooze_delay.\n",


I can do those changes when applying if you like rather than making you
do a v3.

cheers
