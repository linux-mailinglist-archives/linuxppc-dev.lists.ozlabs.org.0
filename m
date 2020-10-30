Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC5A29FAA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:32:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlDk10BlzDql9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:32:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q4ezMsSr; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvr0gpwzDqk8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:15 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U12pWD099680
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sKtylfZ/sOww1cD2ugsThNjd8dqs7yU4pJ6q+54PH1k=;
 b=Q4ezMsSrofU+SbC+h7YzcEcsa4CFgo1hHUZdOpVZYTDEDB7Rr6Ruli627F40XtKhPMUj
 YHT5Wo+RmriTMPtWyegVy32HT2t9qeSzgzW//BXLrf0orrSrduJjINGfGpBVIEexsMOQ
 +JFllwe+/H0RhUKc35+RUUfl3sGG+80jnJlT9g0GX1CGUMsqJ3tKZ1FXTfAai7kfY69l
 tdSj+1FqXR9Xl01yRGtSb+QBenLdsoJfl8QjxHH+Q5vTzl49sqcRjxlu8fc31wKz6ARv
 VTsR5AwEELA+cy/vNs+RsP3NP193yIxHGie5vEbV7BUuiTFR+UkqKpqzAUI5Hfub3Fnx Hg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fyx99bj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HIxR000782
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 34e1gpc5b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IBOE52691236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81AEDAE05F;
 Fri, 30 Oct 2020 01:18:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49DECAE05C;
 Fri, 30 Oct 2020 01:18:11 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:11 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/29] powerpc/hvcall: add token and codes for H_VASI_SIGNAL
Date: Thu, 29 Oct 2020 20:17:43 -0500
Message-Id: <20201030011805.1224603-8-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=1 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=507 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
2.25.4

