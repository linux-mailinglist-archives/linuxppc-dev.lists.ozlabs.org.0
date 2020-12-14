Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1A12D93C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 09:03:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvYmb6l8zzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 19:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cQU/VUJv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvYkb2gBbzDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 19:01:42 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BE7YABp132592; Mon, 14 Dec 2020 03:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EdrLgE+meKPIMDcuGvA9iP3ULmG+8/SsIt5jiktRwLo=;
 b=cQU/VUJvXrKpd2rNW74oK2ssQM+LysiK9zyy9DcdcrpFRz0p5zYGYNRfKTdKZSItLryK
 2+RnHCmpt16ELsxQf7JEt5bv4JqeQodShLfiV/J6qeJkQA6YAg9jGNbEGSwtYu1S1OQ6
 6I0ckXzIi+Z1ebhfnaaAySVYWVf2DFM6DPvBk6eOEeAAtPFt7F1WmyLmfJo2h3loIpFp
 /S1RZaJJgDC0lBPKwOOk4ifSdv5KQiOKdaGbSc2NuUfhEubiHGN4+TaDzNT74EFeyFi9
 D0LoCu4lLb0FRRGnjNicUss96MGiGR1jJfrPUjSNr209rR5QhuWn9ely43mB8jOVKUcZ Qw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35e3k3rw45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 03:01:29 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BE7wY22025726;
 Mon, 14 Dec 2020 08:01:28 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 35cng8p8e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 08:01:28 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BE81Rua21627238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 08:01:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A36F9124052;
 Mon, 14 Dec 2020 08:01:27 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E979E124053;
 Mon, 14 Dec 2020 08:01:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.196.11])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 08:01:25 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/book3s/kup: Mark the kuap/keup function non __init
Date: Mon, 14 Dec 2020 13:31:21 +0530
Message-Id: <20201214080121.358567-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_03:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=896 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140055
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel call these functions on cpu online and hence they should
not be marked __init.

Fixes: 3b47b7549ead ("powerpc/book3s64/kuap: Move KUAP related function outside radix")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 2b7ded396db4..f1c6f264ed91 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -251,7 +251,7 @@ void __init pkey_early_init_devtree(void)
 }
 
 #ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
+void setup_kuep(bool disabled)
 {
 	if (disabled)
 		return;
@@ -277,7 +277,7 @@ void __init setup_kuep(bool disabled)
 #endif
 
 #ifdef CONFIG_PPC_KUAP
-void __init setup_kuap(bool disabled)
+void setup_kuap(bool disabled)
 {
 	if (disabled)
 		return;
-- 
2.28.0

