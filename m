Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE11231E02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 14:05:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsgv30V5zDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 22:05:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGsCD2BhkzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:44:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGsCC6yvrz8tSY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:44:23 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGsCC5lTrz9sTR; Wed, 29 Jul 2020 21:44:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGsCC1j3Tz9sTH
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jul 2020 21:44:23 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TBWxLU050275; Wed, 29 Jul 2020 07:44:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32k72ba5gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:44:15 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TBeJKb075474;
 Wed, 29 Jul 2020 07:44:15 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32k72ba5ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:44:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TBgtlD016170;
 Wed, 29 Jul 2020 11:44:13 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqgn059-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:44:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06TBgjEj66584988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 11:42:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D30975204E;
 Wed, 29 Jul 2020 11:44:10 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.79.217.86])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 83E1352050;
 Wed, 29 Jul 2020 11:44:07 +0000 (GMT)
Subject: [PATCH v6 11/11] ppc64/kexec_file: enable early kernel's OPAL calls
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jul 2020 17:14:06 +0530
Message-ID: <159602303975.575379.5032301944162937479.stgit@hbathini>
In-Reply-To: <159602259854.575379.16910915605574571585.stgit@hbathini>
References: <159602259854.575379.16910915605574571585.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290071
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel built with CONFIG_PPC_EARLY_DEBUG_OPAL enabled expects r8 & r9
to be filled with OPAL base & entry addresses respectively. Setting
these registers allows the kernel to perform OPAL calls before the
device tree is parsed.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v5 -> v6:
* Added Reviewed-by tag from Thiago.
* Moved the patch to end of the series for mpe to take a call on whether
  to have it or not.

v4 -> v5:
* New patch. Updated opal_base & opal_entry values in r8 & r9 respectively.
  This change was part of the below dropped patch in v4:
    - https://lore.kernel.org/patchwork/patch/1275667/


 arch/powerpc/kexec/file_load_64.c      |   20 ++++++++++++++++++++
 arch/powerpc/purgatory/trampoline_64.S |   16 ++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index c6a37ad5a0a4..53bb71e3a2e1 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -876,6 +876,7 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr)
 {
+	struct device_node *dn = NULL;
 	int ret;
 
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
@@ -903,9 +904,28 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 					     &image->arch.backup_start,
 					     sizeof(image->arch.backup_start),
 					     false);
+	if (ret)
+		goto out;
+
+	/* Setup OPAL base & entry values */
+	dn = of_find_node_by_path("/ibm,opal");
+	if (dn) {
+		u64 val;
+
+		of_property_read_u64(dn, "opal-base-address", &val);
+		ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
+						     sizeof(val), false);
+		if (ret)
+			goto out;
+
+		of_property_read_u64(dn, "opal-entry-address", &val);
+		ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
+						     sizeof(val), false);
+	}
 out:
 	if (ret)
 		pr_err("Failed to setup purgatory symbols");
+	of_node_put(dn);
 	return ret;
 }
 
diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
index e79077ff1355..e6a6e7e6dfe4 100644
--- a/arch/powerpc/purgatory/trampoline_64.S
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -87,6 +87,10 @@ master:
 	li	%r4,28
 	STWX_BE	%r17,%r3,%r4	/* Store my cpu as __be32 at byte 28 */
 1:
+	/* Load opal base and entry values in r8 & r9 respectively */
+	ld	%r8,(opal_base - 0b)(%r18)
+	ld	%r9,(opal_entry - 0b)(%r18)
+
 	/* load the kernel address */
 	ld	%r4,(kernel - 0b)(%r18)
 
@@ -133,6 +137,18 @@ backup_start:
 	.8byte  0x0
 	.size backup_start, . - backup_start
 
+	.balign 8
+	.globl opal_base
+opal_base:
+	.8byte  0x0
+	.size opal_base, . - opal_base
+
+	.balign 8
+	.globl opal_entry
+opal_entry:
+	.8byte  0x0
+	.size opal_entry, . - opal_entry
+
 	.data
 	.balign 8
 .globl purgatory_sha256_digest


