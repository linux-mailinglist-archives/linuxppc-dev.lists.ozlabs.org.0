Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F7B2A8FBE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 07:59:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSB8247GGzDr5R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:59:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSB650QC2zDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 17:57:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSB5m178Xz9tyl8;
 Fri,  6 Nov 2020 07:57:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0tvnNDWyEbSe; Fri,  6 Nov 2020 07:57:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSB5l6dqHz9tyl7;
 Fri,  6 Nov 2020 07:57:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B95238B885;
 Fri,  6 Nov 2020 07:57:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id M78HGa_Z50-v; Fri,  6 Nov 2020 07:57:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5854B8B75F;
 Fri,  6 Nov 2020 07:57:16 +0100 (CET)
Subject: Re: [PATCH v2] kernel/watchdog: Fix watchdog_allowed_mask not used
 warning
To: Santosh Sivaraj <santosh@fossix.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20201106015025.1281561-1-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <78e3bbe8-4f45-0b68-6e72-85fcc4f75695@csgroup.eu>
Date: Fri, 6 Nov 2020 07:57:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106015025.1281561-1-santosh@fossix.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/11/2020 à 02:50, Santosh Sivaraj a écrit :
> Define watchdog_allowed_mask only when SOFTLOCKUP_DETECTOR is enabled.
> 
> Fixes: 7feeb9cd4f5b ("watchdog/sysctl: Clean up sysctl variable name space")
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v2:
> Added Petr's reviewed-by from [1] and add fixes tag as suggested by Christophe.
> 
> [1]: https://lkml.org/lkml/2020/8/20/1030
> 
>   kernel/watchdog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 5abb5b22ad13..71109065bd8e 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -44,8 +44,6 @@ int __read_mostly soft_watchdog_user_enabled = 1;
>   int __read_mostly watchdog_thresh = 10;
>   static int __read_mostly nmi_watchdog_available;
>   
> -static struct cpumask watchdog_allowed_mask __read_mostly;
> -
>   struct cpumask watchdog_cpumask __read_mostly;
>   unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
>   
> @@ -162,6 +160,8 @@ static void lockup_detector_update_enable(void)
>   int __read_mostly sysctl_softlockup_all_cpu_backtrace;
>   #endif
>   
> +static struct cpumask watchdog_allowed_mask __read_mostly;
> +
>   /* Global variables, exported for sysctl */
>   unsigned int __read_mostly softlockup_panic =
>   			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE;
> 
