Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAC1DBD2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 20:44:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S1rP0z1PzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 04:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=D7oPGHVD; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S1Vs3VgnzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 04:29:25 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KIHaTv000885;
 Wed, 20 May 2020 18:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=jH2azHDilRy3Eymjd7YkT7wc4b3eHTRR3U5ixDSNB0U=;
 b=D7oPGHVDZIlDsTEsi2DHPv3YDdcbiQrvy1RcZyH7DNu/8USFBIkdYzxB4JBHLOhQswIS
 Bl1HC+g5Ma+05ZEllyzsYldowthCi7Upwy0bCwouq6N+Y0loFQtuLd8W7im9902U0EqA
 sAN7Dyol+855dzUiB7dbikgMrHPMG2NbGc6bfALVHj1wtGNjTNS8PY3HYVRFhmQPLRCE
 Qwd9p3EOBY2jmsn58iPOh0kzUCJevSTTVpKfROGICIy6oKIeSxqDnkKXbshHb0xLW1PM
 gJjs07jlP+TPlbtM6lHbFm1UMAI5wmZ9Lr3NZIj9WvDu7nh7s3jXH4Z7HkXl39EFTMzJ fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31501rb8jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 18:29:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KICcee014778;
 Wed, 20 May 2020 18:27:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 313gj3yt6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 18:27:03 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04KIQq27008059;
 Wed, 20 May 2020 18:26:52 GMT
Received: from localhost.localdomain (/98.229.125.203)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 11:26:52 -0700
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: [PATCH v2 0/7] padata: parallelize deferred page init
Date: Wed, 20 May 2020 14:26:38 -0400
Message-Id: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
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

Deferred struct page init is a bottleneck in kernel boot--the biggest
for us and probably others.  Optimizing it maximizes availability for
large-memory systems and allows spinning up short-lived VMs as needed
without having to leave them running.  It also benefits bare metal
machines hosting VMs that are sensitive to downtime.  In projects such
as VMM Fast Restart[1], where guest state is preserved across kexec
reboot, it helps prevent application and network timeouts in the guests.

So, multithread deferred init to take full advantage of system memory
bandwidth.

Extend padata, a framework that handles many parallel singlethreaded
jobs, to handle multithreaded jobs as well by adding support for
splitting up the work evenly, specifying a minimum amount of work that's
appropriate for one helper thread to do, load balancing between helpers,
and coordinating them.  More documentation in patches 4 and 7.

This series is the first step in a project to address other memory
proportional bottlenecks in the kernel such as pmem struct page init,
vfio page pinning, hugetlb fallocate, and munmap.  Deferred page init
doesn't require concurrency limits, resource control, or priority
adjustments like these other users will because it happens during boot
when the system is otherwise idle and waiting for page init to finish.

This has been run on a variety of x86 systems and speeds up kernel boot
by 3% to 49%, saving up to 1.6 out of 4 seconds.  Patch 5 has more
numbers.

Please review and test, and thanks to Alex, Andrew, Josh, and Pavel for
their feedback in the last version.

The powerpc and s390 lists are included in case they want to give this a
try, they had enabled this feature when it was configured per arch.

Series based on 5.7-rc6 plus these three from mmotm

  mm-call-touch_nmi_watchdog-on-max-order-boundaries-in-deferred-init.patch
  mm-initialize-deferred-pages-with-interrupts-enabled.patch
  mm-call-cond_resched-from-deferred_init_memmap.patch

and it's available here:

  git://oss.oracle.com/git/linux-dmjordan.git padata-mt-definit-v2
  https://oss.oracle.com/git/gitweb.cgi?p=linux-dmjordan.git;a=shortlog;h=refs/heads/padata-mt-definit-v2

and the future users and related features are available as
work-in-progress:

  git://oss.oracle.com/git/linux-dmjordan.git padata-mt-wip-v0.4
  https://oss.oracle.com/git/gitweb.cgi?p=linux-dmjordan.git;a=shortlog;h=refs/heads/padata-mt-wip-v0.4

v2:
 - Improve the problem statement (Andrew, Josh, Pavel)
 - Add T-b's to unchanged patches (Josh)
 - Fully initialize max-order blocks to avoid buddy issues (Alex)
 - Parallelize on section-aligned boundaries to avoid potential
   false sharing (Alex)
 - Return the maximum thread count from a function that architectures
   can override, with the generic version returning 1 (current
   behavior).  Override for x86 since that's the only arch this series
   has been tested on so far.  Other archs can test with more threads
   by dropping patch 6.
 - Rebase to v5.7-rc6, rerun tests

RFC v4 [2] -> v1:
 - merged with padata (Peter)
 - got rid of the 'task' nomenclature (Peter, Jon)

future work branch:
 - made lockdep-aware (Jason, Peter)
 - adjust workqueue worker priority with renice_or_cancel() (Tejun)
 - fixed undo problem in VFIO (Alex)

The remaining feedback, mainly resource control awareness (cgroup etc),
is TODO for later series.

[1] https://static.sched.com/hosted_files/kvmforum2019/66/VMM-fast-restart_kvmforum2019.pdf
    https://www.youtube.com/watch?v=pBsHnf93tcQ
    https://lore.kernel.org/linux-mm/1588812129-8596-1-git-send-email-anthony.yznaga@oracle.com/

[2] https://lore.kernel.org/linux-mm/20181105165558.11698-1-daniel.m.jordan@oracle.com/

Daniel Jordan (7):
  padata: remove exit routine
  padata: initialize earlier
  padata: allocate work structures for parallel jobs from a pool
  padata: add basic support for multithreaded jobs
  mm: parallelize deferred_init_memmap()
  mm: make deferred init's max threads arch-specific
  padata: document multithreaded jobs

 Documentation/core-api/padata.rst |  41 +++--
 arch/x86/mm/init_64.c             |  12 ++
 include/linux/memblock.h          |   3 +
 include/linux/padata.h            |  43 ++++-
 init/main.c                       |   2 +
 kernel/padata.c                   | 277 ++++++++++++++++++++++++------
 mm/Kconfig                        |   6 +-
 mm/page_alloc.c                   |  67 +++++++-
 8 files changed, 373 insertions(+), 78 deletions(-)


base-commit: b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
prerequisite-patch-id: 4ad522141e1119a325a9799dad2bd982fbac8b7c
prerequisite-patch-id: 169273327e56f5461101a71dfbd6b4cfd4570cf0
prerequisite-patch-id: 0f34692c8a9673d4c4f6a3545cf8ec3a2abf8620
-- 
2.26.2

