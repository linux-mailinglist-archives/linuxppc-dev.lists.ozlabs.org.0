Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5CA469238
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 10:20:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6yZY6ZnZz3c7Y
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 20:20:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2iNleMS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q2iNleMS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6yY63TCsz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 20:19:05 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B66p5MT020124; 
 Mon, 6 Dec 2021 09:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O44fa7G4FcbGaYmSZo6gfK+DgurSew47i7F/72YQjEY=;
 b=Q2iNleMSg2dvHj/Y7VxUGv5ewfNkD4lWF9ezEQA81aH/kIVuS+mrtKf+socHtQzp+X4w
 nswVPELCnKr53igjwUNzMMLv4vVfoBqNdjf2umr2JucgGOeDa9DDhqgiQQxRzIgziALV
 OtYXP+CGe6GJP/uhLOX4yTS6ygDxu63/mTqhrrsTBqsSzye3hFf4GA6eTEeZsAG40frf
 sVG+wKHGjg5X1XvsBWZKcrSMFrRfwuDURrwH3kyYErVhhWYODc3BZDsaQ2HmSQrh3jRr
 2lkkkrlNsiGOAKFGxLNjTQEJ5+/MRk27mW5aNfgZoJYatDRMj9Xvok2Ahzuu/TLksil1 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cs9kgx63x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B69Hlho025437;
 Mon, 6 Dec 2021 09:18:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cs9kgx639-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B69DikM013716;
 Mon, 6 Dec 2021 09:18:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cqyy9jffm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B69IVgw19726634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 09:18:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9B01A4069;
 Mon,  6 Dec 2021 09:18:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4291A4051;
 Mon,  6 Dec 2021 09:18:24 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.39.249]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 09:18:24 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 1/4] perf: Add new macros for mem_hops field
Date: Mon,  6 Dec 2021 14:47:46 +0530
Message-Id: <20211206091749.87585-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211206091749.87585-1-kjain@linux.ibm.com>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WUgfsgReV662OWexwUZjnGwz4WFkLJhT
X-Proofpoint-ORIG-GUID: be4wB10cU4PEKyO2QwSDtJ2sLTnyy4kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060054
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, kjain@linux.ibm.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add new macros for mem_hops field which can be used to
represent remote-node, socket and board level details.

Currently the code had macro for HOPS_0, which corresponds
to data coming from another core but same node.
Add new macros for HOPS_1 to HOPS_3 to represent
remote-node, socket and board level data.

For ex: Encodings for mem_hops fields with L2 cache:

L2			- local L2
L2 | REMOTE | HOPS_0	- remote core, same node L2
L2 | REMOTE | HOPS_1	- remote node, same socket L2
L2 | REMOTE | HOPS_2	- remote socket, same board L2
L2 | REMOTE | HOPS_3	- remote board L2

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 include/uapi/linux/perf_event.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index bd8860eeb291..1b65042ab1db 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1332,7 +1332,10 @@ union perf_mem_data_src {
 
 /* hop level */
 #define PERF_MEM_HOPS_0		0x01 /* remote core, same node */
-/* 2-7 available */
+#define PERF_MEM_HOPS_1		0x02 /* remote node, same socket */
+#define PERF_MEM_HOPS_2		0x03 /* remote socket, same board */
+#define PERF_MEM_HOPS_3		0x04 /* remote board */
+/* 5-7 available */
 #define PERF_MEM_HOPS_SHIFT	43
 
 #define PERF_MEM_S(a, s) \
-- 
2.27.0

