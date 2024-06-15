Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1D9098DE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 17:20:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgvuDx3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W1fwc0fZCz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2024 01:20:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgvuDx3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W1fvt1f2lz30W2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2024 01:19:52 +1000 (AEST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45FEhgkD024563;
	Sat, 15 Jun 2024 15:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+Q0rGL8N8LaCSBSgdAqB6/
	nnToMU3UOTJeUQub067eE=; b=jgvuDx3jzAv5sm8K7CuY1RWbRnuFuWVv2uYSDA
	+Q4whNArFf6KmKkJNjZwXLmtTrmzJpeQEt+HFcTJ7+8/NQL+05TwEJlSOz2ZBU2M
	xeKQepW24FzcKR75mUBMuB8prlXLOBgC6GI3YdegoliKdtj1meW8UhAoiSvjb8Xu
	WLiSw9u4gvsBnFo/BFRiTct64DeZFnsvz6k4NC2Yz1I6QguB7rKoYzTKQGLL2KeQ
	Ugyg+gqRq5+KUka2QCG6CJCTYMBr5fJCWLieNlngnQKVDaiwuqvTlNMgigTRAv+B
	5t8Tr+4ZELXQxeWzS1iexyF5X0R1T7KItq5M0zNODYdnPZFg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3b70q1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 15:19:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45FFJBiV017204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 15:19:11 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Jun
 2024 08:19:04 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 15 Jun 2024 08:18:59 -0700
Subject: [PATCH] KVM: PPC: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240615-md-powerpc-arch-powerpc-kvm-v1-1-7478648b3100@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOKwbWYC/z3MwQ6CMAwA0F8hPdtkLIrorxgP3Siu0Y2lUyQh/
 LvTg8d3eSsUVuEC52YF5VmKTKmi3TXgA6UbowzVYI3dm649YBwwT2/W7JHUhz/uc8ST7Y6j752
 h3kEdsvIoy2+/XKsdFUanlHz4ng9JrwUjlScrbNsH0A6iY4wAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
	<npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c65O775oj7ut3YNE45UZp56zioJYRR9i
X-Proofpoint-ORIG-GUID: c65O775oj7ut3YNE45UZp56zioJYRR9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_11,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406150117
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
Cc: Jeff
 Johnson <quic_jjohnson@quicinc.com>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kvm/test-guest-state-buffer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kvm/kvm-pr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/kvm/kvm-hv.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 arch/powerpc/kvm/book3s_hv.c               | 1 +
 arch/powerpc/kvm/book3s_pr.c               | 1 +
 arch/powerpc/kvm/test-guest-state-buffer.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index daaf7faf21a5..e16c096a2422 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6519,6 +6519,7 @@ static void kvmppc_book3s_exit_hv(void)
 
 module_init(kvmppc_book3s_init_hv);
 module_exit(kvmppc_book3s_exit_hv);
+MODULE_DESCRIPTION("KVM on Book 3S (POWER7 and later) in hypervisor mode");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(KVM_MINOR);
 MODULE_ALIAS("devname:kvm");
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index a7d7137ea0c8..7c19744c43cb 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -2111,6 +2111,7 @@ void kvmppc_book3s_exit_pr(void)
 module_init(kvmppc_book3s_init_pr);
 module_exit(kvmppc_book3s_exit_pr);
 
+MODULE_DESCRIPTION("KVM on Book 3S without using hypervisor mode");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(KVM_MINOR);
 MODULE_ALIAS("devname:kvm");
diff --git a/arch/powerpc/kvm/test-guest-state-buffer.c b/arch/powerpc/kvm/test-guest-state-buffer.c
index 4720b8dc8837..10238556c113 100644
--- a/arch/powerpc/kvm/test-guest-state-buffer.c
+++ b/arch/powerpc/kvm/test-guest-state-buffer.c
@@ -325,4 +325,5 @@ static struct kunit_suite guest_state_buffer_test_suite = {
 
 kunit_test_suites(&guest_state_buffer_test_suite);
 
+MODULE_DESCRIPTION("KUnit tests for Guest State Buffer APIs");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240615-md-powerpc-arch-powerpc-kvm-9267fc8b0a8b

