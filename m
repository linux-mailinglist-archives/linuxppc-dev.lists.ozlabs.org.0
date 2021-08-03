Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C63DF03E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 16:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfHHf4kLMz3dBs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 00:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PYhmKlzH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PYhmKlzH; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfHH26D6Yz3bYQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 00:26:05 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id n11so12608270wmd.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Aug 2021 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hyrev4qZ9gpvHA1KPCI74nwAO20DWHqFncjdod67xeY=;
 b=PYhmKlzHVcWBCe22CBKVh/KxzmRCtPAQBvU+UWPmJGHL6O8vEmHQ2VVS7padRiJfDv
 M0L+E63SYkCVgoWe8p7Jfd5Lvh/vsoT3Hi5J0VWPan3CZIXdxpFKAwATKpBrOAGhUKM7
 tW3YaxbCKIcKPv7p7/Kx3CzOZ9ev/Q1EULAYiP/qxyhk5ODDZcKhNo+GVGA0pf/cki+l
 62n2JMxkUOb0ktuQSYOHM48ZBedtzV4VW23uslZwi4WCIUhadBSmTJ4R3hh0SDk3xtii
 KUbHi5FBa2auiSaifO4Ufh18Eq/uukG0ta2ryDOAfVyzBOiYCbrAiIsw/XZP2hS2AE1J
 zzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hyrev4qZ9gpvHA1KPCI74nwAO20DWHqFncjdod67xeY=;
 b=BsecyDAcUfS1D0TkZOtrEiTyq2MmDsHbaOu9/unjUoevy2vtZ1XxF4G5NdGIoJab1F
 A1th4EGFI/O96c3cv1CkKzgSwyWmS1+zOrqjRy/KeoZDJy/Nq/WJJIeMTVpnu9s/F9/g
 mTFGvDVDWjbgdnzEKKgnlXjDZNOGXjm91O3qxlRicdSxdMu4XxRBZAcA6WCB6haJd6fa
 vcR9pOS+xt2kjxehd7yy/FUJSa/6DUlDWaH/3zvHW9odN/41fLkif/82i07VJ3VaqqIl
 kSF0m2O/J7qKzYGt7IsgHGEGcUHU3I9eviHdSCVPrP2aSzXLJs/UKwGPc06iEee5ciB8
 fFag==
X-Gm-Message-State: AOAM530eAFhRMMCtot8O2A2emUU8qazpRy3llENkuo1KHfNpRqN2RwhY
 s9NGQp94RMtDEVTxkREciHuOgg==
X-Google-Smtp-Source: ABdhPJwBsXTY7UQoTg+5apK7w/53TzVRzoUSN5h/Ae6fXdtB2xBNWKpTQUndSfLu+uJJGNrrmH5HIw==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr22633670wmh.130.1628000761410; 
 Tue, 03 Aug 2021 07:26:01 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f7sm17949139wrr.54.2021.08.03.07.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:26:00 -0700 (PDT)
Date: Tue, 3 Aug 2021 15:25:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v1 03/10] kgdb: delay roundup if holding printk
 cpulock
Message-ID: <20210803142558.cz7apumpgijs5y4y@maple.lan>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-4-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-4-john.ogness@linutronix.de>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Chengyang Fan <cy.fan@huawei.com>, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 03, 2021 at 03:18:54PM +0206, John Ogness wrote:
> kgdb makes use of its own cpulock (@dbg_master_lock, @kgdb_active)
> during cpu roundup. This will conflict with the printk cpulock.

When the full vision is realized what will be the purpose of the printk
cpulock?

I'm asking largely because it's current role is actively unhelpful
w.r.t. kdb. It is possible that cautious use of in_dbg_master() might
be a better (and safer) solution. However it sounds like there is a
larger role planned for the printk cpulock...


> Therefore, a CPU must ensure that it is not holding the printk
> cpulock when calling kgdb_cpu_enter(). If it is, it must allow its
> printk context to complete first.
> 
> A new helper function kgdb_roundup_delay() is introduced for kgdb
> to determine if it is holding the printk cpulock. If so, a flag is
> set so that when the printk cpulock is released, kgdb will be
> re-triggered for that CPU.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/powerpc/include/asm/smp.h |  1 +
>  arch/powerpc/kernel/kgdb.c     | 10 +++++++-
>  arch/powerpc/kernel/smp.c      |  5 ++++
>  arch/x86/kernel/kgdb.c         |  9 ++++---
>  include/linux/kgdb.h           |  3 +++
>  include/linux/printk.h         |  8 ++++++
>  kernel/debug/debug_core.c      | 45 ++++++++++++++++++++--------------
>  kernel/printk/printk.c         | 12 +++++++++
>  8 files changed, 70 insertions(+), 23 deletions(-)
> 
> [...]
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 3d0c933937b4..1b546e117f10 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -44,6 +44,7 @@
>  #include <linux/irq_work.h>
>  #include <linux/ctype.h>
>  #include <linux/uio.h>
> +#include <linux/kgdb.h>
>  #include <linux/sched/clock.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task_stack.h>
> @@ -214,6 +215,7 @@ int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
>  #ifdef CONFIG_SMP
>  static atomic_t printk_cpulock_owner = ATOMIC_INIT(-1);
>  static atomic_t printk_cpulock_nested = ATOMIC_INIT(0);
> +static unsigned int kgdb_cpu = -1;

Is this the flag to provoke retriggering? It appears to be a write-only
variable (at least in this patch). How is it consumed?


Daniel.


>  /**
>   * __printk_wait_on_cpu_lock() - Busy wait until the printk cpu-reentrant
> @@ -325,6 +327,16 @@ void __printk_cpu_unlock(void)
>  			   -1); /* LMM(__printk_cpu_unlock:B) */
>  }
>  EXPORT_SYMBOL(__printk_cpu_unlock);
> +
> +bool kgdb_roundup_delay(unsigned int cpu)
> +{
> +	if (cpu != atomic_read(&printk_cpulock_owner))
> +		return false;
> +
> +	kgdb_cpu = cpu;
> +	return true;
> +}
> +EXPORT_SYMBOL(kgdb_roundup_delay);
>  #endif /* CONFIG_SMP */
>  
>  /* Number of registered extended console drivers. */
> -- 
> 2.20.1
> 
