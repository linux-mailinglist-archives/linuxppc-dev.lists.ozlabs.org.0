Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80F7786E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 07:17:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=riDDfeAa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMX9m4DmTz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 15:17:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=riDDfeAa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMX8r138Xz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 15:16:59 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B58S4i015649;
	Fri, 11 Aug 2023 05:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Uozn107CQ0SK1JghVFmAEOg+1EQ/BBo1/ih3ynJcCAg=;
 b=riDDfeAaukTY3ibkXpycVP8pm//OrAPm+34Rr+iT4cWYDg1GcYGlPmcy8gMoZSxSXqZX
 b9imZBBPzwT9cMNMlxhZ/DVl2wML/Va1enAksHyCePlIRA0u2DXtoZyH+DMepzLLFMul
 uRYpHnx++zPmrjrTPhpm0dQMqnZbEvEmM0Hd/wKXauZ0Ki8k/Eud6XZy103mTlzjVSKY
 CACYQzkWfGeN8HwyFlDEI6mXfPDHOrveon0+t0PTEiLqJguUb1L/aGGr8toEPJ6nXi+j
 J2v3giKo9kcwBBlBwPkNxG9Gi71pRREcja8V8gTTrWJWufRhYbMMqMl0LzxXrE1mReWd Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sdebtra9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 05:15:59 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37B58qjd017082;
	Fri, 11 Aug 2023 05:15:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sdebtra9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 05:15:58 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37B3GAiC007592;
	Fri, 11 Aug 2023 05:15:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa150091b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 05:15:57 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37B5FrN261407532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 05:15:54 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D51882005A;
	Fri, 11 Aug 2023 05:15:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B8862004B;
	Fri, 11 Aug 2023 05:15:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.95.190])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Aug 2023 05:15:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH] tools/perf: Fix dso kernel load and symbol process to correctly map dso to its long_name, type and adjust_symbols
Date: Fri, 11 Aug 2023 10:45:46 +0530
Message-Id: <20230811051546.70039-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7UfOZkxg8wBYupvycD5b0M287Jtr4Nd1
X-Proofpoint-ORIG-GUID: QQKkBCrB7lJCC0jWr2YkYYiMx9eY8q44
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Test "object cocde reading" fails sometimes for kernel address
as below:

    Reading object code for memory address: 0xc000000000004c3c
    File is: [kernel.kallsyms]
    On file address is: 0x14c3c
    dso__data_read_offset failed
    test child finished with -1
    ---- end ----
    Object code reading: FAILED!

Here the dso__data_read_offset fails for symbol address
0xc000000000004c3c. This is because, the dso long_name here
is [kernel.kallsyms] and hence open_dso fails to open this
file. There is an incorrect dso to map handling here. The
key points here is:
- dso long_name is set to [kernel.kallsyms]. This file is
  not present and hence returns error
- DSO binary type is set to DSO_BINARY_TYPE__NOT_FOUND
- dso adjust_symbols is set to zero

In the end dso__data_read_offset() returns -1 and the address
0x14c3c can not be resolved. Hence the test fails. But the
address actually maps to kernel dso

    # objdump -z -d --start-address=0xc000000000004c3c --stop-address=0xc000000000004cbc /home/athira/linux/vmlinux

    /home/athira/linux/vmlinux:     file format elf64-powerpcle

    Disassembly of section .head.text:

    c000000000004c3c <exc_virt_0x4c00_system_call+0x3c>:
    c000000000004c3c:	a6 02 9b 7d 	mfsrr1  r12
    c000000000004c40:	78 13 42 7c 	mr      r2,r2
    c000000000004c44:	18 00 4d e9 	ld      r10,24(r13)
    c000000000004c48:	60 c6 4a 61 	ori     r10,r10,50784
    c000000000004c4c:	a6 03 49 7d 	mtctr   r10

Fix the dso__process_kernel_symbol function to set the
binary_type and adjust_symbols. adjust_symbols is used by
function "map__rip_2objdump" which converts symbol start
address to objdump address. Also set the dso long_name during
dso__load_vmlinux function.

Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Note: Found similar discussion here in thread:
      https://www.spinics.net/lists/linux-perf-users/msg06337.html
      where Adrian proposed the fix, but looks like this was
      not added to the perf. Hence addeed Suggested-by from Adrian.

      Additional to the fix proposed by Adrian, the patch also
      adds setting of adjust_symbols which is needed for
      map__rip_2objdump to convert symbol start to objdump address.

 tools/perf/util/symbol-elf.c |  2 ++
 tools/perf/util/symbol.c     | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 252d26a59e64..9e7eeaf616b8 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1440,6 +1440,8 @@ static int dso__process_kernel_symbol(struct dso *dso, struct map *map,
 		curr_dso->kernel = dso->kernel;
 		curr_dso->long_name = dso->long_name;
 		curr_dso->long_name_len = dso->long_name_len;
+		curr_dso->binary_type = dso->binary_type;
+		curr_dso->adjust_symbols = dso->adjust_symbols;
 		curr_map = map__new2(start, curr_dso);
 		dso__put(curr_dso);
 		if (curr_map == NULL)
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index f849f9ef68e6..3f36675b7c8f 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -2204,15 +2204,20 @@ int dso__load_vmlinux(struct dso *dso, struct map *map,
 	if (symsrc__init(&ss, dso, symfs_vmlinux, symtab_type))
 		return -1;
 
+	/*
+	 * dso__load_sym() may copy 'dso' which will result in the copies having
+	 * an incorrect long name unless we set it here first.
+	 */
+	dso__set_long_name(dso, vmlinux, vmlinux_allocated);
+	if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
+		dso->binary_type = DSO_BINARY_TYPE__GUEST_VMLINUX;
+	else
+		dso->binary_type = DSO_BINARY_TYPE__VMLINUX;
+
 	err = dso__load_sym(dso, map, &ss, &ss, 0);
 	symsrc__destroy(&ss);
 
 	if (err > 0) {
-		if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
-			dso->binary_type = DSO_BINARY_TYPE__GUEST_VMLINUX;
-		else
-			dso->binary_type = DSO_BINARY_TYPE__VMLINUX;
-		dso__set_long_name(dso, vmlinux, vmlinux_allocated);
 		dso__set_loaded(dso);
 		pr_debug("Using %s for symbols\n", symfs_vmlinux);
 	}
-- 
2.31.1

