Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999735F9653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 02:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm0Jn3VGhz3dwg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 11:33:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvJmGlEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvJmGlEv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm0Fh73Gyz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 11:31:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 299Mtueg028542;
	Mon, 10 Oct 2022 00:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D66I4qI/0wf5e+R3yzh7g8S98gPPFwfRQqT/YWWw1LQ=;
 b=ZvJmGlEvnNPYg9KoVK9pcjjW/YhL2f5lk9w/PyDLDqJfBY3u+Zmz5UVBMP5aY0z4ejZV
 XuVsClHhvyI84kVEy2GVgvICYVQfVMNfDAgB8MI7/MOPyddqhv+P/QmKIIxtIQUupBPt
 pP65vv28qNsrcbgjxDaq7t9Kxqf2ZL7TB97VUAdF1eGBxEftfiMJrgYg4vjfVj5UgH9X
 AfdSdWBMgwIljYQME1rV3P7VfHnk6suk0FBXKcchlEhHIorsYqCPO9EouJL1tDNmvexJ
 dtYtkdTsuETwyVC7NiMJ+hoR6maqoYE3bzaRkqLCIKlgsNZs2KRbV8BmADLAZAH5Kdbn kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jhaw2ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:39 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A0RoE1021299;
	Mon, 10 Oct 2022 00:30:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jhaw2tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29A0Kcw0028575;
	Mon, 10 Oct 2022 00:30:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3k30fja1dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29A0PrbH38011224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 00:25:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B82EEAE051;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61914AE045;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8C7436061A;
	Mon, 10 Oct 2022 11:30:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/6] powerpc/module: Optimise nearby branches in ELF V2 ABI stub
Date: Mon, 10 Oct 2022 11:29:54 +1100
Message-Id: <20221010002957.128276-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010002957.128276-1-bgray@linux.ibm.com>
References: <20221010002957.128276-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gTGNmI_hm7jDsE21SMvbmRWU97D-tqBW
X-Proofpoint-ORIG-GUID: vmUH4B8oHlpKKpVe4caWny2v28q1mvl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210090155
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Inserts a direct branch to the stub target when possible, replacing the
mtctr/btctr sequence.

The load into r12 could potentially be skipped too, but that change
would need to refactor the arguments to indicate that the address
does not have a separate local entry point.

This helps the static call implementation, where modules calling their
own trampolines are called through this stub and the trampoline is
easily within range of a direct branch.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 83a6f6e22e3b..3a90043b006c 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -141,6 +141,12 @@ static u32 ppc64_stub_insns[] = {
 	PPC_RAW_BCTR(),
 };
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
+#define PPC64_STUB_MTCTR_OFFSET 5
+#else
+#define PPC64_STUB_MTCTR_OFFSET 4
+#endif
+
 /* Count how many different 24-bit relocations (different symbol,
    different addend) */
 static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
@@ -426,6 +432,7 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			      struct module *me,
 			      const char *name)
 {
+	int err;
 	long reladdr;
 	func_desc_t desc;
 	int i;
@@ -439,6 +446,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			return 0;
 	}
 
+	/* Replace indirect branch sequence with direct branch where possible */
+	err = patch_branch(&entry->jump[PPC64_STUB_MTCTR_OFFSET], addr, 0);
+	if (err && err != -ERANGE)
+		return 0;
+
 	/* Stub uses address relative to r2. */
 	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
 	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-- 
2.37.3

