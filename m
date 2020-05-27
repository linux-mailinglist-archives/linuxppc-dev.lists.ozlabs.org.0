Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2B1E4C62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 19:50:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XJK44kzFzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 03:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=reCN7ZDh; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XJ1b34bhzDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 03:37:22 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RHS8xU066133;
 Wed, 27 May 2020 17:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=yPUXFWPL94bqTXYWjhf36bOZIYPC2tWDc5RPRYWRQpc=;
 b=reCN7ZDhlWpd3nB6imCa52znFT7mP1fOUN2XCQQ631F1ma2oxX577K3URLMu6DcgEmYc
 9SzOSPQUOj3SMYETsYmmw8Gl621nAz5lbRotfYPZF2vFTfB8aEpbbZvxKAwsTD2iAC4f
 uH9PUDI9zDyhtj82I2gJvjyomGX/+XFWkYJDEqdSIofBdYhajQmQtvs+KBoH05hu9m4v
 O8OX/i87vC0fKYZnKE3j6wRzs0TQlzC67GIUO0w5JQooN99R3qvXEGQhrRg/1h7/iKDO
 yl1QBJ8gcMuCPJfzXBLg2QEJF45uqhx78MNKx7H2ed7ngfom+HlWlCOWkP5x4Y1le2et 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 318xe1gubg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 May 2020 17:36:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RHXdpC142867;
 Wed, 27 May 2020 17:36:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 317dkutu4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 17:36:31 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04RHaRuB012736;
 Wed, 27 May 2020 17:36:27 GMT
Received: from localhost.localdomain (/98.229.125.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 May 2020 10:36:27 -0700
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: [PATCH v3 5/8] mm: don't track number of pages during deferred
 initialization
Date: Wed, 27 May 2020 13:36:05 -0400
Message-Id: <20200527173608.2885243-6-daniel.m.jordan@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527173608.2885243-1-daniel.m.jordan@oracle.com>
References: <20200527173608.2885243-1-daniel.m.jordan@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 cotscore=-2147483648 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270136
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

Deferred page init used to report the number of pages initialized:

  node 0 initialised, 32439114 pages in 97ms

Tracking this makes the code more complicated when using multiple
threads.  Given that the statistic probably has limited value,
especially since a zone grows on demand so that the page count can vary,
just remove it.

The boot message now looks like

  node 0 deferred pages initialised in 97ms

Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Suggested-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 mm/page_alloc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d0c0d9364aa6d..d64f3027fdfa6 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1819,7 +1819,7 @@ static int __init deferred_init_memmap(void *data)
 {
 	pg_data_t *pgdat = data;
 	const struct cpumask *cpumask = cpumask_of_node(pgdat->node_id);
-	unsigned long spfn = 0, epfn = 0, nr_pages = 0;
+	unsigned long spfn = 0, epfn = 0;
 	unsigned long first_init_pfn, flags;
 	unsigned long start = jiffies;
 	struct zone *zone;
@@ -1868,15 +1868,15 @@ static int __init deferred_init_memmap(void *data)
 	 * allocator.
 	 */
 	while (spfn < epfn) {
-		nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
+		deferred_init_maxorder(&i, zone, &spfn, &epfn);
 		cond_resched();
 	}
 zone_empty:
 	/* Sanity check that the next zone really is unpopulated */
 	WARN_ON(++zid < MAX_NR_ZONES && populated_zone(++zone));
 
-	pr_info("node %d initialised, %lu pages in %ums\n",
-		pgdat->node_id,	nr_pages, jiffies_to_msecs(jiffies - start));
+	pr_info("node %d deferred pages initialised in %ums\n",
+		pgdat->node_id, jiffies_to_msecs(jiffies - start));
 
 	pgdat_init_report_one_done();
 	return 0;
-- 
2.26.2

