Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45190524301
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 05:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzGsf1BNBz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 13:07:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d6ZqPlGq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d6ZqPlGq; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzGs10nQWz3bdP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 13:06:44 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id g184so3432041pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zm77XuKLZiFKCTXff9/DZf2N76nza4knTVrJw3dY7k=;
 b=d6ZqPlGqZU64GDD4AaDMtWZonPd74O6ETXNgB4PxggKQxFnT45BAv3MNchxszSGq7j
 ZhgXTpXcrDwIeX426COYuKuBgM/U+tU3IZHjmnoLieyXRgAEgKOcfGPzuzD8RbXISyrB
 82Pv0j/XIdHrQcdb32iFTjuE3h0ZSXGAE70DG3fpOdgp+OfwiYhxEUDaSLPLrq4lnt3Q
 Wq2TOJMTTlT0tBFZDbXRkdNJRYiCvheTmW131DugG073TzojAiGVGKX/RZWgrlu888Vr
 +LfMfKsgmleZ62f3O9ve2rXuyFTi/XbyEp80vqt4Ti/jOdPpFTaLUjOENmIBTfGI67Kh
 18aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zm77XuKLZiFKCTXff9/DZf2N76nza4knTVrJw3dY7k=;
 b=ubtxEINP6tEzGtzLNQUm0CRyo+hTBQSo3SirxVBmHq3TxTqVhSp7Bk9O/i3bNyMgw8
 NOMg5yAsC9vXLw5bhPduvQHS9rmvMFeq/p9gOvwhxUC1FNNzfhgJ5CVoUM80ao1m57Pg
 /bvdoiWzxVwl1EaXC1+oc0LifLhWbF9G+/X0PuZ/xMvy1XoYTBKApS5HleMSZX1ofIYg
 c162mkDuSqla+Budk5TncJyCrmM/fDkhogEk3KLJOa0MEjSb1kmz7sAyI7LAucbNPIFs
 mGm7A0tT95syB5NI6Z2WBkHkEWS2TIg6W4ekEIHxU9rXZey7M4S1+ZOEfvNNtL0GMkay
 jFnw==
X-Gm-Message-State: AOAM531mcFacx0tUkm+nzV/0ZoqZImJNWdW8I3/Xh6mEPsOyXMyRxtuT
 5OJv6ARJOPxBxxIa3fqytOw/A0lP2A==
X-Google-Smtp-Source: ABdhPJz+qdiTcvw4bPKG8OCo9I2d73PxA49RGqUHPWRCJ9GqlXcyuwY3unb7/BI6LdSPeVzPvJ+2oA==
X-Received: by 2002:a62:7994:0:b0:4e1:58c4:ddfd with SMTP id
 u142-20020a627994000000b004e158c4ddfdmr9287569pfc.65.1652324801708; 
 Wed, 11 May 2022 20:06:41 -0700 (PDT)
Received: from piliu.users.ipa.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e13-20020aa7980d000000b0050dc762815bsm2488162pfl.53.2022.05.11.20.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 20:06:41 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv4 1/2] cpu/hotplug: Keep cpu hotplug disabled until the
 rebooting cpu is stable
Date: Thu, 12 May 2022 11:06:18 +0800
Message-Id: <20220512030619.13426-2-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220512030619.13426-1-kernelfans@gmail.com>
References: <20220512030619.13426-1-kernelfans@gmail.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Vincent Donnefort <vincent.donnefort@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>, Pingfan Liu <kernelfans@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Baokun Li <libaokun1@huawei.com>, Eric Biederman <ebiederm@xmission.com>,
 kexec@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

smp_shutdown_nonboot_cpus() repeats the same code chunk as
migrate_to_reboot_cpu() to ensure that the rebooting happens on a valid
cpu.

	if (!cpu_online(primary_cpu))
		primary_cpu = cpumask_first(cpu_online_mask);

This is due to an unexpected cpu-down event like the following:
kernel_kexec()
   migrate_to_reboot_cpu();
   cpu_hotplug_enable();
                        -----------> comes a cpu_down(this_cpu) on other cpu
   machine_shutdown();
     smp_shutdown_nonboot_cpus();    which needs to re-check "if (!cpu_online(primary_cpu))"

Although the kexec-reboot task can get through a cpu_down() on its cpu,
this code looks a little confusing.

Tracing down the git history, the cpu_hotplug_enable() called by
kernel_kexec() is introduced by commit 011e4b02f1da ("powerpc, kexec:
Fix "Processor X is stuck" issue during kexec from ST mode"), which
wakes up all offline cpu by cpu_up(cpu). Later, it is required by the
architectures(arm/arm64/ia64/riscv) which resort to cpu hot-removing to
achieve kexec-reboot by
smp_shutdown_nonboot_cpus()->cpu_down_maps_locked().

Hence, the cpu_hotplug_enable() in kernel_kexec() is an architecture
requirement.

By deferring the cpu hotplug enable to a more proper point, where
smp_shutdown_nonboot_cpus() holds cpu_add_remove_lock, the
unexpected cpu-down event is squashed out and the rebooting cpu can keep
unchanged. (For powerpc, no gains from this change.)

As a result, the repeated code chunk can be removed and in [2/2], the
callsites of smp_shutdown_nonboot_cpus() can be consistent.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vincent Donnefort <vincent.donnefort@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: YueHaibing <yuehaibing@huawei.com>
Cc: Baokun Li <libaokun1@huawei.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
To: linux-kernel@vger.kernel.org
---
 arch/powerpc/kexec/core_64.c |  1 +
 kernel/cpu.c                 | 10 +++++-----
 kernel/kexec_core.c          | 11 +++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 6cc7793b8420..8ccf22197f08 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -224,6 +224,7 @@ static void wake_offline_cpus(void)
 
 static void kexec_prepare_cpus(void)
 {
+	cpu_hotplug_enable();
 	wake_offline_cpus();
 	smp_call_function(kexec_smp_down, NULL, /* wait */0);
 	local_irq_disable();
diff --git a/kernel/cpu.c b/kernel/cpu.c
index d0a9aa0b42e8..4415370f0e91 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1236,12 +1236,12 @@ void smp_shutdown_nonboot_cpus(unsigned int primary_cpu)
 	cpu_maps_update_begin();
 
 	/*
-	 * Make certain the cpu I'm about to reboot on is online.
-	 *
-	 * This is inline to what migrate_to_reboot_cpu() already do.
+	 * At this point, the cpu hotplug is still disabled by
+	 * migrate_to_reboot_cpu() to guarantee that the rebooting happens on
+	 * the selected CPU.  But cpu_down_maps_locked() returns -EBUSY, if
+	 * cpu_hotplug_disabled. So re-enable CPU hotplug here.
 	 */
-	if (!cpu_online(primary_cpu))
-		primary_cpu = cpumask_first(cpu_online_mask);
+	__cpu_hotplug_enable();
 
 	for_each_online_cpu(cpu) {
 		if (cpu == primary_cpu)
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 68480f731192..1bd5a8c95a20 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1168,14 +1168,13 @@ int kernel_kexec(void)
 		kexec_in_progress = true;
 		kernel_restart_prepare("kexec reboot");
 		migrate_to_reboot_cpu();
-
 		/*
-		 * migrate_to_reboot_cpu() disables CPU hotplug assuming that
-		 * no further code needs to use CPU hotplug (which is true in
-		 * the reboot case). However, the kexec path depends on using
-		 * CPU hotplug again; so re-enable it here.
+		 * migrate_to_reboot_cpu() disables CPU hotplug and pin the
+		 * rebooting thread on the selected CPU. If an architecture
+		 * requires CPU hotplug to achieve kexec reboot, it should
+		 * enable the hotplug in the architecture specific code
 		 */
-		cpu_hotplug_enable();
+
 		pr_notice("Starting new kernel\n");
 		machine_shutdown();
 	}
-- 
2.31.1

