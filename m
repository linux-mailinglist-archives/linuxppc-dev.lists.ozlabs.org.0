Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4AB844027
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 14:10:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4JoE4Mw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ2Sv0BWmz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 00:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4JoE4Mw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ2S606P2z3blb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 00:09:25 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40VBaYgi008037;
	Wed, 31 Jan 2024 13:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yjp8mNUxahTgn7kvuM/IVGuQ/zwU7B9XzbCPNzk19Eg=;
 b=F4JoE4MwRCfUiFU3YlVQ97KGcnfQuzeuXkErfTrzFLHktQhbu7xnQZzC+iLG7xaCmBci
 4gZ0aJioZKFbWcJ28UNKCHzKJZFvdGnNt3QG+l6+MgGNlpHQ6uME9s07l/3/o6Q1aK8m
 tM9EMDkr6lA4P/wa8g1Dyu28ac2ikVqm4LffRpezFnOUiOWwxOOJtjpxYKaLp04JL727
 WIxg3Q7B+rVv0shQE2nW44Fyexiv7iUQtRcjEUHzUf5uvd3mdpMFiDuz5AF8hSOBb/bU
 NVRQ5HqGn4ewhqdeJKKLGXQFCljbMRWIwOPuXWkTwjMH0GQ4YhSQoc+Q3oZ1D2Vg2FgO YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vymu839k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 13:09:09 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40VCU6k0023273;
	Wed, 31 Jan 2024 13:09:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vymu839jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 13:09:08 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40VC5pqg008234;
	Wed, 31 Jan 2024 13:09:08 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwdnm5cpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 13:09:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40VD94An57147712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jan 2024 13:09:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B51B82004E;
	Wed, 31 Jan 2024 13:09:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4FE020067;
	Wed, 31 Jan 2024 13:09:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.59.95])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jan 2024 13:09:02 +0000 (GMT)
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, shuah@kernel.org,
        skhan@linuxfoundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] papr_vpd.c: calling devfd before get_system_loc_code
Date: Wed, 31 Jan 2024 18:38:59 +0530
Message-Id: <20240131130859.14968-1-rnsastry@linux.ibm.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: of0iIm6w8rYeDF7JcWbHIF16Z7Rixjyh
X-Proofpoint-ORIG-GUID: O83hNWb-4by3EyM9cdH9oufTUYtX3KgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401310100
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
Cc: rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Calling get_system_loc_code before checking devfd and errno - fails the test
when the device is not available, expected a SKIP.
Change the order of 'SKIP_IF_MSG' correctly SKIP when the /dev/papr-vpd device
is not available.

with out patch: Test FAILED on line 271
with patch: [SKIP] Test skipped on line 266: /dev/papr-vpd not present

Signed-off-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
---
 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
index 98cbb9109ee6..505294da1b9f 100644
--- a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
+++ b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
@@ -263,10 +263,10 @@ static int papr_vpd_system_loc_code(void)
 	off_t size;
 	int fd;
 
-	SKIP_IF_MSG(get_system_loc_code(&lc),
-		    "Cannot determine system location code");
 	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
 		    DEVPATH " not present");
+	SKIP_IF_MSG(get_system_loc_code(&lc),
+		    "Cannot determine system location code");
 
 	FAIL_IF(devfd < 0);
 
-- 
2.37.1 (Apple Git-137.1)

