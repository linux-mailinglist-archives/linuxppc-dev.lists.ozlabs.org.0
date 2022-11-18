Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1CB62F8E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKvV1NnMz3f35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayyFZL8N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayyFZL8N;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsV5C7Dz3bbb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:07:58 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7lBn010752
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wn6bXTXZSis04qa4ZqKkxawTxZ/27wDMfuR6ZONqkts=;
 b=ayyFZL8NSgN5QcauOnP34cLTwK/sSiCoB6sISmfxq3kTUbOHtU5KSj1wBVIZPDVz60KD
 MNKydUnjnTaw1JcZYEdsOrbzYMC1oMztcWH/F3f3waB28Sh9us6axglcgpuELjMhZpbh
 k/O1EZQink6g9XiCpvi4GRfFw3qAHZL7lhhzy8SlC5NipHI/G/6jwhlE5H2jc7n8GHIl
 XPBpR+NlWQ4oLrHo0VLgUp7tDRO4fvozVXRsifA+24pPcNGQDZA4g/usK6XSA5HXM0Iv
 lmEGiZICDTW+ztep1cvhfKbcZtFOIA96lo996rmQOPT3i1aKrPDjNTbtn0Klmk3wqzIt Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx156fwhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEJGlj018700
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:54 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx156fwh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:54 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF7Wd0012335;
	Fri, 18 Nov 2022 15:07:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 3kt34aj5cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:54 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7sHb34996930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:54 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E8F458061;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43FAC5803F;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/13] powerpc/rtas: document rtas_call()
Date: Fri, 18 Nov 2022 09:07:39 -0600
Message-Id: <20221118150751.469393-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I7aLBWzmz4iNY7xCWHL0Z4mYhwskoZZl
X-Proofpoint-GUID: PnP8S_AHm7M7UR2HWaxVY0zKyO9a62XM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180084
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_call() has a complex calling convention, non-standard return
values, and many users. Add kernel-doc for it and remove the less
structured commentary from rtas.h.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 15 ---------
 arch/powerpc/kernel/rtas.c      | 58 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 56319aea646e..479a95cb2770 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -33,21 +33,6 @@
 #define RTAS_THREADS_ACTIVE     -9005 /* Multiple processor threads active */
 #define RTAS_OUTSTANDING_COPROC -9006 /* Outstanding coprocessor operations */
 
-/*
- * In general to call RTAS use rtas_token("string") to lookup
- * an RTAS token for the given string (e.g. "event-scan").
- * To actually perform the call use
- *    ret = rtas_call(token, n_in, n_out, ...)
- * Where n_in is the number of input parameters and
- *       n_out is the number of output parameters
- *
- * If the "string" is invalid on this system, RTAS_UNKNOWN_SERVICE
- * will be returned as a token.  rtas_call() does look for this
- * token and error out gracefully so rtas_call(rtas_token("str"), ...)
- * may be safely used for one-shot calls to RTAS.
- *
- */
-
 /* RTAS event classes */
 #define RTAS_INTERNAL_ERROR		0x80000000 /* set bit 0 */
 #define RTAS_EPOW_WARNING		0x40000000 /* set bit 1 */
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index e847f9b1c5b9..c12dd5ed5e00 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -467,6 +467,64 @@ void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 static int ibm_open_errinjct_token;
 static int ibm_errinjct_token;
 
+/**
+ * rtas_call() - Invoke an RTAS firmware function.
+ * @token: Identifies the function being invoked.
+ * @nargs: Number of input parameters. Does not include token.
+ * @nret: Number of output parameters, including the call status.
+ * @outputs: Array of @nret output words.
+ * @....: List of @nargs input parameters.
+ *
+ * Invokes the RTAS function indicated by @token, which the caller
+ * should obtain via rtas_token().
+ *
+ * The @nargs and @nret arguments must match the number of input and
+ * output parameters specified for the RTAS function.
+ *
+ * rtas_call() returns RTAS status codes, not conventional Linux errno
+ * values. Callers must translate any failure to an appropriate errno
+ * in syscall context. Most callers of RTAS functions that can return
+ * -2 or 990x should use rtas_busy_delay() to correctly handle those
+ * statuses before calling again.
+ *
+ * The return value descriptions are adapted from 7.2.8 [RTAS] Return
+ * Codes of the PAPR and CHRP specifications.
+ *
+ * Context: Process context preferably, interrupt context if
+ *          necessary.  Acquires an internal spinlock and may perform
+ *          GFP_ATOMIC slab allocation in error path. Unsafe for NMI
+ *          context.
+ * Return:
+ * *                          0 - RTAS function call succeeded.
+ * *                         -1 - RTAS function encountered a hardware or
+ *                                platform error, or the token is invalid,
+ *                                or the function is restricted by kernel policy.
+ * *                         -2 - Specs say "A necessary hardware device was busy,
+ *                                and the requested function could not be
+ *                                performed. The operation should be retried at
+ *                                a later time." This is misleading, at least with
+ *                                respect to current RTAS implementations. What it
+ *                                usually means in practice is that the function
+ *                                could not be completed while meeting RTAS's
+ *                                deadline for returning control to the OS (250us
+ *                                for PAPR/PowerVM, typically), but the call may be
+ *                                immediately reattempted to resume work on it.
+ * *                         -3 - Parameter error.
+ * *                         -7 - Unexpected state change.
+ * *                9000...9899 - Vendor-specific success codes.
+ * *                9900...9905 - Advisory extended delay. Caller should try
+ *                                again after ~10^x ms has elapsed, where x is
+ *                                the last digit of the status [0-5]. Again going
+ *                                beyond the PAPR text, 990x on PowerVM indicates
+ *                                contention for RTAS-internal resources. Other
+ *                                RTAS call sequences in progress should be
+ *                                allowed to complete before reattempting the
+ *                                call.
+ * *                      -9000 - Multi-level isolation error.
+ * *              -9999...-9004 - Vendor-specific error codes.
+ * * Additional negative values - Function-specific error.
+ * * Additional positive values - Function-specific success.
+ */
 int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 {
 	va_list list;
-- 
2.37.1

