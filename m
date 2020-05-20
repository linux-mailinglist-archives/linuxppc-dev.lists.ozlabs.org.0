Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FB1DBD05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 20:39:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S1ks2z2gzDql9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 04:39:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=P3/+t99s; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S1TB21DRzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 04:27:57 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KIHSQi000794;
 Wed, 20 May 2020 18:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=+I5DK1bpDxPp17bxmkq3TLU7ktjAi9yJhHWfSrepooM=;
 b=P3/+t99sOI/cJLLQGLPGcYunKHfgTXLhGsWaI52GKYtr7wyKIO64OoVtL9IMpVjD74uS
 r8CzhtQuf1c1Jitqjbj9kH5cupw6vHmbuWRRgEHEQH8ZJbs/tLe6xx+nXDL1BwAvlD+F
 R8R3Xyx8Gex8EBS0uet5gInYKJlSgBY6zWUTNHfldY+mT6Dw5c9Ka5098MbyD8WMf03L
 /NJHzNYzKCc3WLNcSBYOArsURzvhCgY67wjBxEMWNQzJS7WpLdmCbw7EOK31zOgdiR92
 ml56VbjMyyzFqVbE3KSAyqwxek3U/YkOCY6ZY3BUAFQTuKQdK9He5gQ9z+lw066FZ3b8 5Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31501rb8a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 18:27:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KIDD4p076208;
 Wed, 20 May 2020 18:27:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 315020rdjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 18:27:10 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04KIR8V3008161;
 Wed, 20 May 2020 18:27:08 GMT
Received: from localhost.localdomain (/98.229.125.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 11:27:08 -0700
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: [PATCH v2 7/7] padata: document multithreaded jobs
Date: Wed, 20 May 2020 14:26:45 -0400
Message-Id: <20200520182645.1658949-8-daniel.m.jordan@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
References: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add Documentation for multithreaded jobs.

Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
---
 Documentation/core-api/padata.rst | 41 +++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/padata.rst b/Documentation/core-api/padata.rst
index 9a24c111781d9..b7e047af993e8 100644
--- a/Documentation/core-api/padata.rst
+++ b/Documentation/core-api/padata.rst
@@ -4,23 +4,26 @@
 The padata parallel execution mechanism
 =======================================
 
-:Date: December 2019
+:Date: April 2020
 
 Padata is a mechanism by which the kernel can farm jobs out to be done in
-parallel on multiple CPUs while retaining their ordering.  It was developed for
-use with the IPsec code, which needs to be able to perform encryption and
-decryption on large numbers of packets without reordering those packets.  The
-crypto developers made a point of writing padata in a sufficiently general
-fashion that it could be put to other uses as well.
+parallel on multiple CPUs while optionally retaining their ordering.
 
-Usage
-=====
+It was originally developed for IPsec, which needs to perform encryption and
+decryption on large numbers of packets without reordering those packets.  This
+is currently the sole consumer of padata's serialized job support.
+
+Padata also supports multithreaded jobs, splitting up the job evenly while load
+balancing and coordinating between threads.
+
+Running Serialized Jobs
+=======================
 
 Initializing
 ------------
 
-The first step in using padata is to set up a padata_instance structure for
-overall control of how jobs are to be run::
+The first step in using padata to run parallel jobs is to set up a
+padata_instance structure for overall control of how jobs are to be run::
 
     #include <linux/padata.h>
 
@@ -162,6 +165,24 @@ functions that correspond to the allocation in reverse::
 It is the user's responsibility to ensure all outstanding jobs are complete
 before any of the above are called.
 
+Running Multithreaded Jobs
+==========================
+
+A multithreaded job has a main thread and zero or more helper threads, with the
+main thread participating in the job and then waiting until all helpers have
+finished.  padata splits the job into units called chunks, where a chunk is a
+piece of the job that one thread completes in one call to the thread function.
+
+A user has to do three things to run a multithreaded job.  First, describe the
+job by defining a padata_mt_job structure, which is explained in the Interface
+section.  This includes a pointer to the thread function, which padata will
+call each time it assigns a job chunk to a thread.  Then, define the thread
+function, which accepts three arguments, ``start``, ``end``, and ``arg``, where
+the first two delimit the range that the thread operates on and the last is a
+pointer to the job's shared state, if any.  Prepare the shared state, which is
+typically a stack-allocated structure that wraps the required data.  Last, call
+padata_do_multithreaded(), which will return once the job is finished.
+
 Interface
 =========
 
-- 
2.26.2

