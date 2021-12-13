Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F79473212
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 17:43:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCS4H14xbz3c9h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 03:43:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d4CLBK3p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d4CLBK3p; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCS3b00yyz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 03:42:34 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDGTU7T022427
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 16:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date : message-id : subject; s=pp1;
 bh=9gNJol1L+ZIGAM70Z2Xg561qU+ZlT2e0JTgYhI5RHGg=;
 b=d4CLBK3pSN/nJsa1DOPqvthQm3nkan2xZ/+5oYy7/7/L5w3FWIiJ7UHsoRn3MOLudK9C
 JY6kcLlfaBYg6VbKmLx2rbEWA2luojJlnj5NpGmR9c+d6H13FtsACW/Oj2TlySZL1AcV
 2TNQxFyou0oHqWHJZ/Ik3SxDtHL7ButvG8rCfNVUXUOMHFiZ94uROayD5VZSKLky+Fua
 x+bZoly4j8qvP+ssW4b6plNpXBsvtESfElCjOR0b9gybrTUhN2npQE7mmqkbZ+5jBH2x
 Z4ddqaVZ4IruaOQ1HVYt0ucbgnmbGDVHu2he71Md3MryDUGwJTvaOH8GM1DQgvoH9G76 eA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cx9r9rata-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 16:42:31 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BDGgC3p027995
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 16:42:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3cvkm8p51f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 16:42:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BDGYUCt45941168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 16:34:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CCABA405B;
 Mon, 13 Dec 2021 16:42:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F9DBA4055;
 Mon, 13 Dec 2021 16:42:24 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (unknown [9.79.183.212])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Dec 2021 16:42:24 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Mon, 13 Dec 2021 22:12:23 +0530
Message-Id: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
Subject: [PATCH]selftests/powerpc: skip tests for unavailable mitigations.
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mL9oDK8DkQFioOlUWwGbnBc2xWoLYKOu
X-Proofpoint-GUID: mL9oDK8DkQFioOlUWwGbnBc2xWoLYKOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_08,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=715 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112130105
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mitigation patching test iterates over a set of mitigations irrespective
of whether a certain mitigation is supported/available in the kernel.
This causes following messages on a kernel where some mitigations
are unavailable:

  Spawned threads enabling/disabling mitigations ...
  cat: entry_flush: No such file or directory
  cat: uaccess_flush: No such file or directory
  Waiting for timeout ...
  OK

This patch adds a check for available mitigations in the kernel.

Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
---
diff -Naurp aa/tools/testing/selftests/powerpc/security/mitigation-patching.sh bb/tools/testing/selftests/powerpc/security/mitigation-patching.sh
--- aa/tools/testing/selftests/powerpc/security/mitigation-patching.sh	2021-12-13 10:17:05.714127154 -0500
+++ bb/tools/testing/selftests/powerpc/security/mitigation-patching.sh	2021-12-13 10:19:32.575315913 -0500
@@ -44,7 +44,10 @@ mitigations="barrier_nospec stf_barrier
 
 for m in $mitigations
 do
-    do_one "$m" &
+    if [[ -f /sys/kernel/debug/powerpc/$m ]]
+    then
+        do_one "$m" &
+    fi
 done
 
 echo "Spawned threads enabling/disabling mitigations ..."
