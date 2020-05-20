Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F061DBCFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 20:37:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S1hY4FygzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 04:37:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=t1HrSf+u; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S1TB0B6dzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 04:27:51 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KIHRrk000780;
 Wed, 20 May 2020 18:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=inOVoPdk3ShCeURbGvONf8SqJIpbyrKXmxbqcuxhVCI=;
 b=t1HrSf+uEOH0m5wOK12ubs73IKJPe+bsE2s3oI6aoFmtyOaukq5E24DSC81lgl/jYprj
 iftP8wiQ4g3PgZH27U2TlPWynvgHMyg6t+9khIaSEp/7ZbG8kZPfSmZ4SgwXqmPq87Tb
 BG44VDpiwdWR/aIT5mMtVINeJzAqAOO7EQdv9gk340YR010pLJzzwPpxr+VovGIjpBZM
 aY9bKBsqPVevgjkUReS5PTW1st4GQUrwv0VlBt/QjIvLTXUI2Y56jf9/riwf7YFRgJyf
 R06AbGgvX3m3Fm4b671ZskCozgSz9qCo6yqtDQNHVC5+pLsuHP6JhcafymP3O//QClG2 lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31501rb89q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 18:27:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KIDBaU187377;
 Wed, 20 May 2020 18:27:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 312t38cm0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 18:27:03 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04KIQxW9004547;
 Wed, 20 May 2020 18:26:59 GMT
Received: from localhost.localdomain (/98.229.125.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 11:26:59 -0700
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: [PATCH v2 3/7] padata: allocate work structures for parallel jobs
 from a pool
Date: Wed, 20 May 2020 14:26:41 -0400
Message-Id: <20200520182645.1658949-4-daniel.m.jordan@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
References: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=2 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200148
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

padata allocates per-CPU, per-instance work structs for parallel jobs.
A do_parallel call assigns a job to a sequence number and hashes the
number to a CPU, where the job will eventually run using the
corresponding work.

This approach fit with how padata used to bind a job to each CPU
round-robin, makes less sense after commit bfde23ce200e6 ("padata:
unbind parallel jobs from specific CPUs") because a work isn't bound to
a particular CPU anymore, and isn't needed at all for multithreaded jobs
because they don't have sequence numbers.

Replace the per-CPU works with a preallocated pool, which allows sharing
them between existing padata users and the upcoming multithreaded user.
The pool will also facilitate setting NUMA-aware concurrency limits with
later users.

The pool is sized according to the number of possible CPUs.  With this
limit, MAX_OBJ_NUM no longer makes sense, so remove it.

If the global pool is exhausted, a parallel job is run in the current
task instead to throttle a system trying to do too much in parallel.

Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
---
 include/linux/padata.h |   8 +--
 kernel/padata.c        | 118 +++++++++++++++++++++++++++--------------
 2 files changed, 78 insertions(+), 48 deletions(-)

diff --git a/include/linux/padata.h b/include/linux/padata.h
index 476ecfa41f363..3bfa503503ac5 100644
--- a/include/linux/padata.h
+++ b/include/linux/padata.h
@@ -24,7 +24,6 @@
  * @list: List entry, to attach to the padata lists.
  * @pd: Pointer to the internal control structure.
  * @cb_cpu: Callback cpu for serializatioon.
- * @cpu: Cpu for parallelization.
  * @seq_nr: Sequence number of the parallelized data object.
  * @info: Used to pass information from the parallel to the serial function.
  * @parallel: Parallel execution function.
@@ -34,7 +33,6 @@ struct padata_priv {
 	struct list_head	list;
 	struct parallel_data	*pd;
 	int			cb_cpu;
-	int			cpu;
 	unsigned int		seq_nr;
 	int			info;
 	void                    (*parallel)(struct padata_priv *padata);
@@ -68,15 +66,11 @@ struct padata_serial_queue {
 /**
  * struct padata_parallel_queue - The percpu padata parallel queue
  *
- * @parallel: List to wait for parallelization.
  * @reorder: List to wait for reordering after parallel processing.
- * @work: work struct for parallelization.
  * @num_obj: Number of objects that are processed by this cpu.
  */
 struct padata_parallel_queue {
-       struct padata_list    parallel;
        struct padata_list    reorder;
-       struct work_struct    work;
        atomic_t              num_obj;
 };
 
@@ -111,7 +105,7 @@ struct parallel_data {
 	struct padata_parallel_queue	__percpu *pqueue;
 	struct padata_serial_queue	__percpu *squeue;
 	atomic_t			refcnt;
-	atomic_t			seq_nr;
+	unsigned int			seq_nr;
 	unsigned int			processed;
 	int				cpu;
 	struct padata_cpumask		cpumask;
diff --git a/kernel/padata.c b/kernel/padata.c
index 6f709bc0fc413..78ff9aa529204 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -32,7 +32,15 @@
 #include <linux/sysfs.h>
 #include <linux/rcupdate.h>
 
-#define MAX_OBJ_NUM 1000
+struct padata_work {
+	struct work_struct	pw_work;
+	struct list_head	pw_list;  /* padata_free_works linkage */
+	void			*pw_data;
+};
+
+static DEFINE_SPINLOCK(padata_works_lock);
+static struct padata_work *padata_works;
+static LIST_HEAD(padata_free_works);
 
 static void padata_free_pd(struct parallel_data *pd);
 
@@ -58,30 +66,44 @@ static int padata_cpu_hash(struct parallel_data *pd, unsigned int seq_nr)
 	return padata_index_to_cpu(pd, cpu_index);
 }
 
-static void padata_parallel_worker(struct work_struct *parallel_work)
+static struct padata_work *padata_work_alloc(void)
 {
-	struct padata_parallel_queue *pqueue;
-	LIST_HEAD(local_list);
+	struct padata_work *pw;
 
-	local_bh_disable();
-	pqueue = container_of(parallel_work,
-			      struct padata_parallel_queue, work);
+	lockdep_assert_held(&padata_works_lock);
 
-	spin_lock(&pqueue->parallel.lock);
-	list_replace_init(&pqueue->parallel.list, &local_list);
-	spin_unlock(&pqueue->parallel.lock);
+	if (list_empty(&padata_free_works))
+		return NULL;	/* No more work items allowed to be queued. */
 
-	while (!list_empty(&local_list)) {
-		struct padata_priv *padata;
+	pw = list_first_entry(&padata_free_works, struct padata_work, pw_list);
+	list_del(&pw->pw_list);
+	return pw;
+}
 
-		padata = list_entry(local_list.next,
-				    struct padata_priv, list);
+static void padata_work_init(struct padata_work *pw, work_func_t work_fn,
+			     void *data)
+{
+	INIT_WORK(&pw->pw_work, work_fn);
+	pw->pw_data = data;
+}
 
-		list_del_init(&padata->list);
+static void padata_work_free(struct padata_work *pw)
+{
+	lockdep_assert_held(&padata_works_lock);
+	list_add(&pw->pw_list, &padata_free_works);
+}
 
-		padata->parallel(padata);
-	}
+static void padata_parallel_worker(struct work_struct *parallel_work)
+{
+	struct padata_work *pw = container_of(parallel_work, struct padata_work,
+					      pw_work);
+	struct padata_priv *padata = pw->pw_data;
 
+	local_bh_disable();
+	padata->parallel(padata);
+	spin_lock(&padata_works_lock);
+	padata_work_free(pw);
+	spin_unlock(&padata_works_lock);
 	local_bh_enable();
 }
 
@@ -105,9 +127,9 @@ int padata_do_parallel(struct padata_shell *ps,
 		       struct padata_priv *padata, int *cb_cpu)
 {
 	struct padata_instance *pinst = ps->pinst;
-	int i, cpu, cpu_index, target_cpu, err;
-	struct padata_parallel_queue *queue;
+	int i, cpu, cpu_index, err;
 	struct parallel_data *pd;
+	struct padata_work *pw;
 
 	rcu_read_lock_bh();
 
@@ -135,25 +157,25 @@ int padata_do_parallel(struct padata_shell *ps,
 	if ((pinst->flags & PADATA_RESET))
 		goto out;
 
-	if (atomic_read(&pd->refcnt) >= MAX_OBJ_NUM)
-		goto out;
-
-	err = 0;
 	atomic_inc(&pd->refcnt);
 	padata->pd = pd;
 	padata->cb_cpu = *cb_cpu;
 
-	padata->seq_nr = atomic_inc_return(&pd->seq_nr);
-	target_cpu = padata_cpu_hash(pd, padata->seq_nr);
-	padata->cpu = target_cpu;
-	queue = per_cpu_ptr(pd->pqueue, target_cpu);
-
-	spin_lock(&queue->parallel.lock);
-	list_add_tail(&padata->list, &queue->parallel.list);
-	spin_unlock(&queue->parallel.lock);
+	rcu_read_unlock_bh();
 
-	queue_work(pinst->parallel_wq, &queue->work);
+	spin_lock(&padata_works_lock);
+	padata->seq_nr = ++pd->seq_nr;
+	pw = padata_work_alloc();
+	spin_unlock(&padata_works_lock);
+	if (pw) {
+		padata_work_init(pw, padata_parallel_worker, padata);
+		queue_work(pinst->parallel_wq, &pw->pw_work);
+	} else {
+		/* Maximum works limit exceeded, run in the current task. */
+		padata->parallel(padata);
+	}
 
+	return 0;
 out:
 	rcu_read_unlock_bh();
 
@@ -324,8 +346,9 @@ static void padata_serial_worker(struct work_struct *serial_work)
 void padata_do_serial(struct padata_priv *padata)
 {
 	struct parallel_data *pd = padata->pd;
+	int hashed_cpu = padata_cpu_hash(pd, padata->seq_nr);
 	struct padata_parallel_queue *pqueue = per_cpu_ptr(pd->pqueue,
-							   padata->cpu);
+							   hashed_cpu);
 	struct padata_priv *cur;
 
 	spin_lock(&pqueue->reorder.lock);
@@ -416,8 +439,6 @@ static void padata_init_pqueues(struct parallel_data *pd)
 		pqueue = per_cpu_ptr(pd->pqueue, cpu);
 
 		__padata_list_init(&pqueue->reorder);
-		__padata_list_init(&pqueue->parallel);
-		INIT_WORK(&pqueue->work, padata_parallel_worker);
 		atomic_set(&pqueue->num_obj, 0);
 	}
 }
@@ -451,7 +472,7 @@ static struct parallel_data *padata_alloc_pd(struct padata_shell *ps)
 
 	padata_init_pqueues(pd);
 	padata_init_squeues(pd);
-	atomic_set(&pd->seq_nr, -1);
+	pd->seq_nr = -1;
 	atomic_set(&pd->refcnt, 1);
 	spin_lock_init(&pd->lock);
 	pd->cpu = cpumask_first(pd->cpumask.pcpu);
@@ -1051,6 +1072,7 @@ EXPORT_SYMBOL(padata_free_shell);
 
 void __init padata_init(void)
 {
+	unsigned int i, possible_cpus;
 #ifdef CONFIG_HOTPLUG_CPU
 	int ret;
 
@@ -1062,13 +1084,27 @@ void __init padata_init(void)
 
 	ret = cpuhp_setup_state_multi(CPUHP_PADATA_DEAD, "padata:dead",
 				      NULL, padata_cpu_dead);
-	if (ret < 0) {
-		cpuhp_remove_multi_state(hp_online);
-		goto err;
-	}
+	if (ret < 0)
+		goto remove_online_state;
+#endif
+
+	possible_cpus = num_possible_cpus();
+	padata_works = kmalloc_array(possible_cpus, sizeof(struct padata_work),
+				     GFP_KERNEL);
+	if (!padata_works)
+		goto remove_dead_state;
+
+	for (i = 0; i < possible_cpus; ++i)
+		list_add(&padata_works[i].pw_list, &padata_free_works);
 
 	return;
+
+remove_dead_state:
+#ifdef CONFIG_HOTPLUG_CPU
+	cpuhp_remove_multi_state(CPUHP_PADATA_DEAD);
+remove_online_state:
+	cpuhp_remove_multi_state(hp_online);
 err:
-	pr_warn("padata: initialization failed\n");
 #endif
+	pr_warn("padata: initialization failed\n");
 }
-- 
2.26.2

