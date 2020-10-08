Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9712872EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:59:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Srj2HGBzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XxGwEA5B; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6ShW3dGTzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:52:27 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 098AnN3d112594; Thu, 8 Oct 2020 06:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=hfAzSDcn2gB31ncyYwwT7GVlA0gD4Jtqx5jw8GcvgX4=;
 b=XxGwEA5BETCnr7ca0auiuNDIk3D8K6Xwuv+33IWBHhgq3WfarAtmo/yyKglpdCHNXGuE
 nfIA4c0qU4vnLPysvvL33qrj2dCgUuc7sS6/zM6Of+7mCZl004RDHojZyxUYive+mAjd
 RX3K+LAa5JMuLqLChSEGqDoKksjcAp8he4QP6QCExzmsQVlp4d9CwrQJm/T/dATHKOLd
 BO1KXZciD5V0/yPpA7Mw/Rc13XwHNH1qJ6A2mJFYeoi1JmxC3BKNEYy4hO72eawpLlfz
 1nwUOg2nalsZUwLyFTiP3ssnPW64Y87bej3Uv35Ny9a+cGFAq937LHJqV2uQ4m42Rjgw lA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3421btr1ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 06:52:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 098Apouh022659;
 Thu, 8 Oct 2020 10:52:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx8d8gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 10:52:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 098AqG1F33095990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 10:52:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05D1D4C04E;
 Thu,  8 Oct 2020 10:52:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76F084C044;
 Thu,  8 Oct 2020 10:52:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.255.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 10:52:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/4] powerpc/perf: Using SIER[CMPL] instead of SIER[SIAR_VALID]
Date: Thu,  8 Oct 2020 06:52:07 -0400
Message-Id: <1602154329-2092-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_04:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=883 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080077
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On power10 DD1, there is an issue that causes the SIAR_VALID
bit of Sampled Instruction Event Register(SIER) not to be
set. But the SIAR_VALID bit is used for fetching the instruction
address from Sampled Instruction Address Register(SIAR), and
marked events are sampled only if the SIAR_VALID bit is set.
So add a condition check for power10 DD1 to use SIER[CMPL] bit
instead.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cb..d766090 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -350,7 +350,14 @@ static inline int siar_valid(struct pt_regs *regs)
 	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
 
 	if (marked) {
-		if (ppmu->flags & PPMU_HAS_SIER)
+		/*
+		 * SIER[SIAR_VALID] is not set for some
+		 * marked events on power10 DD1, so use
+		 * SIER[CMPL] instead.
+		 */
+		if (ppmu->flags & PPMU_P10_DD1)
+			return regs->dar & 0x1;
+		else if (ppmu->flags & PPMU_HAS_SIER)
 			return regs->dar & SIER_SIAR_VALID;
 
 		if (ppmu->flags & PPMU_SIAR_VALID)
-- 
1.8.3.1

