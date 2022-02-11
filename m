Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D14B2716
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 14:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwDwp1kJ4z3cGW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 00:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=thM9KwNN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=thM9KwNN; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwDw974Xkz303n
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 00:28:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A3DBB827DF;
 Fri, 11 Feb 2022 13:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A6AC340E9;
 Fri, 11 Feb 2022 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644586115;
 bh=mCNT3oPNt/Cs3wTOK6JcTXaoAFjJWvd0EWUepSHHUM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thM9KwNNE1WN93MdEHu5IVXS4RssfF9Z1RqdF6m23qGw5zC3iG0Ip/U6kRD4Cb2VH
 xk71LhrFEWb16RVxobScCcnhIRrAogvgBGi3NctphPz8DbtgnynWkV6jv1qewqp9aE
 HaPdg7J5c0xrDoxJUjMB6cc/rRRBV+ox+lUJGSbO8FiFIfuCpKAvIsgv1WR8VlCWvS
 9GIvISClRZCGJBzKMHXFFZOTvbfPTf/iy6npfzvrVzjxWs6dHE+wFftVd3MMZsTVcQ
 zolRso+fDhRVouYdK4KoPxiJ4YYxd3P9wruDqIYVdWqSjpwFNEqLaaoD20oyymEVtu
 hJjoIB6eZ4uYw==
Date: Fri, 11 Feb 2022 15:28:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Message-ID: <YgZke383drSXTekO@kernel.org>
References: <20220211063330.99648-1-aneesh.kumar@linux.ibm.com>
 <YgY7lDToiQ0pM6U6@kernel.org>
 <27a71056-489a-4099-b094-64766bea84db@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27a71056-489a-4099-b094-64766bea84db@linux.ibm.com>
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
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

On Fri, Feb 11, 2022 at 05:22:13PM +0530, Aneesh Kumar K V wrote:
> On 2/11/22 16:03, Mike Rapoport wrote:
> > On Fri, Feb 11, 2022 at 12:03:28PM +0530, Aneesh Kumar K.V wrote:
> > > Keep it simple by using a #define and limiting hugepage size to 2M.
> > > This keeps the test simpler instead of dynamically finding the page size
> > > and huge page size.
> > > 
> > > Without this tests are broken w.r.t reading /proc/self/pagemap
> > > 
> > > 	if (pread(pagemap_fd, ent, sizeof(ent),
> > > 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
> > > 		err(2, "read pagemap");
> > > 
> > > Cc: Shuah Khan <shuah@kernel.org>
> > > Cc: linux-kselftest@vger.kernel.org
> > > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > > ---
> > >   tools/testing/selftests/vm/ksm_tests.c        | 9 ++++++++-
> > >   tools/testing/selftests/vm/transhuge-stress.c | 9 ++++++++-
> > >   2 files changed, 16 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
> > > index 1436e1a9a3d3..cae72872152b 100644
> > > --- a/tools/testing/selftests/vm/ksm_tests.c
> > > +++ b/tools/testing/selftests/vm/ksm_tests.c
> > > @@ -22,7 +22,14 @@
> > >   #define KSM_MERGE_ACROSS_NODES_DEFAULT true
> > >   #define MB (1ul << 20)
> > > -#define PAGE_SHIFT 12
> > > +#ifdef __powerpc64__
> > > +#define PAGE_SHIFT	16
> > > +#else
> > > +#define PAGE_SHIFT	12
> > > +#endif
> > 
> > Page size can be other than 4096 for other configurations as well. And even
> > on ppc64 it's not necessarily 64k.
> > 
> 
> But most common test config is with 64K page size.
> 
> > Ideally page size in selftests/vm should be sysconf(_SC_PAGESIZE)
> 
> 
> yes. As explained in commit message, the idea was to keep it simpler.

I think it's simple enough (compile tested on x86 only):

From 219577d87041f19f2c00dc7c23e0fd5aad8b02d5 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Fri, 11 Feb 2022 15:24:13 +0200
Subject: [PATCH] selftest/vm: add helpers to detect PAGE_SIZE and PAGE_SHIFT

PAGE_SIZE is not 4096 in many configurations, particularily ppc64 uses
64K pages in majority of cases.

Add helpers to detect PAGE_SIZE and PAGE_SHIFT dynamically.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 tools/testing/selftests/vm/gup_test.c         |  3 +-
 tools/testing/selftests/vm/ksm_tests.c        |  8 +----
 tools/testing/selftests/vm/transhuge-stress.c |  9 ++----
 tools/testing/selftests/vm/util.h             | 29 +++++++++++++++++++
 4 files changed, 34 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/vm/util.h

diff --git a/tools/testing/selftests/vm/gup_test.c b/tools/testing/selftests/vm/gup_test.c
index fe043f67798b..cda837a14736 100644
--- a/tools/testing/selftests/vm/gup_test.c
+++ b/tools/testing/selftests/vm/gup_test.c
@@ -10,8 +10,9 @@
 #include <assert.h>
 #include "../../../../mm/gup_test.h"
 
+#include "util.h"
+
 #define MB (1UL << 20)
-#define PAGE_SIZE sysconf(_SC_PAGESIZE)
 
 /* Just the flags we need, copied from mm.h: */
 #define FOLL_WRITE	0x01	/* check pte is writable */
diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
index cae72872152b..7faafd24446f 100644
--- a/tools/testing/selftests/vm/ksm_tests.c
+++ b/tools/testing/selftests/vm/ksm_tests.c
@@ -12,6 +12,7 @@
 
 #include "../kselftest.h"
 #include "../../../../include/vdso/time64.h"
+#include "util.h"
 
 #define KSM_SYSFS_PATH "/sys/kernel/mm/ksm/"
 #define KSM_FP(s) (KSM_SYSFS_PATH s)
@@ -22,17 +23,10 @@
 #define KSM_MERGE_ACROSS_NODES_DEFAULT true
 #define MB (1ul << 20)
 
-#ifdef __powerpc64__
-#define PAGE_SHIFT	16
-#else
-#define PAGE_SHIFT	12
-#endif
 /*
  * On ppc64 this will only work with radix 2M hugepage size
  */
 #define HPAGE_SHIFT 21
-
-#define PAGE_SIZE (1 << PAGE_SHIFT)
 #define HPAGE_SIZE (1 << HPAGE_SHIFT)
 
 #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
index b1f8d98355c5..baf90a745d28 100644
--- a/tools/testing/selftests/vm/transhuge-stress.c
+++ b/tools/testing/selftests/vm/transhuge-stress.c
@@ -16,17 +16,12 @@
 #include <string.h>
 #include <sys/mman.h>
 
-#ifdef __powerpc64__
-#define PAGE_SHIFT	16
-#else
-#define PAGE_SHIFT	12
-#endif
+#include "util.h"
+
 /*
  * On ppc64 this will only work with radix 2M hugepage size
  */
 #define HPAGE_SHIFT 21
-
-#define PAGE_SIZE (1 << PAGE_SHIFT)
 #define HPAGE_SIZE (1 << HPAGE_SHIFT)
 
 #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
diff --git a/tools/testing/selftests/vm/util.h b/tools/testing/selftests/vm/util.h
new file mode 100644
index 000000000000..1c85d7583bac
--- /dev/null
+++ b/tools/testing/selftests/vm/util.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __KSELFTEST_VM_UTIL_H
+#define __KSELFTEST_VM_UTIL_H
+
+#include <string.h> /* ffsl() */
+#include <unistd.h> /* _SC_PAGESIZE */
+
+static unsigned __page_size;
+static unsigned __page_shift;
+
+static inline unsigned page_size(void)
+{
+	if (!__page_size)
+		__page_size = sysconf(_SC_PAGESIZE);
+	return __page_size;
+}
+
+static inline unsigned page_shift(void)
+{
+	if (!__page_shift)
+		__page_shift = (ffsl(page_size()) - 1);
+	return __page_shift;
+}
+
+#define PAGE_SHIFT	(page_shift())
+#define PAGE_SIZE	(page_size())
+
+#endif /* __KSELFTEST_VM_UTIL_H */
-- 
2.34.1

-- 
Sincerely yours,
Mike.
