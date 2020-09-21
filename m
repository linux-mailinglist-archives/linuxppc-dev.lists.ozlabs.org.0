Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5961271E84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 11:05:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvz6Z2yj8zDqhC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 19:05:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sathnaga@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WHBBKE1G; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvz4P31gfzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 19:03:16 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08L9305J146229; Mon, 21 Sep 2020 05:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=leuZBYJN+/lc+Fxidrffl08f1oCjwqKg5qzlph2Ogn4=;
 b=WHBBKE1GUfZB1ECOVoQDcwNj9LmC1qqp47gJP8wq2B6HZr1wR96jYTTYMM2buaVgn3YE
 /7HD2WsZzVJZWOQdu5thPBBbJV3d3uLN44L2E3+mSv9qNAeygZzH6PfJqWXFXzTqQM5b
 7qn2QsISdgnsQh1BUzOGE0PQZKcp58SU2a6N5ubIbK9+BFaTVXiXqdIBSNI5Gzim8Pa9
 dudhf4LUJatvlJesIDd6d1xxanVwUiaD3N2hvVIKbUrEnQTCARZ4N6ateAUKq8AA07JJ
 uezPdaCGhwE/R0R4EYzHWNwlzK3vWm+HWYUtg6JGSg6G3rONZGt1qDC3vWngc8X6p8gf DA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ps1f08gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 05:03:04 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08L92ZQ9016538;
 Mon, 21 Sep 2020 09:02:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33n9m89u7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 09:02:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08L92VSj27132210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 09:02:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A1E4A4062;
 Mon, 21 Sep 2020 09:02:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E7BEA4054;
 Mon, 21 Sep 2020 09:02:29 +0000 (GMT)
Received: from satheesh.ibmuc.com (unknown [9.102.17.247])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Sep 2020 09:02:29 +0000 (GMT)
From: sathnaga@linux.vnet.ibm.com
To: linux-doc@vger.kernel.org
Subject: [PATCH V2] Doc: admin-guide: Add entry for kvm_cma_resv_ratio kernel
 param
Date: Mon, 21 Sep 2020 14:32:20 +0530
Message-Id: <20200921090220.14981-1-sathnaga@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_01:2020-09-21,
 2020-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=979 mlxscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210067
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
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Add document entry for kvm_cma_resv_ratio kernel param which
is used to alter the KVM contiguous memory allocation percentage
for hash pagetable allocation used by hash mode PowerPC KVM guests.

Cc: linux-kernel@vger.kernel.org
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
---

V2: 
Addressed review comments from Randy.

V1: https://lkml.org/lkml/2020/9/16/72
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1068742a6df..932ed45740c9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2258,6 +2258,14 @@
 			[KVM,ARM] Allow use of GICv4 for direct injection of
 			LPIs.
 
+	kvm_cma_resv_ratio=n [PPC]
+			Reserves given percentage from system memory area for
+			contiguous memory allocation for KVM hash pagetable
+			allocation.
+			By default it reserves 5% of total system memory.
+			Format: <integer>
+			Default: 5
+
 	kvm-intel.ept=	[KVM,Intel] Disable extended page tables
 			(virtualized MMU) support on capable Intel chips.
 			Default is 1 (enabled)
-- 
2.26.2

