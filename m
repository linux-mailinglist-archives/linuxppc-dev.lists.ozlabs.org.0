Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 306591E4C30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 19:42:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XJ7H0RxVzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 03:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=gpqMIRSS; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XJ1Z2HYQzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 03:37:21 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RHRnBo159300;
 Wed, 27 May 2020 17:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=8ztsrQeoWYCfb7JFrFcvLi0nB8lJ6Flwt07F20xyilM=;
 b=gpqMIRSSRDyAsGxQlMF8vZZvbw67UlETR0Mnr72cjOwpYe0Fu71PErHhXJ57MowK5G9j
 KPMyoDxCtd8ftZ0dxmafqGRTebGZwMoyfbjbJNs8Dk8NCNX7Pp6cqK8jBwVcSqF/qmQC
 Afa/vq6EHmv0WPnhFYlm/adMUn9GxBRWz/lsQUWauDyLcVW5elLIA+5zQL+NGSDE/69F
 gCchPhIOaAe2utAl9+bvDytZrrMi8yh7lKWNbtfE5KFvsvrS/iXlmqz1s0ATRC1x8PE5
 fuWEgQVRtfEhjP45CtrMaaE7VULPtbrVaiUBRXt/8F4jkZktqLhUE6LzaS0UgMrRpu2N Jw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 318xbk0v54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 May 2020 17:36:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RHX5Au195653;
 Wed, 27 May 2020 17:36:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 317ddr6jux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 17:36:30 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04RHaPFx013665;
 Wed, 27 May 2020 17:36:25 GMT
Received: from localhost.localdomain (/98.229.125.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 May 2020 10:36:24 -0700
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: [PATCH v3 4/8] padata: add basic support for multithreaded jobs
Date: Wed, 27 May 2020 13:36:04 -0400
Message-Id: <20200527173608.2885243-5-daniel.m.jordan@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527173608.2885243-1-daniel.m.jordan@oracle.com>
References: <20200527173608.2885243-1-daniel.m.jordan@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=2 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 cotscore=-2147483648
 suspectscore=2 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005270136
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Steven Sistare <steven.sistare@oracle.com>,
 Pavel Machek <pavel@ucw.cz>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Zi Yan <ziy@nvidia.com>, Robert Elliott <elliott@hpe.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dan Williams <dan.j.williams@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sometimes the kernel doesn't take full advantage of system memory
bandwidth, leading to a single CPU spending excessive time in
initialization paths where the data scales with memory size.

Multithreading naturally addresses this problem.

Extend padata, a framework that handles many parallel yet singlethreaded
jobs, to also handle multithreaded jobs by adding support for splitting
up the work evenly, specifying a minimum amount of work that's
appropriate for one helper thread to do, load balancing between helpers,
and coordinating them.

This is inspired by work from Pavel Tatashin and Steve Sistare.

Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Tested-by: Josh Triplett <josh@joshtriplett.org>
---
 include/linux/padata.h |  29 ++++++++
 kernel/padata.c        | 152 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 178 insertions(+), 3 deletions(-)

diff --git a/include/linux/padata.h b/include/linux/padata.h
index 3bfa503503ac5..b0affa466a841 100644
--- a/include/linux/padata.h
+++ b/include/linux/padata.h
@@ -4,6 +4,9 @@
  *
  * Copyright (C) 2008, 2009 secunet Security Networks AG
  * Copyright (C) 2008, 2009 Steffen Klassert <steffen.klassert@secunet.com>
+ *
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ * Author: Daniel Jordan <daniel.m.jordan@oracle.com>
  */
 
 #ifndef PADATA_H
@@ -130,6 +133,31 @@ struct padata_shell {
 	struct list_head		list;
 };
 
+/**
+ * struct padata_mt_job - represents one multithreaded job
+ *
+ * @thread_fn: Called for each chunk of work that a padata thread does.
+ * @fn_arg: The thread function argument.
+ * @start: The start of the job (units are job-specific).
+ * @size: size of this node's work (units are job-specific).
+ * @align: Ranges passed to the thread function fall on this boundary, with the
+ *         possible exceptions of the beginning and end of the job.
+ * @min_chunk: The minimum chunk size in job-specific units.  This allows
+ *             the client to communicate the minimum amount of work that's
+ *             appropriate for one worker thread to do at once.
+ * @max_threads: Max threads to use for the job, actual number may be less
+ *               depending on task size and minimum chunk size.
+ */
+struct padata_mt_job {
+	void (*thread_fn)(unsigned long start, unsigned long end, void *arg);
+	void			*fn_arg;
+	unsigned long		start;
+	unsigned long		size;
+	unsigned long		align;
+	unsigned long		min_chunk;
+	int			max_threads;
+};
+
 /**
  * struct padata_instance - The overall control structure.
  *
@@ -171,6 +199,7 @@ extern void padata_free_shell(struct padata_shell *ps);
 extern int padata_do_parallel(struct padata_shell *ps,
 			      struct padata_priv *padata, int *cb_cpu);
 extern void padata_do_serial(struct padata_priv *padata);
+extern void __init padata_do_multithreaded(struct padata_mt_job *job);
 extern int padata_set_cpumask(struct padata_instance *pinst, int cpumask_type,
 			      cpumask_var_t cpumask);
 extern int padata_start(struct padata_instance *pinst);
diff --git a/kernel/padata.c b/kernel/padata.c
index 78ff9aa529204..e78f57d9aef90 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -7,6 +7,9 @@
  * Copyright (C) 2008, 2009 secunet Security Networks AG
  * Copyright (C) 2008, 2009 Steffen Klassert <steffen.klassert@secunet.com>
  *
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ * Author: Daniel Jordan <daniel.m.jordan@oracle.com>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -21,6 +24,7 @@
  * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
  */
 
+#include <linux/completion.h>
 #include <linux/export.h>
 #include <linux/cpumask.h>
 #include <linux/err.h>
@@ -32,6 +36,8 @@
 #include <linux/sysfs.h>
 #include <linux/rcupdate.h>
 
+#define	PADATA_WORK_ONSTACK	1	/* Work's memory is on stack */
+
 struct padata_work {
 	struct work_struct	pw_work;
 	struct list_head	pw_list;  /* padata_free_works linkage */
@@ -42,7 +48,17 @@ static DEFINE_SPINLOCK(padata_works_lock);
 static struct padata_work *padata_works;
 static LIST_HEAD(padata_free_works);
 
+struct padata_mt_job_state {
+	spinlock_t		lock;
+	struct completion	completion;
+	struct padata_mt_job	*job;
+	int			nworks;
+	int			nworks_fini;
+	unsigned long		chunk_size;
+};
+
 static void padata_free_pd(struct parallel_data *pd);
+static void __init padata_mt_helper(struct work_struct *work);
 
 static int padata_index_to_cpu(struct parallel_data *pd, int cpu_index)
 {
@@ -81,18 +97,56 @@ static struct padata_work *padata_work_alloc(void)
 }
 
 static void padata_work_init(struct padata_work *pw, work_func_t work_fn,
-			     void *data)
+			     void *data, int flags)
 {
-	INIT_WORK(&pw->pw_work, work_fn);
+	if (flags & PADATA_WORK_ONSTACK)
+		INIT_WORK_ONSTACK(&pw->pw_work, work_fn);
+	else
+		INIT_WORK(&pw->pw_work, work_fn);
 	pw->pw_data = data;
 }
 
+static int __init padata_work_alloc_mt(int nworks, void *data,
+				       struct list_head *head)
+{
+	int i;
+
+	spin_lock(&padata_works_lock);
+	/* Start at 1 because the current task participates in the job. */
+	for (i = 1; i < nworks; ++i) {
+		struct padata_work *pw = padata_work_alloc();
+
+		if (!pw)
+			break;
+		padata_work_init(pw, padata_mt_helper, data, 0);
+		list_add(&pw->pw_list, head);
+	}
+	spin_unlock(&padata_works_lock);
+
+	return i;
+}
+
 static void padata_work_free(struct padata_work *pw)
 {
 	lockdep_assert_held(&padata_works_lock);
 	list_add(&pw->pw_list, &padata_free_works);
 }
 
+static void __init padata_works_free(struct list_head *works)
+{
+	struct padata_work *cur, *next;
+
+	if (list_empty(works))
+		return;
+
+	spin_lock(&padata_works_lock);
+	list_for_each_entry_safe(cur, next, works, pw_list) {
+		list_del(&cur->pw_list);
+		padata_work_free(cur);
+	}
+	spin_unlock(&padata_works_lock);
+}
+
 static void padata_parallel_worker(struct work_struct *parallel_work)
 {
 	struct padata_work *pw = container_of(parallel_work, struct padata_work,
@@ -168,7 +222,7 @@ int padata_do_parallel(struct padata_shell *ps,
 	pw = padata_work_alloc();
 	spin_unlock(&padata_works_lock);
 	if (pw) {
-		padata_work_init(pw, padata_parallel_worker, padata);
+		padata_work_init(pw, padata_parallel_worker, padata, 0);
 		queue_work(pinst->parallel_wq, &pw->pw_work);
 	} else {
 		/* Maximum works limit exceeded, run in the current task. */
@@ -409,6 +463,98 @@ static int pd_setup_cpumasks(struct parallel_data *pd,
 	return err;
 }
 
+static void __init padata_mt_helper(struct work_struct *w)
+{
+	struct padata_work *pw = container_of(w, struct padata_work, pw_work);
+	struct padata_mt_job_state *ps = pw->pw_data;
+	struct padata_mt_job *job = ps->job;
+	bool done;
+
+	spin_lock(&ps->lock);
+
+	while (job->size > 0) {
+		unsigned long start, size, end;
+
+		start = job->start;
+		/* So end is chunk size aligned if enough work remains. */
+		size = roundup(start + 1, ps->chunk_size) - start;
+		size = min(size, job->size);
+		end = start + size;
+
+		job->start = end;
+		job->size -= size;
+
+		spin_unlock(&ps->lock);
+		job->thread_fn(start, end, job->fn_arg);
+		spin_lock(&ps->lock);
+	}
+
+	++ps->nworks_fini;
+	done = (ps->nworks_fini == ps->nworks);
+	spin_unlock(&ps->lock);
+
+	if (done)
+		complete(&ps->completion);
+}
+
+/**
+ * padata_do_multithreaded - run a multithreaded job
+ * @job: Description of the job.
+ *
+ * See the definition of struct padata_mt_job for more details.
+ */
+void __init padata_do_multithreaded(struct padata_mt_job *job)
+{
+	/* In case threads finish at different times. */
+	static const unsigned long load_balance_factor = 4;
+	struct padata_work my_work, *pw;
+	struct padata_mt_job_state ps;
+	LIST_HEAD(works);
+	int nworks;
+
+	if (job->size == 0)
+		return;
+
+	/* Ensure at least one thread when size < min_chunk. */
+	nworks = max(job->size / job->min_chunk, 1ul);
+	nworks = min(nworks, job->max_threads);
+
+	if (nworks == 1) {
+		/* Single thread, no coordination needed, cut to the chase. */
+		job->thread_fn(job->start, job->start + job->size, job->fn_arg);
+		return;
+	}
+
+	spin_lock_init(&ps.lock);
+	init_completion(&ps.completion);
+	ps.job	       = job;
+	ps.nworks      = padata_work_alloc_mt(nworks, &ps, &works);
+	ps.nworks_fini = 0;
+
+	/*
+	 * Chunk size is the amount of work a helper does per call to the
+	 * thread function.  Load balance large jobs between threads by
+	 * increasing the number of chunks, guarantee at least the minimum
+	 * chunk size from the caller, and honor the caller's alignment.
+	 */
+	ps.chunk_size = job->size / (ps.nworks * load_balance_factor);
+	ps.chunk_size = max(ps.chunk_size, job->min_chunk);
+	ps.chunk_size = roundup(ps.chunk_size, job->align);
+
+	list_for_each_entry(pw, &works, pw_list)
+		queue_work(system_unbound_wq, &pw->pw_work);
+
+	/* Use the current thread, which saves starting a workqueue worker. */
+	padata_work_init(&my_work, padata_mt_helper, &ps, PADATA_WORK_ONSTACK);
+	padata_mt_helper(&my_work.pw_work);
+
+	/* Wait for all the helpers to finish. */
+	wait_for_completion(&ps.completion);
+
+	destroy_work_on_stack(&my_work.pw_work);
+	padata_works_free(&works);
+}
+
 static void __padata_list_init(struct padata_list *pd_list)
 {
 	INIT_LIST_HEAD(&pd_list->list);
-- 
2.26.2

