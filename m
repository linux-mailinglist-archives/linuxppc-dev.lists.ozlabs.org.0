Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401D62F8F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKxX5kxVz3f3N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZTW33fyG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZTW33fyG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsX50FKz3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:00 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7G1V005136
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=foh1qqdEJ5MRAzJJjlRJgrupl2evtqnjDVkupRQ8n8Y=;
 b=ZTW33fyGMurzpPgN8bNaMYwr9rmXx/6PeOUFGNLnPBzeK+7nkU9IBKnZ3gCsvHPhldLp
 dbh5XTT39aZRkdfypwsDfrs2LDwwNwjA5I7bFHTMD7yBXlaWykf2FWv7zxLjcmwz6qw6
 cP5bZsPK2g8r9OYMePpOrFiP7ZUSZp3yRxRu9ZHHgXCoN/YEQRJpJasxpt5d2TPTEzNV
 M9jGQIiICx4e9woFhvVf5+/Wc9CZFcxs670vb50RGTP1j5Ew06K0IEdBrtgTAnvficzg
 It84U5eUGL2UmP38sWuhEFm8TaZBI9ivXtsoh+WcW6JEJT74Bbn2Y+wRV/SlyX54gFTU rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx7suyh0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:57 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEmvfW011542
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:57 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx7suyh03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6mKq014736;
	Fri, 18 Nov 2022 15:07:56 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma02wdc.us.ibm.com with ESMTP id 3kt34a88d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:56 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7sfN5833312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:55 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFB4358066;
	Fri, 18 Nov 2022 15:07:54 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 905E358059;
	Fri, 18 Nov 2022 15:07:54 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:54 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/13] powerpc/rtas: clean up rtas_error_log_max initialization
Date: Fri, 18 Nov 2022 09:07:44 -0600
Message-Id: <20221118150751.469393-7-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CO396bauL_XhvdN5zsVg-5bq4g-43Vfc
X-Proofpoint-GUID: Um7eZJMhPglROP0NjBNAhkADil5j7hAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211180088
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

The code in rtas_get_error_log_max() doesn't cause problems in
practice, but there are no measures to ensure that the lazy
initialization of the static rtas_error_log_max variable is atomic,
and it's not worth adding them.

Initialize the static rtas_error_log_max variable at boot when we're
single-threaded instead of lazily on first use. Use the more
appropriate of_property_read_u32() API instead of rtas_token() to
consult the "rtas-error-log-max" property, which is not the name of an
RTAS function. Convert use of printk() to pr_warn() and distinguish
the possible error cases.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 51f0508593a7..3fa84c247415 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -353,6 +353,9 @@ int rtas_service_present(const char *service)
 EXPORT_SYMBOL(rtas_service_present);
 
 #ifdef CONFIG_RTAS_ERROR_LOGGING
+
+static u32 rtas_error_log_max __ro_after_init = RTAS_ERROR_LOG_MAX;
+
 /*
  * Return the firmware-specified size of the error log buffer
  *  for all rtas calls that require an error buffer argument.
@@ -360,21 +363,30 @@ EXPORT_SYMBOL(rtas_service_present);
  */
 int rtas_get_error_log_max(void)
 {
-	static int rtas_error_log_max;
-	if (rtas_error_log_max)
-		return rtas_error_log_max;
-
-	rtas_error_log_max = rtas_token ("rtas-error-log-max");
-	if ((rtas_error_log_max == RTAS_UNKNOWN_SERVICE) ||
-	    (rtas_error_log_max > RTAS_ERROR_LOG_MAX)) {
-		printk (KERN_WARNING "RTAS: bad log buffer size %d\n",
-			rtas_error_log_max);
-		rtas_error_log_max = RTAS_ERROR_LOG_MAX;
-	}
 	return rtas_error_log_max;
 }
 EXPORT_SYMBOL(rtas_get_error_log_max);
 
+static void __init init_error_log_max(void)
+{
+	static const char propname[] __initconst = "rtas-error-log-max";
+	u32 max;
+
+	if (of_property_read_u32(rtas.dev, propname, &max)) {
+		pr_warn("%s not found, using default of %u\n",
+			propname, RTAS_ERROR_LOG_MAX);
+		max = RTAS_ERROR_LOG_MAX;
+	}
+
+	if (max > RTAS_ERROR_LOG_MAX) {
+		pr_warn("%s = %u, clamping max error log size to %u\n",
+			propname, max, RTAS_ERROR_LOG_MAX);
+		max = RTAS_ERROR_LOG_MAX;
+	}
+
+	rtas_error_log_max = max;
+}
+
 
 static char rtas_err_buf[RTAS_ERROR_LOG_MAX];
 static int rtas_last_error_token;
@@ -432,6 +444,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 #else /* CONFIG_RTAS_ERROR_LOGGING */
 #define __fetch_rtas_last_error(x)	NULL
 #define get_errorlog_buffer()		NULL
+static void __init init_error_log_max(void) {}
 #endif
 
 
@@ -1341,6 +1354,8 @@ void __init rtas_initialize(void)
 	no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry", &entry);
 	rtas.entry = no_entry ? rtas.base : entry;
 
+	init_error_log_max();
+
 	/*
 	 * Discover these now to avoid device tree lookups in the
 	 * panic path.
-- 
2.37.1

