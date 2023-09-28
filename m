Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 244667B2629
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 21:52:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nZfPejot;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxPKK0Csxz3ccD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 05:52:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nZfPejot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxPDj3M2Fz3cR0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 05:48:53 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38SJguhR012120;
	Thu, 28 Sep 2023 19:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rw2xvaos3ujdFQhktNdqT+qoefRatgCvXuIyXiJNv9w=;
 b=nZfPejoteqd0V5vSkKU8DEzWpki7H8d7aBQQxiM+vF9PMg7QwWiP5xK84LoEL9dp4gXj
 gguopueli9+MjmxRXGCzHhY/ZDglfDODsPDhq2IpmtF83SOHD/GLIZmSJC/OjS1dIad5
 6XV/OGRx/p8KqiFqwWF5o0Qq0irOU/ePVe3tbU1tB3XZIsH3HFakwTeM+xpyyCnda0+V
 8IuBy7h8S+nUpXDAyi+hEG4lh+g8W+Iyd+NBe9Wr7y+k4YLS/UoYh4HzN/QHDR4i3isy
 meQmdUPcuT2HxnfaXTTYfBsqDvH7Tp9CF6zh7D5E4aBCfKtxsXtmH0p4a5nvP603S4au pw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdfgyrkq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 19:48:33 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38SIRJxc030544;
	Thu, 28 Sep 2023 19:48:33 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad226x98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 19:48:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38SJmVVG44433990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Sep 2023 19:48:31 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 724C12004D;
	Thu, 28 Sep 2023 19:48:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86E1720043;
	Thu, 28 Sep 2023 19:48:29 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.85.6])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Sep 2023 19:48:29 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v5 4/5] powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data
Date: Fri, 29 Sep 2023 01:18:17 +0530
Message-ID: <20230928194818.261163-5-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928194818.261163-1-hbathini@linux.ibm.com>
References: <20230928194818.261163-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lK1Z04Cf-MbMJcDbk2IEIHhE2N0oDgBU
X-Proofpoint-ORIG-GUID: lK1Z04Cf-MbMJcDbk2IEIHhE2N0oDgBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_19,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=695 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280167
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc64_jit_data is a misnomer as it is meant for both ppc32 and
ppc64. Rename it to powerpc_jit_data.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index ecd7cffbbe28..e7ca270a39d5 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -43,7 +43,7 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg,
 	return 0;
 }
 
-struct powerpc64_jit_data {
+struct powerpc_jit_data {
 	struct bpf_binary_header *header;
 	u32 *addrs;
 	u8 *image;
@@ -63,7 +63,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	u8 *image = NULL;
 	u32 *code_base;
 	u32 *addrs;
-	struct powerpc64_jit_data *jit_data;
+	struct powerpc_jit_data *jit_data;
 	struct codegen_context cgctx;
 	int pass;
 	int flen;
-- 
2.41.0

