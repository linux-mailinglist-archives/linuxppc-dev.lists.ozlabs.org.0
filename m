Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52C42F404
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 15:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW6qR2VlHz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 00:41:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HW6p91CgGz3c9q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 00:39:59 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0BA4D6E;
 Fri, 15 Oct 2021 06:39:56 -0700 (PDT)
Received: from [10.57.95.157] (unknown [10.57.95.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA6F53F694;
 Fri, 15 Oct 2021 06:39:55 -0700 (PDT)
Subject: Re: [PATCH] soc: fsl: dpio: protect smp_processor_id when get
 processor id
To: Meng.Li@windriver.com, Roy.Pledge@nxp.com, leoyang.li@nxp.com,
 ruxandra.radulescu@nxp.com, horia.geanta@nxp.com
References: <20211015063601.23303-1-Meng.Li@windriver.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ba116805-8e41-1502-6cd4-acc1d5e5fa41@arm.com>
Date: Fri, 15 Oct 2021 14:39:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211015063601.23303-1-Meng.Li@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-10-15 07:36, Meng.Li@windriver.com wrote:
> From: Meng Li <meng.li@windriver.com>
> 
> When enable debug kernel configs,there will be calltrace as below:
> 
> BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> caller is debug_smp_processor_id+0x20/0x30
> CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.10.63-yocto-standard #1
> Hardware name: NXP Layerscape LX2160ARDB (DT)
> Call trace:
>   dump_backtrace+0x0/0x1a0
>   show_stack+0x24/0x30
>   dump_stack+0xf0/0x13c
>   check_preemption_disabled+0x100/0x110
>   debug_smp_processor_id+0x20/0x30
>   dpaa2_io_query_fq_count+0xdc/0x154
>   dpaa2_eth_stop+0x144/0x314
>   __dev_close_many+0xdc/0x160
>   __dev_change_flags+0xe8/0x220
>   dev_change_flags+0x30/0x70
>   ic_close_devs+0x50/0x78
>   ip_auto_config+0xed0/0xf10
>   do_one_initcall+0xac/0x460
>   kernel_init_freeable+0x30c/0x378
>   kernel_init+0x20/0x128
>   ret_from_fork+0x10/0x38
> 
> Because smp_processor_id() should be invoked in preempt disable status.
> So, add preempt_disable/enable() to protect smp_processor_id().

If preemption doesn't matter anyway, as the comment in the context 
implies, then it probably makes more sense just to use 
raw_smp_processor_id() instead.

Robin.

> Fixes: c89105c9b390 ("staging: fsl-mc: Move DPIO from staging to drivers/soc/fsl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>   drivers/soc/fsl/dpio/dpio-service.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
> index 19f47ea9dab0..afc3b89b0fc5 100644
> --- a/drivers/soc/fsl/dpio/dpio-service.c
> +++ b/drivers/soc/fsl/dpio/dpio-service.c
> @@ -58,8 +58,11 @@ static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
>   	 * If cpu == -1, choose the current cpu, with no guarantees about
>   	 * potentially being migrated away.
>   	 */
> -	if (cpu < 0)
> -		cpu = smp_processor_id();
> +        if (cpu < 0) {
> +                preempt_disable();
> +                cpu = smp_processor_id();
> +                preempt_enable();
> +        }
>   
>   	/* If a specific cpu was requested, pick it up immediately */
>   	return dpio_by_cpu[cpu];
> 
