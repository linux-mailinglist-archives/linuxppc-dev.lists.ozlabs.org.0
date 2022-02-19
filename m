Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DB04BCA92
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KKh6ZJ4z3dkc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:04:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gxIrQMLl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gxIrQMLl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KK11l3Nz2x9P
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:04:20 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJGuY3030554; 
 Sat, 19 Feb 2022 20:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ASf2tseN+TigZhVFH+u8PVSP92z5KGKTNc4Eim/0cPY=;
 b=gxIrQMLlg4GIW9+t7szIutT43COL1jkLqDT8i/tvPE8dYKIFgM2e9tRJmJmuC38l/Gdy
 GNcKMaXhb9iIhtCK5R6cBfPl1fAFepx3WVBGUfeAcc5icFeCl1wK4dG4wvjXkVGNHqL+
 cTTp2/CUHM0K4u3dCSStSUc72G8m9WSrwky26ZBBQogho/gLQAf/m4pTUuuT3DcMdbsY
 zkMglQfUgbkhDDiFS/zEAEJG2J8HtTTa1ScKn6TYU55d1kTyUAGRvrmlWpYrxtCqmH0i
 pe+JFp8FMnFFkdA/9nOgcom0f8V0YJX1MdBzmrsJSZj+UkLMzIEERQJ2ChVIp8szg3Bz Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb6js0jca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:04:16 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJcsHD027362;
 Sat, 19 Feb 2022 20:04:15 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb6js0jc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:04:15 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JK47Kk018055;
 Sat, 19 Feb 2022 20:04:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3ear68p5cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:04:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK4DwA31982076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:04:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AA76AC059;
 Sat, 19 Feb 2022 20:04:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B76FAC065;
 Sat, 19 Feb 2022 20:04:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:04:12 +0000 (GMT)
Message-ID: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
Subject: [PATCH v3 0/4] powerpc/pseries/vas: VAS/NXGZIP support with LPM
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:04:10 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VMiIymaX9Ro5tSACMqAJbudj26KGurA-
X-Proofpoint-ORIG-GUID: Y1UsTs6mONwdcFkBAQJPj5fnHrzJAlmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=427
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190130
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

Haren Myneni (4):
  powerpc/pseries/vas: Define global hv_cop_caps struct
  powerpc/pseries/vas: Modify reconfig open/close functions for
    migration
  powerpc/pseries/vas: Add VAS migration handler
  powerpc/pseries/vas: Disable window open during migration

 arch/powerpc/include/asm/vas.h            |   2 +
 arch/powerpc/platforms/pseries/mobility.c |   5 +
 arch/powerpc/platforms/pseries/vas.c      | 234 +++++++++++++++++-----
 arch/powerpc/platforms/pseries/vas.h      |   6 +
 4 files changed, 201 insertions(+), 46 deletions(-)

-- 
2.27.0


