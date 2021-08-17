Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA13EEC09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:00:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpqNB2bGdz3bNq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 22:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpqMh69cGz2yLQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 21:59:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GpqMY2xY1z9sVQ;
 Tue, 17 Aug 2021 13:59:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iJYUjS6-uac; Tue, 17 Aug 2021 13:59:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GpqMY16XPz9sVJ;
 Tue, 17 Aug 2021 13:59:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE3AE8B7C5;
 Tue, 17 Aug 2021 13:59:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I98F-xCv6McI; Tue, 17 Aug 2021 13:59:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B77B8B7A9;
 Tue, 17 Aug 2021 13:59:36 +0200 (CEST)
Subject: Re: [PATCH] macintosh: no need to initilise statics to 0
To: Jason Wang <wangborong@cdjrlc.com>, benh@kernel.crashing.org
References: <20210817115104.30057-1-wangborong@cdjrlc.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2105ef52-b736-cc18-def9-02ac174d1922@csgroup.eu>
Date: Tue, 17 Aug 2021 13:59:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817115104.30057-1-wangborong@cdjrlc.com>
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
Cc: yukuai3@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/08/2021 à 13:51, Jason Wang a écrit :
> Global static variables dont need to be initialised to 0. Because
> the compiler will initilise them.

It is not the compiler, it is the Kernel. It is done here:

https://elixir.bootlin.com/linux/v5.14-rc6/source/arch/powerpc/kernel/early_32.c


> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>   drivers/macintosh/mediabay.c | 10 ++---
>   drivers/macintosh/via-pmu.c  | 78 ++++++++++++++++++------------------
>   2 files changed, 44 insertions(+), 44 deletions(-)

Among those 44 changes, only 2 are related to the commit's description.

> 
> diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
> index eab7e83c11c4..e104a95decb5 100644
> --- a/drivers/macintosh/mediabay.c
> +++ b/drivers/macintosh/mediabay.c
> @@ -70,7 +70,7 @@ struct media_bay_info {
>   #define MAX_BAYS	2
>   
>   static struct media_bay_info media_bays[MAX_BAYS];
> -static int media_bay_count = 0;
> +static int media_bay_count;
>   
>   /*
>    * Wait that number of ms between each step in normal polling mode
> @@ -129,7 +129,7 @@ enum {
>   /*
>    * Functions for polling content of media bay
>    */
> -
> +

What is that change ? Unrelated.

>   static u8
>   ohare_mb_content(struct media_bay_info *bay)
>   {
> @@ -336,7 +336,7 @@ static inline void set_mb_power(struct media_bay_info* bay, int onoff)
>   		bay->ops->power(bay, 1);
>   		bay->state = mb_powering_up;
>   		pr_debug("mediabay%d: powering up\n", bay->index);
> -	} else {
> +	} else {

What is that change ? Unrelated.

>   		/* Make sure everything is powered down & disabled */
>   		bay->ops->power(bay, 0);
>   		bay->state = mb_powering_down;
> @@ -577,7 +577,7 @@ static int media_bay_attach(struct macio_dev *mdev,
>   		macio_release_resources(mdev);
>   		return -ENOMEM;
>   	}
> -	
> +

What is that change ? Unrelated.

>   	i = media_bay_count++;
>   	bay = &media_bays[i];
>   	bay->mdev = mdev;
> @@ -745,7 +745,7 @@ static int __init media_bay_init(void)
>   	if (!machine_is(powermac))
>   		return 0;
>   
> -	macio_register_driver(&media_bay_driver);	
> +	macio_register_driver(&media_bay_driver);

What is that change ? Unrelated.

>   
>   	return 0;
>   }
> diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
> index 4bdd4c45e7a7..cba4c2464dbf 100644
> --- a/drivers/macintosh/via-pmu.c
> +++ b/drivers/macintosh/via-pmu.c
> @@ -158,7 +158,7 @@ static struct device_node *vias;
>   static struct device_node *gpio_node;
>   #endif
>   static unsigned char __iomem *gpio_reg;
> -static int gpio_irq = 0;
> +static int gpio_irq;
>   static int gpio_irq_enabled = -1;
>   static volatile int pmu_suspended;
>   static spinlock_t pmu_lock;
> @@ -313,7 +313,7 @@ int __init find_via_pmu(void)
>   			PMU_INT_SNDBRT |
>   			PMU_INT_ADB |
>   			PMU_INT_TICK;
> -	
> +

What is that change ? Unrelated.

>   	if (of_node_name_eq(vias->parent, "ohare") ||
>   	    of_device_is_compatible(vias->parent, "ohare"))
>   		pmu_kind = PMU_OHARE_BASED;
> @@ -336,7 +336,7 @@ int __init find_via_pmu(void)
>   				PMU_INT_ADB |
>   				PMU_INT_TICK |
>   				PMU_INT_ENVIRONMENT;
> -		
> +

What is that change ? Unrelated.

>   		gpiop = of_find_node_by_name(NULL, "gpio");
>   		if (gpiop) {
>   			reg = of_get_property(gpiop, "reg", NULL);
> @@ -358,7 +358,7 @@ int __init find_via_pmu(void)
>   		printk(KERN_ERR "via-pmu: Can't map address !\n");
>   		goto fail_via_remap;
>   	}
> -	
> +

What is that change ? Unrelated.

>   	out_8(&via1[IER], IER_CLR | 0x7f);	/* disable all intrs */
>   	out_8(&via1[IFR], 0x7f);			/* clear IFR */
>   
> @@ -368,7 +368,7 @@ int __init find_via_pmu(void)
>   		goto fail_init;
>   
>   	sys_ctrler = SYS_CTRLER_PMU;
> -	
> +

What is that change ? Unrelated.

>   	return 1;
>   
>    fail_init:
> @@ -623,7 +623,7 @@ init_pmu(void)
>   	pmu_wait_complete(&req);
>   	if (req.reply_len > 0)
>   		pmu_version = req.reply[0];
> -	
> +

What is that change ? Unrelated.

>   	/* Read server mode setting */
>   	if (pmu_kind == PMU_KEYLARGO_BASED) {
>   		pmu_request(&req, NULL, 2, PMU_POWER_EVENTS,
> @@ -664,11 +664,11 @@ static void pmu_set_server_mode(int server_mode)
>   	if (server_mode)
>   		pmu_request(&req, NULL, 4, PMU_POWER_EVENTS,
>   			    PMU_PWR_SET_POWERUP_EVENTS,
> -			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT);
> +			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT);

What is that change ? Unrelated.

>   	else
>   		pmu_request(&req, NULL, 4, PMU_POWER_EVENTS,
>   			    PMU_PWR_CLR_POWERUP_EVENTS,
> -			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT);
> +			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT);

What is that change ? Unrelated.

>   	pmu_wait_complete(&req);
>   }
>   
> @@ -684,8 +684,8 @@ done_battery_state_ohare(struct adb_request* req)
>   	 *    0x01 :  AC indicator
>   	 *    0x02 :  charging
>   	 *    0x04 :  battery exist
> -	 *    0x08 :
> -	 *    0x10 :
> +	 *    0x08 :
> +	 *    0x10 :

What is that change ? Unrelated.

>   	 *    0x20 :  full charged
>   	 *    0x40 :  pcharge reset
>   	 *    0x80 :  battery exist
> @@ -708,7 +708,7 @@ done_battery_state_ohare(struct adb_request* req)
>   		pmu_power_flags |= PMU_PWR_AC_PRESENT;
>   	else
>   		pmu_power_flags &= ~PMU_PWR_AC_PRESENT;
> -	
> +

What is that change ? Unrelated.

>   	if (mb == PMAC_TYPE_COMET) {
>   		vmax_charged = 189;
>   		vmax_charging = 213;
> @@ -771,26 +771,26 @@ done_battery_state_smart(struct adb_request* req)
>   	/* format:
>   	 *  [0] : format of this structure (known: 3,4,5)
>   	 *  [1] : flags
> -	 *
> +	 *

What is that change ? Unrelated.

>   	 *  format 3 & 4:
> -	 *
> +	 *

What is that change ? Unrelated.

>   	 *  [2] : charge
>   	 *  [3] : max charge
>   	 *  [4] : current
>   	 *  [5] : voltage
> -	 *
> +	 *

What is that change ? Unrelated.

>   	 *  format 5:
> -	 *
> +	 *

What is that change ? Unrelated.

>   	 *  [2][3] : charge
>   	 *  [4][5] : max charge
>   	 *  [6][7] : current
>   	 *  [8][9] : voltage
>   	 */
> -	
> +

What is that change ? Unrelated.

>   	unsigned int bat_flags = PMU_BATT_TYPE_SMART;
>   	int amperage;
>   	unsigned int capa, max, voltage;
> -	
> +

What is that change ? Unrelated.

>   	if (req->reply[1] & 0x01)
>   		pmu_power_flags |= PMU_PWR_AC_PRESENT;
>   	else
> @@ -798,7 +798,7 @@ done_battery_state_smart(struct adb_request* req)
>   
>   
>   	capa = max = amperage = voltage = 0;
> -	
> +

What is that change ? Unrelated.

>   	if (req->reply[1] & 0x04) {
>   		bat_flags |= PMU_BATT_PRESENT;
>   		switch(req->reply[0]) {
> @@ -897,7 +897,7 @@ static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
>   static int pmu_battery_proc_show(struct seq_file *m, void *v)
>   {
>   	long batnum = (long)m->private;
> -	
> +

What is that change ? Unrelated.

>   	seq_putc(m, '\n');
>   	seq_printf(m, "flags      : %08x\n", pmu_batteries[batnum].flags);
>   	seq_printf(m, "charge     : %d\n", pmu_batteries[batnum].charge);
> @@ -932,7 +932,7 @@ static ssize_t pmu_options_proc_write(struct file *file,
>   	char tmp[33];
>   	char *label, *val;
>   	size_t fcount = count;
> -	
> +

What is that change ? Unrelated.

>   	if (!count)
>   		return -EINVAL;
>   	if (count > 32)
> @@ -1304,7 +1304,7 @@ pmu_suspend(void)
>   
>   	if (pmu_state == uninitialized)
>   		return;
> -	
> +

What is that change ? Unrelated.

>   	spin_lock_irqsave(&pmu_lock, flags);
>   	pmu_suspended++;
>   	if (pmu_suspended > 1) {
> @@ -1430,7 +1430,7 @@ pmu_handle_data(unsigned char *data, int len)
>   			      && data[1] == 0x2c && data[3] == 0xff
>   			      && (data[2] & ~1) == 0xf4))
>   				adb_input(data+1, len-1, 1);
> -#endif /* CONFIG_ADB */		
> +#endif /* CONFIG_ADB */

What is that change ? Unrelated.

>   		}
>   		break;
>   
> @@ -1554,7 +1554,7 @@ pmu_sr_intr(void)
>   			interrupt_data_len[int_data_last] = data_len;
>   		} else {
>   			req = current_req;
> -			/*
> +			/*

What is that change ? Unrelated.

>   			 * For PMU sleep and freq change requests, we lock the
>   			 * PMU until it's explicitly unlocked. This avoids any
>   			 * spurrious event polling getting in
> @@ -1589,7 +1589,7 @@ via_pmu_interrupt(int irq, void *arg)
>   	/* This is a bit brutal, we can probably do better */
>   	spin_lock_irqsave(&pmu_lock, flags);
>   	++disable_poll;
> -	
> +

What is that change ? Unrelated.

>   	for (;;) {
>   		/* On 68k Macs, VIA interrupts are dispatched individually.
>   		 * Unless we are polling, the relevant IRQ flag has already
> @@ -1653,7 +1653,7 @@ via_pmu_interrupt(int irq, void *arg)
>   		} else if (current_req)
>   			pmu_start();
>   	}
> -no_free_slot:			
> +no_free_slot:

What is that change ? Unrelated.

>   	/* Mark the oldest buffer for flushing */
>   	if (int_data_state[!int_data_last] == int_data_ready) {
>   		int_data_state[!int_data_last] = int_data_flush;
> @@ -1670,7 +1670,7 @@ via_pmu_interrupt(int irq, void *arg)
>   		pmu_done(req);
>   		req = NULL;
>   	}
> -		
> +

What is that change ? Unrelated.

>   	/* Deal with interrupt datas outside of the lock */
>   	if (int_data >= 0) {
>   		pmu_handle_data(interrupt_data[int_data], interrupt_data_len[int_data]);
> @@ -1776,7 +1776,7 @@ pmu_restart(void)
>   	local_irq_disable();
>   
>   	drop_interrupts = 1;
> -	
> +

What is that change ? Unrelated.

>   	if (pmu_kind != PMU_KEYLARGO_BASED) {
>   		pmu_request(&req, NULL, 2, PMU_SET_INTR_MASK, PMU_INT_ADB |
>   						PMU_INT_TICK );
> @@ -1830,7 +1830,7 @@ pmu_present(void)
>   /*
>    * Put the powerbook to sleep.
>    */
> -
> +

What is that change ? Unrelated.

>   static u32 save_via[8];
>   static int __fake_sleep;
>   
> @@ -1901,7 +1901,7 @@ static int powerbook_sleep_grackle(void)
>   
>   	pci_read_config_word(grackle, 0x70, &pmcr1);
>   	/* Apparently, MacOS uses NAP mode for Grackle ??? */
> -	pmcr1 &= ~(GRACKLE_DOZE|GRACKLE_SLEEP);
> +	pmcr1 &= ~(GRACKLE_DOZE|GRACKLE_SLEEP);

What is that change ? Unrelated.

>   	pmcr1 |= GRACKLE_PM|GRACKLE_NAP;
>   	pci_write_config_word(grackle, 0x70, pmcr1);
>   
> @@ -1913,7 +1913,7 @@ static int powerbook_sleep_grackle(void)
>   
>   	/* We're awake again, stop grackle PM */
>   	pci_read_config_word(grackle, 0x70, &pmcr1);
> -	pmcr1 &= ~(GRACKLE_PM|GRACKLE_DOZE|GRACKLE_SLEEP|GRACKLE_NAP);
> +	pmcr1 &= ~(GRACKLE_PM|GRACKLE_DOZE|GRACKLE_SLEEP|GRACKLE_NAP);

What is that change ? Unrelated.

>   	pci_write_config_word(grackle, 0x70, pmcr1);
>   
>   	pci_dev_put(grackle);
> @@ -1921,11 +1921,11 @@ static int powerbook_sleep_grackle(void)
>   	/* Make sure the PMU is idle */
>   	pmac_call_feature(PMAC_FTR_SLEEP_STATE,NULL,0,0);
>   	restore_via_state();
> -	
> +

What is that change ? Unrelated.

>   	/* Restore L2 cache */
>   	if (save_l2cr != 0xffffffff && (save_l2cr & L2CR_L2E) != 0)
>    		_set_L2CR(save_l2cr);
> -	
> +

What is that change ? Unrelated.

>   	/* Restore userland MMU context */
>   	switch_mmu_context(NULL, current->active_mm, NULL);
>   
> @@ -1949,7 +1949,7 @@ powerbook_sleep_Core99(void)
>   	unsigned long save_l2cr;
>   	unsigned long save_l3cr;
>   	struct adb_request req;
> -	
> +

What is that change ? Unrelated.

>   	if (pmac_call_feature(PMAC_FTR_SLEEP_STATE,NULL,0,-1) < 0) {
>   		printk(KERN_ERR "Sleep mode not supported on this machine\n");
>   		return -ENOSYS;
> @@ -2014,7 +2014,7 @@ powerbook_sleep_Core99(void)
>   	/* Restore L3 cache */
>   	if (save_l3cr != 0xffffffff && (save_l3cr & L3CR_L3E) != 0)
>    		_set_L3CR(save_l3cr);
> -	
> +

What is that change ? Unrelated.

>   	/* Restore userland MMU context */
>   	switch_mmu_context(NULL, current->active_mm, NULL);
>   
> @@ -2173,7 +2173,7 @@ pmu_open(struct inode *inode, struct file *file)
>   	return 0;
>   }
>   
> -static ssize_t
> +static ssize_t

What is that change ? Unrelated.

>   pmu_read(struct file *file, char __user *buf,
>   			size_t count, loff_t *ppos)
>   {
> @@ -2219,7 +2219,7 @@ pmu_read(struct file *file, char __user *buf,
>   	__set_current_state(TASK_RUNNING);
>   	remove_wait_queue(&pp->wait, &wait);
>   	spin_unlock_irqrestore(&pp->lock, flags);
> -	
> +

What is that change ? Unrelated.

>   	return ret;
>   }
>   
> @@ -2236,7 +2236,7 @@ pmu_fpoll(struct file *filp, poll_table *wait)
>   	struct pmu_private *pp = filp->private_data;
>   	__poll_t mask = 0;
>   	unsigned long flags;
> -	
> +

What is that change ? Unrelated.

>   	if (!pp)
>   		return 0;
>   	poll_wait(filp, &pp->wait, wait);
> @@ -2500,7 +2500,7 @@ device_initcall(pmu_device_init);
>   
>   
>   #ifdef DEBUG_SLEEP
> -static inline void
> +static inline void

What is that change ? Unrelated.

>   polled_handshake(void)
>   {
>   	via2[B] &= ~TREQ; eieio();
> @@ -2511,7 +2511,7 @@ polled_handshake(void)
>   		;
>   }
>   
> -static inline void
> +static inline void

What is that change ? Unrelated.

>   polled_send_byte(int x)
>   {
>   	via1[ACR] |= SR_OUT | SR_EXT; eieio();
> 
