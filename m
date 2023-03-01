Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D606D6A71D9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 18:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRgjb45vtz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 04:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kZYOtZv2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kZYOtZv2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRghc08QWz2yfq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 04:09:51 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 321GsLiN025511;
	Wed, 1 Mar 2023 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8/eJeT6Yte1UeKx+GRfxQA+4XfdO/XLB6n/0ZgWG4Do=;
 b=kZYOtZv2F3tz9ZblUjBveZ7DfoToY0Mx7QJjO5gJLxkXfZCbPqiGOC0YINPGJwdUimbX
 Ew5QYyLwewPQpy7EQ7O5mYQ1AtwgnLc+CTTb6tJL/RfYvQyN0NYzw9TwuRuImvyDRTXG
 j00iTQdW6squ9Mj3pgybXAZeeoB1xHN4IudANyp1L5tdO2MO3DCHbBqtbl/A1j/h1G71
 EirJB4ya4VK/F2hmfnfhpNJcmsy7ASSre1DY13iaCxiz6vHreqIveNpE3V453TiCqXcv
 W7fTxaEEhBOBpHd6jqmGuet9UFrCEHF29f5p0EIbyXgJtPhtvfw2MkJ5uCXZAOkp8H3V YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2amngg2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 17:09:44 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 321GvVKN032649;
	Wed, 1 Mar 2023 17:09:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2amngg0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 17:09:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 321Bc6ut028906;
	Wed, 1 Mar 2023 17:09:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nybcucqrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Mar 2023 17:09:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 321H9cdI26542438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Mar 2023 17:09:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 307E320043;
	Wed,  1 Mar 2023 17:09:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F96120040;
	Wed,  1 Mar 2023 17:09:36 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.25.125])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Mar 2023 17:09:36 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] selftests/powerpc/pmu: Fix sample field check in the mmcra_thresh_marked_sample_test
Date: Wed,  1 Mar 2023 22:39:17 +0530
Message-Id: <20230301170918.69176-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v1aPEW9ZE1qflGUv3giL5jERAdUN8LTV
X-Proofpoint-ORIG-GUID: h4ivNXPQBkffmdsszAfVEvXfrkGcfUVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010141
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com, David Binderman <dcb314@hotmail.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The testcase verifies the setting of different fields in Monitor Mode
Control Register A (MMCRA). In the current code, EV_CODE_EXTRACT macro
is used to extract the "sample" field, which then needs to be further
processed to fetch rand_samp_elig and rand_samp_mode bits. But the
current code is not passing valid sample field to EV_CODE_EXTRACT
macro. Patch addresses this by fixing the input for EV_CODE_EXTRACT.

Fixes: 29cf373c5766 ("selftests/powerpc/pmu: Add interface test for mmcra register fields")
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../pmu/sampling_tests/mmcra_thresh_marked_sample_test.c      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
index 022cc1655eb5..75527876ad3c 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c
@@ -63,9 +63,9 @@ static int mmcra_thresh_marked_sample(void)
 			get_mmcra_thd_stop(get_reg_value(intr_regs, "MMCRA"), 4));
 	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, marked) !=
 			get_mmcra_marked(get_reg_value(intr_regs, "MMCRA"), 4));
-	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sample >> 2) !=
+	FAIL_IF((EV_CODE_EXTRACT(event.attr.config, sample) >> 2) !=
 			get_mmcra_rand_samp_elig(get_reg_value(intr_regs, "MMCRA"), 4));
-	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sample & 0x3) !=
+	FAIL_IF((EV_CODE_EXTRACT(event.attr.config, sample) & 0x3) !=
 			get_mmcra_sample_mode(get_reg_value(intr_regs, "MMCRA"), 4));
 	FAIL_IF(EV_CODE_EXTRACT(event.attr.config, sm) !=
 			get_mmcra_sm(get_reg_value(intr_regs, "MMCRA"), 4));
-- 
2.39.1

