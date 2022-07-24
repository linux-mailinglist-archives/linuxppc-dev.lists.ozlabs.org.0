Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5857F26B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 03:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lr4fq57LNz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 11:03:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwoWxf6q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwoWxf6q;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lr4f95b8Qz3bXy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 11:02:39 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so7233682pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 18:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnMePAjlxfqugbwA3tp6h6RFCc5B1OEQTh1N6m+wjeE=;
        b=OwoWxf6q/XqRD0WQiN+4+CVfXv4K783W9L7JdqbWGvT9EkFquACP2USzwgr1BBWZcs
         UgFa7nkl5dwNbRGqz0+stQx+lYc/wuvHeQFSqSLwHxd8pYFSbLbfYIUH9vDKO1CR9+FW
         2yvL/KayQ4QKgWJ2HIKDPNL+qTja4CjGdVdCWaOLk7ArHY44EtypiRYybXNwi/Jdr5lq
         S3y39XpJqiS0QSZxK1PSq0YToPR+T28HcNP83uKyGgjrlB5Ez8y8Mk3G+alrWQ43yePF
         6eidm9naEOPDsCmECj5JQW+XhHh+7nf9OCIAZMrQb8rkpUvtyNyO0mk4xO71ZW0oKIgH
         8VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnMePAjlxfqugbwA3tp6h6RFCc5B1OEQTh1N6m+wjeE=;
        b=bw1gpJhfUuqFnI67nA6fUQA3pa8zh3nkKto9Un5yqYPAhvAdOpVvnSCCEe5vxj5KVu
         LGLu7Xz2P1+Qbs2yJdx1MY1syU5GGsXsHiZ/vHtIfdSdbJebtNeA6308LVYLNz7w9mMZ
         cOVge6BRlgZHd/SM2jGptrUYLZkHdddBd72xJVQRO+2ZYiU7CGuBlCBUGGXbfa2WoB3O
         nmb88YjzngV5c1U4AF9HD2sV8pxuASN2EuSwNQYVScMsB6zS+b8K9v71K10MiQI+DSJI
         eiklvQUO4QjymGWTxGVp8Y/NAoiaX1/55fnbOsKXs7ruOJbnxbGDMsXEmIKdJlHW7kN3
         vZSg==
X-Gm-Message-State: AJIora9+nPN9moHtoD1om0I+4Z9NQgOg85n07Fm1tbCgx/H0vwnbUu5y
	96LfpzqtlykxcELQKy7kCJQ=
X-Google-Smtp-Source: AGRyM1vzFM2UWLBfSDMyYJQbiiyXGWXRTPwC5zsCa8kurF/e71YFSJZxsOOehXI9DiAtwv2OMMtl4Q==
X-Received: by 2002:a17:90a:bc1:b0:1f2:435f:94bc with SMTP id x1-20020a17090a0bc100b001f2435f94bcmr7431584pjd.5.1658624554996;
        Sat, 23 Jul 2022 18:02:34 -0700 (PDT)
Received: from localhost.localdomain ([194.5.48.112])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001677d4a9654sm6286171ple.265.2022.07.23.18.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 18:02:34 -0700 (PDT)
From: zhouzhouyi@gmail.com
To: john.ogness@linutronix.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	akpm@linux-foundation.org,
	christophe.leroy@csgroup.eu,
	wangkefeng.wang@huawei.com,
	npiggin@gmail.com,
	rppt@kernel.org,
	aneesh.kumar@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org,
	paulmck@kernel.org,
	rcu@vger.kernel.org
Subject: [PATCH linux-next] powerpc: init jump label early in ppc 64
Date: Sun, 24 Jul 2022 09:02:21 +0800
Message-Id: <20220724010221.17371-1-zhouzhouyi@gmail.com>
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
because static key will be used in subroutine of early_init_devtree.

So we can invoke jump_label_init earlier in early_setup.
We can not move setup_feature_keys backward because its subroutine
cpu_feature_keys_init depend on data structures initialized in
early_init_devtree.

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
 arch/powerpc/kernel/setup_64.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2b2d0b0fbb30..bf2fb76221da 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -365,6 +365,9 @@ void __init early_setup(unsigned long dt_ptr)
 
 	udbg_printf(" -> %s(), dt_ptr: 0x%lx\n", __func__, dt_ptr);
 
+	/* Initialise jump label because subsequent calls need it */
+	jump_label_init();
+
 	/*
 	 * Do early initialization using the flattened device
 	 * tree, such as retrieving the physical memory map or
@@ -394,8 +397,15 @@ void __init early_setup(unsigned long dt_ptr)
 
 	/* Apply all the dynamic patching */
 	apply_feature_fixups();
-	setup_feature_keys();
+
+	/*
+	 * All the cpu/mmu_has_feature() checks take on their correct polarity
+	 * based on the current set of CPU/MMU features. These should be done
+	 * only after early_init_devtree.
+	 */
+	cpu_feature_keys_init();
+	mmu_feature_keys_init();
+
 
 	/* Initialize the hash table or TLB handling */
 	early_init_mmu();
-- 
2.25.1

