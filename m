Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEC75B68CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRb4X6M5Tz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:41:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DiXC/3eE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DiXC/3eE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRb3s59Jyz2xkn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:40:41 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D6MPqq019810;
	Tue, 13 Sep 2022 07:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=XEWg50zbzdHL3H1BQOEtZ2hzWzP6iQyIY3jNSI3a5V8=;
 b=DiXC/3eEpUeCfj2WmTIdbNwUpjrm10YZ8+V3SFgBOKyPwIr7/wPnmiIJlCl3a4aKy0gJ
 G8mRCYkfBush3LCMw1XGST7kCetPRKItm0sp3XVFjEFidsvWcxoaIhgo8SJk8oATEb0Y
 HFHwGbNeZtwPL7ge83m/hoYr8IzJpeqcKCaeleSgwSlzCIcpIkmwMzyaisMkKZD/VMfz
 mirIF1UJZIO7LR6uEnQTfodx6FYwHktubyyRTqPudFARrqcCSE/9VJglZex+p4g6B1G+
 vVXdOuDPaD0k7HFIHnInDdbbztDM6uZd17MQ0tx5LXx4swB+EZB5J0Sf+X83nDCoIRGX sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjm0kkt43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28D7GKas007612;
	Tue, 13 Sep 2022 07:40:35 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjm0kkt3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D7Z4w9002747;
	Tue, 13 Sep 2022 07:40:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jgj79kepd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D7eru324510808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 07:40:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4966EAE04D;
	Tue, 13 Sep 2022 07:40:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E33AEAE045;
	Tue, 13 Sep 2022 07:40:27 +0000 (GMT)
Received: from disgoel-ibm-com.in.ibm.com (unknown [9.199.154.114])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 07:40:27 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/4] Remove unused macros from asm-offset
Date: Tue, 13 Sep 2022 13:10:21 +0530
Message-Id: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _nvVMDsU1vLsOR7tMav5XYjkFKCdb9Xj
X-Proofpoint-ORIG-GUID: CNYyeg83HK-hbnDR_JqbRLlmqnSwwcUe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 mlxlogscore=883 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There were commits which did code refactoring and converting some of kvm
assembly routines to C. When doing it, many of the asm-offset macro
definitions were missed to remove. Patchset here removes those.

Patch1 removes usage of KVM_TLB_SETS macro from the asm-offset

Patch2 removes KVM_RADIX macro from the asm-offset.c

Patch3 removes a set of unused kvm vcpu and hstate macros from the
asm-offset.c

Patch4 removes unused HSTATE/host_mmcr references for MMCR3/SIER2/SIER3

Link to the script used to get unused macro:
https://github.com/maddy-kerneldev/scripts/blob/master/check_asm-offset.sh

Link to linux-ci job result:
https://github.com/disgoel/linux-ci/actions

Disha Goel (3):
  powerpc/asm-offset: Remove unused KVM_TLB_SETS macros
  powerpc/asm-offset: Remove unused KVM_RADIX macros
  powerpc/kvm: Remove unused macros from asm-offset

Kajol Jain (1):
  powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers

 arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
 arch/powerpc/kernel/asm-offsets.c         | 25 -----------------------
 2 files changed, 1 insertion(+), 26 deletions(-)

-- 
2.31.1

