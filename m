Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451D47E904
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 22:21:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKjmB03KRz3ccb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 08:20:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdNfjxGh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PdNfjxGh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKjkr3C5Sz3c53
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 08:19:48 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BNL5qvt028886; 
 Thu, 23 Dec 2021 21:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=himf4nqViNdME7f5Fn0dx0Uj2a2JkriHSzZZyh/AASU=;
 b=PdNfjxGh0bcPiRNu+TNbegvN61ay+ge9dapN2D2aIWN1Qaqxhmn0vQM5f2lr/LAMZoa+
 6IC1UdSI6ITEjjKUDdK37pA0rRxouulGSGz0xANkXdq95eezWjCxXLBdvZXXi6Pzfz7V
 EaSFOsoDYkOci4V1VLA5ffGYrlXxZS6boKVMX2bAxdEVHc245JNrFe6MCySz9k69Gt5M
 q4218+Uq4yp6qztcPyhLWpeXFhxPeQivc/vYOxa/OJOARjAXHYpAimrN+t0ZlkzvoSlf
 t4kTcdHMcUxDSWLA6+1gSkINlPR3N2xp/l2Tnm952wAKp54wfNVAIG0+RjExnrPGBiQn 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4u3p6gqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:19:44 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BNLJhRT032011;
 Thu, 23 Dec 2021 21:19:43 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4u3p6gq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:19:43 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BNLHOja004596;
 Thu, 23 Dec 2021 21:19:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3d179cybyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:19:42 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BNLJeM111272932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 21:19:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0992BE05D;
 Thu, 23 Dec 2021 21:19:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DAE0BE058;
 Thu, 23 Dec 2021 21:19:39 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.19.83])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 21:19:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 3/3] KVM: PPC: Book3S HV: Free allocated memory if module init
 fails
Date: Thu, 23 Dec 2021 18:19:31 -0300
Message-Id: <20211223211931.3560887-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223211931.3560887-1-farosas@linux.ibm.com>
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ohbHWmd_bUce-D2sURNTqkrIYljxiyX
X-Proofpoint-GUID: buAxf0rA5X5yAh6f2Wtx-BB-7BA3usD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=855 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The module's exit function is not called when the init fails, we need
to do cleanup before returning.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 53400932f5d8..2d79298e7ca4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6065,7 +6065,7 @@ static int kvmppc_book3s_init_hv(void)
 
 	r = kvm_init_subcore_bitmap();
 	if (r)
-		return r;
+		goto err;
 
 	/*
 	 * We need a way of accessing the XICS interrupt controller,
@@ -6080,7 +6080,8 @@ static int kvmppc_book3s_init_hv(void)
 		np = of_find_compatible_node(NULL, NULL, "ibm,opal-intc");
 		if (!np) {
 			pr_err("KVM-HV: Cannot determine method for accessing XICS\n");
-			return -ENODEV;
+			r = -ENODEV;
+			goto err;
 		}
 		/* presence of intc confirmed - node can be dropped again */
 		of_node_put(np);
@@ -6093,12 +6094,12 @@ static int kvmppc_book3s_init_hv(void)
 
 	r = kvmppc_mmu_hv_init();
 	if (r)
-		return r;
+		goto err;
 
 	if (kvmppc_radix_possible()) {
 		r = kvmppc_radix_init();
 		if (r)
-			return r;
+			goto err;
 	}
 
 	r = kvmppc_uvmem_init();
@@ -6111,6 +6112,12 @@ static int kvmppc_book3s_init_hv(void)
 	kvmppc_hv_ops = &kvm_ops_hv;
 
 	return 0;
+
+err:
+	kvmhv_nested_exit();
+	kvmppc_radix_exit();
+
+	return r;
 }
 
 static void kvmppc_book3s_exit_hv(void)
-- 
2.33.1

