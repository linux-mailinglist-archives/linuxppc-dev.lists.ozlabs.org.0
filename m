Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E78C0F41
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 14:07:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AB4+tWfl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrPR738rz3cYK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:07:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AB4+tWfl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrNk4dbCz3cRR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 22:07:18 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 449AwH8o010769;
	Thu, 9 May 2024 12:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=wB/RWoAJV2Kfx9dgeYhfSibcvHgEFIlPM4CBDF2TtHk=;
 b=AB4+tWfl8spiWQqwneYWVcKOFIuDl7ua2n1SJa74QISK6sCl52gpfiL0C75UqSxDdxyt
 Xjea4wpL11Tnh8N+nChF0DlaR2xoQ4bHbFo+aFas64Knuv30aG6Xe0yxFOTZUcngZlVp
 1psr2jPtxGTN/QUwsELFfBfCKqxuSZ040fI722yz8KgN+/HSf4qwpWs55vLyaC765JBi
 68+nrfGF2D8emaHwK6OuQ0rwZCLYH09MRsdcPGpGxxBMA5RHV/xh4CGCHx6ClQQ5ss1/
 lgDmshvKYr+XqVJ9uXVYwosupxw+dcla/FFUs7Vd1FFTsQODipPPTyWl2WNiIqI4zgyI Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0w6rg4ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 12:07:06 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 449C76je020859;
	Thu, 9 May 2024 12:07:06 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0w6rg4u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 12:07:06 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 449Bn23i009823;
	Thu, 9 May 2024 12:07:05 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xyshutpgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 12:07:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 449C70Ih57016742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 12:07:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 054E620043;
	Thu,  9 May 2024 12:07:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1198120040;
	Thu,  9 May 2024 12:06:57 +0000 (GMT)
Received: from li-a50b8fcc-3415-11b2-a85c-f1daa4f09788.in.ibm.com (unknown [9.109.241.85])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2024 12:06:56 +0000 (GMT)
From: Krishna Kumar <krishnak@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH 0/2] PCI hotplug driver fixes
Date: Thu,  9 May 2024 17:35:52 +0530
Message-ID: <20240509120644.653577-1-krishnak@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EONjMsdldPhPf2sVN8g05O0_NZS1G4S_
X-Proofpoint-GUID: MhXk9jPgL08IGT3MtvuJymytL3kTsmxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxlogscore=673 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405090080
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-pci@vger.kernel.org, Krishna Kumar <krishnak@linux.ibm.com>, linux-kernel@vger.kernel.org, gbatra@linux.ibm.com, bhelgaas@google.com, tpearson@raptorengineering.com, oohall@gmail.com, brking@linux.vnet.ibm.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The fix of Powerpc hotplug driver (drivers/pci/hotplug/pnv_php.c)
addresses below two issues.

1. Kernel Crash during hot unplug of bridge/switch slot.

2. DPC-Support Enablement - Previously, when we do a hot-unplug
operation on a bridge slot, all the ports and devices behind the
bridge-ports would be hot-unplugged/offline, but when we do a hot-plug
operation on the same bridge slot, all the ports and devices behind the
bridge would not get hot-plugged/online. In this case, Only the first
port of the bridge gets enabled and the remaining port/devices remain
unplugged/offline.  After the fix, The hot-unplug and hot-plug
operations on the slot associated with the bridge started behaving
correctly and became in sync. Now, after the hot plug operation on the
same slot, all the bridge ports and devices behind the bridge become
hot-plugged/online/restored in the same manner as it was before the
hot-unplug operation.



Krishna Kumar (2):
  pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
  arch/powerpc: hotplug driver bridge support

 arch/powerpc/include/asm/ppc-pci.h |  4 +++
 arch/powerpc/kernel/pci-hotplug.c  |  5 ++--
 arch/powerpc/kernel/pci_dn.c       | 42 ++++++++++++++++++++++++++++++
 drivers/pci/hotplug/pnv_php.c      |  3 +--
 4 files changed, 49 insertions(+), 5 deletions(-)

-- 
2.44.0

