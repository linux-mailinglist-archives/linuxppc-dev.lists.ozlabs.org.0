Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1653F19D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 14:57:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr4Yg1g9Bz3cm7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 22:57:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr4YG2gs1z30B0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 22:57:20 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JCXMI3178857; Thu, 19 Aug 2021 08:57:06 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ahq0vhfa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 08:57:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JCmQiV021378;
 Thu, 19 Aug 2021 12:57:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ae5f8g9hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 12:57:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JCv1qr57278792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 12:57:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B3A6A405C;
 Thu, 19 Aug 2021 12:57:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 373ACA4054;
 Thu, 19 Aug 2021 12:57:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 19 Aug 2021 12:57:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 82CE4220179;
 Thu, 19 Aug 2021 14:57:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/prom: Introduce early_reserve_mem_old()
Date: Thu, 19 Aug 2021 14:56:51 +0200
Message-Id: <20210819125656.14498-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819125656.14498-1-clg@kaod.org>
References: <20210819125656.14498-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hlJ9oMifOqrPTjRC6KVDNLOvrSSSRzCM
X-Proofpoint-ORIG-GUID: hlJ9oMifOqrPTjRC6KVDNLOvrSSSRzCM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1034 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108190072
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

and condition its call with IS_ENABLED(CONFIG_PPC32). This fixes a
compile error with W=3D1.

arch/powerpc/kernel/prom.c: In function =E2=80=98early_reserve_mem=E2=80=99=
:
arch/powerpc/kernel/prom.c:625:10: error: variable =E2=80=98reserve_map=E2=
=80=99 set but not used [-Werror=3Dunused-but-set-variable]
  __be64 *reserve_map;
          ^~~~~~~~~~~
cc1: all warnings being treated as errors

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Christophe, I think you had comments on this one ? Yes, I am being a bit=
 lazy.

 arch/powerpc/kernel/prom.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index f620e04dc9bf..52869d12bc1d 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -621,27 +621,14 @@ static void __init early_reserve_mem_dt(void)
 	}
 }
=20
-static void __init early_reserve_mem(void)
+static void __init early_reserve_mem_old(void)
 {
 	__be64 *reserve_map;
=20
 	reserve_map =3D (__be64 *)(((unsigned long)initial_boot_params) +
 			fdt_off_mem_rsvmap(initial_boot_params));
=20
-	/* Look for the new "reserved-regions" property in the DT */
-	early_reserve_mem_dt();
-
-#ifdef CONFIG_BLK_DEV_INITRD
-	/* Then reserve the initrd, if any */
-	if (initrd_start && (initrd_end > initrd_start)) {
-		memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
-			ALIGN(initrd_end, PAGE_SIZE) -
-			ALIGN_DOWN(initrd_start, PAGE_SIZE));
-	}
-#endif /* CONFIG_BLK_DEV_INITRD */
-
-#ifdef CONFIG_PPC32
-	/*=20
+	/*
 	 * Handle the case where we might be booting from an old kexec
 	 * image that setup the mem_rsvmap as pairs of 32-bit values
 	 */
@@ -659,9 +646,25 @@ static void __init early_reserve_mem(void)
 			DBG("reserving: %x -> %x\n", base_32, size_32);
 			memblock_reserve(base_32, size_32);
 		}
-		return;
 	}
-#endif
+}
+
+static void __init early_reserve_mem(void)
+{
+	/* Look for the new "reserved-regions" property in the DT */
+	early_reserve_mem_dt();
+
+#ifdef CONFIG_BLK_DEV_INITRD
+	/* Then reserve the initrd, if any */
+	if (initrd_start && (initrd_end > initrd_start)) {
+		memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
+			ALIGN(initrd_end, PAGE_SIZE) -
+			ALIGN_DOWN(initrd_start, PAGE_SIZE));
+	}
+#endif /* CONFIG_BLK_DEV_INITRD */
+
+	if (IS_ENABLED(CONFIG_PPC32))
+		early_reserve_mem_old();
 }
=20
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
--=20
2.31.1

