Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8B258FFA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 16:13:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgpvh370nzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 00:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z302qOXK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgppL6HrmzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 00:08:58 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 081Di55p087820; Tue, 1 Sep 2020 10:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=xFcTUIX01cLLAjK4w1JAdadIh0Qdzl7X/zatSLI9ejQ=;
 b=Z302qOXKFuUrmf4blDuX0goYyb0LfiStAGSSJkRdEHWAu4NTgU0+vntAQqSnklVBS45h
 AiylFju0oTxnN3PYcEPLMXjoKaHlBe+Z5LhNEnWc8ULccqyJy26dEyv2lbwvwLz/Ssgs
 11iL4aD97aLmA1JbQnessMa3y6bFB9LLHfZAXK/y5mh4cXMusdvqtDZWHom/8HWxGANZ
 7TyWBjXvrgms+q3WGxOuVUgm47hmyC7jSWy86+qQCODgg6yOIIXCkz4BD4iNZ6exzOs7
 hHf7lb39zBniyW2dceTz9tZxc1QXnVMaxuose8Jyyzm8AEHuSZKLV22boHWLzdmybcwm Bg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339msjne7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 10:08:49 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 081E7M0t006465;
 Tue, 1 Sep 2020 14:08:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 337en90h4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 14:08:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 081E8ix356754552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 14:08:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 190E3C6059;
 Tue,  1 Sep 2020 14:08:47 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F0FBC6055;
 Tue,  1 Sep 2020 14:08:46 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.77.196.208])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 14:08:46 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id B10CB2E301D; Tue,  1 Sep 2020 19:38:41 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH] cpuidle-pseries: Fix CEDE latency conversion from tb to us
Date: Tue,  1 Sep 2020 19:38:13 +0530
Message-Id: <1598969293-29228-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_08:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxlogscore=784 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010113
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
of the Extended CEDE states advertised by the platform. The values
advertised by the platform are in timebase ticks. However the cpuidle
framework requires the latency values in microseconds.

If the tb-ticks value advertised by the platform correspond to a value
smaller than 1us, during the conversion from tb-ticks to microseconds,
in the current code, the result becomes zero. This is incorrect as it
puts a CEDE state on par with the snooze state.

This patch fixes this by rounding up the result obtained while
converting the latency value from tb-ticks to microseconds.

Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
CEDE(0)")

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-pseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
index ff6d99e..9043358 100644
--- a/drivers/cpuidle/cpuidle-pseries.c
+++ b/drivers/cpuidle/cpuidle-pseries.c
@@ -361,7 +361,7 @@ static void __init fixup_cede0_latency(void)
 	for (i = 0; i < nr_xcede_records; i++) {
 		struct xcede_latency_record *record = &payload->records[i];
 		u64 latency_tb = be64_to_cpu(record->latency_ticks);
-		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
+		u64 latency_us = DIV_ROUND_UP_ULL(tb_to_ns(latency_tb), NSEC_PER_USEC);
 
 		if (latency_us < min_latency_us)
 			min_latency_us = latency_us;
-- 
1.9.4

