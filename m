Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 523BB2E6D33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 03:16:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4dMR2n0vzDqGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 13:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g1wx3cCY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4dK74XGczDqFB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 13:14:34 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BT2C0UR173994; Mon, 28 Dec 2020 21:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=hqWkg5f1Pi+5UgSrgszLJ6xHxIpH+NkVeUkxpeR6ovw=;
 b=g1wx3cCYP3wMPIyv5ZxEf//lq8KpFgSm1TjVvFpEVY2rZZjX4nEow5IzzI0xEtAKIgJk
 LALswfZm+PvlQu/mHzKp406mJhm6auOcjo3c7xEeFUtu0OwNiXSTxZJZHe/LoLFhqoxn
 OfBK7e0ZRnST8tshPi+W3dfnmjFjj6BY35NjGPpOeiAYi8Hzcmkv1BzJprsR3woS1Uor
 wx9FbhOTiakDsKEQyaFSLsJt9xmy5xDQ/QOyMuB91udusrwhDA5SDizhrxCV4PWF4U9p
 K1PIaQqy3ZKWbhl9DnuCrWG1AGMzGxXBEmtLj1WhIYfEWOnmOGlQaczVSbZMGd6ZhiAm eQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35quf98101-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Dec 2020 21:14:25 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BT2DYNZ003016;
 Tue, 29 Dec 2020 02:14:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 35nvt82gw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Dec 2020 02:14:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BT2ELmd36962696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Dec 2020 02:14:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E88D04C044;
 Tue, 29 Dec 2020 02:14:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 206414C046;
 Tue, 29 Dec 2020 02:14:19 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.245.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Dec 2020 02:14:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH] tools/perf: Fix powerpc gap between kernel end and module
 start
Date: Mon, 28 Dec 2020 21:14:14 -0500
Message-Id: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-29_03:2020-12-28,
 2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1011
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012290006
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running "perf mem report" in TUI mode fails with ENOMEM message
in powerpc:

failed to process sample

Running with debug and verbose options points that issue is while
allocating memory for sample histograms.

The error path is:
symbol__inc_addr_samples -> __symbol__inc_addr_samples
-> annotated_source__histogram

symbol__inc_addr_samples calls annotated_source__alloc_histograms
to allocate memory for sample histograms using calloc. Here calloc fails
since the size of symbol is huge. The size of a symbol is calculated as
difference between its start and end address.

Example histogram allocation that fails is:
sym->name is _end, sym->start is 0xc0000000027a0000, sym->end is
0xc008000003890000, symbol__size(sym) is 0x80000010f0000

In above case, difference between sym->start (0xc0000000027a0000)
and sym->end (0xc008000003890000) is huge.

This is same problem as in s390 and arm64 which are fixed in commits:
'commit b9c0a64901d5 ("perf annotate: Fix s390 gap between kernel end
and module start")'
'commit 78886f3ed37e ("perf symbols: Fix arm64 gap between kernel start
and module end")'

When this symbol was read first, its start and end address was set to
address which matches with data from /proc/kallsyms.

After symbol__new:
symbol__new: _end 0xc0000000027a0000-0xc0000000027a0000

From /proc/kallsyms:
...
c000000002799370 b backtrace_flag
c000000002799378 B radix_tree_node_cachep
c000000002799380 B __bss_stop
c0000000027a0000 B _end
c008000003890000 t icmp_checkentry      [ip_tables]
c008000003890038 t ipt_alloc_initial_table      [ip_tables]
c008000003890468 T ipt_do_table [ip_tables]
c008000003890de8 T ipt_unregister_table_pre_exit        [ip_tables]
...

Perf calls function symbols__fixup_end() which sets the end of symbol
to 0xc008000003890000, which is the next address and this is the start
address of first module (icmp_checkentry in above) which will make the
huge symbol size of 0x80000010f0000.

After symbols__fixup_end:
symbols__fixup_end: sym->name: _end, sym->start: 0xc0000000027a0000,
sym->end: 0xc008000003890000

On powerpc, kernel text segment is located at 0xc000000000000000
whereas the modules are located at very high memory addresses,
0xc00800000xxxxxxx. Since the gap between end of kernel text segment
and beginning of first module's address is high, histogram allocation
using calloc fails.

Fix this by detecting the kernel's last symbol and limiting
the range of last kernel symbol to pagesize.

Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/Build     |  1 +
 tools/perf/arch/powerpc/util/machine.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 tools/perf/arch/powerpc/util/machine.c

diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index e86e210bf514..b7945e5a543b 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -1,4 +1,5 @@
 perf-y += header.o
+perf-y += machine.o
 perf-y += kvm-stat.o
 perf-y += perf_regs.o
 perf-y += mem-events.o
diff --git a/tools/perf/arch/powerpc/util/machine.c b/tools/perf/arch/powerpc/util/machine.c
new file mode 100644
index 000000000000..c30e5cc88c16
--- /dev/null
+++ b/tools/perf/arch/powerpc/util/machine.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <stdio.h>
+#include <string.h>
+#include <internal/lib.h> // page_size
+#include "debug.h"
+#include "symbol.h"
+
+/* On powerpc kernel text segment start at memory addresses, 0xc000000000000000
+ * whereas the modules are located at very high memory addresses,
+ * for example 0xc00800000xxxxxxx. The gap between end of kernel text segment
+ * and beginning of first module's text segment is very high.
+ * Therefore do not fill this gap and do not assign it to the kernel dso map.
+ */
+
+void arch__symbols__fixup_end(struct symbol *p, struct symbol *c)
+{
+	if (strchr(p->name, '[') == NULL && strchr(c->name, '['))
+		/* Limit the range of last kernel symbol */
+		p->end += page_size;
+	else
+		p->end = c->start;
+	pr_debug4("%s sym:%s end:%#lx\n", __func__, p->name, p->end);
+}
-- 
1.8.3.1

