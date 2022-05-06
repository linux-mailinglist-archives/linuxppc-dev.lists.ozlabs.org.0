Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F36CB51D113
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 08:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvgFR5yZSz3cC8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 16:11:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cUUyhEA5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cUUyhEA5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvgD94ydTz3c7W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 16:10:49 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2464AKid013179;
 Fri, 6 May 2022 06:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OiVvkETrUVZE3/M4Vh7WZbSuEpnt17VBF5PGfso6Hms=;
 b=cUUyhEA5zuhRJ4oL69Ubkjaf8A/KijqDE2mtUIAMSpdYK6MNSGj5pmZdM5XBQABLfvTN
 /0ErQUtuBEyDVbdPc/Nn1HceQrG1jGz5HcLTYsj2ZuaDPwW+eevxf7qRmdNMWCh32bho
 WwPvgswlgRP8kXcuAtQMT44SDU4yfmqODA0JES2JdPbzCPQmLmHQLHy8XpDLwjAOmYw5
 pPH0B26N8Z/1SqIdRn7oe2iJkWV3n38GMuO57rlNRp9z7hsXHGyc4ShvGW7w7SL0XDZd
 Go23wvke0qVwJIb9vYdDzB5E/6PkIr9OTlCT0QuKlS2e/Pmw/cxWlnFEsHYcigIJtzaQ Pg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvv23jarn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 06:10:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246699Wj028869;
 Fri, 6 May 2022 06:10:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk5xsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 06:10:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2466AQWW25428282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 06:10:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65AFCA404D;
 Fri,  6 May 2022 06:10:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1287BA4040;
 Fri,  6 May 2022 06:10:31 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 06:10:30 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/perf: Fix the threshold compare group constraint
 for power9
Date: Fri,  6 May 2022 11:40:15 +0530
Message-Id: <20220506061015.43916-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506061015.43916-1-kjain@linux.ibm.com>
References: <20220506061015.43916-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Aa2qbKaYnNsi7OKtTxivNsMx3HbHJdYS
X-Proofpoint-GUID: Aa2qbKaYnNsi7OKtTxivNsMx3HbHJdYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060031
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thresh compare bits for a event is used to program thresh compare
field in Monitor Mode Control Register A (MMCRA: 9-18 bits for power9).
When scheduling events as a group, all events in that group should
match value in threshold bits (like thresh compare, thresh control,
thresh select). Otherwise event open for the sibling events should fail.
But in the current code, incase thresh compare bits are not valid,
we are not failing in group_constraint function which can result
in invalid group schduling.

Fix the issue by returning -1 incase event is threshold and threshold
compare value is not valid.

Thresh control bits in the event code is used to program thresh_ctl
field in Monitor Mode Control Register A (MMCRA: 48-55). In below example,
the scheduling of group events PM_MRK_INST_CMPL (873534401e0) and
PM_THRESH_MET (8734340101ec) is expected to fail as both event
request different thresh control bits and invalid thresh compare value.

Result before the patch changes:

[command]# perf stat -e "{r8735340401e0,r8734340101ec}" sleep 1

 Performance counter stats for 'sleep 1':

            11,048      r8735340401e0
             1,967      r8734340101ec

       1.001354036 seconds time elapsed

       0.001421000 seconds user
       0.000000000 seconds sys

Result after the patch changes:

[command]# perf stat -e "{r8735340401e0,r8734340101ec}" sleep 1
Error:
The sys_perf_event_open() syscall returned with 22 (Invalid argument)
for event (r8735340401e0).
/bin/dmesg | grep -i perf may provide additional information.

Fixes: 78a16d9fc1206 ("powerpc/perf: Avoid FAB_*_MATCH checks for power9")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 013b06af6fe6..bb5d64862bc9 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -508,7 +508,8 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp,
 		if (event_is_threshold(event) && is_thresh_cmp_valid(event)) {
 			mask  |= CNST_THRESH_MASK;
 			value |= CNST_THRESH_VAL(event >> EVENT_THRESH_SHIFT);
-		}
+		} else if (event_is_threshold(event))
+			return -1;
 	} else {
 		/*
 		 * Special case for PM_MRK_FAB_RSP_MATCH and PM_MRK_FAB_RSP_MATCH_CYC,
-- 
2.31.1

