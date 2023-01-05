Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6ED65EA61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 13:05:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnlYJ43G4z3c69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 23:05:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QN6kgCCI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QN6kgCCI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnlXJ07q9z2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 23:05:03 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 305BwtUO030458;
	Thu, 5 Jan 2023 12:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=RkeNOhipKMcUPD8Qm3P5AwLCsoQDpwRJLYbcr4SzAZQ=;
 b=QN6kgCCIFkQenaD6iJUVi6ADgldTQLSpGThxbPLWdz25zElYpW7+B08ghYyJGaydZmwd
 VDGLdSXQT374aNCM86KHGqmgk7m4YoyZjVIotyf/vIdzS+1JU649L8iW3WukDcbO3ifC
 wqYRT+18idL4wjDDaC0tW35u2lOjQountc5O44rGEb0MN1LQ+O5KGQP5rApSel5DQMnU
 qvVxVyqPvPBkNY913d8+Tvwo8QjEbhPDTwJbbUmoeH96JW+tyYIDmUNwyGsvLE733rE0
 rItMVWhBAnX/PqZtdmNa0xARL5pf9TeyG3NNdvQ6MysPohqbCiZlAAEjm6HlOQtrYS1e yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwx5e85f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 12:04:47 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305C04Qm034500;
	Thu, 5 Jan 2023 12:04:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwx5e85ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 12:04:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3053rFJB001030;
	Thu, 5 Jan 2023 12:04:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbfeqts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 12:04:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 305C4ea337159366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 12:04:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8A752004B;
	Thu,  5 Jan 2023 12:04:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDB3020043;
	Thu,  5 Jan 2023 12:04:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.120.85])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jan 2023 12:04:37 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH] tools/perf: Fix bpf-script-test-prologue test compile issue with clang
Date: Thu,  5 Jan 2023 17:34:36 +0530
Message-Id: <20230105120436.92051-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7cGmRhIcY4yJog4txKJk0luZ5c_vl4K1
X-Proofpoint-GUID: yl-0TTym-C2lPItHSOUPQIVNwUecPMwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050095
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running perf test for bpf, observed that "BPF prologue
generation" test case fails to compile with clang. Logs below
from powerpc:

<stdin>:33:2: error: use of undeclared identifier 'fmode_t'
        fmode_t f_mode = (fmode_t)_f_mode;
        ^
<stdin>:37:6: error: use of undeclared identifier 'f_mode'; did you mean '_f_mode'?
        if (f_mode & FMODE_WRITE)
            ^~~~~~
            _f_mode
<stdin>:30:60: note: '_f_mode' declared here
int bpf_func__null_lseek(void *ctx, int err, unsigned long _f_mode,
                                                           ^
2 errors generated.

The test code tests/bpf-script-test-prologue.c uses fmode_t.
And the error above is for "fmode_t" which is defined in
include/linux/types.h as part of kernel build directory:
"/lib/modules/<kernel_version>/build" that comes from
kernel devel [ soft link to /usr/src/<kernel_version> ].
Clang picks this header file from "-working-directory" build
option that specifies this build folder.

But the 'commit 14e4b9f4289a ("perf trace: Raw augmented
syscalls fix libbpf 1.0+ compatibility")', changed the
include directory to use: "/usr/include".  Post this change,
types.h from /usr/include/ is getting picked upwhich doesn’t
contain definition of "fmode_t" and hence fails to compile.

Compilation command before this commit:
/usr/bin/clang -D__KERNEL__ -D__NR_CPUS__=72 -DLINUX_VERSION_CODE=0x50e00 -xc  -I/root/lib/perf/include/bpf -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h  -Wno-unused-value -Wno-pointer-sign -working-directory /lib/modules/<ver>/build -c - -target bpf  -g -O2 -o -

Compilation command after this commit:
/usr/bin/clang -D__KERNEL__ -D__NR_CPUS__=72 -DLINUX_VERSION_CODE=0x50e00 -xc  -I/usr/include/ -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h  -Wno-unused-value -Wno-pointer-sign -working-directory /lib/modules/<ver>/build -c - -target bpf  -g -O2 -o -

The difference is addition of -I/usr/include/  in the first line
which is causing the error. Fix this by adding typedef for "fmode_t"
in the testcase to solve the compile issue.

Fixes: 14e4b9f4289a ("perf trace: Raw augmented syscalls fix libbpf 1.0+ compatibility")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/bpf-script-test-prologue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/tests/bpf-script-test-prologue.c b/tools/perf/tests/bpf-script-test-prologue.c
index bd83d364cf30..91778b5c6125 100644
--- a/tools/perf/tests/bpf-script-test-prologue.c
+++ b/tools/perf/tests/bpf-script-test-prologue.c
@@ -20,6 +20,8 @@
 # undef if
 #endif
 
+typedef unsigned int __bitwise fmode_t;
+
 #define FMODE_READ		0x1
 #define FMODE_WRITE		0x2
 
-- 
2.31.1

