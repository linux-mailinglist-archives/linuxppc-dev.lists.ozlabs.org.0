Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5647E909
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 22:22:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKjnt6L1Hz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 08:22:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VT4gGb3J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VT4gGb3J; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKjlh6BNPz3cYG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 08:20:32 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BNLBjFs030317; 
 Thu, 23 Dec 2021 21:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=t14t2vj/S6GC1hZeq8psc24jMksUbqcWz8p32ljojM0=;
 b=VT4gGb3J2iYR2G3pq6F95YJ0BBo6YgY3TaitAm4d+40JYN5qmjeUxuD1eGyeyJow98I4
 J0g7HStPo028ZA7Fb4wQnpinEUbyt87Fw//aiQSi0uPM8NDfpiG3qLrx5IF/IUGFPT1n
 yPo3kbY6Uyd8WieUH/OuyVE5CJktzJM6QZFI51UTTBSip2TfUpi5T9crIN0qiiievxzq
 41yNzNSy8JWMkQCXgXcyCbsybbmHQNmHB1ouz9ks2UObu4qn+q6oOajhIgMq25uussPK
 PfWKxClX84PkQTW39Nj495r9Eo1sHCSAli6yRstNy6SFC3IoZ/fRwTTEQQoebfxtoDJN ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d50te83yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:20:27 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BNLCOlL031386;
 Thu, 23 Dec 2021 21:20:27 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d50te83y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:20:27 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BNLKIsS016542;
 Thu, 23 Dec 2021 21:20:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3d179cqdtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:20:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BNLJcf728049728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 21:19:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA6DBE063;
 Thu, 23 Dec 2021 21:19:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECA84BE05D;
 Thu, 23 Dec 2021 21:19:36 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.19.83])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 21:19:36 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 2/3] KVM: PPC: Book3S HV: Delay setting of kvm ops
Date: Thu, 23 Dec 2021 18:19:30 -0300
Message-Id: <20211223211931.3560887-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223211931.3560887-1-farosas@linux.ibm.com>
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JFOmQZ0HQsOqR0YOVZBiWcB3citxsPz0
X-Proofpoint-GUID: _phdkWjETO7giu6CqoiNPz03Hx1fUGsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=853 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230106
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delay the setting of kvm_hv_ops until after all init code has
completed. This avoids leaving the ops still accessible if the init
fails.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9f4765951733..53400932f5d8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6087,9 +6087,6 @@ static int kvmppc_book3s_init_hv(void)
 	}
 #endif
 
-	kvm_ops_hv.owner = THIS_MODULE;
-	kvmppc_hv_ops = &kvm_ops_hv;
-
 	init_default_hcalls();
 
 	init_vcore_lists();
@@ -6105,10 +6102,15 @@ static int kvmppc_book3s_init_hv(void)
 	}
 
 	r = kvmppc_uvmem_init();
-	if (r < 0)
+	if (r < 0) {
 		pr_err("KVM-HV: kvmppc_uvmem_init failed %d\n", r);
+		return r;
+	}
 
-	return r;
+	kvm_ops_hv.owner = THIS_MODULE;
+	kvmppc_hv_ops = &kvm_ops_hv;
+
+	return 0;
 }
 
 static void kvmppc_book3s_exit_hv(void)
-- 
2.33.1

