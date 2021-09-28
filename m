Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2BE41AF4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 14:46:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJfQJ585Pz2ysq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 22:46:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Eye/D+Ky;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Eye/D+Ky; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJfPc0Xgbz2xrg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 22:45:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SCJgs4003192
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 08:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=gQ66LNlupbZHsp8X6FrAuV8QgGNMct7Px/ufEC1UCog=;
 b=Eye/D+Ky8n02nhQnIl2rBzsGO2odFPDKuz3V2Jzft0Nsv04XRc3jUj9QqT1pNpa1KA4K
 +NNs0r5SDMb3/hvs6D8HDK1fvBghX0kYwP1oK5sM34fiiTvyd4m9azWVv/Sbl3ccguka
 ZT3zlQZnjfyTQqjTybXKcb3BtJ0RAxytX1XzEc7zeieFg7fnYYIjAx0Q+HTfYn/W23fy
 Lg124ELdLs1emoMzTjwsVy+hQFn6otHMdJbAZbfYjgJMR72mTlvtcWLYH+ugdq8puvrm
 prwN3egWIz36rZR8F5wmB38f+q4LKw+93uzeSj4KxvCb+083PuenJ0lqpQvhUSSit1rV aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bbusba5by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 08:45:53 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18SBmfbW031317
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 08:45:52 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bbusba5bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 08:45:52 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SChSoR003284;
 Tue, 28 Sep 2021 12:45:52 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3ba00d8687-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 12:45:52 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SCjp3w40567054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 12:45:51 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CB3A136069;
 Tue, 28 Sep 2021 12:45:51 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08A9B13604F;
 Tue, 28 Sep 2021 12:45:50 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 12:45:50 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: fix unbalanced node refcount in check_kvm_guest()
Date: Tue, 28 Sep 2021 07:45:50 -0500
Message-Id: <20210928124550.132020-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W0qN7QBbCo66KYNS_zoakmykicsm_iZx
X-Proofpoint-ORIG-GUID: nS0G8PLWMlUXVf_e73rq_MbklL1khvMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280071
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When check_kvm_guest() succeeds in looking up a /hypervisor OF node, it
returns without performing a matching put for the lookup, leaving the
node's reference count elevated.

Add the necessary call to of_node_put(), rearranging the code slightly to
avoid repetition or goto.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell restrictions")
---
 arch/powerpc/kernel/firmware.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index c7022c41cc31..20328f72f9f2 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -31,11 +31,10 @@ int __init check_kvm_guest(void)
 	if (!hyper_node)
 		return 0;
 
-	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
-		return 0;
-
-	static_branch_enable(&kvm_guest);
+	if (of_device_is_compatible(hyper_node, "linux,kvm"))
+		static_branch_enable(&kvm_guest);
 
+	of_node_put(hyper_node);
 	return 0;
 }
 core_initcall(check_kvm_guest); // before kvm_guest_init()
-- 
2.31.1

