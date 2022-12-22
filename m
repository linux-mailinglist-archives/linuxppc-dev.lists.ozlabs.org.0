Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2965421A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 14:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdBS32pLjz3fL2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 00:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yc8TZULH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yc8TZULH;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nd7rc4JLwz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 22:49:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709760; x=1703245760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mb5C0Q08zzL0licCWm6JekgDD5up38tTeg7UqDDgK3g=;
  b=Yc8TZULHwFEVHNzkJgKBZd52IpWj/yK5Hp06VH06yDJ0Qh7sCL5QodqN
   HLoqBN1A3OePhFF7clgLyTE3HqTtQ+XhqEBLkXhDzO8wRiBmlcqDRq0ra
   qD+lb9CEo8xmSLSIhJkTs0g3OOf3I+oweOOdTM0b7Za2Pu7UONc+dV3Yh
   z+HPIsOJuMYBKLIj+wqtvtjvviaaRBYBegGek5xaAEHfSI6OQBMM64MY+
   Ug/AHDn6kaygUj+jYT+TGxmB0pBS/mAF9ihKqy4Eo5LlDVnfbkklgVJU2
   AVUc4VJge5ml5rElTI/CTnWAOUe/knM8Lgf3xpvmGgbFTT+331EFJW0ue
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804967"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804967"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:49:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504977"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504977"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:49:12 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/19] drm/i915/gt: use __xchg instead of internal helper
Date: Thu, 22 Dec 2022 12:46:35 +0100
Message-Id: <20221222114635.1251934-20-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 00:29:21 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prefer core helper if available.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 2 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c     | 4 ++--
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c                 | 4 ++--
 drivers/gpu/drm/i915/gt/intel_gsc.c                  | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                   | 4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c                | 2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                  | 6 +++---
 drivers/gpu/drm/i915/gt/intel_migrate.c              | 2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                  | 2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                  | 2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c           | 2 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c   | 2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c          | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c            | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c                | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             | 2 +-
 drivers/gpu/drm/i915/i915_utils.h                    | 1 +
 18 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 99c4b866adddfa..aa548bd0b83687 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1042,7 +1042,7 @@ static void cleanup_status_page(struct intel_engine_cs *engine)
 	/* Prevent writes into HWSP after returning the page to the system */
 	intel_engine_set_hwsp_writemask(engine, ~0u);
 
-	vma = fetch_and_zero(&engine->status_page.vma);
+	vma = __xchg(&engine->status_page.vma, 0);
 	if (!vma)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 9a527e1f5be655..09befcc6a84fa1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -229,7 +229,7 @@ static void heartbeat(struct work_struct *wrk)
 	mutex_unlock(&ce->timeline->mutex);
 out:
 	if (!engine->i915->params.enable_hangcheck || !next_heartbeat(engine))
-		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
+		i915_request_put(__xchg(&engine->heartbeat.systole, 0));
 	intel_engine_pm_put(engine);
 }
 
@@ -244,7 +244,7 @@ void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine)
 void intel_engine_park_heartbeat(struct intel_engine_cs *engine)
 {
 	if (cancel_delayed_work(&engine->heartbeat.work))
-		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
+		i915_request_put(__xchg(&engine->heartbeat.systole, 0));
 }
 
 void intel_gt_unpark_heartbeats(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 49a8f10d76c77b..692f18e5a10ef3 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3197,7 +3197,7 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 		RB_CLEAR_NODE(rb);
 
 		spin_lock(&ve->base.sched_engine->lock);
-		rq = fetch_and_zero(&ve->request);
+		rq = __xchg(&ve->request, NULL);
 		if (rq) {
 			if (i915_request_mark_eio(rq)) {
 				rq->engine = engine;
@@ -3602,7 +3602,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 
 		spin_lock_irq(&ve->base.sched_engine->lock);
 
-		old = fetch_and_zero(&ve->request);
+		old = __xchg(&ve->request, NULL);
 		if (old) {
 			GEM_BUG_ON(!__i915_request_is_complete(old));
 			__i915_request_submit(old);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 0c7fe360f87331..81317187d0c5c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -684,7 +684,7 @@ static void fini_aliasing_ppgtt(struct i915_ggtt *ggtt)
 {
 	struct i915_ppgtt *ppgtt;
 
-	ppgtt = fetch_and_zero(&ggtt->alias);
+	ppgtt = __xchg(&ggtt->alias, NULL);
 	if (!ppgtt)
 		return;
 
@@ -1238,7 +1238,7 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 				   was_bound);
 
 		if (obj) { /* only used during resume => exclusive access */
-			write_domain_objs |= fetch_and_zero(&obj->write_domain);
+			write_domain_objs |= __xchg(&obj->write_domain, 0);
 			obj->read_domains |= I915_GEM_DOMAIN_GTT;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index bcc3605158dbde..38fbea757ba741 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -70,7 +70,7 @@ gsc_ext_om_alloc(struct intel_gsc *gsc, struct intel_gsc_intf *intf, size_t size
 
 static void gsc_ext_om_destroy(struct intel_gsc_intf *intf)
 {
-	struct drm_i915_gem_object *obj = fetch_and_zero(&intf->gem_obj);
+	struct drm_i915_gem_object *obj = __xchg(&intf->gem_obj, 0);
 
 	if (!obj)
 		return;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7eeee5a7cb33cb..03fe262de7bda5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -754,7 +754,7 @@ int intel_gt_init(struct intel_gt *gt)
 	intel_uc_fini(&gt->uc);
 err_engines:
 	intel_engines_release(gt);
-	i915_vm_put(fetch_and_zero(&gt->vm));
+	i915_vm_put(__xchg(&gt->vm, 0));
 err_pm:
 	intel_gt_pm_fini(gt);
 	intel_gt_fini_scratch(gt);
@@ -801,7 +801,7 @@ void intel_gt_driver_release(struct intel_gt *gt)
 {
 	struct i915_address_space *vm;
 
-	vm = fetch_and_zero(&gt->vm);
+	vm = __xchg(&gt->vm, 0);
 	if (vm) /* FIXME being called twice on error paths :( */
 		i915_vm_put(vm);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index c065950d0badec..219dfecf5f48db 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -123,7 +123,7 @@ static int __gt_unpark(struct intel_wakeref *wf)
 static int __gt_park(struct intel_wakeref *wf)
 {
 	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
-	intel_wakeref_t wakeref = fetch_and_zero(&gt->awake);
+	intel_wakeref_t wakeref = __xchg(&gt->awake, 0);
 	struct drm_i915_private *i915 = gt->i915;
 
 	GT_TRACE(gt, "\n");
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7771a19008c604..9dfa3c10ddc85f 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1144,7 +1144,7 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 static struct intel_timeline *
 pinned_timeline(struct intel_context *ce, struct intel_engine_cs *engine)
 {
-	struct intel_timeline *tl = fetch_and_zero(&ce->timeline);
+	struct intel_timeline *tl = __xchg(&ce->timeline, 0);
 
 	return intel_timeline_create_from_engine(engine, page_unmask_bits(tl));
 }
@@ -1261,8 +1261,8 @@ void lrc_fini(struct intel_context *ce)
 	if (!ce->state)
 		return;
 
-	intel_ring_put(fetch_and_zero(&ce->ring));
-	i915_vma_put(fetch_and_zero(&ce->state));
+	intel_ring_put(__xchg(&ce->ring, 0));
+	i915_vma_put(__xchg(&ce->state, 0));
 }
 
 void lrc_destroy(struct kref *kref)
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 3f638f19879685..3eab1867a4abee 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -1147,7 +1147,7 @@ void intel_migrate_fini(struct intel_migrate *m)
 {
 	struct intel_context *ce;
 
-	ce = fetch_and_zero(&m->context);
+	ce = __xchg(&m->context, 0);
 	if (!ce)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 2ee4051e4d9613..dde40fe05709cc 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -702,7 +702,7 @@ void intel_rc6_fini(struct intel_rc6 *rc6)
 
 	intel_rc6_disable(rc6);
 
-	pctx = fetch_and_zero(&rc6->pctx);
+	pctx = __xchg(&rc6->pctx, 0);
 	if (pctx)
 		i915_gem_object_put(pctx);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 9ad3bc7201cbaa..e34ca33b09d2e7 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1831,7 +1831,7 @@ static void rps_work(struct work_struct *work)
 	u32 pm_iir = 0;
 
 	spin_lock_irq(gt->irq_lock);
-	pm_iir = fetch_and_zero(&rps->pm_iir) & rps->pm_events;
+	pm_iir = __xchg(&rps->pm_iir, 0) & rps->pm_events;
 	client_boost = atomic_read(&rps->num_waiters);
 	spin_unlock_irq(gt->irq_lock);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 76fbae358072df..3f49ca1debc6ce 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -171,7 +171,7 @@ static int live_context_size(void *arg)
 		 * active state is sufficient, we are only checking that we
 		 * don't use more than we planned.
 		 */
-		saved = fetch_and_zero(&engine->default_state);
+		saved = __xchg(&engine->default_state, 0);
 
 		/* Overlaps with the execlists redzone */
 		engine->context_size += I915_GTT_PAGE_SIZE;
diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 87ceb0f374b673..a01aaca4fbf5ff 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -269,7 +269,7 @@ static int live_ctx_switch_wa(void *arg)
 		if (IS_GRAPHICS_VER(gt->i915, 4, 5))
 			continue; /* MI_STORE_DWORD is privileged! */
 
-		saved_wa = fetch_and_zero(&engine->wa_ctx.vma);
+		saved_wa = __xchg(&engine->wa_ctx.vma, 0);
 
 		intel_engine_pm_get(engine);
 		err = __live_ctx_switch_wa(engine);
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 522d0190509ccc..d14d5159024ec7 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -892,7 +892,7 @@ static int create_watcher(struct hwsp_watcher *w,
 static int check_watcher(struct hwsp_watcher *w, const char *name,
 			 bool (*op)(u32 hwsp, u32 seqno))
 {
-	struct i915_request *rq = fetch_and_zero(&w->rq);
+	struct i915_request *rq = __xchg(&w->rq, NULL);
 	u32 offset, end;
 	int err;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index fd21dbd2663bec..3f85d3f6fc6e92 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -110,7 +110,7 @@ void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
 	flush_work(&gsc->work);
 
 	if (gsc->ce)
-		intel_engine_destroy_pinned_context(fetch_and_zero(&gsc->ce));
+		intel_engine_destroy_pinned_context(__xchg(&gsc->ce, NULL));
 
 	i915_vma_unpin_and_release(&gsc->local, 0);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 9a8a1abf71d7fe..0292212cffbcb9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -169,7 +169,7 @@ static void __uc_capture_load_err_log(struct intel_uc *uc)
 
 static void __uc_free_load_err_log(struct intel_uc *uc)
 {
-	struct drm_i915_gem_object *log = fetch_and_zero(&uc->load_err_log);
+	struct drm_i915_gem_object *log = __xchg(&uc->load_err_log, NULL);
 
 	if (log)
 		i915_gem_object_put(log);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d6ff6c584c1e1d..21324c017aea49 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -1105,7 +1105,7 @@ void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw)
 	if (!intel_uc_fw_is_available(uc_fw))
 		return;
 
-	i915_gem_object_put(fetch_and_zero(&uc_fw->obj));
+	i915_gem_object_put(__xchg(&uc_fw->obj, NULL));
 
 	intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_SELECTED);
 }
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index b64192d9c7daa7..2394a4e9e53d4c 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -26,6 +26,7 @@
 #define __I915_UTILS_H
 
 #include <linux/list.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/overflow.h>
 #include <linux/sched.h>
 #include <linux/string_helpers.h>
-- 
2.34.1

