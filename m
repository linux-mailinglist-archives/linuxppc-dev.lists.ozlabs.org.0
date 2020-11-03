Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497C2A40E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 10:57:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQQDz44J3zDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 20:57:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQQCD5LFhzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 20:55:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQQC11G6dz9vBL6;
 Tue,  3 Nov 2020 10:55:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gMUBwbi-TI51; Tue,  3 Nov 2020 10:55:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQQC109jtz9vBL4;
 Tue,  3 Nov 2020 10:55:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 273D38B77E;
 Tue,  3 Nov 2020 10:55:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BFsGvPi7rmNr; Tue,  3 Nov 2020 10:55:42 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 79F678B7BD;
 Tue,  3 Nov 2020 10:55:41 +0100 (CET)
Subject: Re: [RESEND PATCH] kernel/watchdog: Fix watchdog_allowed_mask not
 used warning
To: Santosh Sivaraj <santosh@fossix.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20201103093235.655665-1-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <214be993-96ec-82b0-b841-c80f7e7faefb@csgroup.eu>
Date: Tue, 3 Nov 2020 10:55:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201103093235.655665-1-santosh@fossix.org>
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
Cc: pmladek@suse.com, Thomas Gleixner <tglx@linutronix.de>,
 bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/11/2020 à 10:32, Santosh Sivaraj a écrit :
> Define watchdog_allowed_mask only when SOFTLOCKUP_DETECTOR is enabled.
> 
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>

I think maybe you should add a Fixes: tag (Towards https://github.com/linuxppc/linux/commit/7feeb9cd ?)

And copy Thomas (tglx)

Christophe

> ---
> 
> Original patch is here:
> https://lore.kernel.org/lkml/20190807014417.9418-1-santosh@fossix.org/
> 
> A similar patch was also sent by Balamuruhan and reviewed by Petr.
> https://lkml.org/lkml/2020/8/20/1030
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
