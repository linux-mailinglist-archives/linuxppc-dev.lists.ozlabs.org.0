Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53D486736
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 17:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVB3Y2dGgz30Kw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:03:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XguRgZsj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XguRgZsj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV3Py0sBmz2ybH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 22:04:05 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206AuTjt022476; 
 Thu, 6 Jan 2022 11:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date : message-id : subject; s=pp1;
 bh=cHp/BsSvlaVBakeB0G6qcGO6G3wt2bTzTLqWQ8hB7rU=;
 b=XguRgZsj0mriRrRHP9m82NxebNUws9byUEmlcY8ejdiWodkxNN3sen39EPfku8JfpknI
 tBnnza3pzgOEcznk/JbUurWEo8T4ngFQnjKjR+dEBnCbOxiO0EGKGxJx9a9BW+lrU0kF
 f9Tuc2pMzrGg6eqIuq58ElwYO59/H9QkLomH3YE7JdvMulyxCm8SnyGmzNfqLtgi0MM/
 PrDhzmllQ/gz52VxbfQXMwqF18t5YDRUdv3FxlzxRhC3JEtWgMuuCfxxzrUnsXTospIe
 ln7rO85tNtS+eFhqjtsp3/3tWQTYqPX56K9dwOu25vxun8BExdAFz7/2EbjkNe4jgsON 8g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddy4483pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:04:01 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206B38SC016726;
 Thu, 6 Jan 2022 11:03:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3ddmugc6e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:03:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 206At6Ev49479976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 10:55:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F13D11C099;
 Thu,  6 Jan 2022 11:03:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5705F11C07F;
 Thu,  6 Jan 2022 11:03:54 +0000 (GMT)
Received: from MacBook-Pro.local (unknown [9.195.43.116])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 11:03:54 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Thu, 06 Jan 2022 16:33:53 +0530
Message-Id: <164146703333.19039.10920919226094771665.sendpatchset@MacBook-Pro.local>
Subject: [PATCH]powerpc/xive: Export XIVE IPI information for online-only
 processors.
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jOOAQJKXJXFvhJys2lQ7I2xp-3sUCrwL
X-Proofpoint-GUID: jOOAQJKXJXFvhJys2lQ7I2xp-3sUCrwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_04,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=784 lowpriorityscore=0
 phishscore=0 clxscore=1011 spamscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060079
X-Mailman-Approved-At: Fri, 07 Jan 2022 03:03:03 +1100
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
Cc: clg@kaod.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cédric pointed out that XIVE IPI information exported via sysfs
(debug/powerpc/xive) display empty lines for processors which are
not online.

Switch to using for_each_online_cpu() so that information is
displayed for online-only processors.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Sachin Sant <sachinp@linux.ibm.com>
--- 
diff -Naurp a/arch/p werpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
--- a/arch/powerpc/sysdev/xive/common.c	2022-01-05 08:52:59.460118219 -0500
+++ b/arch/powerpc/sysdev/xive/common.c	2022-01-06 02:34:20.994513145 -0500
@@ -1791,7 +1791,7 @@ static int xive_ipi_debug_show(struct se
 	if (xive_ops->debug_show)
 		xive_ops->debug_show(m, private);
 
-	for_each_possible_cpu(cpu)
+	for_each_online_cpu(cpu)
 		xive_debug_show_ipi(m, cpu);
 	return 0;
 }
