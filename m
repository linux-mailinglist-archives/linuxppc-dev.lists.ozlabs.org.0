Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71AB8669E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 07:08:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cdd7+BxY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjqsz3Pn9z3dS0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:08:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cdd7+BxY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjqsC1TD6z30h5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 17:07:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q2skcw023039;
	Mon, 26 Feb 2024 06:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=C8+2Qnl9XtAIZApdC5az7ZdfHDNJ60GO2n/6cCrVzNA=;
 b=cdd7+BxYXwetO7Kz4/PtGsPa6TDRaok6mjN1s4+ZmS7Kh3L8h6A8zoySYFne1+O0SJxt
 PlxtdmVtDnnv/lebKfnL32ocFoOImJmvvGtfAtAgcXX4IPeM1kzDfDeF4niOkchdfnQj
 e/ew0z+GeYAppoku0zoM4QjW3z/ZivAaTowp4rpagq1ByEUbFFSFMSj1y7mGQ9aYs4Gk
 wODp0y9oB4F1GP/vPnCQ6Ai4HSnxq9B8B8vXi6xnFnV5Aocauc2m9YSWJE/5TYmSxY+h
 hsZuk/9JpcwX/ZgJGPB00zWkDzrd2eB6sFzegTgc5fGA914fNFCHove1cMOu96yfI7GN qA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgdvuf2cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:07:20 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q67FgN024127;
	Mon, 26 Feb 2024 06:07:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0jxsbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:07:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41Q67E2i57803062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 06:07:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08D4E2004B;
	Mon, 26 Feb 2024 06:07:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA4FD20040;
	Mon, 26 Feb 2024 06:07:11 +0000 (GMT)
Received: from tp-ibm-com.ibmuc.com (unknown [9.171.51.48])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 06:07:10 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 0/1] Parallel EEH recovery between PHBs
Date: Mon, 26 Feb 2024 11:37:04 +0530
Message-ID: <20240226060705.146261-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NzfvR_cg2sWTsByCGu4b5ggTCClB1DCN
X-Proofpoint-ORIG-GUID: NzfvR_cg2sWTsByCGu4b5ggTCClB1DCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_02,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0
 mlxlogscore=318 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2402260044
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

 arch/powerpc/include/asm/eeh_event.h  |  7 +++++
 arch/powerpc/include/asm/pci-bridge.h |  4 +++
 arch/powerpc/kernel/eeh_driver.c      | 27 +++++++++++++++++--
 arch/powerpc/kernel/eeh_event.c       | 38 ++++++++++++++++++++++++++-
 arch/powerpc/kernel/eeh_pe.c          |  4 +++
 5 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.43.2

