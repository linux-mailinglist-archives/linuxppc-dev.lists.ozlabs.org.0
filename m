Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13620EAD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wmmK6WbNzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wmkQ4yZlzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ikI6Lg8m; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wmkQ2hBsz9sRk;
 Tue, 30 Jun 2020 11:20:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593480014;
 bh=m4WmUHkQALcylgOZ+dnZgVmqWAg4+2S6xGRs4SSlSBM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ikI6Lg8m9XC/26DR9jOlGqXQnUkgHNg5eDc/+8BLJTpUAMNx2TUc1h5d6sLkUDMFN
 5ThhMYkcsrcWj63leBuYbrJKsPmBzu33txgdCW8tYjH13Lc9HTux5gKIDIGlRBAYlV
 o659ukNU1Q6YScNpWpClFzXsi9C+gLmGWVZCxHCB/sWrvOd6xpSgBpkUfLj+ZAen8x
 SvtvauV6RXJop5KfBwzzw8J+E5jUa3KAT1WZMtMCvqLDnu1X6vvap2tzzorpSaNbWS
 0wcNm461okXd0FO2Ms5H36FmzvW1yVPQYiDY0t2XaUZHJ1g4v8N2w3HmPBG3OBXfcc
 RlV76H91dmj4Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Warn about use of smt_snooze_delay
In-Reply-To: <20200625100349.2408899-1-joel@jms.id.au>
References: <20200625100349.2408899-1-joel@jms.id.au>
Date: Tue, 30 Jun 2020 11:22:29 +1000
Message-ID: <87366d8i0a.fsf@mpe.ellerman.id.au>
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
Cc: ego@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/powerpc/kernel/sysfs.c | 41 +++++++++++++------------------------
>  1 file changed, 14 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b3259697e..530ae92bc46d 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -32,29 +32,25 @@
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
> +	WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");

We shouldn't have user-triggerable WARNs.

I think this should just be a pr_warn_ratelimited(), maybe including
current->comm & pid.

cheers
