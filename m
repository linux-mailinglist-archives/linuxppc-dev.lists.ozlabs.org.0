Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB537249B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4W068Phz3c4J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:06:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vla0jKa2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vla0jKa2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4S93bSPz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:08 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1442XbW2030601; Mon, 3 May 2021 23:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=G6wyuUYp2A/yx3daQThCxp7+e9BBg03KiMVepsRnfAc=;
 b=Vla0jKa2ipYAWmIQQ3j4jKWs2PtMFnJLYr5ZIAYE5dHAjPDkUHwkTlrusQ7bV/78Ix/c
 EGLWzzGXeDbxABE7RgnwUOiNPWaXCCNXJr6cGcApnKxciYmQlCP/HDwFpVgNtLuyBTiX
 NgFxlgV1KRrO068GiA4F56jcpiy7RJxiXNFYBa4dQIfi8u+eI6wZYrrcHAjgakjpjoqG
 kBzC1s86Mo+6P/F/C675Ymwtxw3CJYd9g1Y0+x4cpfSQWSnPB4Ye4gahzaZOIqoQdCRK
 3yKkSxPB6M3uc4OQRmGdOIW72KwoFKBA0MPnL1aHmP/s2+njHJ/ZusyjsfLU/vh3R3/m Og== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38awe7gmaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:03 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442vZsj016832;
 Tue, 4 May 2021 03:04:03 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 388xm9q1yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144342mT40567078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:04:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DE53AC059;
 Tue,  4 May 2021 03:04:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46454AC05B;
 Tue,  4 May 2021 03:04:02 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:04:02 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 04/10] powerpc/rtas-rtc: convert set-time-of-day to
 rtas_sched_if_busy()
Date: Mon,  3 May 2021 22:03:52 -0500
Message-Id: <20210504030358.1715034-5-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504030358.1715034-1-nathanl@linux.ibm.com>
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0FRudzH1dlo2dvFoMoH1qcT2-CXK80IO
X-Proofpoint-GUID: 0FRudzH1dlo2dvFoMoH1qcT2-CXK80IO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105040018
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
Cc: aik@ozlabs.ru, ajd@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_set_rtc_time() is called only in process context; convert this to
rtas_sched_if_busy().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas-rtc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/rtas-rtc.c b/arch/powerpc/kernel/rtas-rtc.c
index 82cb95f29a11..421b92f95669 100644
--- a/arch/powerpc/kernel/rtas-rtc.c
+++ b/arch/powerpc/kernel/rtas-rtc.c
@@ -62,7 +62,7 @@ void rtas_get_rtc_time(struct rtc_time *rtc_tm)
 
 int rtas_set_rtc_time(struct rtc_time *tm)
 {
-	int error, wait_time;
+	int error;
 	u64 max_wait_tb;
 
 	max_wait_tb = get_tb() + tb_ticks_per_usec * 1000 * MAX_RTC_WAIT;
@@ -72,13 +72,7 @@ int rtas_set_rtc_time(struct rtc_time *tm)
 				  tm->tm_mday, tm->tm_hour, tm->tm_min,
 				  tm->tm_sec, 0);
 
-		wait_time = rtas_busy_delay_time(error);
-		if (wait_time) {
-			if (in_interrupt())
-				return 1;	/* probably decrementer */
-			msleep(wait_time);
-		}
-	} while (wait_time && (get_tb() < max_wait_tb));
+	} while (rtas_sched_if_busy(error) && (get_tb() < max_wait_tb));
 
 	if (error != 0)
 		printk_ratelimited(KERN_WARNING
-- 
2.30.2

