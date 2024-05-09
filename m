Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0368C0F0F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 13:58:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MFACxQev;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrBv4471z3cYQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 21:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MFACxQev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrBB06t1z3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 21:58:09 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 449Axk7N012332;
	Thu, 9 May 2024 11:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wWIiCSijmlG3Sv/ZMIEuQjjzkV4IGk287dsg/C4RpKY=;
 b=MFACxQev5m9eZpSonqW1Rx877wsro6jo9nqhElLkNu14ByoUlfkKHr3t4AbNZXlBOmbm
 nr7G5DDnAa27eWTK1ca30WrQfbbmBudN/x9/lNafweUTMuI81sHiPu91F8BE7yMX3LlX
 YrBk1MeYLRryHTfXerUluFPUXBHDAtr4n2mgQ/ebW98mk3Q+GV66IF6q4RPpTveRQUuj
 lItaBfMU+NayRQM0Tiw4eL5c1s8EnJzuzUQ27kI+lzOFfl+fgy7cV5TwPUg+omiu8UWj
 gwQq6Tb2LKnTxHj2sVu6yCtiO/kcgesJ4Fw9tlUAqwA2Npez/j5whajkiHUBNth5cmG3 ZA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0w6rg40m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 11:58:03 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4498kYQf017553;
	Thu, 9 May 2024 11:58:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xysht2m7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 11:58:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 449BvvIV55050710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 11:57:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2B9520043;
	Thu,  9 May 2024 11:57:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 956AE20040;
	Thu,  9 May 2024 11:57:56 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2024 11:57:56 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/3] powerpc/fadump: pass additional args to dump capture kernel
Date: Thu,  9 May 2024 17:27:52 +0530
Message-ID: <20240509115755.519982-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gMYscPaC0194dzEW-TvaJ9xebrF_5ZU_
X-Proofpoint-GUID: gMYscPaC0194dzEW-TvaJ9xebrF_5ZU_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxlogscore=492 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405090079
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While fadump is a more reliable alternative to kdump dump capturing
method, it doesn't support passing additional parameters. Having
such support is desirable for two major reasons:

  1. It helps minimize the memory consumption of fadump dump capture
     kernel by disabling features that consume considerable amount of
     memory but have little significance for dump capture environment
     (eg. numa, cma, cgroup, etc.)
   2. It helps disable such features/components in dump capture kernel
      that are unstable and/or are being debugged.

This patch series is a follow-up to [1]. Adds support for passing
additional parameters to fadump capture kernel to make it more
desirable. For this, a dedicated area is passed between production
kernel and capture kerenl to pass these additional parameters. This
support is enabled only on pseries as of now. The dedicated area is
referred to as RTAS_FADUMP_PARAM_AREA.

In radix MMU mode, this dedicated area can be anywhere but in case of
hash MMU, it can only be in the first memory block to be accessible
during early boot. Enabling this feature support in both radix and
hash MMU modes but in hash MMU only when RMA size is 768MB or more
to avoid complex memory real estate with FW components.

The first patch adds support for multiple boot memory regions to make
addition of any new region types simpler. The second patch sets up the
parameter (dedicated) area to be passed to the capture kernel.
/sys/kernel/fadump/bootargs_append is exported to the userspace to
specify the additional parameters to be passed to the capture kernel.
The last patch appends the parameters to bootargs during capture
kernel boot.

Changes in v2:
* RFC tag removed.
* Moved variable declaration out of switch case.
* Zero'ed the parameter area while setting up.
* Reserving the parameter area only when needed.

[1] https://lore.kernel.org/linuxppc-dev/20231205201835.388030-1-hbathini@linux.ibm.com/

Hari Bathini (3):
  powerpc/pseries/fadump: add support for multiple boot memory regions
  powerpc/fadump: setup additional parameters for dump capture kernel
  powerpc/fadump: pass additional parameters when fadump is active

 arch/powerpc/include/asm/fadump-internal.h   |   5 +-
 arch/powerpc/include/asm/fadump.h            |   2 +
 arch/powerpc/kernel/fadump.c                 | 149 ++++++++--
 arch/powerpc/kernel/prom.c                   |   3 +
 arch/powerpc/platforms/powernv/opal-fadump.c |  13 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c | 290 +++++++++++++------
 arch/powerpc/platforms/pseries/rtas-fadump.h |  29 +-
 7 files changed, 366 insertions(+), 125 deletions(-)

-- 
2.45.0

