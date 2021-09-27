Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4741A00E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 22:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJDZq03C3z3bWk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 06:22:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PEXbg6pq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PEXbg6pq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJDWl2p0nz2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 06:19:46 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RInXC8003658; 
 Mon, 27 Sep 2021 16:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vfh7/jREAbgBYL77RtiSaiA/oTpO6wNwvdheSexyfw4=;
 b=PEXbg6pqDANMPFEt4bkOXXNRZSSI3rCO3+TSUNLZGBZN5JlA3+DapGxdnc6n5Bb13AJ2
 9s8OkCZIw0yS43+WZGhdo4R9I7FolQ6iBU2aoBNdqvPVTjaZGN6h2TdujlIKVzN0XZyI
 lX3Ek56NiRkYVRlzdVhtgGNJNpZeEummLLaGS+WGKZE9vU6u1e7oDc0AA1KwPnyYEctV
 TkNC8uQs9XImnFltE4VBtQUn09Pz33pthOdIL8G/I6rDWa1TdagLyLvYTayPm7knIoYX
 HjVvcB2bETtXLoYpjas+2Wy5A1x28aGWlNPpBL6k5lzQ2wIoyUotSRQ5f8Um27HQLW3p Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bagv8dd8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 16:19:42 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18RJso2q013548;
 Mon, 27 Sep 2021 16:19:41 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bagv8dd86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 16:19:41 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18RKHCdL017242;
 Mon, 27 Sep 2021 20:19:40 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3b9udaevv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 20:19:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18RKJdpK31916376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Sep 2021 20:19:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34ECDBE058;
 Mon, 27 Sep 2021 20:19:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16DCDBE04F;
 Mon, 27 Sep 2021 20:19:39 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Sep 2021 20:19:39 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/pseries/cpuhp: remove obsolete comment from
 pseries_cpu_die
Date: Mon, 27 Sep 2021 15:19:33 -0500
Message-Id: <20210927201933.76786-5-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927201933.76786-1-nathanl@linux.ibm.com>
References: <20210927201933.76786-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H3nhnG9OqpMNn-V2OHWg-jpSw2VUMo8a
X-Proofpoint-ORIG-GUID: 1itUI2ZnCHtCigG5NPDqGBTF55bevpc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270135
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 danielhb413@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This comment likely refers to the obsolete DLPAR workflow where some
resource state transitions were driven more directly from user space
utilities, but it also seems to contradict itself: "Change isolate state to
Isolate [...]" is at odds with the preceding sentences, and it does not
relate at all to the code that follows.

Remove it to prevent confusion.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index b50f3e9aa259..5ab44600c8d3 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -137,11 +137,6 @@ static void pseries_cpu_die(unsigned int cpu)
 			cpu, pcpu);
 	}
 
-	/* Isolation and deallocation are definitely done by
-	 * drslot_chrp_cpu.  If they were not they would be
-	 * done here.  Change isolate state to Isolate and
-	 * change allocation-state to Unusable.
-	 */
 	paca_ptrs[cpu]->cpu_start = 0;
 }
 
-- 
2.31.1

