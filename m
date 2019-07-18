Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9986D3C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 20:20:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qMr85P3kzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 04:20:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qMnW3KLbzDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 04:18:07 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6II4QV5026423
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 14:18:04 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttv2jc79g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 14:18:04 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Thu, 18 Jul 2019 19:18:02 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 19:17:57 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6IIHun345154322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 18:17:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1E5C4C052;
 Thu, 18 Jul 2019 18:17:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A6AE4C050;
 Thu, 18 Jul 2019 18:17:54 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.42.37])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jul 2019 18:17:53 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@redhat.com
Subject: [PATCH v2 1/3] tools/perf: Move kvm-stat header file from conditional
 inclusion to common include section
Date: Thu, 18 Jul 2019 23:47:47 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071818-0012-0000-0000-000003342226
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071818-0013-0000-0000-0000216DA54C
Message-Id: <20190718181749.30612-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180187
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move kvm-stat header file to the common include section, and make the
definitions in the header file under the conditional inclusion 
`#ifdef HAVE_KVM_STAT_SUPPORT`.

This helps to define other perf kvm related function prototypes in
kvm-stat header file, which may not need kvm-stat support.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 tools/perf/builtin-kvm.c   | 2 +-
 tools/perf/util/kvm-stat.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index b33c83489120..5d2b34d290a3 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -19,6 +19,7 @@
 #include "util/top.h"
 #include "util/data.h"
 #include "util/ordered-events.h"
+#include "util/kvm-stat.h"
 
 #include <sys/prctl.h>
 #ifdef HAVE_TIMERFD_SUPPORT
@@ -55,7 +56,6 @@ static const char *get_filename_for_perf_kvm(void)
 }
 
 #ifdef HAVE_KVM_STAT_SUPPORT
-#include "util/kvm-stat.h"
 
 void exit_event_get_key(struct perf_evsel *evsel,
 			struct perf_sample *sample,
diff --git a/tools/perf/util/kvm-stat.h b/tools/perf/util/kvm-stat.h
index 1403dec189b4..b3b2670e1a2b 100644
--- a/tools/perf/util/kvm-stat.h
+++ b/tools/perf/util/kvm-stat.h
@@ -2,6 +2,8 @@
 #ifndef __PERF_KVM_STAT_H
 #define __PERF_KVM_STAT_H
 
+#ifdef HAVE_KVM_STAT_SUPPORT
+
 #include "../perf.h"
 #include "tool.h"
 #include "stat.h"
@@ -144,5 +146,6 @@ extern const int decode_str_len;
 extern const char *kvm_exit_reason;
 extern const char *kvm_entry_trace;
 extern const char *kvm_exit_trace;
+#endif /* HAVE_KVM_STAT_SUPPORT */
 
 #endif /* __PERF_KVM_STAT_H */
-- 
2.20.1

