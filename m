Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C947FC0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 11:57:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMvl74qlsz2yp9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 21:57:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J1gqUY27;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J1gqUY27; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMvkQ2G9Sz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 21:57:01 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAftVs026894; 
 Mon, 27 Dec 2021 10:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=SIzVxZ6r/UN8DgnfpcHWnMnQUknvJPFyMpEkOxGf69A=;
 b=J1gqUY27MMaBvShlLU3XSgR2AGoBm6Vh1H0LQogWveb5ZPGL5ooPHRmms1tzQFHuz8FQ
 g33l6Z7OWDlJHQiyxW7QaFHQlBNyHNR0EMt9+iGzj3JIzNQcFWgaPG0qRPLzcqj9U+9E
 YgSOl4AZlqVLK8bxn8o802WcOR8uUmY5dp3S8NiPEKwrz4TGvFjEd82madz7d4p/gi1n
 Ci+cjiaVCxbO0wP6nRuuMlqp4GLEMThk+gytb1qiJaXC5YYekcF9II5BSVN+0QMyTds3
 FygGqQrFAsdcTKHWTlR1m0ZtDe870Ag4KahjlyC5Oq6XduVEHQjlzaDReMyZ4wvXMjb4 RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7by806s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:56:54 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRAneLD017663;
 Mon, 27 Dec 2021 10:56:54 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7by806rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:56:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAEwti013644;
 Mon, 27 Dec 2021 10:56:53 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3d5tx9p104-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:56:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRAupdf8454508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 10:56:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8150128058;
 Mon, 27 Dec 2021 10:56:51 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F7B02805C;
 Mon, 27 Dec 2021 10:56:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 10:56:50 +0000 (GMT)
Message-ID: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
Subject: [RFC PATCH 0/3] powerpc/pseries/vas: VAS/NXGZIP support with LPM
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 27 Dec 2021 02:56:48 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UEQl4sJatZ3YSzR_orAuJ2EHjxlHuCdP
X-Proofpoint-GUID: 4IOwMbYcOEE9VV2IPnBCbcDwfiQ7kHYv
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_02,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=919
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270052
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
  powerpc/pseries/vas: Modify reconfig open/close functions for
    migration
  powerpc/pseries/vas: Add VAS suspend/resume notifier
  powerpc/pseries/vas: Use migration_in_progress to disable DLPAR

 arch/powerpc/include/asm/vas.h       |   2 +
 arch/powerpc/platforms/pseries/vas.c | 176 ++++++++++++++++++++++++---
 2 files changed, 162 insertions(+), 16 deletions(-)

-- 
2.27.0


