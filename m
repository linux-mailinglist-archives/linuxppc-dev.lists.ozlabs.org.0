Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179ED54B286
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 15:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMqbJ6xXJz3cf9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 23:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kZLNJknp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kZLNJknp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMqZb6GLPz3bpb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 23:50:31 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EDBHub017763;
	Tue, 14 Jun 2022 13:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OwrOFbTRYEoqZ12i7zkJKWkeRWNGUgDeifO3rN+XfME=;
 b=kZLNJknp3xvtJx/Vz9aKfb3CNOT0crsyp4mg3r1ZA11/Sc4OrFOX7sTfrbkDZR0v6YeF
 FjDebauehk5PZaAOKscXYA0v7FygoNyCoWbeaQTN0WgJV8VDdrBRwu1YHhumPEDtg0Bw
 tWlcia6YgoHI7pdvZMbthYsQp+tjVmXMr3NdAC3ATHset8g+pkg1aNLf0X6VdcM4jZy4
 0bQ8aajREtLtpFMloM9jsjSQ14GKjBjnjeinnBwmYdZmfWSG0zey7xeMElKABtUX1iwZ
 w9ckwqzH8wbkqEswh6DNdCfTyBtqm8avpIAHqu8/h3szf5/fBbStS/WsVlMgAe5QgWKI jg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpq77052a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 13:50:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EDZpWw011190;
	Tue, 14 Jun 2022 13:50:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3gmjahuf9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 13:50:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25EDnrh422413724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jun 2022 13:49:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E0C94C040;
	Tue, 14 Jun 2022 13:50:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2935E4C046;
	Tue, 14 Jun 2022 13:50:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jun 2022 13:50:23 +0000 (GMT)
Received: from intelligence.ibm.com (unknown [9.43.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC0D160236;
	Tue, 14 Jun 2022 23:50:13 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address
Date: Tue, 14 Jun 2022 23:49:52 +1000
Message-Id: <20220614134952.156010-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sqBBWRbQqqH7wIo_2GyRCKaNdEu57fEX
X-Proofpoint-GUID: sqBBWRbQqqH7wIo_2GyRCKaNdEu57fEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_04,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206140054
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Sathvika Vasireddy <sathvika@linux.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a special case to block_rtas_call() to allow the ibm,platform-dump RTAS
call through the RTAS filter if the buffer address is 0.

According to PAPR, ibm,platform-dump is called with a null buffer address
to notify the platform firmware that processing of a particular dump is
finished.

Without this, on a pseries machine with CONFIG_PPC_RTAS_FILTER enabled, an
application such as rtas_errd that is attempting to retrieve a dump will
encounter an error at the end of the retrieval process.

Fixes: bd59380c5ba4 ("powerpc/rtas: Restrict RTAS requests from userspace")
Cc: stable@vger.kernel.org
Reported-by: Sathvika Vasireddy <sathvika@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index a6fce3106e02..693133972294 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1071,7 +1071,7 @@ static struct rtas_filter rtas_filters[] __ro_after_init = {
 	{ "get-time-of-day", -1, -1, -1, -1, -1 },
 	{ "ibm,get-vpd", -1, 0, -1, 1, 2 },
 	{ "ibm,lpar-perftools", -1, 2, 3, -1, -1 },
-	{ "ibm,platform-dump", -1, 4, 5, -1, -1 },
+	{ "ibm,platform-dump", -1, 4, 5, -1, -1 },		/* Special cased */
 	{ "ibm,read-slot-reset-state", -1, -1, -1, -1, -1 },
 	{ "ibm,scan-log-dump", -1, 0, 1, -1, -1 },
 	{ "ibm,set-dynamic-indicator", -1, 2, -1, -1, -1 },
@@ -1120,6 +1120,15 @@ static bool block_rtas_call(int token, int nargs,
 				size = 1;
 
 			end = base + size - 1;
+
+			/*
+			 * Special case for ibm,platform-dump - NULL buffer
+			 * address is used to indicate end of dump processing
+			 */
+			if (!strcmp(f->name, "ibm,platform-dump") &&
+			    base == 0)
+				return false;
+
 			if (!in_rmo_buf(base, end))
 				goto err;
 		}
-- 
2.30.2

