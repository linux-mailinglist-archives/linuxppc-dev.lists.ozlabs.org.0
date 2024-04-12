Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629D8A2B05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 11:22:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jBRJVwA0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGB0q0qpYz3vdn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 19:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jBRJVwA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGB073xGCz3dSV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 19:21:43 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43C937sa002330;
	Fri, 12 Apr 2024 09:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=yn79bwGubA/WZGaspi0s7XWlEXgqV81Bd9Q7fyu0nqU=;
 b=jBRJVwA0nbvvHq/57lgco0w1LaL7J0SBE/OmGPztEtHEndyNxnAX9sHEEIpskuTQoqWy
 +XTNdA0x+XlNnueXtSghVjx505lm7dlKfE+SyflegpqUw5a49/96OUeO7WH1TiVR2MGL
 9e4zPF366tvWRZDz15w9DhX7sxR1JfXdlpnx/+lo1hclLZ7r7N0jyQPxnyfEZTsci9Om
 kxA8FH9My+UxDQJynOOqHoFYq/f9k4KYOCA7BV682bb/SGy4vF+ChznsgaWZAytTKfl8
 N5hfRUckIiwDZD8yKqTON1WZiUzcClAokTpAO/vTe5hRESd+ZzoGLTvGhJ8rb1CKE9fd wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xf1yjr144-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:21:37 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43C9LaEW030523;
	Fri, 12 Apr 2024 09:21:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xf1yjr142-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:21:36 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43C6bLbt019108;
	Fri, 12 Apr 2024 09:21:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbh40s59h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:21:35 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43C9LTnj49217972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Apr 2024 09:21:31 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B22302004D;
	Fri, 12 Apr 2024 09:21:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E18A22004E;
	Fri, 12 Apr 2024 09:20:59 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.ibm.com.com (unknown [9.79.183.6])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Apr 2024 09:20:59 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/2] powerpc/pseries: Fixes for lparstat boot reports
Date: Fri, 12 Apr 2024 14:50:45 +0530
Message-Id: <20240412092047.455483-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7C4GVRMboggUUN3Pm5ys6OEyN-kAuHUZ
X-Proofpoint-ORIG-GUID: 7e6_cD81fmMH7YeEcB1WMCMhDvXsYVLt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_06,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=789
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404120067
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
Cc: nathanl@linux.ibm.com, tyreld@linux.ibm.com, sshegde@linux.ibm.com, npiggin@gmail.com, mahesh@linux.ibm.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently lparstat reports which shows since LPAR boot are wrong for
some fields. There is a need for storing the PIC(Pool Idle Count) at
boot for accurate reporting. PATCH 1 Does that.

While there, it was noticed that hcall return value is long and both
h_get_ppp and h_get_mpp could set the uninitialized values if the hcall
fails. PATCH 2 does that.

v1 -> v2:
- Nathan pointed out the issues surrounding the h_pic call. Addressed
those.
- Added a pr_debug if h_pic fails during lparcfg_init
- If h_pic fails while reading lparcfg, related files are not exported.
- Added failure checks for h_get_mpp, h_get_ppp calls as well.

v1: https://lore.kernel.org/all/20240405101340.149171-1-sshegde@linux.ibm.com/

Shrikanth Hegde (2):
  powerpc/pseries: Add pool idle time at LPAR boot
  powerpc/pseries: Add fail related checks for h_get_mpp and h_get_ppp

 arch/powerpc/include/asm/hvcall.h        |  2 +-
 arch/powerpc/platforms/pseries/lpar.c    |  6 ++--
 arch/powerpc/platforms/pseries/lparcfg.c | 45 +++++++++++++++++-------
 3 files changed, 37 insertions(+), 16 deletions(-)

--
2.39.3

