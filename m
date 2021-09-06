Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2040182B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 10:45:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H326Z33CDz2yNN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 18:45:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iIh1am7P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iIh1am7P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H32485SrPz2yJ7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 18:43:36 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1868Xk2L187394; Mon, 6 Sep 2021 04:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nPKuqzdckfDggrgp1YDI2ku7Hj1iEmRacTZP1IUmj+E=;
 b=iIh1am7PqayOlO1e3RkbX0jufHbhaOL8P0rhIUxQ28RkHThGeveWqBJEgDsC1+Svsf50
 IlNHA/ANWfbEAmVAQk8qUZVcrSeQYsUOTsq6NOZwtP+fSrrnI6TJd9N9kQpM5pgAA7J9
 8mzZ+5Rv6NEIVEy+KVxlkGNANVhfTRu0TzlFbDXN9ioOx22XEZ5bLn0mPnnJgDLpbjzq
 f+mTWV/bh1aMHCX2ce9xlYXDssEtVO+PYqWq+/wBjSTFJvhFQxznRu/ygNu+6kjLcKvt
 bnQCogco0S5xdM2LGhqkcXjGA34t/ISyXAjwriS1w2rbwJPocIWkA7tCZYk+X9yGZBgs Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awfhjr8df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 04:43:32 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1868YhUM192838;
 Mon, 6 Sep 2021 04:43:32 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awfhjr8cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 04:43:31 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1868hOnK020648;
 Mon, 6 Sep 2021 08:43:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3av0e9082v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 08:43:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1868hPOu46268742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 08:43:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C5A9AE04D;
 Mon,  6 Sep 2021 08:43:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF89DAE045;
 Mon,  6 Sep 2021 08:43:22 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.82.144]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Sep 2021 08:43:22 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 3/3] powerpc/mce: Modify the real address error logging
 messages
Date: Mon,  6 Sep 2021 14:13:03 +0530
Message-Id: <20210906084303.183921-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906084303.183921-1-ganeshgr@linux.ibm.com>
References: <20210906084303.183921-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KkPZmq953EoLb_QZwbz_Wso-7kbdEW-W
X-Proofpoint-GUID: v3lJArzefmsCPAEmaVeteOnUl6INB49R
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_04:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060051
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid ambiguity, modify the strings in real address error
logging messages to "foreign/control memory" from "foreign",
Since the error discriptions in P9 user manual and P10 user
manual are different for same type of errors.

P9 User Manual for MCE:
DSISR:59 Host real address to foreign space during translation.
DSISR:60 Host real address to foreign space on a load or store
	 access.

P10 User Manual for MCE:
DSISR:59 D-side tablewalk used a host real address in the
	 control memory address range.
DSISR:60 D-side operand access to control memory address space.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v3: No changes.

v2: No changes.
---
 arch/powerpc/kernel/mce.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 9d1e39d42e3e..5baf69503349 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -400,14 +400,14 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 	static const char *mc_ra_types[] = {
 		"Indeterminate",
 		"Instruction fetch (bad)",
-		"Instruction fetch (foreign)",
+		"Instruction fetch (foreign/control memory)",
 		"Page table walk ifetch (bad)",
-		"Page table walk ifetch (foreign)",
+		"Page table walk ifetch (foreign/control memory)",
 		"Load (bad)",
 		"Store (bad)",
 		"Page table walk Load/Store (bad)",
-		"Page table walk Load/Store (foreign)",
-		"Load/Store (foreign)",
+		"Page table walk Load/Store (foreign/control memory)",
+		"Load/Store (foreign/control memory)",
 	};
 	static const char *mc_link_types[] = {
 		"Indeterminate",
-- 
2.31.1

