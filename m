Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A246E50E771
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 19:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnC5d3tzMz3bnZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 03:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P9LugIYb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P9LugIYb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnC4v5TJWz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 03:42:06 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PGQMr4013138;
 Mon, 25 Apr 2022 17:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mWwc7mf7BKdCaJhN4Fzr3lEAPxe1cNjfM2MegTwuVjw=;
 b=P9LugIYb2+3ydqwqh9M181rUIbxJT5SEVGituCDhXNfGqevRMztk8Y9yGkXiwy9r9hm8
 kGxJMIOdUTfaJKSuQkPZKpQlR9YNv89ZDfCtLcpq4TLTcF1B33bXJkVZr5PvHCZSkTz9
 +2AyN301peZjeT3/831cp25kj4/14SvO8GUiIJKcD6CpuoMisJ7Qh3vKcC6EZgdiBljW
 Hxvh/14ZGmNvvEGxoteTQeAFA90V4ZkQ5Qt8qTrsQLrFnlS20Y8y1IEf98FnmilQ9xj5
 blQ9MPlbz979q+gxp9NafX1lSF5cK4dXyXP3KcsJdHmkdvJmn8Kmr5Mt66revJE0I2kV iQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fny5r1ky5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 17:41:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23PHSQVY004804;
 Mon, 25 Apr 2022 17:41:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3fm938tquw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 17:41:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23PHfild53608926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:41:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9877452050;
 Mon, 25 Apr 2022 17:41:44 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.79.106])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3725152051;
 Mon, 25 Apr 2022 17:41:41 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Eric Biederman <ebiederm@xmission.com>
Subject: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
Date: Mon, 25 Apr 2022 23:11:28 +0530
Message-Id: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EBo1atO3SRUozK-Gw_Q6mTuZbtchykkM
X-Proofpoint-GUID: EBo1atO3SRUozK-Gw_Q6mTuZbtchykkM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=800
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250078
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
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kexec_load_purgatory() can fail for many reasons - there is no need to
print an error when encountering unsupported relocations.

This solves a build issue on powerpc with binutils v2.36 and newer [1].
Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
symbols") [2], binutils started dropping section symbols that it thought
were unused.  This isn't an issue in general, but with kexec_file.c, gcc
is placing kexec_arch_apply_relocations[_add] into a separate
.text.unlikely section and the section symbol ".text.unlikely" is being
dropped. Due to this, recordmcount is unable to find a non-weak symbol
in .text.unlikely to generate a relocation record against. Dropping
pr_err() calls results in these functions being left in .text section,
enabling recordmcount to emit a proper relocation record.

[1] https://github.com/linuxppc/issues/issues/388
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 kernel/kexec_file.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 8347fc158d2b96..55d144c58b5278 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -121,7 +121,6 @@ int __weak
 arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
 				 const Elf_Shdr *relsec, const Elf_Shdr *symtab)
 {
-	pr_err("RELA relocation unsupported.\n");
 	return -ENOEXEC;
 }
 
@@ -138,7 +137,6 @@ int __weak
 arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *section,
 			     const Elf_Shdr *relsec, const Elf_Shdr *symtab)
 {
-	pr_err("REL relocation unsupported.\n");
 	return -ENOEXEC;
 }
 

base-commit: 83d8a0d166119de813cad27ae7d61f54f9aea707
-- 
2.35.1

