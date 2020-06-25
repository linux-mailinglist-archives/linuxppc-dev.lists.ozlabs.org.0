Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0ED209CE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 12:30:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sxB801p4zDqpg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 20:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sx8N3k9lzDqkk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 20:29:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49sx876L9cz9vBfd;
 Thu, 25 Jun 2020 12:29:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id x9T-X4NdHZ7A; Thu, 25 Jun 2020 12:29:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49sx875VGWz9vBfc;
 Thu, 25 Jun 2020 12:29:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B9D98B7DB;
 Thu, 25 Jun 2020 12:29:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lY2QcFeMOyse; Thu, 25 Jun 2020 12:29:13 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 457118B7D7;
 Thu, 25 Jun 2020 12:29:13 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Warn about use of smt_snooze_delay
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200625100349.2408899-1-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <189c0339-da57-9df7-4774-4fe97db7ce52@csgroup.eu>
Date: Thu, 25 Jun 2020 12:29:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625100349.2408899-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 25/06/2020 à 12:03, Joel Stanley a écrit :
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.

Why not just drop the file entirely  if it is useless ?

Christophe

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/powerpc/kernel/sysfs.c | 41 +++++++++++++------------------------
>   1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 571b3259697e..530ae92bc46d 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -32,29 +32,25 @@
>   
>   static DEFINE_PER_CPU(struct cpu, cpu_devices);
>   
> -/*
> - * SMT snooze delay stuff, 64-bit only for now
> - */
> -
>   #ifdef CONFIG_PPC64
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
>   static ssize_t store_smt_snooze_delay(struct device *dev,
>   				      struct device_attribute *attr,
>   				      const char *buf,
>   				      size_t count)
>   {
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
>   	return count;
>   }
>   
> @@ -62,9 +58,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
>   				     struct device_attribute *attr,
>   				     char *buf)
>   {
> -	struct cpu *cpu = container_of(dev, struct cpu, dev);
> +	WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
>   
> -	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
> +	return sprintf(buf, "100\n");
>   }
>   
>   static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
> @@ -72,16 +68,7 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
>   
>   static int __init setup_smt_snooze_delay(char *str)
>   {
> -	unsigned int cpu;
> -	long snooze;
> -
> -	if (!cpu_has_feature(CPU_FTR_SMT))
> -		return 1;
> -
> -	snooze = simple_strtol(str, NULL, 10);
> -	for_each_possible_cpu(cpu)
> -		per_cpu(smt_snooze_delay, cpu) = snooze;
> -
> +	WARN_ON_ONCE("smt-snooze-delay command line option has no effect\n");
>   	return 1;
>   }
>   __setup("smt-snooze-delay=", setup_smt_snooze_delay);
> 
