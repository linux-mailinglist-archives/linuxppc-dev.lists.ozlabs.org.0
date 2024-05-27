Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 45EF58CFAD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 10:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vnnxs1NPsz3gL3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 17:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnnxN0m0Qz3fwX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 17:55:03 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44R7klkI020397;
	Mon, 27 May 2024 07:54:58 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Dibm.com;_h=3Dcc?=
 =?UTF-8?Q?:content-transfer-encoding:date:from:message-id:mime-version:su?=
 =?UTF-8?Q?bject:to;_s=3Dpp1;_bh=3D9nUS4kem/dYo6Edjf/6tfPUfhFsnuIrmV0KaaMr?=
 =?UTF-8?Q?5zX8=3D;_b=3DVIAzd++wUR+vebt8qZ1wOYhEfqegDwgl1aCLuW+oJYNcq2Vo00?=
 =?UTF-8?Q?n154osVakSw+kud0Cw_ckWVZ2KlZMwcse/AZdvRe79V+OrEB+gdKwi9FVu18uKc?=
 =?UTF-8?Q?KasWumZSJRpkPvqOVe1ZUVD3_dJBQ7QDDmzZzXibfp/LhRMsBRB0wbReX3uRasY?=
 =?UTF-8?Q?VtyThf7dJKxflvHDR1hS619X+fPaMM_tkE94N0Z/pSAKQB2ydTU5CPE5kmR6BvG?=
 =?UTF-8?Q?+qZhI3drLYTFxbPc2quxq41d/dJTjNmbRdVT_fFh5aK+nLxa695aj9JzocrLZzk?=
 =?UTF-8?Q?d6e9hmGSd2NRajfLvmegtAN7lEEJ+ljFrp6fQ2axy7_ig=3D=3D_?=
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ycmftr883-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 07:54:58 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44R5s8Wq032078;
	Mon, 27 May 2024 07:54:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ybutkyjd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 07:54:57 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44R7spJP14942592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 May 2024 07:54:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 749CA2004F;
	Mon, 27 May 2024 07:54:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E37DD20040;
	Mon, 27 May 2024 07:54:49 +0000 (GMT)
Received: from tp-ibm-com.domain.name (unknown [9.171.19.162])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 May 2024 07:54:49 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/eeh: avoid possible crash when edev->pdev changes
Date: Mon, 27 May 2024 13:24:33 +0530
Message-ID: <20240527075433.415693-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G7xc6BYPW8x_eJt17QTklDwKqNGunlUJ
X-Proofpoint-ORIG-GUID: G7xc6BYPW8x_eJt17QTklDwKqNGunlUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 malwarescore=0 mlxlogscore=637 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405270063
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a PCI device is removed during eeh_pe_report_edev(), edev->pdev
will change and can cause a crash, hold the PCI rescan/remove lock
while taking a copy of edev->pdev.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_pe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index d1030bc52564..49f968733912 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -859,7 +859,9 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 
 	/* Retrieve the parent PCI bus of first (top) PCI device */
 	edev = list_first_entry_or_null(&pe->edevs, struct eeh_dev, entry);
+	pci_lock_rescan_remove();
 	pdev = eeh_dev_to_pci_dev(edev);
+	pci_unlock_rescan_remove();
 	if (pdev)
 		return pdev->bus;
 
-- 
2.44.0

