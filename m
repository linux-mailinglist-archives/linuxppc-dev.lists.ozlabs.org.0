Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046B479D79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:44:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfWl0R13z3drw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:44:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aeyrRdsb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aeyrRdsb; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf0F2lyqz2yHj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:20:45 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso7462933ots.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yzUNsvJwnd0v47Q5AxP6lhYkyqcCWxa0P2De/g+O3S0=;
 b=aeyrRdsbMj+T7Uh+RBjZZWB/kA4U6108/E5yXjYzEClA1t4rVOhg/TvjA0URGEfjoS
 8yYx9V7mJF6lmAgq1RzTAn0dXWVtCFnCSFSksRA2bCDS1+uiI+TNu4nmPvKC0vculKAb
 2vav+lP6DUjfNbJW+bp5U8XrXK8lFMlsnqbY6Zewmwd9n5fAAW+kNcP//A8BmAU23hFg
 Lq0+BqGt31qmsHiR1/82tonV9twgXObMrhuAwajRpq5K5rv0K69gHMcZp/93pbohASi1
 adq5kjwvFtWTOSo4i7GJNxLBBtYCHu1eTmkd8vxkfTbiK5L1H6Us5Ch8+PPNqfwfmUKe
 oUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yzUNsvJwnd0v47Q5AxP6lhYkyqcCWxa0P2De/g+O3S0=;
 b=sxKupTDcqv4KaC3RwU0O4zpRPJ6ZzDL5Pqtpzlw8135paBKhPrkHitARHlvg596Vlr
 eQv8te8F5OMPpYvM4TRdNAKus7dFiBViDkKC6YKJNBEgg7xBWmixXqdVL/3AITLJQsvg
 wjluP7h3t8W8FnFE8R3u499VHY94pp8gBo5H7qtXzdlpFECcSmMOiV+nS8oxpqQlMdgC
 /c6YEUGwm4v7KIlthURwq67VJZxYDiMq54MR9sYETT0usYAJO3tTxxRZ8+49H0aC3FTx
 eFVOD9+b0cOHTAmEvkKgNPuYOO82u9AEhaqxZnws1vas49aINtMc+YBnFKpULt62CFmR
 k6gw==
X-Gm-Message-State: AOAM533CBVx7HesNBBnJ1n3tDdL/alT+W8d7GOWiSUGo+bKamRRRE2qj
 9lQM3Itvl//nC4h/Axd+xz4=
X-Google-Smtp-Source: ABdhPJwfIZ0Qa4eLLyeYlPDfGf2rm+0UPfH1JNF0NiYHXOLlCwWJPU0EMB/YwfrozpLsXV17jLZYCg==
X-Received: by 2002:a05:6830:2681:: with SMTP id
 l1mr6437156otu.378.1639862442812; 
 Sat, 18 Dec 2021 13:20:42 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id s1sm2263399ooo.11.2021.12.18.13.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:42 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/17] all: replace bitmap_weight with bitmap_weight_{eq, gt,
 ge, lt, le} where appropriate
Date: Sat, 18 Dec 2021 13:20:04 -0800
Message-Id: <20211218212014.1315894-9-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Dec 2021 08:39:01 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel code calls bitmap_weight() to compare the weight of bitmap with
a given number. We can do it more efficiently with bitmap_weight_{eq, ...}
because conditional bitmap_weight may stop traversing the bitmap earlier,
as soon as condition is met.

This patch replaces bitmap_weight with conditional versions where possible,
except for small bitmaps which size is not configurable and  known at
constant time. In that case conditional version of bitmap_weight would not
benefit due to small_const_nbits() optimization; but readability may
suffer.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c                 |  2 +-
 drivers/iio/dummy/iio_simple_dummy_buffer.c            |  4 ++--
 drivers/iio/industrialio-trigger.c                     |  2 +-
 drivers/memstick/core/ms_block.c                       |  4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c         |  2 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |  2 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_flows.c    |  4 ++--
 drivers/net/ethernet/mellanox/mlx4/cmd.c               | 10 +++-------
 drivers/net/ethernet/mellanox/mlx4/eq.c                |  4 ++--
 drivers/net/ethernet/mellanox/mlx4/fw.c                |  4 ++--
 drivers/net/ethernet/mellanox/mlx4/main.c              |  2 +-
 drivers/perf/thunderx2_pmu.c                           |  4 ++--
 drivers/staging/media/tegra-video/vi.c                 |  2 +-
 13 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index e23ff03290b8..9d42e592c1cf 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2752,7 +2752,7 @@ static int __init_one_rdt_domain(struct rdt_domain *d, struct resctrl_schema *s,
 	 * bitmap_weight() does not access out-of-bound memory.
 	 */
 	tmp_cbm = cfg->new_ctrl;
-	if (bitmap_weight(&tmp_cbm, r->cache.cbm_len) < r->cache.min_cbm_bits) {
+	if (bitmap_weight_lt(&tmp_cbm, r->cache.cbm_len, r->cache.min_cbm_bits)) {
 		rdt_last_cmd_printf("No space on %s:%d\n", s->name, d->id);
 		return -ENOSPC;
 	}
diff --git a/drivers/iio/dummy/iio_simple_dummy_buffer.c b/drivers/iio/dummy/iio_simple_dummy_buffer.c
index 59aa60d4ca37..cd2470ddf82b 100644
--- a/drivers/iio/dummy/iio_simple_dummy_buffer.c
+++ b/drivers/iio/dummy/iio_simple_dummy_buffer.c
@@ -72,8 +72,8 @@ static irqreturn_t iio_simple_dummy_trigger_h(int irq, void *p)
 		int i, j;
 
 		for (i = 0, j = 0;
-		     i < bitmap_weight(indio_dev->active_scan_mask,
-				       indio_dev->masklength);
+		     bitmap_weight_gt(indio_dev->active_scan_mask,
+				       indio_dev->masklength, i);
 		     i++, j++) {
 			j = find_next_bit(indio_dev->active_scan_mask,
 					  indio_dev->masklength, j);
diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index f504ed351b3e..98c54022fecf 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -331,7 +331,7 @@ int iio_trigger_detach_poll_func(struct iio_trigger *trig,
 {
 	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(pf->indio_dev);
 	bool no_other_users =
-		bitmap_weight(trig->pool, CONFIG_IIO_CONSUMERS_PER_TRIGGER) == 1;
+		bitmap_weight_eq(trig->pool, CONFIG_IIO_CONSUMERS_PER_TRIGGER, 1);
 	int ret = 0;
 
 	if (trig->ops && trig->ops->set_trigger_state && no_other_users) {
diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 0cda6c6baefc..5cdd987e78f7 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -155,8 +155,8 @@ static int msb_validate_used_block_bitmap(struct msb_data *msb)
 	for (i = 0; i < msb->zone_count; i++)
 		total_free_blocks += msb->free_block_count[i];
 
-	if (msb->block_count - bitmap_weight(msb->used_blocks_bitmap,
-					msb->block_count) == total_free_blocks)
+	if (bitmap_weight_eq(msb->used_blocks_bitmap, msb->block_count,
+				msb->block_count - total_free_blocks))
 		return 0;
 
 	pr_err("BUG: free block counts don't match the bitmap");
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
index 214a38de3f41..35297d8a488b 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
@@ -246,7 +246,7 @@ int ixgbe_disable_sriov(struct ixgbe_adapter *adapter)
 #endif
 
 	/* Disable VMDq flag so device will be set in VM mode */
-	if (bitmap_weight(adapter->fwd_bitmask, adapter->num_rx_pools) == 1) {
+	if (bitmap_weight_eq(adapter->fwd_bitmask, adapter->num_rx_pools, 1)) {
 		adapter->flags &= ~IXGBE_FLAG_VMDQ_ENABLED;
 		adapter->flags &= ~IXGBE_FLAG_SRIOV_ENABLED;
 		rss = min_t(int, ixgbe_max_rss_indices(adapter),
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
index d85db90632d6..a55fd1d0c653 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
@@ -287,7 +287,7 @@ static int otx2_set_channels(struct net_device *dev,
 	if (!channel->rx_count || !channel->tx_count)
 		return -EINVAL;
 
-	if (bitmap_weight(&pfvf->rq_bmap, pfvf->hw.rx_queues) > 1) {
+	if (bitmap_weight_gt(&pfvf->rq_bmap, pfvf->hw.rx_queues, 1)) {
 		netdev_err(dev,
 			   "Receive queues are in use by TC police action\n");
 		return -EINVAL;
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
index 80b2d64b4136..55c899a6fcdd 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
@@ -1170,8 +1170,8 @@ int otx2_remove_flow(struct otx2_nic *pfvf, u32 location)
 		 * interface mac address and configure CGX/RPM block in
 		 * promiscuous mode
 		 */
-		if (bitmap_weight(&flow_cfg->dmacflt_bmap,
-				  flow_cfg->dmacflt_max_flows) == 1)
+		if (bitmap_weight_eq(&flow_cfg->dmacflt_bmap,
+				     flow_cfg->dmacflt_max_flows, 1))
 			otx2_update_rem_pfmac(pfvf, DMAC_ADDR_DEL);
 	} else {
 		err = otx2_remove_flow_msg(pfvf, flow->entry, false);
diff --git a/drivers/net/ethernet/mellanox/mlx4/cmd.c b/drivers/net/ethernet/mellanox/mlx4/cmd.c
index c56d2194cbfc..5bca0c68f00a 100644
--- a/drivers/net/ethernet/mellanox/mlx4/cmd.c
+++ b/drivers/net/ethernet/mellanox/mlx4/cmd.c
@@ -2792,9 +2792,8 @@ int mlx4_slave_convert_port(struct mlx4_dev *dev, int slave, int port)
 {
 	unsigned n;
 	struct mlx4_active_ports actv_ports = mlx4_get_active_ports(dev, slave);
-	unsigned m = bitmap_weight(actv_ports.ports, dev->caps.num_ports);
 
-	if (port <= 0 || port > m)
+	if (port <= 0 || bitmap_weight_lt(actv_ports.ports, dev->caps.num_ports, port))
 		return -EINVAL;
 
 	n = find_first_bit(actv_ports.ports, dev->caps.num_ports);
@@ -3404,10 +3403,6 @@ int mlx4_vf_set_enable_smi_admin(struct mlx4_dev *dev, int slave, int port,
 	struct mlx4_priv *priv = mlx4_priv(dev);
 	struct mlx4_active_ports actv_ports = mlx4_get_active_ports(
 			&priv->dev, slave);
-	int min_port = find_first_bit(actv_ports.ports,
-				      priv->dev.caps.num_ports) + 1;
-	int max_port = min_port - 1 +
-		bitmap_weight(actv_ports.ports, priv->dev.caps.num_ports);
 
 	if (slave == mlx4_master_func_num(dev))
 		return 0;
@@ -3417,7 +3412,8 @@ int mlx4_vf_set_enable_smi_admin(struct mlx4_dev *dev, int slave, int port,
 	    enabled < 0 || enabled > 1)
 		return -EINVAL;
 
-	if (min_port == max_port && dev->caps.num_ports > 1) {
+	if (dev->caps.num_ports > 1 &&
+	    bitmap_weight_eq(actv_ports.ports, priv->dev.caps.num_ports, 1)) {
 		mlx4_info(dev, "SMI access disallowed for single ported VFs\n");
 		return -EPROTONOSUPPORT;
 	}
diff --git a/drivers/net/ethernet/mellanox/mlx4/eq.c b/drivers/net/ethernet/mellanox/mlx4/eq.c
index 414e390e6b48..0c09432ff389 100644
--- a/drivers/net/ethernet/mellanox/mlx4/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/eq.c
@@ -1435,8 +1435,8 @@ int mlx4_is_eq_shared(struct mlx4_dev *dev, int vector)
 	if (vector <= 0 || (vector >= dev->caps.num_comp_vectors + 1))
 		return -EINVAL;
 
-	return !!(bitmap_weight(priv->eq_table.eq[vector].actv_ports.ports,
-				dev->caps.num_ports) > 1);
+	return bitmap_weight_gt(priv->eq_table.eq[vector].actv_ports.ports,
+				dev->caps.num_ports, 1);
 }
 EXPORT_SYMBOL(mlx4_is_eq_shared);
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/fw.c b/drivers/net/ethernet/mellanox/mlx4/fw.c
index 42c96c9d7fb1..855aae326ccb 100644
--- a/drivers/net/ethernet/mellanox/mlx4/fw.c
+++ b/drivers/net/ethernet/mellanox/mlx4/fw.c
@@ -1300,8 +1300,8 @@ int mlx4_QUERY_DEV_CAP_wrapper(struct mlx4_dev *dev, int slave,
 	actv_ports = mlx4_get_active_ports(dev, slave);
 	first_port = find_first_bit(actv_ports.ports, dev->caps.num_ports);
 	for (slave_port = 0, real_port = first_port;
-	     real_port < first_port +
-	     bitmap_weight(actv_ports.ports, dev->caps.num_ports);
+	     bitmap_weight_gt(actv_ports.ports, dev->caps.num_ports,
+			      real_port - first_port);
 	     ++real_port, ++slave_port) {
 		if (flags & (MLX4_DEV_CAP_FLAG_WOL_PORT1 << real_port))
 			flags |= MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port;
diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
index b187c210d4d6..cfbaa7ac712f 100644
--- a/drivers/net/ethernet/mellanox/mlx4/main.c
+++ b/drivers/net/ethernet/mellanox/mlx4/main.c
@@ -1383,7 +1383,7 @@ static int mlx4_mf_bond(struct mlx4_dev *dev)
 		   dev->persist->num_vfs + 1);
 
 	/* only single port vfs are allowed */
-	if (bitmap_weight(slaves_port_1_2, dev->persist->num_vfs + 1) > 1) {
+	if (bitmap_weight_gt(slaves_port_1_2, dev->persist->num_vfs + 1, 1)) {
 		mlx4_warn(dev, "HA mode unsupported for dual ported VFs\n");
 		return -EINVAL;
 	}
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 05378c0fd8f3..ebfa66b212c7 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -623,8 +623,8 @@ static void tx2_uncore_event_start(struct perf_event *event, int flags)
 		return;
 
 	/* Start timer for first event */
-	if (bitmap_weight(tx2_pmu->active_counters,
-				tx2_pmu->max_counters) == 1) {
+	if (bitmap_weight_eq(tx2_pmu->active_counters,
+				tx2_pmu->max_counters, 1)) {
 		hrtimer_start(&tx2_pmu->hrtimer,
 			ns_to_ktime(tx2_pmu->hrtimer_interval),
 			HRTIMER_MODE_REL_PINNED);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 69d9787d5338..98d878a5ca6b 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -436,7 +436,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
 
-	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+	if (bitmap_weight_le(fmts_bitmap, MAX_FORMAT_NUM, f->index))
 		return -EINVAL;
 
 	for (i = 0; i < f->index + 1; i++, index++)
-- 
2.30.2

