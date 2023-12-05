Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FDD805F45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 21:19:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fLh/5rYx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlBhl3hS3z3dGr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 07:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fLh/5rYx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlBgs3RH6z3cVY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 07:18:49 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5Jm57m015804;
	Tue, 5 Dec 2023 20:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2xqKcYQA8MQnqu68X0jRFrSDm32HOOSlsD1tIIjzdRc=;
 b=fLh/5rYx9QKp8Oa+w+G2omcdSEP7AvSZYkB6RomHegehrm6zNA5qhSoGBgLnrns1NT5A
 UrZ9URXzZNMnVpuVA9sD0FAW6hBeW2NsRAeUVFhUQuZkXB1xaorP3YdvZGzTFUL2vdyk
 x3UAvaOWeI6vpLND7e4yvByvTFt0QmFhGzT2zTOZnrB8Op+67Mu56lNqsUAatKdldIbl
 4x01izXTcX3omQh3HqkJrAyY4fh55BMCC4bcwWvtGuWNeXPQf2TW7LDQ8Q8Y+iVn5T6+
 frPVYgwlHWnhwPbxhVh+089b+wu2re4p5wARO3rUjeeVPi0iGlMrFnEwio4Cq9iGAO82 rg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3utab9ru5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 20:18:41 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5J3WX8009969;
	Tue, 5 Dec 2023 20:18:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3urh4kgqwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 20:18:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B5KIbER44434100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Dec 2023 20:18:37 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A13CF20049;
	Tue,  5 Dec 2023 20:18:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A9172004D;
	Tue,  5 Dec 2023 20:18:36 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.30.216])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Dec 2023 20:18:35 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 0/3] powerpc/fadump: pass additional args to dump capture kernel
Date: Wed,  6 Dec 2023 01:48:32 +0530
Message-ID: <20231205201835.388030-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dx3wRfKemKFiM85yvbuPMiAdUJ3GRaRE
X-Proofpoint-GUID: dx3wRfKemKFiM85yvbuPMiAdUJ3GRaRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_15,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=6 suspectscore=0
 mlxlogscore=119 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=6 spamscore=6 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050160
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
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

This patch series adds support to pass additional parameters to fadump
capture kernel to make it more desirable. For this, a dedicated area
is passed between production kernel and capture kerenl to pass these
additional parameters. This support is enabled only on pseries as of
now. The dedicated area is referred to as RTAS_FADUMP_PARAM_AREA.

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

Hari Bathini (2):
  powerpc/fadump: pass additional parameters to dump capture kernel
  powerpc/fadump: pass additional parameters when fadump is active

Sourabh Jain (1):
  powerpc/pseries/fadump: add support for multiple boot memory regions

 arch/powerpc/include/asm/fadump-internal.h   |   5 +-
 arch/powerpc/include/asm/fadump.h            |   2 +
 arch/powerpc/kernel/fadump.c                 | 141 +++++++--
 arch/powerpc/kernel/prom.c                   |   3 +
 arch/powerpc/platforms/powernv/opal-fadump.c |  14 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c | 293 +++++++++++++------
 arch/powerpc/platforms/pseries/rtas-fadump.h |  29 +-
 7 files changed, 360 insertions(+), 127 deletions(-)

-- 
2.43.0

