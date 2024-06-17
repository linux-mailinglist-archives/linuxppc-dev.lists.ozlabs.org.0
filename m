Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74090A775
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 09:38:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cj99Yk85;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hZZ6xsqz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 17:38:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cj99Yk85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hY42Mkfz3dBr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 17:37:11 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H6vTcL025280;
	Mon, 17 Jun 2024 07:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=3SrKMgy6URapIyXPkoC3Zdw/IS
	PnKAFZZPejEf3Yt2U=; b=cj99Yk85CFRtvLs0AgIdotfr1N5NRMZoFAQY1h6NuX
	Qtd7iF5AL9bKasVutyOzMklZiQnqp1DKpU6i9Qo1PLJrg2g8YutYlnnT7Xx4Coxz
	dAKzp2p6lHSnwAqMhVMEW3pEg0lDaz1Q4aE3Z5S77/J2Z1X+Zv+JPjNbwfIFv7RP
	rGMlwV2Nfm8Jr1vV8nhc68TYteqVUisaF6R18LoCC7xqDpR6K4DGRs+97lPkhp5b
	UPBDYgu/gE3LR9ZHbjZ52lsGEQ5JjP1+asdblsg1cPa+5Ju+4ZWEzBZlYWxDtG9L
	kZzb56sUzcQvGkcdkTmuUKWMB2427i9qHjNwG6oMYIIg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytcu6rfrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 07:37:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45H5Te5H011031;
	Mon, 17 Jun 2024 07:37:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yspsmqsht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 07:37:05 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45H7b0h048169454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 07:37:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C8DF2004E;
	Mon, 17 Jun 2024 07:37:00 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD8C820040;
	Mon, 17 Jun 2024 07:36:58 +0000 (GMT)
Received: from tp-ibm-com.domain.name (unknown [9.171.38.70])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jun 2024 07:36:58 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 0/1] Parallel EEH recovery between PHBs
Date: Mon, 17 Jun 2024 13:06:43 +0530
Message-ID: <20240617073644.566218-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MrUSC2CYTJl1eZI12TjZQ8JqUIhPjpFO
X-Proofpoint-GUID: MrUSC2CYTJl1eZI12TjZQ8JqUIhPjpFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_06,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=296
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170055
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This change is based on Sam Bobroff's patches which aimed
to allow recovery to happen in parallel between PHBs and PEs,
Due to various reasons the patches did not get in.

But having parallel recovery between PHBs is fairly simple and
gives significant improvement on powervm, Since powervm maintains
flat hierarchy for PCI devices.
This patch enables PHBs to have separate event queues and shorten
the time taken for EEH recovery by making the recovery to run in
parallel between PHBs.

On powervm with 64 VFs from same PHB,  I see approximately 48%
reduction in time taken in EEH recovery. On powernv the improvement
is not so significant.

Ganesh Goudar (1):
  powerpc/eeh: Enable PHBs to recovery in parallel

 arch/powerpc/include/asm/eeh_event.h  |  7 ++++
 arch/powerpc/include/asm/pci-bridge.h |  4 ++
 arch/powerpc/kernel/eeh_driver.c      | 27 +++++++++++-
 arch/powerpc/kernel/eeh_event.c       | 59 +++++++++++++++++----------
 arch/powerpc/kernel/eeh_pe.c          |  4 ++
 5 files changed, 78 insertions(+), 23 deletions(-)

-- 
2.44.0

