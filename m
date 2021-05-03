Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6270371F0F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYrLp4rsdz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 03:58:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WfFrYLw+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WfFrYLw+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYrLK3gRpz2xfn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 03:58:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143HXOEQ046168
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 13:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Dh8ISY4foAHpF++DcYAUv7nUYOMZUtTXiz4lBWX8adM=;
 b=WfFrYLw+u1Crm+SNqtvsTZs+GI4UqObABcx1x7tywvx/VXHUC7zyt1SNbSewVIvU9Pxa
 J3UDTRHKOQmYydYtUyXl7hJjs1UvGKUIztx/lRyz0zGowAt/jo0miwwo2GOyc9tB35O7
 hoN2DpbisTxlXhpAXT33mHwBM7cDEjcu0TxZXN3a7TAypS2ceQc+jPTVFZIJVT0dlGa3
 ortFfAf0rQjFtSJch4EHgVSnFkntAhn8M9Ax3bmG1bpSeCUQkKJhcbAiq4XiPMN9M6B4
 S3S0yU4osBAB8+EgYF0V2Nl0twNh815fIE1aUNZUGiTmYfOwcWYfcIrUob/2GwpVpyb+ 5A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38an8cs9ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 13:58:14 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143HvSMv010200
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 17:58:12 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 388xm9yt86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 17:58:12 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143HwCYb36110810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 17:58:12 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13045136051
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:58:12 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D047D13604F
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:58:11 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:58:11 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/rtas-rtc: remove unused constant
Date: Mon,  3 May 2021 12:58:11 -0500
Message-Id: <20210503175811.1528208-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nSIj5V_cW2lic22Lx1zQRoE7KUcLYHnK
X-Proofpoint-GUID: nSIj5V_cW2lic22Lx1zQRoE7KUcLYHnK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_13:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=987 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030116
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RTAS_CLOCK_BUSY is unused, remove it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas-rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas-rtc.c b/arch/powerpc/kernel/rtas-rtc.c
index a28239b8b0c0..33c07c8af6c8 100644
--- a/arch/powerpc/kernel/rtas-rtc.c
+++ b/arch/powerpc/kernel/rtas-rtc.c
@@ -12,7 +12,7 @@
 
 
 #define MAX_RTC_WAIT 5000	/* 5 sec */
-#define RTAS_CLOCK_BUSY (-2)
+
 time64_t __init rtas_get_boot_time(void)
 {
 	int ret[8];
-- 
2.30.2

