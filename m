Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A518F87B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:24:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJ8f3110zDqdm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=v/mr=5i=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=zCkspbRT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mHck5RSkzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:00:36 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E0182076A;
 Mon, 23 Mar 2020 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584975634;
 bh=sOwqdzjNyDhqWaqPuKSrOiqTlX2z5cN/FIXJ3P/xkjI=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=zCkspbRTmHUxF9l9kRPZQnxtYGdYi8+u6rRR3/9+G3jy+1Py13gdsJwR0GL7JDxJY
 DSpD2HdIdJvkPPQPC0zgJceBlBX5G9X0TWzOx+qjPICnwN5AmkaI4wgCQcYvkrDVkI
 xQOQ+kQyCeBEE5NPoHcjWNEc/LS2t4bjGP3+oOWY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 5B36B35226C6; Mon, 23 Mar 2020 08:00:34 -0700 (PDT)
Date: Mon, 23 Mar 2020 08:00:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Qais Yousef <qais.yousef@arm.com>
Subject: Re: [PATCH v4 01/17] cpu: Add new {add,remove}_cpu() functions
Message-ID: <20200323150034.GG3199@paulmck-ThinkPad-P72>
References: <20200323135110.30522-1-qais.yousef@arm.com>
 <20200323135110.30522-2-qais.yousef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323135110.30522-2-qais.yousef@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Juergen Gross <jgross@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 01:50:54PM +0000, Qais Yousef wrote:
> The new functions use device_{online,offline}() which are userspace
> safe.
> 
> This is in preparation to move cpu_{up, down} kernel users to use
> a safer interface that is not racy with userspace.
> 
> Suggested-by: "Paul E. McKenney" <paulmck@kernel.org>
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: "Paul E. McKenney" <paulmck@kernel.org>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> CC: Helge Deller <deller@gmx.de>
> CC: Michael Ellerman <mpe@ellerman.id.au>
> CC: "David S. Miller" <davem@davemloft.net>
> CC: Juergen Gross <jgross@suse.com>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> CC: xen-devel@lists.xenproject.org
> CC: linux-parisc@vger.kernel.org
> CC: sparclinux@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: x86@kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  include/linux/cpu.h |  2 ++
>  kernel/cpu.c        | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index 1ca2baf817ed..cf8cf38dca43 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -89,6 +89,7 @@ extern ssize_t arch_cpu_release(const char *, size_t);
>  #ifdef CONFIG_SMP
>  extern bool cpuhp_tasks_frozen;
>  int cpu_up(unsigned int cpu);
> +int add_cpu(unsigned int cpu);
>  void notify_cpu_starting(unsigned int cpu);
>  extern void cpu_maps_update_begin(void);
>  extern void cpu_maps_update_done(void);
> @@ -118,6 +119,7 @@ extern void cpu_hotplug_disable(void);
>  extern void cpu_hotplug_enable(void);
>  void clear_tasks_mm_cpumask(int cpu);
>  int cpu_down(unsigned int cpu);
> +int remove_cpu(unsigned int cpu);
>  
>  #else /* CONFIG_HOTPLUG_CPU */
>  
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 9c706af713fb..069802f7010f 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1057,6 +1057,18 @@ int cpu_down(unsigned int cpu)
>  }
>  EXPORT_SYMBOL(cpu_down);
>  
> +int remove_cpu(unsigned int cpu)
> +{
> +	int ret;
> +
> +	lock_device_hotplug();
> +	ret = device_offline(get_cpu_device(cpu));
> +	unlock_device_hotplug();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(remove_cpu);
> +
>  #else
>  #define takedown_cpu		NULL
>  #endif /*CONFIG_HOTPLUG_CPU*/
> @@ -1209,6 +1221,18 @@ int cpu_up(unsigned int cpu)
>  }
>  EXPORT_SYMBOL_GPL(cpu_up);
>  
> +int add_cpu(unsigned int cpu)
> +{
> +	int ret;
> +
> +	lock_device_hotplug();
> +	ret = device_online(get_cpu_device(cpu));
> +	unlock_device_hotplug();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(add_cpu);
> +
>  #ifdef CONFIG_PM_SLEEP_SMP
>  static cpumask_var_t frozen_cpus;
>  
> -- 
> 2.17.1
> 
