Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDB54F04C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 06:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPRDj1sslz3bl5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 14:40:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esRZdaRe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rashmica@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esRZdaRe;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPRCz0Z4Rz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 14:39:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H4W2qR028670;
	Fri, 17 Jun 2022 04:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=rxvl31Wkh4gZDEtAmfEr3jezU31EQnH40seEU4VTrn0=;
 b=esRZdaRehdr8wBuVpSBtUywKNDLniNCoutV8yf8d3cRaYUfYRm/HXw3Nj9ZdywU8g3Ft
 Of3VQrKQ6ZTVRsuUA7KqHXH7+Jp3GsVmhvkMKFR8GHGYda6vLA5v/bqX0O6DG+DY9xHH
 ASQsXJ907w7l2MdCeN8l+NPp2ztn8mhT08d/Nbpmuwj+BvfEt7Avxm36K+b7a+s4kFCY
 mQrri4+Nf+MmZdmlIKW2gH7GULN/ndJ8vhZa6uAuVlCdIFHHAqGg92X9T2BhiynowC/s
 4JrcQ8fFDTW/EejUs4uXJFdb2IebmIlq6RZjNpMAhATH/BLldf4d+cf4qjl2DYo6EsjZ tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqxe2x3yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 04:39:52 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25H4dqMe002133;
	Fri, 17 Jun 2022 04:39:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqxe2x3xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 04:39:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25H4ZAf5014926;
	Fri, 17 Jun 2022 04:39:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3gmjp986fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 04:39:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25H4dlgY13631844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 04:39:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE96D11C04C;
	Fri, 17 Jun 2022 04:39:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59B7E11C04A;
	Fri, 17 Jun 2022 04:39:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 17 Jun 2022 04:39:47 +0000 (GMT)
Received: from rashmica.home.majoof.com (unknown [9.43.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 199E66038D;
	Fri, 17 Jun 2022 14:39:43 +1000 (AEST)
From: Rashmica Gupta <rashmica@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix matrix multiply assist test
Date: Fri, 17 Jun 2022 14:39:35 +1000
Message-Id: <20220617043935.428083-1-rashmica@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cihKv1IpTsLHLekHEvL60_NNLw3AZIwU
X-Proofpoint-ORIG-GUID: _8ULxKy8b6VC42ZU9HhcomykBbFGWe3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_02,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 phishscore=0 mlxlogscore=878 malwarescore=0
 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170020
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
Cc: npiggin@gmail.com, alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ISA states: "when ACC[i] contains defined data, the contents of VSRs
4×i to 4×i+3 are undefined until either a VSX Move From ACC instruction
is used to copy the contents of ACC[i] to VSRs 4×i to 4×i+3 or some other
instruction directly writes to one of these VSRs." We aren't doing this.

This test only works on Power10 because the hardware implementation
happens to map ACC0 to VSRs 0-3, but will fail on any other implementation
that doesn't do this. So add xxmfacc between writing to the accumulator
and accessing the VSRs.

Fixes commit 3527e1ab9a79 ("selftests/powerpc: Add matrix multiply assist
(MMA) test")

Signed-off-by: Rashmica Gupta <rashmica@linux.ibm.com>
---
 tools/testing/selftests/powerpc/math/mma.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/powerpc/math/mma.S b/tools/testing/selftests/powerpc/math/mma.S
index 8528c9849565..61cc88b1b26b 100644
--- a/tools/testing/selftests/powerpc/math/mma.S
+++ b/tools/testing/selftests/powerpc/math/mma.S
@@ -20,6 +20,9 @@ test_mma:
 	/* xvi16ger2s */
 	.long	0xec042958
 
+	/* Deprime the accumulator - xxmfacc 0 */
+	.long 0x7c000162
+
 	/* Store result in image passed in r5 */
 	stxvw4x	0,0,5
 	addi	5,5,16
-- 
2.35.3

