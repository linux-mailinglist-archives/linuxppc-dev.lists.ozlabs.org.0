Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906D1B6CFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 07:01:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497hpW3GxszDr9K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 15:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497hlP3gG8zDr8R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 14:58:40 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O4jDws001310
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 00:58:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghu9q29p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 00:58:37 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03O4nFVN007420
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 00:58:37 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghu9q299-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 00:58:37 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03O4v1Zn012607;
 Fri, 24 Apr 2020 04:58:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 30fs658pca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 04:58:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O4wX2557606222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 04:58:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A17C95204E;
 Fri, 24 Apr 2020 04:58:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4ED7652050;
 Fri, 24 Apr 2020 04:58:33 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.206.180.103])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 846C6A0209;
 Fri, 24 Apr 2020 14:58:27 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/3] powerpc/rtas: Export rtas_error_rc
Date: Fri, 24 Apr 2020 14:58:29 +1000
Message-Id: <e9c245df4a0b1cd1f68171c81e0d9e64a13ab0e9.1587704308.git.sbobroff@linux.ibm.com>
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1587704308.git.sbobroff@linux.ibm.com>
References: <cover.1587704308.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_19:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=1 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240027
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Export rtas_error_rc() so that it can be used by other users of
rtas_call() (which is already exported).

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
v3 * New in this version.

 arch/powerpc/include/asm/rtas.h | 1 +
 arch/powerpc/kernel/rtas.c      | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3c1887351c71..7c9e4d3635cf 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -379,6 +379,7 @@ extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
 
 extern unsigned int rtas_busy_delay_time(int status);
 extern unsigned int rtas_busy_delay(int status);
+extern int rtas_error_rc(int rtas_rc);
 
 extern int early_init_dt_scan_rtas(unsigned long node,
 		const char *uname, int depth, void *data);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c5fa251b8950..238bf112d29a 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -518,7 +518,7 @@ unsigned int rtas_busy_delay(int status)
 }
 EXPORT_SYMBOL(rtas_busy_delay);
 
-static int rtas_error_rc(int rtas_rc)
+int rtas_error_rc(int rtas_rc)
 {
 	int rc;
 
@@ -546,6 +546,7 @@ static int rtas_error_rc(int rtas_rc)
 	}
 	return rc;
 }
+EXPORT_SYMBOL(rtas_error_rc);
 
 int rtas_get_power_level(int powerdomain, int *level)
 {
-- 
2.22.0.216.g00a2a96fc9

