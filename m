Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC3580934
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 03:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsKnn4VZ7z3bmY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 11:58:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hH8GmYmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hH8GmYmD;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsKnB6WLDz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 11:58:06 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 72so11968356pge.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iELE13c5EAmybvD3Vh3mx4VeAxK4EXpiqxVffBI81To=;
        b=hH8GmYmD/tKCI/+MEIhSwd5KFqMYKkKOz1hEtp2hdShCDxhvKsknHGDpRBp8lijY7E
         yLnEK1GRc5eXIUi1EAEQIhzSW0Jyt3UGgu+nFT2np7RbPZQRYIqWKU8b9wcy4F6NDQyo
         WNLuxFvy/K6w1B+fk/tQolzjUN94Q+7VIJskLksBaE082A9kIE9iTPCX5xfrE4r9Xxt/
         eh8s/ZTqFvIB/RgMeqyb0G7MzlfzwE80cmMMrDhTcJAtoWGtpt762gW/nx5DTq+/43ld
         T1itpR8LXvzjA3CJm/I1IjbJBk1pfW1ZGLNFPVW1SD+6lqSRQaHklBBlzgo6bzQSDHFZ
         jRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iELE13c5EAmybvD3Vh3mx4VeAxK4EXpiqxVffBI81To=;
        b=v6WP1tiE6vxSit6nJoJuMBej803E1d6XeXHq3iPhUXU85OOj1Nu8jdSYC9Dd/+NK9h
         Fnhnl6CEgoUv/1nCbltQDF+ElNFQcJ2C8/jkGJvB99zL/hFL/VHZfv8/15pVGXDRtzzH
         69XeXm6L1pes1dPaMxGYO+WmytfafrKfwTlmyfOEnpCZoVPnSNCt7Ez0z5Ial81uAdUN
         8fLcZapV3bOcCteKfuuLqoKT7F7xFVhjA4n7BeFgqgCxzYOYsjRnKvoDjtNy6LiHxpGq
         7gCgETpDCN3t+xaDOeS+e0Yzn0gCRpG7Y9fn/RmQCDhoMcNxpLAJOv5D/5cMpOc1iSQp
         z0ug==
X-Gm-Message-State: AJIora9FwXLlc1Sbu8S9KYD7PjNXFDEFiEjEFEUcVCIB3l0tyO9p86nU
	5d0lq/6LNb4BvYol9VtHhps=
X-Google-Smtp-Source: AGRyM1tX4TMBHZh0Kr9SwjeR5NUak/R8xzZVbqkNwX1Satxy5I0Vkzs5ymcvGmZs7wWgHJjL9C8XCQ==
X-Received: by 2002:a05:6a00:1a49:b0:528:6ea0:14e2 with SMTP id h9-20020a056a001a4900b005286ea014e2mr15078153pfv.22.1658800681435;
        Mon, 25 Jul 2022 18:58:01 -0700 (PDT)
Received: from localhost.localdomain ([194.5.48.100])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902780200b00168dadc7354sm9966560pll.78.2022.07.25.18.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 18:58:00 -0700 (PDT)
From: zhouzhouyi@gmail.com
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	frank.rowand@sony.com,
	robh@kernel.org,
	christophe.leroy@csgroup.eu,
	npiggin@gmail.com,
	nick.child@ibm.com,
	adobriyan@gmail.com,
	clg@kaod.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org,
	paulmck@kernel.org,
	rcu@vger.kernel.org,
	john.ogness@linutronix.de
Subject: [PATCH linux-next v2] powerpc: init jump label early in ppc 64
Date: Tue, 26 Jul 2022 09:57:47 +0800
Message-Id: <20220726015747.11754-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

In ppc 64, invoke jump_label_init in setup_feature_keys is too late
because static key will be used in subroutine of parse_early_param
which is again subroutine of early_init_devtree.

So we invoke jump_label_init just before parse_early_param in
early_init_devtree. 

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear PPC developers

I found this bug when trying to do rcutorture tests in ppc VM of
Open Source Lab of Oregon State University.

qemu-system-ppc64 -nographic -smp cores=8,threads=1 -net none -M pseries -nodefaults -device spapr-vscsi -serial file:/home/ubuntu/linux-next/tools/testing/selftests/rcutorture/res/2022.07.19-01.18.42-torture/results-rcutorture/TREE03/console.log -m 512 -kernel /home/ubuntu/linux-next/tools/testing/selftests/rcutorture/res/2022.07.19-01.18.42-torture/results-rcutorture/TREE03/vmlinux -append "debug_boot_weak_hash panic=-1 console=ttyS0 rcupdate.rcu_cpu_stall_suppress_at_boot=1 torture.disable_onoff_at_boot rcupdate.rcu_task_stall_timeout=30000 rcutorture.onoff_interval=200 rcutorture.onoff_holdoff=30 rcutree.gp_preinit_delay=12 rcutree.gp_init_delay=3 rcutree.gp_cleanup_delay=3 rcutree.kthread_prio=2 threadirqs tree.use_softirq=0 rcutorture.n_barrier_cbs=4 rcutorture.stat_interval=15 rcutorture.shutdown_secs=420 rcutorture.test_no_idle_hz=1 rcutorture.verbose=1"

console.log report following WARN:
[    0.000000][    T0] static_key_enable_cpuslocked(): static key '0xc000000002953260' used before call to jump_label_init()^M
[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/jump_label.c:166 static_key_enable_cpuslocked+0xfc/0x120^M
[    0.000000][    T0] Modules linked in:^M
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc5-next-20220708-dirty #131^M
[    0.000000][    T0] NIP:  c00000000038068c LR: c000000000380688 CTR: c000000000186ac0^M
[    0.000000][    T0] REGS: c000000002867930 TRAP: 0700   Not tainted  (5.19.0-rc5-next-20220708-dirty)^M
[    0.000000][    T0] MSR:  8000000000022003 <SF,FP,RI,LE>  CR: 24282224  XER: 20040000^M
[    0.000000][    T0] CFAR: 0000000000000730 IRQMASK: 1 ^M
[    0.000000][    T0] GPR00: c000000000380688 c000000002867bd0 c000000002868d00 0000000000000065 ^M
[    0.000000][    T0] GPR04: 0000000000000001 0000000000000000 0000000000000080 000000000000000d ^M
[    0.000000][    T0] GPR08: 0000000000000000 0000000000000000 c0000000027fd000 000000000000000f ^M
[    0.000000][    T0] GPR12: c000000000186ac0 c000000002082280 0000000000000003 000000000000000d ^M
[    0.000000][    T0] GPR16: 0000000002cc00d0 0000000000000000 c000000002082280 0000000000000001 ^M
[    0.000000][    T0] GPR20: c000000002080942 0000000000000000 0000000000000000 0000000000000000 ^M
[    0.000000][    T0] GPR24: 0000000000000000 c0000000010d6168 0000000000000000 c0000000020034c8 ^M
[    0.000000][    T0] GPR28: 0000002800000000 0000000000000000 c000000002080942 c000000002953260 ^M
[    0.000000][    T0] NIP [c00000000038068c] static_key_enable_cpuslocked+0xfc/0x120^M
[    0.000000][    T0] LR [c000000000380688] static_key_enable_cpuslocked+0xf8/0x120^M
[    0.000000][    T0] Call Trace:^M
[    0.000000][    T0] [c000000002867bd0] [c000000000380688] static_key_enable_cpuslocked+0xf8/0x120 (unreliable)^M
[    0.000000][    T0] [c000000002867c40] [c000000000380810] static_key_enable+0x30/0x50^M
[    0.000000][    T0] [c000000002867c70] [c000000002030314] setup_forced_irqthreads+0x28/0x40^M
[    0.000000][    T0] [c000000002867c90] [c000000002003568] do_early_param+0xa0/0x108^M
[    0.000000][    T0] [c000000002867d10] [c000000000175340] parse_args+0x290/0x4e0^M
[    0.000000][    T0] [c000000002867e10] [c000000002003c74] parse_early_options+0x48/0x5c^M
[    0.000000][    T0] [c000000002867e30] [c000000002003ce0] parse_early_param+0x58/0x84^M
[    0.000000][    T0] [c000000002867e60] [c000000002009878] early_init_devtree+0xd4/0x518^M
[    0.000000][    T0] [c000000002867f10] [c00000000200aee0] early_setup+0xb4/0x214^M

After this fix, the WARN does not show again.

Kind Regards
Zhouyi
--
 arch/powerpc/kernel/prom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 1066b072db35..bfe170ed6b12 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -751,7 +751,13 @@ void __init early_init_devtree(void *params)
 	early_init_dt_scan_root();
 	early_init_dt_scan_memory_ppc();
 
+	/*
+	 * As generic code authors expect to be able to use static keys
+	 * in early_param() handlers, we initialize the static keys just
+	 * before parsing early params (it's fine to call jump_label_init
+	 * more than once).
+	 */
+	jump_label_init();
 	parse_early_param();
 
 	/* make sure we've parsed cmdline for mem= before this */
-- 
2.25.1

