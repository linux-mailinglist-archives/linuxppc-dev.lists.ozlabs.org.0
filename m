Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330B4C63F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:46:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6XWv1mw2z3bk5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:46:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h14zo3WC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h14zo3WC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6XW83JbVz2xrv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:46:12 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S7cSnA018387; 
 Mon, 28 Feb 2022 07:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mdm6go2E92XrxZmwDNd7rHno+BJCGGwU5vncGVgBH3M=;
 b=h14zo3WCqnG8E7dGYV0tsUcf8yos4zmlRVLCJeZJfSg1Po1BLBt1ZBbuekcZ5ZaOjb2E
 bxtj0hwTq5NH5h3/aW1YKtoLhdmWecE0CzkFB7pc3TXIPwnjrp1n6EfhJHtlCIkYrg2r
 kSX0tp8vmU6rbrdc+V/Stq517WmstRT55u/LPSCoDJxu2kHLLst7lxLjr/I1bHNjNmk3
 tdxcaTGNk22r/Iyn7E1bLiHEWrAKhLCd0veBWf4snC/zbM5vyeA5tHYDIlwObQWqhwbq
 RRDwB4BgjYFX2+kxUOiSVYnqPaCpjc6v5Nb0tAijkADxv7uN2npC/82K+gbH2UQkm+ET Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egrgjjmcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:46:09 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7k81u008616;
 Mon, 28 Feb 2022 07:46:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egrgjjmc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:46:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7bGJC016616;
 Mon, 28 Feb 2022 07:46:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3efbu9xd3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:46:06 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7k40b46596594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:46:04 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59AB6B205F;
 Mon, 28 Feb 2022 07:46:04 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BDFFB2068;
 Mon, 28 Feb 2022 07:46:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:46:03 +0000 (GMT)
Message-ID: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
Subject: [PATCH v4 0/3] powerpc/pseries/vas: VAS/NXGZIP support with LPM
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:46:01 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gW5abF_j5D_6eXWQ7zJWwa_JiWJs7Nic
X-Proofpoint-ORIG-GUID: GU0VAZX_QLUSGg6xwIl_8Ug-lNVMbQtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=435 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280043
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
Cc: haren@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Virtual Accelerator Switchboard (VAS) is an engine stays on the
chip. So all windows opened on a specific engine belongs to VAS
the chip. The hypervisor expects the partition to close all
active windows on the sources system and reopen them after
migration on the destination machine.

This patch series adds VAS support with the partition migration.
When the migration initiates, the VAS migration handler will be
invoked before pseries_suspend() to close all active windows and
mark them in-active with VAS_WIN_MIGRATE_CLOSE status. Whereas
this migration handler is called after migration to reopen all
windows which has VAS_WIN_MIGRATE_CLOSE status and make them
active again. The user space gets paste instruction failure
when it sends requests on these in-active windows.

These patches depend on VAS/DLPAR support patch series

Changes in v2:
- Added new patch "Define global hv_cop_caps struct" to eliminate
  memory allocation failure during migration (suggestion by
  Nathan Lynch)

Changes in v3:
- Rebase on 5.17-rc4
- Naming changes for VAS capability struct elemets based on the V4 DLPAR
  support patch series.

Changes in v4:
- Rebase on 5.17-rc5
- Include migration_in_progress enable patch in "VAS migration handler"
  and other changes as suggested by Nicholas Piggin 

Haren Myneni (3):
  powerpc/pseries/vas: Define global hv_cop_caps struct
  powerpc/pseries/vas: Modify reconfig open/close functions for
	migration
  powerpc/pseries/vas: Add VAS migration handler

 arch/powerpc/include/asm/vas.h            |   2 +
 arch/powerpc/platforms/pseries/mobility.c |   5 +
 arch/powerpc/platforms/pseries/vas.c      | 233 +++++++++++++++++-----
 arch/powerpc/platforms/pseries/vas.h      |   6 +
 4 files changed, 201 insertions(+), 45 deletions(-)

-- 
2.27.0


