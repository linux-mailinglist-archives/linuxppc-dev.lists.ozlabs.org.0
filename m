Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5013EB28D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 10:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmGlS436Sz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 18:23:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XIRKgGne;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XIRKgGne; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmGkj14vhz30gd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 18:22:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17D842ho152780; Fri, 13 Aug 2021 04:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=c7HMP7WCtuA3u7tWwogQpJwpnJw4HwHAjddpZblJ3RQ=;
 b=XIRKgGnenEbWPuJ7008ar9cjkx+SQC1y3sRuhlJ++O8gFFuwa3vRkN0DAPWVRd1DQPCm
 LD+DvBPlprgSc7SIgH9Mgpjf0/hVo88fgRTZRlCgMJtZ97qsS9fHTsG3uErBGcmP2TF+
 +9SinaPde4oyzqiYQHnTB9SWXWobiV85aEyIZekhLebyM/Y082AkNs7Ev4BuWv9IJG9O
 hgZtjozGqUhILrDG3WppVDZX7M1GVKwRqpKkt3jRMoe0GwqvE1uPry5BBjc9NnZWutLW
 5ofi6MU4L2QDrEmOZ1j5nsx8TdQ8RnZB8qO9SOeY+0J6HzD7GQWGmuEZnElHKYcj6ivc vg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ad4hy8n6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 04:22:12 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17D8Dp7t030531;
 Fri, 13 Aug 2021 08:22:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3acfpgayb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 08:22:10 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17D8M6In46137760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 08:22:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E6811C058;
 Fri, 13 Aug 2021 08:22:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 493F811C07B;
 Fri, 13 Aug 2021 08:22:03 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.137])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Aug 2021 08:22:02 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/perf/hv-gpci: Fix the logic to compute counter value
 from the hcall result buffer.
Date: Fri, 13 Aug 2021 13:51:58 +0530
Message-Id: <20210813082158.429023-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iRF2LreeJfHXYDwhO2hSSOLvfC-9eeJf
X-Proofpoint-GUID: iRF2LreeJfHXYDwhO2hSSOLvfC-9eeJf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-13_01:2021-08-12,
 2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130048
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.ibm.com,
 rnsastry@linux.ibm.com, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_GetPerformanceCounterInfo (0xF080) hcall returns the counter data in the
result buffer. Result buffer has specific format defined in the PAPR
specification. One of the field is counter offset and width of the counter
data returned.

Counter data are returned in a unsigned char array. To
get the final counter data, these values should be left shifted
byte at a time. But commit 220a0c609ad17 ("powerpc/perf: Add support 
for the hv gpci (get performance counter info) interface") made the
shifting bitwise. Because of this, hcall counters values could end up
in lower side, which messes the counter prev vs now calculation. This
lead to huge counter value reporting

[command]#: perf stat -e hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
           -C 0 -I 1000
        time             counts unit events
     1.000078854 18,446,744,073,709,535,232      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     2.000213293                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     3.000320107                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     4.000428392                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     5.000537864                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     6.000649087                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     7.000760312                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     8.000865218             16,448      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     9.000978985 18,446,744,073,709,535,232      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
    10.001088891             16,384      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
    11.001201435                  0      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
    12.001307937 18,446,744,073,709,535,232      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/

Patch here fixes the shifting logic to make is byte-wise with which no more the issue seen. 

Fixes: e4f226b1580b3 ("powerpc/perf/hv-gpci: Increase request buffer size")
Reported-by: Nageswara R Sastry<rnsastry@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index d48413e28c39..c756228a081f 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -175,7 +175,7 @@ static unsigned long single_gpci_request(u32 req, u32 starting_index,
 	 */
 	count = 0;
 	for (i = offset; i < offset + length; i++)
-		count |= arg->bytes[i] << (i - offset);
+		count |= (u64)(arg->bytes[i]) << ((length - 1 - (i - offset)) * 8);
 
 	*value = count;
 out:
-- 
2.26.2

