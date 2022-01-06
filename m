Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44C486ADE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVHRC2Mpdz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 07:05:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lisUK7Rv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lisUK7Rv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVHNG2nvKz2yfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 07:03:26 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206J6thB006680; 
 Thu, 6 Jan 2022 20:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9uPzqDe3EQt72eNGEpAPr1atGl5IxlMGNIsGlB6JlIY=;
 b=lisUK7RvVRdZPzHwoI068onXBVkNYs7i9wCzO/y9l713DzCJ+6VEcrJu1clh/RkHoIO/
 bv+noZ4cBYASdAPhZZXKssc0xoHQuclqAPRVRWtMARA41qexpmEtJRCn8cuE+9tCEP4N
 GMrp984/i6VbWlOtm32DnMYZOSkMiTz5P+ZeUA6FjF9zDuGruYCDfcT9mrYMD6VzQxzo
 sC0qP6UW6XTNnliApWUOGHC9YCqW3o+00e1MbqsRJ1GxLkI1YxbAUIyVnPSIMl2gBX9P
 obdDPinA0D8kgh3uuozp7Mn8a8hp6NrZklg+RhXoe0tH4if6gWuszru4LA16GUQ13VYY Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wx2c9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:22 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206JbQpZ016319;
 Thu, 6 Jan 2022 20:03:21 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wx2c9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:21 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206Jv9jU022887;
 Thu, 6 Jan 2022 20:03:20 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3de4xf2uvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206K3JoR33095982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 20:03:19 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C376BE051;
 Thu,  6 Jan 2022 20:03:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BBF8BE05A;
 Thu,  6 Jan 2022 20:03:17 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.150.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 20:03:17 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 3/7] KVM: PPC: Fix mmio length message
Date: Thu,  6 Jan 2022 17:03:00 -0300
Message-Id: <20220106200304.4070825-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106200304.4070825-1-farosas@linux.ibm.com>
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rB__8DjInEmcBxyTVngLKavAhHCsi_Tk
X-Proofpoint-GUID: KOTkpxwbE92333-sDZjV8lLvQtUDZO0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_08,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060126
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We check against 'bytes' but print 'run->mmio.len' which at that point
has an old value.

e.g. 16-byte load:

before:
__kvmppc_handle_load: bad MMIO length: 8

now:
__kvmppc_handle_load: bad MMIO length: 16

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 92e552ab5a77..0b0818d032e1 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1246,7 +1246,7 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
 
 	if (bytes > sizeof(run->mmio.data)) {
 		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
-		       run->mmio.len);
+		       bytes);
 	}
 
 	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
@@ -1335,7 +1335,7 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
 
 	if (bytes > sizeof(run->mmio.data)) {
 		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
-		       run->mmio.len);
+		       bytes);
 	}
 
 	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
-- 
2.33.1

