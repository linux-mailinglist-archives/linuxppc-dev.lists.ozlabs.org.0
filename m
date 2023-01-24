Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 893E5679B22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1TMz36N8z3fBh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 01:08:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ogxI8CB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ogxI8CB0;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1THv6J4Dz3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 01:04:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OCpAPs006314;
	Tue, 24 Jan 2023 14:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=MOHpKTUOCi8DsIjC8X79RPaLNfe8bSHalAk0icfi2ic=;
 b=ogxI8CB0qI23+FGcy9U9836OUM0dpuKIY4YQjiOdzlc0E+O77J5wfWhAFKE0tdZnKGVG
 CKsSjANtJEezGTFqJvZNlNOalCVOa+WpScLP/hdAk6OC2YwWgvsfcIyld6QtwcjOp4VO
 iwAm4qoFQmNltTjKZVf+5QCpYjGYa7HtOJA4U/rbozRS3v0w/hWHD7yIyg8ZxIjVlFeC
 hKFoHedY7axIEKOC0NRi7rlhwUJARtzGUvZ6ldmDZ39Uag7LRfn+ZgyT6s/wtctKLr/9
 nq1yH16Nt8bxTngua+eAJW4DmQ+FmKnJpMd8X7R2RZlCv2SNCVsgo3gasvbhTQuykTJ8 fA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naakns55d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:53 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30ODKFU0016077;
	Tue, 24 Jan 2023 14:04:53 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naakns54t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:53 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OBKCxK003183;
	Tue, 24 Jan 2023 14:04:52 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3n87p72gy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:52 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OE4onh6947352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 14:04:50 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 578065805D;
	Tue, 24 Jan 2023 14:04:50 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BBD558058;
	Tue, 24 Jan 2023 14:04:50 +0000 (GMT)
Received: from localhost (unknown [9.163.30.189])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 14:04:50 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/rtas: make all exports GPL
Date: Tue, 24 Jan 2023 08:04:46 -0600
Message-Id: <20230124140448.45938-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124140448.45938-1-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lyhfD4XBZDEsDyueDLasQKPqKOk75bO4
X-Proofpoint-GUID: 9BPOZ_9T8Wt6ZQQsyy2ZcwW83TThbPqC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240127
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
Cc: ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first symbol exports of RTAS functions and data came with the (now
removed) scanlog driver in 2003:

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=f92e361842d5251e50562b09664082dcbd0548bb

At the time this was applied, EXPORT_SYMBOL_GPL() was very new, and
the exports of rtas_call() etc have remained non-GPL. As new APIs have
been added to the RTAS subsystem, their symbol exports have followed
the convention set by existing code.

However, the historical evidence is that RTAS function exports have
been added over time only to satisfy the needs of in-kernel users, and
these clients must have fairly intimate knowledge of how the APIs work
to use them safely. No out of tree users are known, and future ones
seem unlikely.

Arguably the default for RTAS symbols should have become
EXPORT_SYMBOL_GPL once it was available. Let's make it so now, and
exceptions can be evaluated as needed.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 6c5716b19d69..e60e2f5af7b9 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -65,10 +65,10 @@ struct rtas_t rtas = {
 };
 
 DEFINE_SPINLOCK(rtas_data_buf_lock);
-EXPORT_SYMBOL(rtas_data_buf_lock);
+EXPORT_SYMBOL_GPL(rtas_data_buf_lock);
 
 char rtas_data_buf[RTAS_DATA_BUF_SIZE] __cacheline_aligned;
-EXPORT_SYMBOL(rtas_data_buf);
+EXPORT_SYMBOL_GPL(rtas_data_buf);
 
 unsigned long rtas_rmo_buf;
 
@@ -77,7 +77,7 @@ unsigned long rtas_rmo_buf;
  * This is done like this so rtas_flash can be a module.
  */
 void (*rtas_flash_term_hook)(int);
-EXPORT_SYMBOL(rtas_flash_term_hook);
+EXPORT_SYMBOL_GPL(rtas_flash_term_hook);
 
 /* RTAS use home made raw locking instead of spin_lock_irqsave
  * because those can be called from within really nasty contexts
@@ -325,7 +325,7 @@ void rtas_progress(char *s, unsigned short hex)
  
 	spin_unlock(&progress_lock);
 }
-EXPORT_SYMBOL(rtas_progress);		/* needed by rtas_flash module */
+EXPORT_SYMBOL_GPL(rtas_progress);		/* needed by rtas_flash module */
 
 int rtas_token(const char *service)
 {
@@ -335,13 +335,13 @@ int rtas_token(const char *service)
 	tokp = of_get_property(rtas.dev, service, NULL);
 	return tokp ? be32_to_cpu(*tokp) : RTAS_UNKNOWN_SERVICE;
 }
-EXPORT_SYMBOL(rtas_token);
+EXPORT_SYMBOL_GPL(rtas_token);
 
 int rtas_service_present(const char *service)
 {
 	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
 }
-EXPORT_SYMBOL(rtas_service_present);
+EXPORT_SYMBOL_GPL(rtas_service_present);
 
 #ifdef CONFIG_RTAS_ERROR_LOGGING
 
@@ -356,7 +356,7 @@ int rtas_get_error_log_max(void)
 {
 	return rtas_error_log_max;
 }
-EXPORT_SYMBOL(rtas_get_error_log_max);
+EXPORT_SYMBOL_GPL(rtas_get_error_log_max);
 
 static void __init init_error_log_max(void)
 {
@@ -584,7 +584,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	}
 	return ret;
 }
-EXPORT_SYMBOL(rtas_call);
+EXPORT_SYMBOL_GPL(rtas_call);
 
 /**
  * rtas_busy_delay_time() - From an RTAS status value, calculate the
@@ -622,7 +622,7 @@ unsigned int rtas_busy_delay_time(int status)
 
 	return ms;
 }
-EXPORT_SYMBOL(rtas_busy_delay_time);
+EXPORT_SYMBOL_GPL(rtas_busy_delay_time);
 
 /**
  * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
@@ -696,7 +696,7 @@ bool rtas_busy_delay(int status)
 
 	return ret;
 }
-EXPORT_SYMBOL(rtas_busy_delay);
+EXPORT_SYMBOL_GPL(rtas_busy_delay);
 
 static int rtas_error_rc(int rtas_rc)
 {
@@ -741,7 +741,7 @@ int rtas_get_power_level(int powerdomain, int *level)
 		return rtas_error_rc(rc);
 	return rc;
 }
-EXPORT_SYMBOL(rtas_get_power_level);
+EXPORT_SYMBOL_GPL(rtas_get_power_level);
 
 int rtas_set_power_level(int powerdomain, int level, int *setlevel)
 {
@@ -759,7 +759,7 @@ int rtas_set_power_level(int powerdomain, int level, int *setlevel)
 		return rtas_error_rc(rc);
 	return rc;
 }
-EXPORT_SYMBOL(rtas_set_power_level);
+EXPORT_SYMBOL_GPL(rtas_set_power_level);
 
 int rtas_get_sensor(int sensor, int index, int *state)
 {
@@ -777,7 +777,7 @@ int rtas_get_sensor(int sensor, int index, int *state)
 		return rtas_error_rc(rc);
 	return rc;
 }
-EXPORT_SYMBOL(rtas_get_sensor);
+EXPORT_SYMBOL_GPL(rtas_get_sensor);
 
 int rtas_get_sensor_fast(int sensor, int index, int *state)
 {
@@ -820,7 +820,7 @@ bool rtas_indicator_present(int token, int *maxindex)
 
 	return false;
 }
-EXPORT_SYMBOL(rtas_indicator_present);
+EXPORT_SYMBOL_GPL(rtas_indicator_present);
 
 int rtas_set_indicator(int indicator, int index, int new_value)
 {
@@ -838,7 +838,7 @@ int rtas_set_indicator(int indicator, int index, int new_value)
 		return rtas_error_rc(rc);
 	return rc;
 }
-EXPORT_SYMBOL(rtas_set_indicator);
+EXPORT_SYMBOL_GPL(rtas_set_indicator);
 
 /*
  * Ignoring RTAS extended delay
-- 
2.37.1

