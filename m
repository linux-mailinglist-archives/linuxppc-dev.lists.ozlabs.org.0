Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BED210502
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 09:28:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xXrW59T4zDqQd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 17:28:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xXlG3gPhzDqg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:23:38 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06173xlJ045102; Wed, 1 Jul 2020 03:23:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320mgnjvtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:23:32 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06176dUD058614;
 Wed, 1 Jul 2020 03:23:32 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320mgnjvt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:23:32 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0617ENOL006605;
 Wed, 1 Jul 2020 07:23:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 31wwr8wre0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 07:23:31 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0617NU9238928648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 07:23:30 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 530A2136059;
 Wed,  1 Jul 2020 07:23:30 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2FDF136051;
 Wed,  1 Jul 2020 07:23:26 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.179])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 07:23:26 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v7 1/7] powerpc/pmem: Restrict papr_scm to P8 and above.
Date: Wed,  1 Jul 2020 12:52:29 +0530
Message-Id: <20200701072235.223558-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_03:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 cotscore=-2147483648
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007010046
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
Cc: Jan Kara <jack@suse.cz>, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 oohall@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PAPR based virtualized persistent memory devices are only supported on
POWER9 and above. In the followup patch, the kernel will switch the persistent
memory cache flush functions to use a new `dcbf` variant instruction. The new
instructions even though added in ISA 3.1 works even on P8 and P9 because these
are implemented as a variant of existing `dcbf` and `hwsync` and on P8 and
P9 behaves as such.

Considering these devices are only supported on P8 and above,  update the driver
to prevent a P7-compat guest from using persistent memory devices.

We don't update of_pmem driver with the same condition, because, on bare-metal,
the firmware enables pmem support only on P9 and above. There the kernel depends
on OPAL firmware to restrict exposing persistent memory related device tree
entries on older hardware. of_pmem.ko is written without any arch dependency and
we don't want to add ppc64 specific cpu feature check in of_pmem driver.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/pmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index f860a897a9e0..2347e1038f58 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -147,6 +147,12 @@ const struct of_device_id drc_pmem_match[] = {
 
 static int pseries_pmem_init(void)
 {
+	/*
+	 * Only supported on POWER8 and above.
+	 */
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return 0;
+
 	pmem_node = of_find_node_by_type(NULL, "ibm,persistent-memory");
 	if (!pmem_node)
 		return 0;
-- 
2.26.2

