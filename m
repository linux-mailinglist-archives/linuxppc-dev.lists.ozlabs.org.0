Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A82D2E7A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:42:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4F63580zDqSy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3cL5DjQzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:14:10 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8F1rYR098193; Tue, 8 Dec 2020 10:14:03 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359qrgk0aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 10:14:03 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8F9ZTN019657;
 Tue, 8 Dec 2020 15:14:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8ne9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 15:14:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8FBTAN30998790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 15:11:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D75411C089;
 Tue,  8 Dec 2020 15:11:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E532511C077;
 Tue,  8 Dec 2020 15:11:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Dec 2020 15:11:28 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6D748220190;
 Tue,  8 Dec 2020 16:11:28 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/13] powerpc/xive: Fix allocation of pages donated to the
 XIVE controller
Date: Tue,  8 Dec 2020 16:11:16 +0100
Message-Id: <20201208151124.1329942-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208151124.1329942-1-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 suspectscore=1 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 clxscore=1034 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080086
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The XIVE interrupt controller uses a set of internal tables to handle
interrupt routing. The small tables (SBE, EAT) are direct tables and
allocated by OPAL. The bigger ones (NVT, ENDT) are indirect, i.e., the
first table entries point to a page which contains the XIVE structures
used by HW. For these, OPAL only allocates the first page level and
requests pages to be allocated by Linux when a new entry is inserted.

Make sure that these pages can not be reclaimed. The problem can be
seen while stressing a system with 4K KVM guests, 16 vCPUs each.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h | 2 ++
 arch/powerpc/sysdev/xive/common.c        | 2 +-
 arch/powerpc/sysdev/xive/native.c        | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index d701af7fb48c..1eacc90f4dcf 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -73,6 +73,8 @@ static inline u32 xive_alloc_order(u32 queue_shift)
 	return (queue_shift > PAGE_SHIFT) ? (queue_shift - PAGE_SHIFT) : 0;
 }
=20
+#define XIVE_GFP (__GFP_NORETRY | __GFP_NOWARN | __GFP_NOMEMALLOC)
+
 extern bool xive_cmdline_disabled;
=20
 #endif /*  __XIVE_INTERNAL_H */
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 605238ca65e4..80fd97d764ab 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1544,7 +1544,7 @@ __be32 *xive_queue_page_alloc(unsigned int cpu, u32=
 queue_shift)
 	__be32 *qpage;
=20
 	alloc_order =3D xive_alloc_order(queue_shift);
-	pages =3D alloc_pages_node(cpu_to_node(cpu), GFP_KERNEL, alloc_order);
+	pages =3D alloc_pages_node(cpu_to_node(cpu), XIVE_GFP, alloc_order);
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 	qpage =3D (__be32 *)page_address(pages);
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index cb58ec7ce77a..6afb44d0d816 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -643,7 +643,7 @@ static bool xive_native_provision_pages(void)
 		 * XXX TODO: Try to make the allocation local to the node where
 		 * the chip resides.
 		 */
-		p =3D kmem_cache_alloc(xive_provision_cache, GFP_KERNEL);
+		p =3D kmem_cache_alloc(xive_provision_cache, XIVE_GFP);
 		if (!p) {
 			pr_err("Failed to allocate provisioning page\n");
 			return false;
--=20
2.26.2

