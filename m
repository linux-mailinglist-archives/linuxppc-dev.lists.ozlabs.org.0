Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C60485437
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 15:18:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTWmz4Wpxz2yfh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 01:18:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tazfRhoS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tazfRhoS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTWmF5Thxz2yMC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 01:18:04 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205Dadxd037260; 
 Wed, 5 Jan 2022 14:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date : message-id : subject; s=pp1;
 bh=9NkXgheG93EKHUWrprzpHv013omjdZKmEDk632IDKSc=;
 b=tazfRhoSQa3Ile9HXlHt5vuVBIcazBqTn8mMrKFqliS2BWPpJ6ZNLenB8TGljj0ryY7r
 fBmGH6JONgCxElSBNKwO+qetE6+HlAD9UURMJsXT8/v/gbfmXLp5NWUyY5H4DuJvnRkh
 suWFTmWzMzuIeM+ju9x6uVJGgGujKlgfRlpJ+gF7RgKxK7kIJraINSKYeA+Cvni33La3
 ezVSDBDdAu8YBjGMkk6rO4n5zvL/DnFr2NSY/2YnDA+oPBKM2P5b/YIXPHNMzurkeDaD
 jEaB4LoCzj+Pb4fVW0BT+CgZj4PhoHqSzj7s8FtDvUp/c6XeZAXLqyZO/0ZTnallqaB/ qw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqu1xg10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 14:17:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205EDGbY008582;
 Wed, 5 Jan 2022 14:17:52 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3daeka8xv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 14:17:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205EHofO41746824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 14:17:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2712752050;
 Wed,  5 Jan 2022 14:17:50 +0000 (GMT)
Received: from MacBook-Pro.local (unknown [9.195.32.223])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5B0DE52059;
 Wed,  5 Jan 2022 14:17:49 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Wed, 05 Jan 2022 19:47:48 +0530
Message-Id: <164139226833.12930.272224382183014664.sendpatchset@MacBook-Pro.local>
Subject: [PATCH]powerpc/xmon: Dump XIVE information for online-only processors.
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hHnV7nQWJ07eQ-AUfbEzeceamBi_Zcun
X-Proofpoint-GUID: hHnV7nQWJ07eQ-AUfbEzeceamBi_Zcun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 adultscore=0 mlxlogscore=600 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050094
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dxa command in XMON debugger iterates through all possible processors.
As a result, empty lines are printed even for processors which are not
online.

CPU 47:pp=00 CPPR=ff IPI=0x0040002f PQ=-- EQ idx=699 T=0 00000000 00000000
CPU 48:
CPU 49:

Restrict XIVE information(dxa) to be displayed for online processors only.

Signed-off-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
---
diff -Naurp a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
--- a/arch/powerpc/xmon/xmon.c	2022-01-05 08:52:59.480118166 -0500
+++ b/arch/powerpc/xmon/xmon.c	2022-01-05 08:56:18.469589555 -0500
@@ -2817,12 +2817,12 @@ static void dump_all_xives(void)
 {
 	int cpu;
 
-	if (num_possible_cpus() == 0) {
+	if (num_online_cpus() == 0) {
 		printf("No possible cpus, use 'dx #' to dump individual cpus\n");
 		return;
 	}
 
-	for_each_possible_cpu(cpu)
+	for_each_online_cpu(cpu)
 		dump_one_xive(cpu);
 }
 
