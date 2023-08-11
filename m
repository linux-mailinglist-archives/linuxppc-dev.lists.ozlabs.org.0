Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D387786F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 07:23:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYrqTT51;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMXJ446dCz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 15:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYrqTT51;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMXGK72tsz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 15:21:45 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B5GpoN009360;
	Fri, 11 Aug 2023 05:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=yY9Ic4vkRhI2XN8jbulU0fMzvwSbRo0HR28rcW9lyMs=;
 b=XYrqTT51S6zHXIO80JKVuF69XBC3kBl5/oFna2jttSJRZnQckmKzd58V5cu8q+JRJj8R
 x2t9A4QGGDN5dLcp1ljztBKnLYJ3I/PWva4GL0tEwLf2/kEl/jrpwZWCstBOqmAVo+vL
 Uzvj2+o+NIasaS96FtK6D6RmYkt1aVtNtGdcerJTsdCAfdcHsCDeY3G0NyZAqA/mWtBI
 +5HGodP4VPGeIKO4ZVcyjmJ3kMCAdE3xS83CCJeX59tCQm75ylFKa+ahfuDTPoz/TXGm
 id1E3+DBKCGUis6/5Yd3fPOkoUUbspb7wNcExCfgW3RbS1Ae2QQBOBdeI+8DJsHIj3qj UA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sdebtre1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 05:21:41 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37B5F6ea003944;
	Fri, 11 Aug 2023 05:21:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sdebtre1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 05:21:41 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37B5H799006437;
	Fri, 11 Aug 2023 05:21:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sd2evd8et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 05:21:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37B5LarC62521676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 05:21:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83FC92004D;
	Fri, 11 Aug 2023 05:21:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D4212004B;
	Fri, 11 Aug 2023 05:21:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.95.190])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Aug 2023 05:21:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH 2/2] tools/perf/tests: Fix object code reading to skip address that falls out of text section
Date: Fri, 11 Aug 2023 10:51:28 +0530
Message-Id: <20230811052128.70282-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230811052128.70282-1-atrajeev@linux.vnet.ibm.com>
References: <20230811052128.70282-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NGrNqF1E5SHBtw-S9sjS4KTPUe2nH96Y
X-Proofpoint-ORIG-GUID: n8ybU4m-j76Bu_RGe5xpHL5myXge38UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110046
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The testcase "Object code reading" fails in somecases
for "fs_something" sub test as below:

    Reading object code for memory address: 0xc008000007f0142c
    File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
    On file address is: 0x1114cc
    Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
    objdump read too few bytes: 128
    test child finished with -1

This can alo be reproduced when running perf record with
workload that exercises fs_something() code. In the test
setup, this is exercising xfs code since root is xfs.

    # perf record ./a.out
    # perf report -v |grep "xfs.ko"
      0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007de5efc B [k] xlog_cil_commit
      0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007d5ae18 B [k] xfs_btree_key_offset
      0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007e11fd4 B [k] 0x0000000000112074

Here addr "0xc008000007e11fd4" is not resolved. since this is a
kernel module, its offset is from the DSO. Xfs module is loaded
at 0xc008000007d00000

   # cat /proc/modules | grep xfs
    xfs 2228224 3 - Live 0xc008000007d00000

And size is 0x220000. So its loaded between  0xc008000007d00000
and 0xc008000007f20000. From objdump, text section is:
    text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4

Hence perf captured ip maps to 0x112074 which is:
( ip - start of module ) + a0

This offset 0x112074 falls out .text section which is up to 0x10f7bc
In this case for module, the address 0xc008000007e11fd4 is pointing
to stub instructions. This address range represents the module stubs
which is allocated on module load and hence is not part of DSO offset.

To address this issue in "object code reading", skip the sample if
address falls out of text section and is within the module end.
Use the "text_end" member of "struct dso" to do this check.

To address this issue in "perf report", exploring an option of
having stubs range as part of the /proc/kallsyms, so that perf
report can resolve addresses in stubs range

However this patch uses text_end to skip the stub range for
Object code reading testcase.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/code-reading.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index ed3815163d1b..911f8fa13677 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -269,6 +269,14 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
 	if (addr + len > map__end(al.map))
 		len = map__end(al.map) - addr;
 
+	/* Check if the ip offset falls in stubs sections for kernel modules */
+	if (strstr(dso->long_name, ".ko")) {
+		if ((al.addr < map__end(al.map)) && (al.addr > dso->text_end)) {
+			pr_debug(" - skipping\n");
+			goto out;
+		}
+	}
+
 	/* Read the object code using perf */
 	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
 					al.addr, buf1, len);
-- 
2.31.1

