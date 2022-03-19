Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8357A4DE905
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 16:27:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLPrg1bq4z3bTD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 02:27:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=S5vmWGPu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLPqv41g3z2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 02:26:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=rs69zP4MkVN9GKX0WlKSGLAUyjwHvCaUIqkkCrFXSMo=; b=S5vmWGPu750bXYHH4SggbfzGxQ
 nzewVVWRmBFcM3WTsVhoviDtMGSgZ5cTnboni5JJPQhcipXEIrY/6j3haJbN/I2aM7MJFFvnR2Vez
 zrqKxt/8n3y13pE+USi1uKJlv+RyPDetTzWN2yxFwArL4LTsq3hFZdUYxpvxBIkQYIzY+6eFFIyDW
 JSleUkW6SwQG4aQKNZdHH3Zp73RjrUBAmJcYpUjkdM66ZKZKO4EfYCtk8fxqmPZmRakiuERRACZbv
 nMzGWjXeCwjphSPkDrES9kkJHR+Fsr8q4JdUJu4Q0XqlamEJzE59NHTo38XOTGOC9REZNVxR1zBT7
 pL6ExI0g==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVayP-008ujB-M1; Sat, 19 Mar 2022 15:26:33 +0000
Message-ID: <d2d05776-c285-b174-6906-f71c5831fbc4@infradead.org>
Date: Sat, 19 Mar 2022 08:26:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/19/22 00:20, Finn Thain wrote:
> drivers/macintosh/via-pmu.c:897:12: warning: 'pmu_battery_proc_show' defined but not used [-Wunused-function]
>  static int pmu_battery_proc_show(struct seq_file *m, void *v)
>             ^~~~~~~~~~~~~~~~~~~~~
> drivers/macintosh/via-pmu.c:871:12: warning: 'pmu_irqstats_proc_show' defined but not used [-Wunused-function]
>  static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
>             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/macintosh/via-pmu.c:860:12: warning: 'pmu_info_proc_show' defined but not used [-Wunused-function]
>  static int pmu_info_proc_show(struct seq_file *m, void *v)
>             ^~~~~~~~~~~~~~~~~~
> 
> Rearrange some code and add some #ifdefs to avoid unused code warnings
> when CONFIG_PROC_FS is disabled.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/macintosh/via-pmu.c | 61 ++++++++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
> index 55afa6dfa263..5ffebf29b630 100644
> --- a/drivers/macintosh/via-pmu.c
> +++ b/drivers/macintosh/via-pmu.c
> @@ -173,10 +173,15 @@ static unsigned long async_req_locks;
>  #define NUM_IRQ_STATS 13
>  static unsigned int pmu_irq_stats[NUM_IRQ_STATS];
>  
> +#ifdef CONFIG_PROC_FS
>  static struct proc_dir_entry *proc_pmu_root;
>  static struct proc_dir_entry *proc_pmu_info;
>  static struct proc_dir_entry *proc_pmu_irqstats;
>  static struct proc_dir_entry *proc_pmu_options;
> +static struct proc_dir_entry *proc_pmu_batt[PMU_MAX_BATTERIES];
> +static void pmu_proc_setup(void);
> +#endif
> +
>  static int option_server_mode;
>  
>  int pmu_battery_count;
> @@ -185,7 +190,6 @@ unsigned int pmu_power_flags = PMU_PWR_AC_PRESENT;
>  struct pmu_battery_info pmu_batteries[PMU_MAX_BATTERIES];
>  static int query_batt_timer = BATTERY_POLLING_COUNT;
>  static struct adb_request batt_req;
> -static struct proc_dir_entry *proc_pmu_batt[PMU_MAX_BATTERIES];
>  
>  int asleep;
>  
> @@ -204,11 +208,7 @@ static int init_pmu(void);
>  static void pmu_start(void);
>  static irqreturn_t via_pmu_interrupt(int irq, void *arg);
>  static irqreturn_t gpio1_interrupt(int irq, void *arg);
> -static int pmu_info_proc_show(struct seq_file *m, void *v);
> -static int pmu_irqstats_proc_show(struct seq_file *m, void *v);
> -static int pmu_battery_proc_show(struct seq_file *m, void *v);
>  static void pmu_pass_intr(unsigned char *data, int len);
> -static const struct proc_ops pmu_options_proc_ops;
>  
>  #ifdef CONFIG_ADB
>  const struct adb_driver via_pmu_driver = {
> @@ -551,26 +551,9 @@ static int __init via_pmu_dev_init(void)
>  	}
>  #endif /* CONFIG_PPC32 */
>  
> -	/* Create /proc/pmu */
> -	proc_pmu_root = proc_mkdir("pmu", NULL);
> -	if (proc_pmu_root) {
> -		long i;
> -
> -		for (i=0; i<pmu_battery_count; i++) {
> -			char title[16];
> -			sprintf(title, "battery_%ld", i);
> -			proc_pmu_batt[i] = proc_create_single_data(title, 0,
> -					proc_pmu_root, pmu_battery_proc_show,
> -					(void *)i);
> -		}
> -
> -		proc_pmu_info = proc_create_single("info", 0, proc_pmu_root,
> -				pmu_info_proc_show);
> -		proc_pmu_irqstats = proc_create_single("interrupts", 0,
> -				proc_pmu_root, pmu_irqstats_proc_show);
> -		proc_pmu_options = proc_create("options", 0600, proc_pmu_root,
> -						&pmu_options_proc_ops);
> -	}
> +#ifdef CONFIG_PROC_FS
> +	pmu_proc_setup();
> +#endif
>  	return 0;
>  }
>  
> @@ -857,6 +840,7 @@ query_battery_state(void)
>  			2, PMU_SMART_BATTERY_STATE, pmu_cur_battery+1);
>  }
>  
> +#ifdef CONFIG_PROC_FS
>  static int pmu_info_proc_show(struct seq_file *m, void *v)
>  {
>  	seq_printf(m, "PMU driver version     : %d\n", PMU_DRIVER_VERSION);
> @@ -978,6 +962,33 @@ static const struct proc_ops pmu_options_proc_ops = {
>  	.proc_write	= pmu_options_proc_write,
>  };
>  
> +static void pmu_proc_setup(void)
> +{
> +	long i;
> +
> +	/* Create /proc/pmu */
> +	proc_pmu_root = proc_mkdir("pmu", NULL);
> +	if (!proc_pmu_root)
> +		return;
> +
> +	for (i = 0; i < pmu_battery_count; i++) {
> +		char title[16];
> +
> +		sprintf(title, "battery_%ld", i);
> +		proc_pmu_batt[i] =
> +			proc_create_single_data(title, 0, proc_pmu_root,
> +						pmu_battery_proc_show, (void *)i);
> +	}
> +
> +	proc_pmu_info = proc_create_single("info", 0, proc_pmu_root,
> +					   pmu_info_proc_show);
> +	proc_pmu_irqstats = proc_create_single("interrupts", 0, proc_pmu_root,
> +					       pmu_irqstats_proc_show);
> +	proc_pmu_options = proc_create("options", 0600, proc_pmu_root,
> +				       &pmu_options_proc_ops);
> +}
> +#endif /* CONFIG_PROC_FS */
> +
>  #ifdef CONFIG_ADB
>  /* Send an ADB command */
>  static int pmu_send_request(struct adb_request *req, int sync)

-- 
~Randy
