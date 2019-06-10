Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6593AF25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 08:48:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MkHq3xS6zDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 16:48:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MkCx3sQyzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 16:45:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5A6gQbQ039902
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 02:45:29 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t1hknhjw8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 02:45:28 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Mon, 10 Jun 2019 07:45:26 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 10 Jun 2019 07:45:24 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5A6jN5848955402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2019 06:45:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FD6F5204F;
 Mon, 10 Jun 2019 06:45:23 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 871345204E;
 Mon, 10 Jun 2019 06:45:21 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@redhat.com
Subject: [PATCH RESEND 2/2] tools/perf: Set 'trace_cycles' as defaultevent for
 perf kvm record in powerpc
Date: Mon, 10 Jun 2019 12:15:18 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610064518.949-1-anju@linux.vnet.ibm.com>
References: <20190610064518.949-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061006-0016-0000-0000-00000287A1E7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061006-0017-0000-0000-000032E4C957
Message-Id: <20190610064518.949-2-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906100047
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

Use 'trace_imc/trace_cycles' as the default event for 'perf kvm record'
in powerpc.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/kvm-stat.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/kvm-stat.c b/tools/perf/arch/powerpc/util/kvm-stat.c
index 66f8fe500945..b552884263df 100644
--- a/tools/perf/arch/powerpc/util/kvm-stat.c
+++ b/tools/perf/arch/powerpc/util/kvm-stat.c
@@ -177,8 +177,9 @@ int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
 /*
  * Incase of powerpc architecture, pmu registers are programmable
  * by guest kernel. So monitoring guest via host may not provide
- * valid samples. It is better to fail the "perf kvm record"
- * with default "cycles" event to monitor guest in powerpc.
+ * valid samples with default 'cycles' event. It is better to use
+ * 'trace_imc/trace_cycles' event for guest profiling, since it
+ * can track the guest instruction pointer in the trace-record.
  *
  * Function to parse the arguments and return appropriate values.
  */
@@ -202,8 +203,14 @@ int kvm_add_default_arch_event(int *argc, const char **argv)
 
 	parse_options(j, tmp, event_options, NULL, 0);
 	if (!event) {
-		free(tmp);
-		return -EINVAL;
+		if (pmu_have_event("trace_imc", "trace_cycles")) {
+			argv[j++] = strdup("-e");
+			argv[j++] = strdup("trace_imc/trace_cycles/");
+			*argc += 2;
+		} else {
+			free(tmp);
+			return -EINVAL;
+		}
 	}
 
 	free(tmp);
-- 
2.17.2

