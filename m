Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1A289952
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 22:11:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7K365zByzDqJf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 07:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7JbP43Q4zDqXs;
 Sat, 10 Oct 2020 06:50:53 +1100 (AEDT)
IronPort-SDR: TGvWEzC3RUgnATw9LeJ+22rwrYaDmyZXXnv32z89vbAb4ju/28zqyteUFdQo+/BIM8Yrm5e1Zl
 2pxwY2FcxPxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="152450731"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="152450731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:51 -0700
IronPort-SDR: r9rFWs4LxSt/DLhc0vk8qSUxzY/hR2W3QZLi44jmj/rGXS9Mfwq/Fn231GdfrO+iUZYF22umi/
 70MWS29lQZXg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529052813"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 02/58] x86/pks/test: Add testing for global option
Date: Fri,  9 Oct 2020 12:49:37 -0700
Message-Id: <20201009195033.3208459-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Now that PKS can be enabled globaly (for all threads) add a test which
spawns a thread and tests the same PKS functionality.

The test enables/disables PKS in 1 thread while attempting to access the
page in another thread.  We use the same test array as in the 'local'
PKS testing.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/x86/mm/fault.c |   4 ++
 lib/pks/pks_test.c  | 128 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 124 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 4b4ff9efa298..4c74f52fbc23 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1108,6 +1108,10 @@ static int spurious_kernel_fault_check(unsigned long error_code, pte_t *pte,
 		if (global_pkey_is_enabled(pte, is_write, irq_state))
 			return 1;
 
+		/*
+		 * NOTE: This must be after the global_pkey_is_enabled() call
+		 * to allow the fixup code to be tested.
+		 */
 		if (handle_pks_testing(error_code, irq_state))
 			return 1;
 
diff --git a/lib/pks/pks_test.c b/lib/pks/pks_test.c
index 286c8b8457da..dfddccbe4cb6 100644
--- a/lib/pks/pks_test.c
+++ b/lib/pks/pks_test.c
@@ -154,7 +154,8 @@ static void check_exception(irqentry_state_t *irq_state)
 	}
 
 	/* Check the exception state */
-	if (!check_pkrs(test_armed_key, PKEY_DISABLE_ACCESS)) {
+	if (!check_pkrs(test_armed_key,
+			PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)) {
 		pr_err("     FAIL: PKRS cache and MSR\n");
 		test_exception_ctx->pass = false;
 	}
@@ -308,24 +309,29 @@ static int test_it(struct pks_test_ctx *ctx, struct pks_access_test *test, void
 	return ret;
 }
 
-static int run_access_test(struct pks_test_ctx *ctx,
-			   struct pks_access_test *test,
-			   void *ptr)
+static void set_protection(int pkey, enum pks_access_mode mode, bool global)
 {
-	switch (test->mode) {
+	switch (mode) {
 		case PKS_TEST_NO_ACCESS:
-			pks_mknoaccess(ctx->pkey, false);
+			pks_mknoaccess(pkey, global);
 			break;
 		case PKS_TEST_RDWR:
-			pks_mkrdwr(ctx->pkey, false);
+			pks_mkrdwr(pkey, global);
 			break;
 		case PKS_TEST_RDONLY:
-			pks_mkread(ctx->pkey, false);
+			pks_mkread(pkey, global);
 			break;
 		default:
 			pr_err("BUG in test invalid mode\n");
 			break;
 	}
+}
+
+static int run_access_test(struct pks_test_ctx *ctx,
+			   struct pks_access_test *test,
+			   void *ptr)
+{
+	set_protection(ctx->pkey, test->mode, false);
 
 	return test_it(ctx, test, ptr);
 }
@@ -516,6 +522,110 @@ static void run_exception_test(void)
 		 pass ? "PASS" : "FAIL");
 }
 
+struct shared_data {
+	struct mutex lock;
+	struct pks_test_ctx *ctx;
+	void *kmap_addr;
+	struct pks_access_test *test;
+};
+
+static int thread_main(void *d)
+{
+	struct shared_data *data = d;
+	struct pks_test_ctx *ctx = data->ctx;
+
+	while (!kthread_should_stop()) {
+		mutex_lock(&data->lock);
+		/*
+		 * wait for the main thread to hand us the page
+		 * We should be spinning so hopefully we will not have gotten
+		 * the global value from a schedule in.
+		 */
+		if (data->kmap_addr) {
+			if (test_it(ctx, data->test, data->kmap_addr))
+				ctx->pass = false;
+			data->kmap_addr = NULL;
+		}
+		mutex_unlock(&data->lock);
+	}
+
+	return 0;
+}
+
+static void run_thread_access_test(struct shared_data *data,
+				   struct pks_test_ctx *ctx,
+				   struct pks_access_test *test,
+				   void *ptr)
+{
+	set_protection(ctx->pkey, test->mode, true);
+
+	pr_info("checking...  mode %s; write %s\n",
+			get_mode_str(test->mode), test->write ? "TRUE" : "FALSE");
+
+	mutex_lock(&data->lock);
+	data->test = test;
+	data->kmap_addr = ptr;
+	mutex_unlock(&data->lock);
+
+	while (data->kmap_addr) {
+		msleep(10);
+	}
+}
+
+static void run_global_test(void)
+{
+	struct task_struct *other_task;
+	struct pks_test_ctx *ctx;
+	struct shared_data data;
+	bool pass = true;
+	void *ptr;
+	int i;
+
+	pr_info("     ***** BEGIN: global pkey checking\n");
+
+	/* Set up context, data pgae, and thread */
+	ctx = alloc_ctx("global pkey test");
+	if (IS_ERR(ctx)) {
+		pr_err("     FAIL: no context\n");
+		pass = false;
+		goto result;
+	}
+	ptr = alloc_test_page(ctx->pkey);
+	if (!ptr) {
+		pr_err("     FAIL: no vmalloc page\n");
+		pass = false;
+		goto free_context;
+	}
+	other_task = kthread_run(thread_main, &data, "PKRS global test");
+	if (IS_ERR(other_task)) {
+		pr_err("     FAIL: Failed to start thread\n");
+		pass = false;
+		goto free_page;
+	}
+
+	memset(&data, 0, sizeof(data));
+	mutex_init(&data.lock);
+	data.ctx = ctx;
+
+	/* Start testing */
+	ctx->pass = true;
+
+	for (i = 0; i < ARRAY_SIZE(pkey_test_ary); i++) {
+		run_thread_access_test(&data, ctx, &pkey_test_ary[i], ptr);
+	}
+
+	kthread_stop(other_task);
+	pass = ctx->pass;
+
+free_page:
+	vfree(ptr);
+free_context:
+	free_ctx(ctx);
+result:
+	pr_info("     ***** END: global pkey checking : %s\n",
+		 pass ? "PASS" : "FAIL");
+}
+
 static void run_all(void)
 {
 	struct pks_test_ctx *ctx[PKS_NUM_KEYS];
@@ -538,6 +648,8 @@ static void run_all(void)
 	}
 
 	run_exception_test();
+
+	run_global_test();
 }
 
 static void crash_it(void)
-- 
2.28.0.rc0.12.gb6a658bd00c9

