Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73652486AE5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVHVS28w3z3dfL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 07:08:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bj1j9ygu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bj1j9ygu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVHNR0x85z30KD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 07:03:34 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206HX0Pc008638; 
 Thu, 6 Jan 2022 20:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XvTh9O26P1B05X1WoTnzuajK/EtEoqBlj2NALd0ZnsY=;
 b=bj1j9yguQlEPfAUYUUvrtbK6X/UDd4dh4kzIhGsAbRzcBHofNcuIcqCbOiIopcoRjNHb
 jte02IE9sZoLUq87zm8qd2gcDRTWt74JyMXAWKJ+IVS1RRLsa8p9xfGbr8DeKzTHp2Qq
 nDw8zyz0t8emUlIeyvFzU2pUdh7cszlWdefQKtDge1iGE5dzIJL59wsZXBON2MopwkI3
 p8FFRAvz8o0xsVrq4q8f0zt2iBMJFDa/Bie7EalomLHQixuioGWBdrz6GHvFuPo6iyiY
 eEq5j5O6oppG+iFj1tKJj+I2iHsFHmdn7Se+MLMkoXDD1GHkc95VSST3RVVtSzfhELAA tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4x2tdpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:29 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206K0KGu032159;
 Thu, 6 Jan 2022 20:03:29 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4x2tdp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:29 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206JvMqS010126;
 Thu, 6 Jan 2022 20:03:28 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3de5rphdyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 20:03:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206K3Rs335848670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 20:03:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7FBDBE059;
 Thu,  6 Jan 2022 20:03:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2569EBE069;
 Thu,  6 Jan 2022 20:03:26 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.150.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 20:03:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 7/7] KVM: PPC: mmio: Reject instructions that access more
 than mmio.data size
Date: Thu,  6 Jan 2022 17:03:04 -0300
Message-Id: <20220106200304.4070825-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106200304.4070825-1-farosas@linux.ibm.com>
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EVWGTYVAVvQUELvM4phItkbZNIoYaeNA
X-Proofpoint-GUID: S7b5-x6tABmun3yGKzu7aNGKEGft9Tii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_08,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=807 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The MMIO interface between the kernel and userspace uses a structure
that supports a maximum of 8-bytes of data. Instructions that access
more than that need to be emulated in parts.

We currently don't have generic support for splitting the emulation in
parts and each set of instructions needs to be explicitly included.

There's already an error message being printed when a load or store
exceeds the mmio.data buffer but we don't fail the emulation until
later at kvmppc_complete_mmio_load and even then we allow userspace to
make a partial copy of the data, which ends up overwriting some fields
of the mmio structure.

This patch makes the emulation fail earlier at kvmppc_handle_load|store,
which will send a Program interrupt to the guest. This is better than
allowing the guest to proceed with partial data.

Note that this was caught in a somewhat artificial scenario using
quadword instructions (lq/stq), there's no account of an actual guest
in the wild running instructions that are not properly emulated.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 50e08635e18a..a1643ca988e0 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1247,6 +1247,7 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
 	if (bytes > sizeof(run->mmio.data)) {
 		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
 		       bytes);
+		return EMULATE_FAIL;
 	}
 
 	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
@@ -1336,6 +1337,7 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
 	if (bytes > sizeof(run->mmio.data)) {
 		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
 		       bytes);
+		return EMULATE_FAIL;
 	}
 
 	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
-- 
2.33.1

