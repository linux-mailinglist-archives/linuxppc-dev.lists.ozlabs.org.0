Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B3496789
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:49:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgY1K1Cdsz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xlp+lpyR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xlp+lpyR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgY0X0ZC5z2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 08:48:27 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LL61qp025020; 
 Fri, 21 Jan 2022 21:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=RJwyNJEks06VC+Hzvzo6U+wpZJP45j0DyGPAljSVyMk=;
 b=Xlp+lpyRFJ1Z/DDi9QHcVBRn/jB7IeUzQjoW9NJK82yOFHec4PCiLFPIehg5A2Ckl+de
 sZ/UIinSUpl+E1WiGPbhQRoxTtfXNe+9Q6zIK8QDWuFKn46VhRAOYYfigzRxyZjtC2BW
 KJ5pgZPVxJ3/RT463Hwd7XltpgoRfs104WTTjwiDB2ah1YvzlyKZqUwGfbZdkz1pfbGS
 PqyIbqaMNs1ozMgo3Wueiv/OzWZyrjZN92sluo0/wYELFpxUJLtbqNJEIXVItgfe2/pw
 Z7AaWjAdxdN0HuAAxQHDkUr4iOo06UidTyihBIxFuOqQEnnAGmWk822JlnIqZcm25YDK gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr378j3e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 21:48:20 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LLFDIS021740;
 Fri, 21 Jan 2022 21:48:19 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr378j3dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 21:48:19 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LLg8fg007719;
 Fri, 21 Jan 2022 21:48:18 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3dqj1fbupw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 21:48:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LLmGUb23331154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 21:48:16 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EE85C605A;
 Fri, 21 Jan 2022 21:48:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04F28C6055;
 Fri, 21 Jan 2022 21:48:14 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 21:48:14 +0000 (GMT)
Message-ID: <cb790b1d369457eb124ad9daa4b4833fa12e0832.camel@linux.ibm.com>
Subject: [RFC PATCH 0/3] powerpc/pseries/vas: VAS/NXGZIP support with LPM
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Fri, 21 Jan 2022 13:48:13 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NW-CDkugp2kzmKIHR84HOJhsIp2_M2S7
X-Proofpoint-GUID: wh_18a5VtwK_kA6LxvIHnXp-6wg8RUd0
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_10,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=657 malwarescore=0 adultscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210136
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
When the migration initiates, the VAS code gets suspend notifier
which closes all active windows and sets VAS_WIN_MIGRATE_CLOSE as
window status. Whereas receives resume notifier after migration
to reopen all windows which has VAS_WIN_MIGRATE_CLOSE status.

These patches depend on VAS/DLPAR support patch series
(https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-December/238331.html)
Also the suspend/resume notifier code is added in a separate patch
and will be posted later with the actual patches.

Haren Myneni (3):
  powerpc/pseries/vas: Modify reconfig open/close functions for migration
  powerpc/pseries/vas: Add VAS suspend/resume notifier
  powerpc/pseries/vas: Disable window open during migration

 arch/powerpc/include/asm/vas.h       |   2 +
 arch/powerpc/platforms/pseries/vas.c | 199 ++++++++++++++++++++++++---
 2 files changed, 181 insertions(+), 20 deletions(-)

-- 
2.27.0


