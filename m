Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CC24B8E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 13:32:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXMvW1ZQvzDr48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 21:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXMsm5HyLzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 21:31:00 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA164AC98;
 Thu, 20 Aug 2020 11:31:24 +0000 (UTC)
Date: Thu, 20 Aug 2020 13:30:56 +0200
From: Petr Mladek <pmladek@suse.com>
To: Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [PATCH] kernel/watchdog: fix warning -Wunused-variable for
 watchdog_allowed_mask in ppc64
Message-ID: <20200820113056.GG4353@alley>
References: <20200814133330.210093-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200814133330.210093-1-bala24@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: ravi.bangoria@linux.ibm.com, peterz@infradead.org, gpiccoli@canonical.com,
 linux-kernel@vger.kernel.org, rdna@fb.com, Jisheng.Zhang@synaptics.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 naveen.n.rao@linux.vnet.ibm.com, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2020-08-14 19:03:30, Balamuruhan S wrote:
> In ppc64 config if `CONFIG_SOFTLOCKUP_DETECTOR` is not set then it
> warns for unused declaration of `watchdog_allowed_mask` while building,
> move the declaration inside ifdef later in the code.
> 
> ```
> kernel/watchdog.c:47:23: warning: ‘watchdog_allowed_mask’ defined but not used [-Wunused-variable]
>  static struct cpumask watchdog_allowed_mask __read_mostly;
> ```
> 
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  kernel/watchdog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 5abb5b22ad13..33c9b8a3d51b 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -44,7 +44,6 @@ int __read_mostly soft_watchdog_user_enabled = 1;
>  int __read_mostly watchdog_thresh = 10;
>  static int __read_mostly nmi_watchdog_available;
>  
> -static struct cpumask watchdog_allowed_mask __read_mostly;
>  
>  struct cpumask watchdog_cpumask __read_mostly;
>  unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
> @@ -166,6 +165,7 @@ int __read_mostly sysctl_softlockup_all_cpu_backtrace;
>  unsigned int __read_mostly softlockup_panic =
>  			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE;
>  
> +static struct cpumask watchdog_allowed_mask __read_mostly;

I could confirm that the variable is used only in code that is built
when CONFIG_SOFTLOCKUP_DETECTOR is enabled.

Note that the problem can't be seen on x86. There the softlockup
detector is enforced together with hardloclup detector via
via HARDLOCKUP_DETECTOR_PERF.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
