Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00D2E9849
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 16:20:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8fTH5MhTzDrSp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 02:20:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8dRK43pqzDqL0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:33:49 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104EWEfr125322; Mon, 4 Jan 2021 09:33:35 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v3182qaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 09:33:34 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104EWBXc003388;
 Mon, 4 Jan 2021 14:32:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 35tgf7s0s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:32:15 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104EWCGJ44237292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 14:32:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC14F42049;
 Mon,  4 Jan 2021 14:32:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 894D742042;
 Mon,  4 Jan 2021 14:32:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  4 Jan 2021 14:32:12 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-4-90.uk.ibm.com [9.145.4.90])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DB0B222016B;
 Mon,  4 Jan 2021 15:32:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/23] powerpc/pmem: Include pmem prototypes
Date: Mon,  4 Jan 2021 15:31:48 +0100
Message-Id: <20210104143206.695198-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104143206.695198-1-clg@kaod.org>
References: <20210104143206.695198-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1034 bulkscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=885 phishscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040091
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

It fixes this W=3D1 compile error :

../arch/powerpc/lib/pmem.c:51:6: error: no previous prototype for =E2=80=98=
arch_wb_cache_pmem=E2=80=99 [-Werror=3Dmissing-prototypes]
   51 | void arch_wb_cache_pmem(void *addr, size_t size)
      |      ^~~~~~~~~~~~~~~~~~
../arch/powerpc/lib/pmem.c:58:6: error: no previous prototype for =E2=80=98=
arch_invalidate_pmem=E2=80=99 [-Werror=3Dmissing-prototypes]
   58 | void arch_invalidate_pmem(void *addr, size_t size)
      |      ^~~~~~~~~~~~~~~~~~~~

Fixes: 32ce3862af3c ("powerpc/lib: Implement PMEM API")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/lib/pmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 1550e0d2513a..eb2919ddf9b9 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -6,6 +6,7 @@
 #include <linux/string.h>
 #include <linux/export.h>
 #include <linux/uaccess.h>
+#include <linux/libnvdimm.h>
=20
 #include <asm/cacheflush.h>
=20
--=20
2.26.2

