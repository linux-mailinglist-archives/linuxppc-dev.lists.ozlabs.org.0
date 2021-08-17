Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32443EEBF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 13:53:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpqDv65GWz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 21:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=106.55.201.39; helo=smtpbg587.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 84 seconds by postgrey-1.36 at boromir;
 Tue, 17 Aug 2021 21:53:25 AEST
Received: from smtpbg587.qq.com (smtpbg128.qq.com [106.55.201.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpqDP0pSVz302V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 21:53:23 +1000 (AEST)
X-QQ-mid: bizesmtp42t1629201074t5vdvioz
Received: from localhost.localdomain (unknown [125.69.42.50])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 17 Aug 2021 19:51:13 +0800 (CST)
X-QQ-SSF: 01000000004000B0C000B00A0000000
X-QQ-FEAT: lSivdDMuKeljc6cmLZ1AVYVfz3V7TEDujLrRmDwWyozF6YrD8rQtNhLD7+2Sk
 BndG8lt68doLiOhaRSr+MN33b+OK5i8J8cyWVBiQbWkRcg1i1e4Il2c3JXo6Pklrq9J2ngn
 zlco99r1Ul1qDoI/0648zRwybOGcCrOg8oTiiBhSa1EGRnq4bfmWssUc48snD9iHJJQuRYZ
 wlmba5y/K6QD7jeVF4ety1uYUht5xNUUuWvNLycAOFGi3pJILDI650XkegOsiIEuTiF24n+
 u8oKyhdIyWfq8LaSsgmwic5exTjm1ZH6TsdQSAnDibisZ11PzW8HTvXSzkitW1BBrlI7p74
 82colIYk7LFevoWWTMwmswGV5FfpQ==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: benh@kernel.crashing.org
Subject: [PATCH] macintosh: no need to initilise statics to 0
Date: Tue, 17 Aug 2021 19:51:04 +0800
Message-Id: <20210817115104.30057-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5
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
 Jason Wang <wangborong@cdjrlc.com>, yukuai3@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Global static variables dont need to be initialised to 0. Because
the compiler will initilise them.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/macintosh/mediabay.c | 10 ++---
 drivers/macintosh/via-pmu.c  | 78 ++++++++++++++++++------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index eab7e83c11c4..e104a95decb5 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -70,7 +70,7 @@ struct media_bay_info {
 #define MAX_BAYS	2
 
 static struct media_bay_info media_bays[MAX_BAYS];
-static int media_bay_count = 0;
+static int media_bay_count;
 
 /*
  * Wait that number of ms between each step in normal polling mode
@@ -129,7 +129,7 @@ enum {
 /*
  * Functions for polling content of media bay
  */
- 
+
 static u8
 ohare_mb_content(struct media_bay_info *bay)
 {
@@ -336,7 +336,7 @@ static inline void set_mb_power(struct media_bay_info* bay, int onoff)
 		bay->ops->power(bay, 1);
 		bay->state = mb_powering_up;
 		pr_debug("mediabay%d: powering up\n", bay->index);
-	} else { 
+	} else {
 		/* Make sure everything is powered down & disabled */
 		bay->ops->power(bay, 0);
 		bay->state = mb_powering_down;
@@ -577,7 +577,7 @@ static int media_bay_attach(struct macio_dev *mdev,
 		macio_release_resources(mdev);
 		return -ENOMEM;
 	}
-	
+
 	i = media_bay_count++;
 	bay = &media_bays[i];
 	bay->mdev = mdev;
@@ -745,7 +745,7 @@ static int __init media_bay_init(void)
 	if (!machine_is(powermac))
 		return 0;
 
-	macio_register_driver(&media_bay_driver);	
+	macio_register_driver(&media_bay_driver);
 
 	return 0;
 }
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 4bdd4c45e7a7..cba4c2464dbf 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -158,7 +158,7 @@ static struct device_node *vias;
 static struct device_node *gpio_node;
 #endif
 static unsigned char __iomem *gpio_reg;
-static int gpio_irq = 0;
+static int gpio_irq;
 static int gpio_irq_enabled = -1;
 static volatile int pmu_suspended;
 static spinlock_t pmu_lock;
@@ -313,7 +313,7 @@ int __init find_via_pmu(void)
 			PMU_INT_SNDBRT |
 			PMU_INT_ADB |
 			PMU_INT_TICK;
-	
+
 	if (of_node_name_eq(vias->parent, "ohare") ||
 	    of_device_is_compatible(vias->parent, "ohare"))
 		pmu_kind = PMU_OHARE_BASED;
@@ -336,7 +336,7 @@ int __init find_via_pmu(void)
 				PMU_INT_ADB |
 				PMU_INT_TICK |
 				PMU_INT_ENVIRONMENT;
-		
+
 		gpiop = of_find_node_by_name(NULL, "gpio");
 		if (gpiop) {
 			reg = of_get_property(gpiop, "reg", NULL);
@@ -358,7 +358,7 @@ int __init find_via_pmu(void)
 		printk(KERN_ERR "via-pmu: Can't map address !\n");
 		goto fail_via_remap;
 	}
-	
+
 	out_8(&via1[IER], IER_CLR | 0x7f);	/* disable all intrs */
 	out_8(&via1[IFR], 0x7f);			/* clear IFR */
 
@@ -368,7 +368,7 @@ int __init find_via_pmu(void)
 		goto fail_init;
 
 	sys_ctrler = SYS_CTRLER_PMU;
-	
+
 	return 1;
 
  fail_init:
@@ -623,7 +623,7 @@ init_pmu(void)
 	pmu_wait_complete(&req);
 	if (req.reply_len > 0)
 		pmu_version = req.reply[0];
-	
+
 	/* Read server mode setting */
 	if (pmu_kind == PMU_KEYLARGO_BASED) {
 		pmu_request(&req, NULL, 2, PMU_POWER_EVENTS,
@@ -664,11 +664,11 @@ static void pmu_set_server_mode(int server_mode)
 	if (server_mode)
 		pmu_request(&req, NULL, 4, PMU_POWER_EVENTS,
 			    PMU_PWR_SET_POWERUP_EVENTS,
-			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT); 
+			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT);
 	else
 		pmu_request(&req, NULL, 4, PMU_POWER_EVENTS,
 			    PMU_PWR_CLR_POWERUP_EVENTS,
-			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT); 
+			    req.reply[0], PMU_PWR_WAKEUP_AC_INSERT);
 	pmu_wait_complete(&req);
 }
 
@@ -684,8 +684,8 @@ done_battery_state_ohare(struct adb_request* req)
 	 *    0x01 :  AC indicator
 	 *    0x02 :  charging
 	 *    0x04 :  battery exist
-	 *    0x08 :  
-	 *    0x10 :  
+	 *    0x08 :
+	 *    0x10 :
 	 *    0x20 :  full charged
 	 *    0x40 :  pcharge reset
 	 *    0x80 :  battery exist
@@ -708,7 +708,7 @@ done_battery_state_ohare(struct adb_request* req)
 		pmu_power_flags |= PMU_PWR_AC_PRESENT;
 	else
 		pmu_power_flags &= ~PMU_PWR_AC_PRESENT;
-	
+
 	if (mb == PMAC_TYPE_COMET) {
 		vmax_charged = 189;
 		vmax_charging = 213;
@@ -771,26 +771,26 @@ done_battery_state_smart(struct adb_request* req)
 	/* format:
 	 *  [0] : format of this structure (known: 3,4,5)
 	 *  [1] : flags
-	 *  
+	 *
 	 *  format 3 & 4:
-	 *  
+	 *
 	 *  [2] : charge
 	 *  [3] : max charge
 	 *  [4] : current
 	 *  [5] : voltage
-	 *  
+	 *
 	 *  format 5:
-	 *  
+	 *
 	 *  [2][3] : charge
 	 *  [4][5] : max charge
 	 *  [6][7] : current
 	 *  [8][9] : voltage
 	 */
-	 
+
 	unsigned int bat_flags = PMU_BATT_TYPE_SMART;
 	int amperage;
 	unsigned int capa, max, voltage;
-	
+
 	if (req->reply[1] & 0x01)
 		pmu_power_flags |= PMU_PWR_AC_PRESENT;
 	else
@@ -798,7 +798,7 @@ done_battery_state_smart(struct adb_request* req)
 
 
 	capa = max = amperage = voltage = 0;
-	
+
 	if (req->reply[1] & 0x04) {
 		bat_flags |= PMU_BATT_PRESENT;
 		switch(req->reply[0]) {
@@ -897,7 +897,7 @@ static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
 static int pmu_battery_proc_show(struct seq_file *m, void *v)
 {
 	long batnum = (long)m->private;
-	
+
 	seq_putc(m, '\n');
 	seq_printf(m, "flags      : %08x\n", pmu_batteries[batnum].flags);
 	seq_printf(m, "charge     : %d\n", pmu_batteries[batnum].charge);
@@ -932,7 +932,7 @@ static ssize_t pmu_options_proc_write(struct file *file,
 	char tmp[33];
 	char *label, *val;
 	size_t fcount = count;
-	
+
 	if (!count)
 		return -EINVAL;
 	if (count > 32)
@@ -1304,7 +1304,7 @@ pmu_suspend(void)
 
 	if (pmu_state == uninitialized)
 		return;
-	
+
 	spin_lock_irqsave(&pmu_lock, flags);
 	pmu_suspended++;
 	if (pmu_suspended > 1) {
@@ -1430,7 +1430,7 @@ pmu_handle_data(unsigned char *data, int len)
 			      && data[1] == 0x2c && data[3] == 0xff
 			      && (data[2] & ~1) == 0xf4))
 				adb_input(data+1, len-1, 1);
-#endif /* CONFIG_ADB */		
+#endif /* CONFIG_ADB */
 		}
 		break;
 
@@ -1554,7 +1554,7 @@ pmu_sr_intr(void)
 			interrupt_data_len[int_data_last] = data_len;
 		} else {
 			req = current_req;
-			/* 
+			/*
 			 * For PMU sleep and freq change requests, we lock the
 			 * PMU until it's explicitly unlocked. This avoids any
 			 * spurrious event polling getting in
@@ -1589,7 +1589,7 @@ via_pmu_interrupt(int irq, void *arg)
 	/* This is a bit brutal, we can probably do better */
 	spin_lock_irqsave(&pmu_lock, flags);
 	++disable_poll;
-	
+
 	for (;;) {
 		/* On 68k Macs, VIA interrupts are dispatched individually.
 		 * Unless we are polling, the relevant IRQ flag has already
@@ -1653,7 +1653,7 @@ via_pmu_interrupt(int irq, void *arg)
 		} else if (current_req)
 			pmu_start();
 	}
-no_free_slot:			
+no_free_slot:
 	/* Mark the oldest buffer for flushing */
 	if (int_data_state[!int_data_last] == int_data_ready) {
 		int_data_state[!int_data_last] = int_data_flush;
@@ -1670,7 +1670,7 @@ via_pmu_interrupt(int irq, void *arg)
 		pmu_done(req);
 		req = NULL;
 	}
-		
+
 	/* Deal with interrupt datas outside of the lock */
 	if (int_data >= 0) {
 		pmu_handle_data(interrupt_data[int_data], interrupt_data_len[int_data]);
@@ -1776,7 +1776,7 @@ pmu_restart(void)
 	local_irq_disable();
 
 	drop_interrupts = 1;
-	
+
 	if (pmu_kind != PMU_KEYLARGO_BASED) {
 		pmu_request(&req, NULL, 2, PMU_SET_INTR_MASK, PMU_INT_ADB |
 						PMU_INT_TICK );
@@ -1830,7 +1830,7 @@ pmu_present(void)
 /*
  * Put the powerbook to sleep.
  */
- 
+
 static u32 save_via[8];
 static int __fake_sleep;
 
@@ -1901,7 +1901,7 @@ static int powerbook_sleep_grackle(void)
 
 	pci_read_config_word(grackle, 0x70, &pmcr1);
 	/* Apparently, MacOS uses NAP mode for Grackle ??? */
-	pmcr1 &= ~(GRACKLE_DOZE|GRACKLE_SLEEP); 
+	pmcr1 &= ~(GRACKLE_DOZE|GRACKLE_SLEEP);
 	pmcr1 |= GRACKLE_PM|GRACKLE_NAP;
 	pci_write_config_word(grackle, 0x70, pmcr1);
 
@@ -1913,7 +1913,7 @@ static int powerbook_sleep_grackle(void)
 
 	/* We're awake again, stop grackle PM */
 	pci_read_config_word(grackle, 0x70, &pmcr1);
-	pmcr1 &= ~(GRACKLE_PM|GRACKLE_DOZE|GRACKLE_SLEEP|GRACKLE_NAP); 
+	pmcr1 &= ~(GRACKLE_PM|GRACKLE_DOZE|GRACKLE_SLEEP|GRACKLE_NAP);
 	pci_write_config_word(grackle, 0x70, pmcr1);
 
 	pci_dev_put(grackle);
@@ -1921,11 +1921,11 @@ static int powerbook_sleep_grackle(void)
 	/* Make sure the PMU is idle */
 	pmac_call_feature(PMAC_FTR_SLEEP_STATE,NULL,0,0);
 	restore_via_state();
-	
+
 	/* Restore L2 cache */
 	if (save_l2cr != 0xffffffff && (save_l2cr & L2CR_L2E) != 0)
  		_set_L2CR(save_l2cr);
-	
+
 	/* Restore userland MMU context */
 	switch_mmu_context(NULL, current->active_mm, NULL);
 
@@ -1949,7 +1949,7 @@ powerbook_sleep_Core99(void)
 	unsigned long save_l2cr;
 	unsigned long save_l3cr;
 	struct adb_request req;
-	
+
 	if (pmac_call_feature(PMAC_FTR_SLEEP_STATE,NULL,0,-1) < 0) {
 		printk(KERN_ERR "Sleep mode not supported on this machine\n");
 		return -ENOSYS;
@@ -2014,7 +2014,7 @@ powerbook_sleep_Core99(void)
 	/* Restore L3 cache */
 	if (save_l3cr != 0xffffffff && (save_l3cr & L3CR_L3E) != 0)
  		_set_L3CR(save_l3cr);
-	
+
 	/* Restore userland MMU context */
 	switch_mmu_context(NULL, current->active_mm, NULL);
 
@@ -2173,7 +2173,7 @@ pmu_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t 
+static ssize_t
 pmu_read(struct file *file, char __user *buf,
 			size_t count, loff_t *ppos)
 {
@@ -2219,7 +2219,7 @@ pmu_read(struct file *file, char __user *buf,
 	__set_current_state(TASK_RUNNING);
 	remove_wait_queue(&pp->wait, &wait);
 	spin_unlock_irqrestore(&pp->lock, flags);
-	
+
 	return ret;
 }
 
@@ -2236,7 +2236,7 @@ pmu_fpoll(struct file *filp, poll_table *wait)
 	struct pmu_private *pp = filp->private_data;
 	__poll_t mask = 0;
 	unsigned long flags;
-	
+
 	if (!pp)
 		return 0;
 	poll_wait(filp, &pp->wait, wait);
@@ -2500,7 +2500,7 @@ device_initcall(pmu_device_init);
 
 
 #ifdef DEBUG_SLEEP
-static inline void 
+static inline void
 polled_handshake(void)
 {
 	via2[B] &= ~TREQ; eieio();
@@ -2511,7 +2511,7 @@ polled_handshake(void)
 		;
 }
 
-static inline void 
+static inline void
 polled_send_byte(int x)
 {
 	via1[ACR] |= SR_OUT | SR_EXT; eieio();
-- 
2.32.0

