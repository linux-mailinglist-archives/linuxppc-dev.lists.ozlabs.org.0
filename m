Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBD022E260
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:52:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFD9F3hmGzDrKb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:52:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCtj6m8ZzDrFF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:39:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFCtj4lfHz8tRl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:39:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFCtj33kpz9sRR; Mon, 27 Jul 2020 05:39:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFCth6m8Bz9sRN
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 05:39:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QJWsWK165801; Sun, 26 Jul 2020 15:39:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gf2992mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:39:18 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06QJX7QP166047;
 Sun, 26 Jul 2020 15:39:17 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gf2992m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:39:17 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QJaubm018257;
 Sun, 26 Jul 2020 19:39:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 32gcq0rvs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 19:39:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QJdCHu59637908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 19:39:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E24FAE04D;
 Sun, 26 Jul 2020 19:39:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F3E1AE045;
 Sun, 26 Jul 2020 19:39:09 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.85.82.224])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 19:39:08 +0000 (GMT)
Subject: [RESEND PATCH v5 07/11] ppc64/kexec_file: enable early kernel's OPAL
 calls
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Jul 2020 01:09:07 +0530
Message-ID: <159579233676.5790.10701756666641782647.stgit@hbathini>
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_12:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007260154
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
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Eric Biederman <ebiederm@xmission.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel built with CONFIG_PPC_EARLY_DEBUG_OPAL enabled expects r8 & r9
to be filled with OPAL base & entry addresses respectively. Setting
these registers allows the kernel to perform OPAL calls before the
device tree is parsed.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

v4 -> v5:
* New patch. Updated opal_base & opal_entry values in r8 & r9 respectively.
  This change was part of the below dropped patch in v4:
    - https://lore.kernel.org/patchwork/patch/1275667/


 arch/powerpc/kexec/file_load_64.c      |   16 ++++++++++++++++
 arch/powerpc/purgatory/trampoline_64.S |   15 +++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 8df085a22fd7..a5c1442590b2 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -713,6 +713,8 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr)
 {
+	struct device_node *dn = NULL;
+	uint64_t val;
 	int ret;
 
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
@@ -735,9 +737,23 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			goto out;
 	}
 
+	/* Setup OPAL base & entry values */
+	dn = of_find_node_by_path("/ibm,opal");
+	if (dn) {
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
index a5a83c3f53e6..464af8e8a4cb 100644
--- a/arch/powerpc/purgatory/trampoline_64.S
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -61,6 +61,10 @@ master:
 	li	%r4,28
 	STWX_BE	%r17,%r3,%r4	/* Store my cpu as __be32 at byte 28 */
 1:
+	/* Load opal base and entry values in r8 & r9 respectively */
+	ld	%r8,(opal_base - 0b)(%r18)
+	ld	%r9,(opal_entry - 0b)(%r18)
+
 	/* load the kernel address */
 	ld	%r4,(kernel - 0b)(%r18)
 
@@ -102,6 +106,17 @@ dt_offset:
 	.8byte  0x0
 	.size dt_offset, . - dt_offset
 
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
 
 	.data
 	.balign 8


