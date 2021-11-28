Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1674604EB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 07:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1z4l3H2qz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 17:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HUV4xgAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HUV4xgAm; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1vnR27jJz3035
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:57:15 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id z9so12898023qtj.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 19:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dxdtrkWjIsAObOF91A4CHCKcg7wYvsO77Q8J0GMQmL0=;
 b=HUV4xgAmywD+aIEa55S2obvZ9+LgB9utii+wNPMkfNudLrmnmmGB8htsibu3WL9DPu
 zVbx53zhl9CihoHBN5hD1Wh3+OUD3XtR5USQfBm37PvlK/f/kJ3Wuwq5XPFLNdwgmpkg
 9WnNmigesbQ+X6SfaqUhyeMs+rCppanDB9+OpF97MRwY23AXJ6YhrjUkwxliRcJHGk1f
 RuZl6rrVZXPXffsOWSmp/zn1RuINd4Hifm25z4UCgD9+32VgO2+ORgwyTSn3rCvn82am
 GJ1emQS5x1cr0MnMvmOmFnXf8fUlFbJsGr6X92ykhxYLeJBNWH+UTpMJUDO/ndAkPhTC
 FryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxdtrkWjIsAObOF91A4CHCKcg7wYvsO77Q8J0GMQmL0=;
 b=XJLrKLxWyTbQEDMEvHV/63jAZIzpAQ1qwh3yQxMJilPnFzawu+1pJC10d3iig4I+IC
 S2ib+Ya8CKwB71XPB8IaQ7XEMz5cw4ERdr/tyIJ/E9Cf4n0pEjP3eTSyZ25VQPrfuMg+
 vQS8tb9HEY8aNMUgtug4ulXXD+6GuLN0I+5L3w0hdJqsovqnWSnuipneCUqChOKoUOx+
 d0bLGum9b/5Ricpok9dbjSFA6FiOgqGHbQnVgx3iUvhbk58R14bzjUmAicnfdSiehdIR
 tVuCZweLlX32mcMiNuJnW5jUBCwvB7cwStgRQLZDT3TUrPh+RPZXR22jUwsyatDwBCwW
 i9+Q==
X-Gm-Message-State: AOAM530iWjZZxBFfsIDPsZY/5OkR31E536GTUkm6zaBqAQ34mAgBrW3m
 OrkzKqLoImFNHjVQPb0LrfU=
X-Google-Smtp-Source: ABdhPJyYuA1tWAvRSk5neF9LUvrERSnOVtUj+TYcibwLf09YOalpOkih4XDzQ31dg/2bH+gJRGN/Eg==
X-Received: by 2002:ac8:5e4f:: with SMTP id i15mr35533097qtx.408.1638071832229; 
 Sat, 27 Nov 2021 19:57:12 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id v17sm6218924qkl.123.2021.11.27.19.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:11 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
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
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron <jic23@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
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
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
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
Subject: [PATCH 3/9] all: replace bitmap_weigth() with bitmap_{empty, full, eq,
 gt, le}
Date: Sat, 27 Nov 2021 19:56:58 -0800
Message-Id: <20211128035704.270739-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Nov 2021 17:23:17 +1100
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

bitmap_weight() counts all set bits in the bitmap unconditionally.
However in some cases we can traverse a part of bitmap when we
only need to check if number of set bits is greater, less or equal
to some number.

This patch replaces bitmap_weight() with one of
bitmap_{empty,full,eq,gt,le), as appropriate.

In some places driver code has been optimized further, where it's
trivial.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/nds32/kernel/perf_event_cpu.c                 |  4 +---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c             |  4 ++--
 arch/x86/kvm/hyperv.c                              |  8 ++++----
 drivers/crypto/ccp/ccp-dev-v5.c                    |  5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |  2 +-
 drivers/iio/adc/mxs-lradc-adc.c                    |  3 +--
 drivers/iio/dummy/iio_simple_dummy_buffer.c        |  4 ++--
 drivers/iio/industrialio-buffer.c                  |  2 +-
 drivers/iio/industrialio-trigger.c                 |  2 +-
 drivers/memstick/core/ms_block.c                   |  4 ++--
 drivers/net/dsa/b53/b53_common.c                   |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c         |  6 +-----
 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c   |  4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c     |  2 +-
 .../ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |  2 +-
 .../ethernet/marvell/octeontx2/nic/otx2_flows.c    |  8 ++++----
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |  2 +-
 drivers/net/ethernet/mellanox/mlx4/cmd.c           | 10 +++-------
 drivers/net/ethernet/mellanox/mlx4/eq.c            |  4 ++--
 drivers/net/ethernet/mellanox/mlx4/main.c          |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_dev.c          |  3 +--
 drivers/net/ethernet/qlogic/qed/qed_rdma.c         |  4 ++--
 drivers/net/ethernet/qlogic/qed/qed_roce.c         |  2 +-
 drivers/perf/arm-cci.c                             |  2 +-
 drivers/perf/arm_pmu.c                             |  4 ++--
 drivers/perf/hisilicon/hisi_uncore_pmu.c           |  2 +-
 drivers/perf/thunderx2_pmu.c                       |  3 +--
 drivers/perf/xgene_pmu.c                           |  2 +-
 drivers/pwm/pwm-pca9685.c                          |  2 +-
 drivers/staging/media/tegra-video/vi.c             |  2 +-
 drivers/thermal/intel/intel_powerclamp.c           | 10 ++++------
 fs/ocfs2/cluster/heartbeat.c                       | 14 +++++++-------
 33 files changed, 57 insertions(+), 75 deletions(-)

diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
index a78a879e7ef1..05a1cd258356 100644
--- a/arch/nds32/kernel/perf_event_cpu.c
+++ b/arch/nds32/kernel/perf_event_cpu.c
@@ -695,10 +695,8 @@ static void nds32_pmu_enable(struct pmu *pmu)
 {
 	struct nds32_pmu *nds32_pmu = to_nds32_pmu(pmu);
 	struct pmu_hw_events *hw_events = nds32_pmu->get_hw_events();
-	int enabled = bitmap_weight(hw_events->used_mask,
-				    nds32_pmu->num_events);
 
-	if (enabled)
+	if (!bitmap_empty(hw_events->used_mask, nds32_pmu->num_events))
 		nds32_pmu->start(nds32_pmu);
 }
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index b57b3db9a6a7..94e7e6b420e4 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2749,10 +2749,10 @@ static int __init_one_rdt_domain(struct rdt_domain *d, struct resctrl_schema *s,
 	cfg->new_ctrl = cbm_ensure_valid(cfg->new_ctrl, r);
 	/*
 	 * Assign the u32 CBM to an unsigned long to ensure that
-	 * bitmap_weight() does not access out-of-bound memory.
+	 * bitmap_weight_le() does not access out-of-bound memory.
 	 */
 	tmp_cbm = cfg->new_ctrl;
-	if (bitmap_weight(&tmp_cbm, r->cache.cbm_len) < r->cache.min_cbm_bits) {
+	if (bitmap_weight_le(&tmp_cbm, r->cache.cbm_len, r->cache.min_cbm_bits) {
 		rdt_last_cmd_printf("No space on %s:%d\n", s->name, d->id);
 		return -ENOSPC;
 	}
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 5e19e6e4c2ce..8b72c896e0f1 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -90,7 +90,7 @@ static void synic_update_vector(struct kvm_vcpu_hv_synic *synic,
 {
 	struct kvm_vcpu *vcpu = hv_synic_to_vcpu(synic);
 	struct kvm_hv *hv = to_kvm_hv(vcpu->kvm);
-	int auto_eoi_old, auto_eoi_new;
+	bool auto_eoi_old, auto_eoi_new;
 
 	if (vector < HV_SYNIC_FIRST_VALID_VECTOR)
 		return;
@@ -100,16 +100,16 @@ static void synic_update_vector(struct kvm_vcpu_hv_synic *synic,
 	else
 		__clear_bit(vector, synic->vec_bitmap);
 
-	auto_eoi_old = bitmap_weight(synic->auto_eoi_bitmap, 256);
+	auto_eoi_old = bitmap_empty(synic->auto_eoi_bitmap, 256);
 
 	if (synic_has_vector_auto_eoi(synic, vector))
 		__set_bit(vector, synic->auto_eoi_bitmap);
 	else
 		__clear_bit(vector, synic->auto_eoi_bitmap);
 
-	auto_eoi_new = bitmap_weight(synic->auto_eoi_bitmap, 256);
+	auto_eoi_new = bitmap_empty(synic->auto_eoi_bitmap, 256);
 
-	if (!!auto_eoi_old == !!auto_eoi_new)
+	if (auto_eoi_old == auto_eoi_new)
 		return;
 
 	down_write(&vcpu->kvm->arch.apicv_update_lock);
diff --git a/drivers/crypto/ccp/ccp-dev-v5.c b/drivers/crypto/ccp/ccp-dev-v5.c
index 7b73332d6aa1..f569e8b99851 100644
--- a/drivers/crypto/ccp/ccp-dev-v5.c
+++ b/drivers/crypto/ccp/ccp-dev-v5.c
@@ -611,7 +611,6 @@ static int ccp_find_and_assign_lsb_to_q(struct ccp_device *ccp,
 {
 	DECLARE_BITMAP(qlsb, MAX_LSB_CNT);
 	int bitno;
-	int qlsb_wgt;
 	int i;
 
 	/* For each queue:
@@ -627,9 +626,7 @@ static int ccp_find_and_assign_lsb_to_q(struct ccp_device *ccp,
 	for (i = 0; i < ccp->cmd_q_count; i++) {
 		struct ccp_cmd_queue *cmd_q = &ccp->cmd_q[i];
 
-		qlsb_wgt = bitmap_weight(cmd_q->lsbmask, MAX_LSB_CNT);
-
-		if (qlsb_wgt == lsb_cnt) {
+		if (bitmap_weight_eq(cmd_q->lsbmask, MAX_LSB_CNT, lsb_cnt)) {
 			bitmap_copy(qlsb, cmd_q->lsbmask, MAX_LSB_CNT);
 
 			bitno = find_first_bit(qlsb, MAX_LSB_CNT);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index d7fa2c49e741..56a3063545ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -68,7 +68,7 @@ static int smp_request_block(struct mdp5_smp *smp,
 	uint8_t reserved;
 
 	/* we shouldn't be requesting blocks for an in-use client: */
-	WARN_ON(bitmap_weight(cs, cnt) > 0);
+	WARN_ON(!bitmap_empty(cs, cnt));
 
 	reserved = smp->reserved[cid];
 
diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index bca79a93cbe4..b3ec713b9c88 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -540,7 +540,6 @@ static bool mxs_lradc_adc_validate_scan_mask(struct iio_dev *iio,
 {
 	struct mxs_lradc_adc *adc = iio_priv(iio);
 	struct mxs_lradc *lradc = adc->lradc;
-	const int map_chans = bitmap_weight(mask, LRADC_MAX_TOTAL_CHANS);
 	int rsvd_chans = 0;
 	unsigned long rsvd_mask = 0;
 
@@ -561,7 +560,7 @@ static bool mxs_lradc_adc_validate_scan_mask(struct iio_dev *iio,
 		return false;
 
 	/* Test for attempts to map more channels then available slots. */
-	if (map_chans + rsvd_chans > LRADC_MAX_MAPPED_CHANS)
+	if (bitmap_weight_gt(mask, LRADC_MAX_TOTAL_CHANS, LRADC_MAX_MAPPED_CHAN - rsvd_chans)
 		return false;
 
 	return true;
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
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index e180728914c0..4487ece29218 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1804,7 +1804,7 @@ void iio_buffers_free_sysfs_and_mask(struct iio_dev *indio_dev)
 bool iio_validate_scan_mask_onehot(struct iio_dev *indio_dev,
 	const unsigned long *mask)
 {
-	return bitmap_weight(mask, indio_dev->masklength) == 1;
+	return bitmap_weight_eq(mask, indio_dev->masklength, 1);
 }
 EXPORT_SYMBOL_GPL(iio_validate_scan_mask_onehot);
 
diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 93990ff1dfe3..d8cedae0d9da 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -298,7 +298,7 @@ int iio_trigger_detach_poll_func(struct iio_trigger *trig,
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
diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index af4761968733..bc0cc2d226a9 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1620,7 +1620,7 @@ static int b53_arl_read(struct b53_device *dev, u64 mac,
 		return 0;
 	}
 
-	if (bitmap_weight(free_bins, dev->num_arl_bins) == 0)
+	if (bitmap_empty(free_bins, dev->num_arl_bins))
 		return -ENOSPC;
 
 	*idx = find_first_bit(free_bins, dev->num_arl_bins);
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 40933bf5a710..241696fdc6c7 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -2177,13 +2177,9 @@ static int bcm_sysport_rule_set(struct bcm_sysport_priv *priv,
 	if (nfc->fs.ring_cookie != RX_CLS_FLOW_WAKE)
 		return -EOPNOTSUPP;
 
-	/* All filters are already in use, we cannot match more rules */
-	if (bitmap_weight(priv->filters, RXCHK_BRCM_TAG_MAX) ==
-	    RXCHK_BRCM_TAG_MAX)
-		return -ENOSPC;
-
 	index = find_first_zero_bit(priv->filters, RXCHK_BRCM_TAG_MAX);
 	if (index >= RXCHK_BRCM_TAG_MAX)
+		/* All filters are already in use, we cannot match more rules */
 		return -ENOSPC;
 
 	/* Location is the classification ID, and index is the position
diff --git a/drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c b/drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c
index 217ff5e9a6f1..9d3ed351d77f 100644
--- a/drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c
@@ -384,8 +384,8 @@ ice_set_pfe_link(struct ice_vf *vf, struct virtchnl_pf_event *pfe,
  */
 static bool ice_vf_has_no_qs_ena(struct ice_vf *vf)
 {
-	return (!bitmap_weight(vf->rxq_ena, ICE_MAX_RSS_QS_PER_VF) &&
-		!bitmap_weight(vf->txq_ena, ICE_MAX_RSS_QS_PER_VF));
+	return bitmap_empty(vf->rxq_ena, ICE_MAX_RSS_QS_PER_VF) &&
+	       bitmap_empty(vf->txq_ena, ICE_MAX_RSS_QS_PER_VF);
 }
 
 /**
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
index 77a13fb555fb..55c899a6fcdd 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_flows.c
@@ -353,7 +353,7 @@ int otx2_add_macfilter(struct net_device *netdev, const u8 *mac)
 {
 	struct otx2_nic *pf = netdev_priv(netdev);
 
-	if (bitmap_weight(&pf->flow_cfg->dmacflt_bmap,
+	if (!bitmap_empty(&pf->flow_cfg->dmacflt_bmap,
 			  pf->flow_cfg->dmacflt_max_flows))
 		netdev_warn(netdev,
 			    "Add %pM to CGX/RPM DMAC filters list as well\n",
@@ -436,7 +436,7 @@ int otx2_get_maxflows(struct otx2_flow_config *flow_cfg)
 		return 0;
 
 	if (flow_cfg->nr_flows == flow_cfg->max_flows ||
-	    bitmap_weight(&flow_cfg->dmacflt_bmap,
+	    !bitmap_empty(&flow_cfg->dmacflt_bmap,
 			  flow_cfg->dmacflt_max_flows))
 		return flow_cfg->max_flows + flow_cfg->dmacflt_max_flows;
 	else
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
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index 1333edf1c361..d51623ff605c 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -1115,7 +1115,7 @@ static int otx2_cgx_config_loopback(struct otx2_nic *pf, bool enable)
 	struct msg_req *msg;
 	int err;
 
-	if (enable && bitmap_weight(&pf->flow_cfg->dmacflt_bmap,
+	if (enable && !bitmap_empty(&pf->flow_cfg->dmacflt_bmap,
 				    pf->flow_cfg->dmacflt_max_flows))
 		netdev_warn(pf->netdev,
 			    "CGX/RPM internal loopback might not work as DMAC filters are active\n");
diff --git a/drivers/net/ethernet/mellanox/mlx4/cmd.c b/drivers/net/ethernet/mellanox/mlx4/cmd.c
index e10b7b04b894..766128749bd0 100644
--- a/drivers/net/ethernet/mellanox/mlx4/cmd.c
+++ b/drivers/net/ethernet/mellanox/mlx4/cmd.c
@@ -2803,9 +2803,8 @@ int mlx4_slave_convert_port(struct mlx4_dev *dev, int slave, int port)
 {
 	unsigned n;
 	struct mlx4_active_ports actv_ports = mlx4_get_active_ports(dev, slave);
-	unsigned m = bitmap_weight(actv_ports.ports, dev->caps.num_ports);
 
-	if (port <= 0 || port > m)
+	if (port <= 0 || bitmap_weight_le(actv_ports.ports, dev->caps.num_ports, port))
 		return -EINVAL;
 
 	n = find_first_bit(actv_ports.ports, dev->caps.num_ports);
@@ -3415,10 +3414,6 @@ int mlx4_vf_set_enable_smi_admin(struct mlx4_dev *dev, int slave, int port,
 	struct mlx4_priv *priv = mlx4_priv(dev);
 	struct mlx4_active_ports actv_ports = mlx4_get_active_ports(
 			&priv->dev, slave);
-	int min_port = find_first_bit(actv_ports.ports,
-				      priv->dev.caps.num_ports) + 1;
-	int max_port = min_port - 1 +
-		bitmap_weight(actv_ports.ports, priv->dev.caps.num_ports);
 
 	if (slave == mlx4_master_func_num(dev))
 		return 0;
@@ -3428,7 +3423,8 @@ int mlx4_vf_set_enable_smi_admin(struct mlx4_dev *dev, int slave, int port,
 	    enabled < 0 || enabled > 1)
 		return -EINVAL;
 
-	if (min_port == max_port && dev->caps.num_ports > 1) {
+	if (bitmap_weight_eq(actv_ports.ports, priv->dev.caps.num_ports, 1) &&
+	    dev->caps.num_ports > 1) {
 		mlx4_info(dev, "SMI access disallowed for single ported VFs\n");
 		return -EPROTONOSUPPORT;
 	}
diff --git a/drivers/net/ethernet/mellanox/mlx4/eq.c b/drivers/net/ethernet/mellanox/mlx4/eq.c
index 9e48509ed3b2..1b38c95ba4f5 100644
--- a/drivers/net/ethernet/mellanox/mlx4/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/eq.c
@@ -1437,8 +1437,8 @@ int mlx4_is_eq_shared(struct mlx4_dev *dev, int vector)
 	if (vector <= 0 || (vector >= dev->caps.num_comp_vectors + 1))
 		return -EINVAL;
 
-	return !!(bitmap_weight(priv->eq_table.eq[vector].actv_ports.ports,
-				dev->caps.num_ports) > 1);
+	return bitmap_weight_gt(priv->eq_table.eq[vector].actv_ports.ports,
+				dev->caps.num_ports, 1);
 }
 EXPORT_SYMBOL(mlx4_is_eq_shared);
 
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
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
index c8757c5a812b..ec81ef9299e6 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
@@ -1670,7 +1670,7 @@ static int mlx5e_set_fecparam(struct net_device *netdev,
 	int err;
 
 	bitmap_from_arr32(&fec_bitmap, &fecparam->fec, sizeof(fecparam->fec) * BITS_PER_BYTE);
-	if (bitmap_weight(&fec_bitmap, ETHTOOL_FEC_LLRS_BIT + 1) > 1)
+	if (bitmap_weight_gt(&fec_bitmap, ETHTOOL_FEC_LLRS_BIT + 1, 1))
 		return -EOPNOTSUPP;
 
 	for (mode = 0; mode < ARRAY_SIZE(pplm_fec_2_ethtool); mode++) {
diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index cc4ec2bb36db..3a588decffb5 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -1702,8 +1702,7 @@ static u16 *qed_init_qm_get_idx_from_flags(struct qed_hwfn *p_hwfn,
 	struct qed_qm_info *qm_info = &p_hwfn->qm_info;
 
 	/* Can't have multiple flags set here */
-	if (bitmap_weight(&pq_flags,
-			  sizeof(pq_flags) * BITS_PER_BYTE) > 1) {
+	if (bitmap_weight_gt(&pq_flags, sizeof(pq_flags) * BITS_PER_BYTE, 1)) {
 		DP_ERR(p_hwfn, "requested multiple pq flags 0x%lx\n", pq_flags);
 		goto err;
 	}
diff --git a/drivers/net/ethernet/qlogic/qed/qed_rdma.c b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
index 23b668de4640..b6e2e17bac04 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_rdma.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
@@ -336,7 +336,7 @@ void qed_rdma_bmap_free(struct qed_hwfn *p_hwfn,
 
 	/* print aligned non-zero lines, if any */
 	for (item = 0, line = 0; line < last_line; line++, item += 8)
-		if (bitmap_weight((unsigned long *)&pmap[item], 64 * 8))
+		if (!bitmap_empty((unsigned long *)&pmap[item], 64 * 8))
 			DP_NOTICE(p_hwfn,
 				  "line 0x%04x: 0x%016llx 0x%016llx 0x%016llx 0x%016llx 0x%016llx 0x%016llx 0x%016llx 0x%016llx\n",
 				  line,
@@ -350,7 +350,7 @@ void qed_rdma_bmap_free(struct qed_hwfn *p_hwfn,
 
 	/* print last unaligned non-zero line, if any */
 	if ((bmap->max_count % (64 * 8)) &&
-	    (bitmap_weight((unsigned long *)&pmap[item],
+	    (!bitmap_empty((unsigned long *)&pmap[item],
 			   bmap->max_count - item * 64))) {
 		offset = sprintf(str_last_line, "line 0x%04x: ", line);
 		for (; item < last_item; item++)
diff --git a/drivers/net/ethernet/qlogic/qed/qed_roce.c b/drivers/net/ethernet/qlogic/qed/qed_roce.c
index 071b4aeaddf2..134ecfca96a3 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_roce.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_roce.c
@@ -76,7 +76,7 @@ void qed_roce_stop(struct qed_hwfn *p_hwfn)
 	 * We delay for a short while if an async destroy QP is still expected.
 	 * Beyond the added delay we clear the bitmap anyway.
 	 */
-	while (bitmap_weight(rcid_map->bitmap, rcid_map->max_count)) {
+	while (!bitmap_empty(rcid_map->bitmap, rcid_map->max_count)) {
 		/* If the HW device is during recovery, all resources are
 		 * immediately reset without receiving a per-cid indication
 		 * from HW. In this case we don't expect the cid bitmap to be
diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 54aca3a62814..96e09fa40909 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1096,7 +1096,7 @@ static void cci_pmu_enable(struct pmu *pmu)
 {
 	struct cci_pmu *cci_pmu = to_cci_pmu(pmu);
 	struct cci_pmu_hw_events *hw_events = &cci_pmu->hw_events;
-	int enabled = bitmap_weight(hw_events->used_mask, cci_pmu->num_cntrs);
+	bool enabled = !bitmap_empty(hw_events->used_mask, cci_pmu->num_cntrs);
 	unsigned long flags;
 
 	if (!enabled)
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 295cc7952d0e..a31b302b0ade 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -524,7 +524,7 @@ static void armpmu_enable(struct pmu *pmu)
 {
 	struct arm_pmu *armpmu = to_arm_pmu(pmu);
 	struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
-	int enabled = bitmap_weight(hw_events->used_mask, armpmu->num_events);
+	bool enabled = !bitmap_empty(hw_events->used_mask, armpmu->num_events);
 
 	/* For task-bound events we may be called on other CPUs */
 	if (!cpumask_test_cpu(smp_processor_id(), &armpmu->supported_cpus))
@@ -785,7 +785,7 @@ static int cpu_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
 {
 	struct arm_pmu *armpmu = container_of(b, struct arm_pmu, cpu_pm_nb);
 	struct pmu_hw_events *hw_events = this_cpu_ptr(armpmu->hw_events);
-	int enabled = bitmap_weight(hw_events->used_mask, armpmu->num_events);
+	bool enabled = !bitmap_empty(hw_events->used_mask, armpmu->num_events);
 
 	if (!cpumask_test_cpu(smp_processor_id(), &armpmu->supported_cpus))
 		return NOTIFY_DONE;
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index a738aeab5c04..358e4e284a62 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -393,7 +393,7 @@ EXPORT_SYMBOL_GPL(hisi_uncore_pmu_read);
 void hisi_uncore_pmu_enable(struct pmu *pmu)
 {
 	struct hisi_pmu *hisi_pmu = to_hisi_pmu(pmu);
-	int enabled = bitmap_weight(hisi_pmu->pmu_events.used_mask,
+	bool enabled = !bitmap_empty(hisi_pmu->pmu_events.used_mask,
 				    hisi_pmu->num_counters);
 
 	if (!enabled)
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 05378c0fd8f3..c8fee2e1e6d4 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -623,8 +623,7 @@ static void tx2_uncore_event_start(struct perf_event *event, int flags)
 		return;
 
 	/* Start timer for first event */
-	if (bitmap_weight(tx2_pmu->active_counters,
-				tx2_pmu->max_counters) == 1) {
+	if (bitmap_weight_eq(tx2_pmu->active_counters, tx2_pmu->max_counters, 1)) {
 		hrtimer_start(&tx2_pmu->hrtimer,
 			ns_to_ktime(tx2_pmu->hrtimer_interval),
 			HRTIMER_MODE_REL_PINNED);
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 2b6d476bd213..88bd100a9633 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -867,7 +867,7 @@ static void xgene_perf_pmu_enable(struct pmu *pmu)
 {
 	struct xgene_pmu_dev *pmu_dev = to_pmu_dev(pmu);
 	struct xgene_pmu *xgene_pmu = pmu_dev->parent;
-	int enabled = bitmap_weight(pmu_dev->cntr_assign_mask,
+	bool enabled = !bitmap_empty(pmu_dev->cntr_assign_mask,
 			pmu_dev->max_counters);
 
 	if (!enabled)
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index c56001a790d0..49841a5681fb 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -98,7 +98,7 @@ static bool pca9685_prescaler_can_change(struct pca9685 *pca, int channel)
 	if (bitmap_empty(pca->pwms_enabled, PCA9685_MAXCHAN + 1))
 		return true;
 	/* More than one PWM enabled: Change not allowed */
-	if (bitmap_weight(pca->pwms_enabled, PCA9685_MAXCHAN + 1) > 1)
+	if (bitmap_weight_gt(pca->pwms_enabled, PCA9685_MAXCHAN + 1, 1))
 		return false;
 	/*
 	 * Only one PWM enabled: Change allowed if the PWM about to
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 69d9787d5338..dfb7435aca83 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -436,7 +436,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
 
-	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+	if (bitmap_weight_le(fmts_bitmap, MAX_FORMAT_NUM, f->index + 1))
 		return -EINVAL;
 
 	for (i = 0; i < f->index + 1; i++, index++)
diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/intel/intel_powerclamp.c
index 9b68489a2356..72cf8925ea3c 100644
--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -556,12 +556,10 @@ static void end_power_clamp(void)
 	 * stop faster.
 	 */
 	clamping = false;
-	if (bitmap_weight(cpu_clamping_mask, num_possible_cpus())) {
-		for_each_set_bit(i, cpu_clamping_mask, num_possible_cpus()) {
-			pr_debug("clamping worker for cpu %d alive, destroy\n",
-				 i);
-			stop_power_clamp_worker(i);
-		}
+	for_each_set_bit(i, cpu_clamping_mask, num_possible_cpus()) {
+		pr_debug("clamping worker for cpu %d alive, destroy\n",
+			 i);
+		stop_power_clamp_worker(i);
 	}
 }
 
diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index a17be1618bf7..fb2de42400e5 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -874,8 +874,8 @@ static void o2hb_set_quorum_device(struct o2hb_region *reg)
 	 * If global heartbeat active, unpin all regions if the
 	 * region count > CUT_OFF
 	 */
-	if (bitmap_weight(o2hb_quorum_region_bitmap,
-			   O2NM_MAX_REGIONS) > O2HB_PIN_CUT_OFF)
+	if (bitmap_weight_gt(o2hb_quorum_region_bitmap,
+			   O2NM_MAX_REGIONS, O2HB_PIN_CUT_OFF))
 		o2hb_region_unpin(NULL);
 unlock:
 	spin_unlock(&o2hb_live_lock);
@@ -1845,7 +1845,7 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	live_threshold = O2HB_LIVE_THRESHOLD;
 	if (o2hb_global_heartbeat_active()) {
 		spin_lock(&o2hb_live_lock);
-		if (bitmap_weight(o2hb_region_bitmap, O2NM_MAX_REGIONS) == 1)
+		if (bitmap_weight_eq(o2hb_region_bitmap, O2NM_MAX_REGIONS, 1))
 			live_threshold <<= 1;
 		spin_unlock(&o2hb_live_lock);
 	}
@@ -2120,8 +2120,8 @@ static void o2hb_heartbeat_group_drop_item(struct config_group *group,
 	if (!o2hb_dependent_users)
 		goto unlock;
 
-	if (bitmap_weight(o2hb_quorum_region_bitmap,
-			   O2NM_MAX_REGIONS) <= O2HB_PIN_CUT_OFF)
+	if (bitmap_weight_le(o2hb_quorum_region_bitmap,
+			   O2NM_MAX_REGIONS, O2HB_PIN_CUT_OFF + 1))
 		o2hb_region_pin(NULL);
 
 unlock:
@@ -2364,8 +2364,8 @@ static int o2hb_region_inc_user(const char *region_uuid)
 	if (o2hb_dependent_users > 1)
 		goto unlock;
 
-	if (bitmap_weight(o2hb_quorum_region_bitmap,
-			   O2NM_MAX_REGIONS) <= O2HB_PIN_CUT_OFF)
+	if (bitmap_weight_le(o2hb_quorum_region_bitmap,
+			   O2NM_MAX_REGIONS, O2HB_PIN_CUT_OFF + 1))
 		ret = o2hb_region_pin(NULL);
 
 unlock:
-- 
2.25.1

