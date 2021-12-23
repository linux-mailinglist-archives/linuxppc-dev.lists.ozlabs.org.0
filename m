Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649747E8F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 22:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKjhZ6X9wz3cXG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 08:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjG0c5tM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FjG0c5tM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKjfD0Jlxz2xsd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 08:15:47 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BNK76QC023603; 
 Thu, 23 Dec 2021 21:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RIuNUwnCoZjoH806KAEwChQheeHazboQZYY2Fsmi338=;
 b=FjG0c5tMw9rCxn4k88XPAlGanmHe6uQIPcJMNDABJ9MYNvlilT0B4Ldz3pl7Y3oj5z+k
 cf+GczsB1ymhAfIx+emroOJxdIMXb//kBb29w+Sh9X4f4ic5FlNF32xsQ+XL8J/yqq/s
 Md/toBwrkZ0hTcKF4UfLEbbBkM4OoX7/rPO0PdaEQQWxrFdlBuAvVht4zzEBz1xLhgLw
 ZpJY/4r9LYMR+Wywdl4KiVPEOsfIllm+mT7oLn23jjZwyWn5E+9tVmNnomjR+QKkecMa
 UP3qNhia29ax4HFA5zgr01w711Acwo+PfSO2sCjSuVciullQPNcOG/9EyztUNzZwm41H 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4xkyta45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:15:43 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BNL1vtW006649;
 Thu, 23 Dec 2021 21:15:43 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4xkyta3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:15:43 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BNL83mK006454;
 Thu, 23 Dec 2021 21:15:41 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3d179c05yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 21:15:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BNLFfmj25625002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 21:15:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50997AC062;
 Thu, 23 Dec 2021 21:15:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B984AC073;
 Thu, 23 Dec 2021 21:15:39 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.19.83])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 21:15:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 2/3] KVM: PPC: Fix vmx/vsx mixup in mmio emulation
Date: Thu, 23 Dec 2021 18:15:27 -0300
Message-Id: <20211223211528.3560711-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223211528.3560711-1-farosas@linux.ibm.com>
References: <20211223211528.3560711-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RXtPppMZTujdT9mZL6LSNv8R6MbHxjWk
X-Proofpoint-ORIG-GUID: RhH12SwwpN7EGpw4S0HiAPzIW5plxdFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-23_04,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=819 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112230106
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

The MMIO emulation code for vector instructions is duplicated between
VSX and VMX. When emulating VMX we should check the VMX copy size
instead of the VSX one.

Fixes: acc9eb9305fe ("KVM: PPC: Reimplement LOAD_VMX/STORE_VMX instruction ...")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 1e130bb087c4..793d42bd6c8f 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1507,7 +1507,7 @@ int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
 {
 	enum emulation_result emulated = EMULATE_DONE;
 
-	if (vcpu->arch.mmio_vsx_copy_nums > 2)
+	if (vcpu->arch.mmio_vmx_copy_nums > 2)
 		return EMULATE_FAIL;
 
 	while (vcpu->arch.mmio_vmx_copy_nums) {
-- 
2.33.1

