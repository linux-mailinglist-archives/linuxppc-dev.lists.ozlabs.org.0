Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3362F91E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:18:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDL5p5tgFz3fLy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:18:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=paso5dVY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=paso5dVY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsd68R9z3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:05 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIEBE64001150
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WNV3IjOWHMNkh9AQbn7q3ylS4bthtMgoiwDpHZQ9pVs=;
 b=paso5dVY3ezuPdVKAc6wkJOOkFq/AvEmSmQUpdo9Y+U/ww/OedZ4MAM3fCBG8QMXoGeP
 xHciqI83ZRIazquz7evpwCPTCG0oRpXqdHUprnWkDqubC6eXMDBUiuStnnd/xPPD/Xnn
 s7ZtXUr7k6AyKwAlLGH9f4a1aPMT4Lh6bIN5agU3wVu/N2F8SikRvYGt33gabmutX2ZK
 xKx97wwg4zWKFcNjVeCed/6ba368Q074lnzyKl0wsrRergBG6X0DQnHUNUy5+jTQpXr+
 rBiWKHRZQmpTqz//EqvsPvLuCQ5sKRI8BmuSPHiLABhl/uzGC8Hm+g2zPCIB8A1pLymp 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6e7he1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:59 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEDINR010238
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6e7he16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:58 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6orT008271;
	Fri, 18 Nov 2022 15:07:58 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01dal.us.ibm.com with ESMTP id 3kt34aa865-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:58 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7uvM18088506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3311958054;
	Fri, 18 Nov 2022 15:07:56 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CAA458056;
	Fri, 18 Nov 2022 15:07:56 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/13] powerpc/rtas: mandate RTAS syscall filtering
Date: Fri, 18 Nov 2022 09:07:47 -0600
Message-Id: <20221118150751.469393-10-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: laYOzzoaq2zDioLFj_Pq6WjhRuZ-0I0t
X-Proofpoint-GUID: _sXzB7RA5OjtF5SSlSNVERLgpE7VKdyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=929
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

CONFIG_PPC_RTAS_FILTER has been optional but default-enabled since its
introduction. It's been enabled in enterprise distro kernels for a
while without causing ABI breakage that wasn't easily fixed, and it
prevents harmful abuses of the rtas syscall.

Let's make it unconditional.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/Kconfig       | 13 -------------
 arch/powerpc/kernel/rtas.c | 16 ----------------
 2 files changed, 29 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..8092915a4e9b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1012,19 +1012,6 @@ config PPC_SECVAR_SYSFS
 	  read/write operations on these variables. Say Y if you have
 	  secure boot enabled and want to expose variables to userspace.
 
-config PPC_RTAS_FILTER
-	bool "Enable filtering of RTAS syscalls"
-	default y
-	depends on PPC_RTAS
-	help
-	  The RTAS syscall API has security issues that could be used to
-	  compromise system integrity. This option enforces restrictions on the
-	  RTAS calls and arguments passed by userspace programs to mitigate
-	  these issues.
-
-	  Say Y unless you know what you are doing and the filter is causing
-	  problems for you.
-
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c3142d352f41..3929bcea92c0 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1051,8 +1051,6 @@ noinstr struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log
 	return NULL;
 }
 
-#ifdef CONFIG_PPC_RTAS_FILTER
-
 /*
  * The sys_rtas syscall, as originally designed, allows root to pass
  * arbitrary physical addresses to RTAS calls. A number of RTAS calls
@@ -1201,20 +1199,6 @@ static void __init rtas_syscall_filter_init(void)
 		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
 }
 
-#else
-
-static bool block_rtas_call(int token, int nargs,
-			    struct rtas_args *args)
-{
-	return false;
-}
-
-static void __init rtas_syscall_filter_init(void)
-{
-}
-
-#endif /* CONFIG_PPC_RTAS_FILTER */
-
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
-- 
2.37.1

