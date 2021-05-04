Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECC37249A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4VS3V0Rz30Dl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V5peBaYF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V5peBaYF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4S858LCz2y6N
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1442YObW120330; Mon, 3 May 2021 23:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IsNjmXBjLzS/W3YHvr0F63hKFSimB4Sh0H1ojNYSjqM=;
 b=V5peBaYFL0aRP0eMdxUciiCfim+rsE8XRvDDxroT/1fwkJe2vlfNIUjAeuZZZkYS0QMx
 tSg4vN78kSNnhKar2/GZg9S+8SSiZvWqy3+081yIzUaM4Xrm2/VCW2XWHOUAQIKLG8FA
 He4RWV6sVA/5nmmFJuD9KB9joRfDLkUIBORJxqcgI0qoJRH+1XvdvFob/BY1d/2jn5ty
 Fe+7l470ceV2ZP32Je9MtXclRTsDiM9nDJeaSLyCHuerZNyj1je9/0BkSF7sA4zViLbl
 +ETGCqkYE33r8hhTJZVrDSwoQO4bEOPpzJzeG4yDWHFzsnYukhVU2hUilTc3oSM5hOcB nA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38awcg0nht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442wX1X017387;
 Tue, 4 May 2021 03:04:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 388xm972gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144341g835848524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:04:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1D5EAC059;
 Tue,  4 May 2021 03:04:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A45DAC068;
 Tue,  4 May 2021 03:04:01 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:04:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 03/10] powerpc/rtas-rtc: convert get-time-of-day to
 rtas_force_spin_if_busy()
Date: Mon,  3 May 2021 22:03:51 -0500
Message-Id: <20210504030358.1715034-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504030358.1715034-1-nathanl@linux.ibm.com>
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VGzJO8kPqkoZlaSIyhWEtr-6YJN0O8EW
X-Proofpoint-ORIG-GUID: VGzJO8kPqkoZlaSIyhWEtr-6YJN0O8EW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
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

The functions in rtas-rtc which call get-time-of-day can be invoked in
boot, suspend, and resume paths with interrupts off. Unfortunately
get-time-of-day can return an extended delay status, so we use
rtas_force_spin_if_busy().

In the specific case of rtas_get_rtc_time(), it is not clear why
returning an incorrect result is better than calling again even if we
are in interrupt context. Remove this logic.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas-rtc.c | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/rtas-rtc.c b/arch/powerpc/kernel/rtas-rtc.c
index a28239b8b0c0..82cb95f29a11 100644
--- a/arch/powerpc/kernel/rtas-rtc.c
+++ b/arch/powerpc/kernel/rtas-rtc.c
@@ -17,19 +17,12 @@ time64_t __init rtas_get_boot_time(void)
 {
 	int ret[8];
 	int error;
-	unsigned int wait_time;
 	u64 max_wait_tb;
 
 	max_wait_tb = get_tb() + tb_ticks_per_usec * 1000 * MAX_RTC_WAIT;
 	do {
 		error = rtas_call(rtas_token("get-time-of-day"), 0, 8, ret);
-
-		wait_time = rtas_busy_delay_time(error);
-		if (wait_time) {
-			/* This is boot time so we spin. */
-			udelay(wait_time*1000);
-		}
-	} while (wait_time && (get_tb() < max_wait_tb));
+	} while (rtas_force_spin_if_busy(error) && (get_tb() < max_wait_tb));
 
 	if (error != 0) {
 		printk_ratelimited(KERN_WARNING
@@ -41,33 +34,16 @@ time64_t __init rtas_get_boot_time(void)
 	return mktime64(ret[0], ret[1], ret[2], ret[3], ret[4], ret[5]);
 }
 
-/* NOTE: get_rtc_time will get an error if executed in interrupt context
- * and if a delay is needed to read the clock.  In this case we just
- * silently return without updating rtc_tm.
- */
 void rtas_get_rtc_time(struct rtc_time *rtc_tm)
 {
         int ret[8];
 	int error;
-	unsigned int wait_time;
 	u64 max_wait_tb;
 
 	max_wait_tb = get_tb() + tb_ticks_per_usec * 1000 * MAX_RTC_WAIT;
 	do {
 		error = rtas_call(rtas_token("get-time-of-day"), 0, 8, ret);
-
-		wait_time = rtas_busy_delay_time(error);
-		if (wait_time) {
-			if (in_interrupt()) {
-				memset(rtc_tm, 0, sizeof(struct rtc_time));
-				printk_ratelimited(KERN_WARNING
-						   "error: reading clock "
-						   "would delay interrupt\n");
-				return;	/* delay not allowed */
-			}
-			msleep(wait_time);
-		}
-	} while (wait_time && (get_tb() < max_wait_tb));
+	} while (rtas_sched_if_busy(error) && (get_tb() < max_wait_tb));
 
 	if (error != 0) {
 		printk_ratelimited(KERN_WARNING
-- 
2.30.2

