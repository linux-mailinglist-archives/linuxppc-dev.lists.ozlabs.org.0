Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5C797864
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 18:46:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1nO/hAW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQB52Q5Vz3cC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 02:46:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1nO/hAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQ9B1z1xz3bxS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 02:45:49 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387Gchk3017994;
	Thu, 7 Sep 2023 16:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Pvrn9AmGzmJM5Eqnf/RzG8rYCfF3vmMqlngUuIcbBEw=;
 b=a1nO/hAWK6wF0FkRY8qlLl5Mnk7vSN89n0V5QWTQu2xtIuruhFi0dzXJ1CTD2AUSOi3a
 hzlU8V618wRg2RYIdnTkUHxGlkuqSOQ3aJyWfhIr/ze84KFiztDf2Wn70SCr/b6qZptU
 SPsE5zu0EYzTx6uKu56MqcdFd/1EgoqTEcCEvDjEDlgLtQOpjaziIAZAHQwGzGmtKirz
 +9SM5Zj+IGeLEQ629b26ktY3EeEVSsfOWvZ6xxaKzdRmLeLrcuhqGZs97GUVMC83VfXI
 SgzdIm4uoHTWFlgZAqFsdfnsPA0K0u/t8KoK1JTQOVG+/b9iIqt1W8OjTJepVhx5MrLb ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sygy8ad44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:45:43 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387GdbG8022796;
	Thu, 7 Sep 2023 16:45:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sygy8ad3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:45:42 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387FM3Uv001614;
	Thu, 7 Sep 2023 16:45:42 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfct5hfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:45:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387Gjd7C23855768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 16:45:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 363AE20043;
	Thu,  7 Sep 2023 16:45:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFB6020040;
	Thu,  7 Sep 2023 16:45:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.9.102])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 16:45:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [V2 2/2] tools/perf/tests: Fix object code reading to skip address that falls out of text section
Date: Thu,  7 Sep 2023 22:15:29 +0530
Message-Id: <20230907164529.36222-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
References: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UtAwaBShcro13XtNZhSjVJT0rMsfFUis
X-Proofpoint-ORIG-GUID: -OTo03DPzw7Ob1bvkHnT5Wv_46pkI3Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070147
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
Cc: atrajeev@linux.vnet.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Reported-by: Disha Goel <disgoel@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2:
 Updated comment to add description on which arch has stub and
 reason for skipping as suggested by Adrian

 tools/perf/tests/code-reading.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index ed3815163d1b..3cf6c2d42416 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -269,6 +269,18 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
 	if (addr + len > map__end(al.map))
 		len = map__end(al.map) - addr;
 
+	/*
+	 * Some architectures (ex: powerpc) have stubs (trampolines) in kernel
+	 * modules to manage long jumps. Check if the ip offset falls in stubs
+	 * sections for kernel modules. And skip module address after text end
+	 */
+	if (strstr(dso->long_name, ".ko")) {
+		if (al.addr > dso->text_end) {
+			pr_debug("skipping the module address %#"PRIx64" after text end\n", al.addr);
+			goto out;
+		}
+	}
+
 	/* Read the object code using perf */
 	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
 					al.addr, buf1, len);
-- 
2.31.1

