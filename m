Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E532D1CCA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:09:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqctB099SzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RqAWWMae; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV21C7zzDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:09 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LRV9M003311
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZmPrl8O+4UVKGRQAFfLHW0jQ8gg45FZf+NMtncrSZGY=;
 b=RqAWWMaejUNzD5oD9k1kpZzWj0H9B8cA36chTNmts7NBljDT+VRYuHbYlBo9v6j+Kitq
 e6v8BEtOxwdglB+qD5QCQmRvI+OkAqOsn+cdxu3wLqcP2fw/pr7pdVbDGh0xXQePi/6c
 YygpTlqNnaol3klHS5A1MAwTTvPlzcncOzioLwUOwcizt56UsrPZgf+4TD6NqbML7vQm
 TdwmAuBkeqE5Gfs6DcQ6Eec5PtbSr3RE3Ys5yZW0lF3pjztleuEQCJYDxeOrxIMLb31d
 RYDxVxNvyb3gOnKqudd6cwAj4udzu+w8vICqgq1hyDcXdfcpjgnpbNO5nMZmvMYJw/LM kg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359q2uavm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:07 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlqUs002543
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3581u8yqa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7Lq5bq16384672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D173AC060;
 Mon,  7 Dec 2020 21:52:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E8F0AC059;
 Mon,  7 Dec 2020 21:52:05 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/28] powerpc/hvcall: add token and codes for H_VASI_SIGNAL
Date: Mon,  7 Dec 2020 15:51:38 -0600
Message-Id: <20201207215200.1785968-7-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=542 suspectscore=1 mlxscore=0 adultscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_VASI_SIGNAL can be used by a partition to request cancellation of
its migration. To be used in future changes.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index c1fbccb04390..c98f5141e3fc 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -155,6 +155,14 @@
 #define H_VASI_RESUMED          5
 #define H_VASI_COMPLETED        6
 
+/* VASI signal codes. Only the Cancel code is valid for H_VASI_SIGNAL. */
+#define H_VASI_SIGNAL_CANCEL    1
+#define H_VASI_SIGNAL_ABORT     2
+#define H_VASI_SIGNAL_SUSPEND   3
+#define H_VASI_SIGNAL_COMPLETE  4
+#define H_VASI_SIGNAL_ENABLE    5
+#define H_VASI_SIGNAL_FAILOVER  6
+
 /* Each control block has to be on a 4K boundary */
 #define H_CB_ALIGNMENT          4096
 
@@ -261,6 +269,7 @@
 #define H_ADD_CONN		0x284
 #define H_DEL_CONN		0x288
 #define H_JOIN			0x298
+#define H_VASI_SIGNAL           0x2A0
 #define H_VASI_STATE            0x2A4
 #define H_VIOCTL		0x2A8
 #define H_ENABLE_CRQ		0x2B0
-- 
2.28.0

