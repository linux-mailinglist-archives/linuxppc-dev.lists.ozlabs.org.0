Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766806B2C94
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 19:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXcWx21tbz3fSn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 05:04:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B06E3l5Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B06E3l5Z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXcRz0n1Yz3cLs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 05:01:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329GY65H029521;
	Thu, 9 Mar 2023 18:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l5EzRfVW37ujuGj5kIADgIvR2souW09W9s/PhNaNJtM=;
 b=B06E3l5Z+4c7k68s/S0YWbnQwvjUR3zDGMjfyJtpnH7Zn5buHD5RlM9+YxCGvc8Q2I3s
 kN2DmYwbprPYoC2BHIOxYOKEx+TVeKqwfgRx0mMuLRk/cMBqDa2auNnu8aF4x6HWrGj7
 lJjE5PuwueuwxDjBc8lyHtvhSlKhD5pTe6JBDfgtom+6XkPICnqMAajUTdW/Hw0uqHM7
 fO7E1IuxU22Al6mloR1rVJBCf2Ns0WL5Noie+/syrPmc3KQQ+80GKI/Dq79Ps5G+q0mg
 5b/lnS8/UPXt19iWW7RAKlYYftusnXra3n9oDKWBUXUy1WpypOjNcykBwiK1vvdRXXVi 1g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6t3c1tnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:00:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329GWwj3030374;
	Thu, 9 Mar 2023 18:00:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3p6g862pmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:00:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329I0cC652560298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 18:00:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89CF720049;
	Thu,  9 Mar 2023 18:00:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77D1820040;
	Thu,  9 Mar 2023 18:00:36 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.13.46])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 18:00:36 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v2 3/4] powerpc/bpf: implement bpf_arch_text_invalidate for bpf_prog_pack
Date: Thu,  9 Mar 2023 23:30:27 +0530
Message-Id: <20230309180028.180200-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309180028.180200-1-hbathini@linux.ibm.com>
References: <20230309180028.180200-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J5LLTBweYC2RG2Yl3TRGIVFARaGo-ipg
X-Proofpoint-ORIG-GUID: J5LLTBweYC2RG2Yl3TRGIVFARaGo-ipg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_09,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090141
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

Implement bpf_arch_text_invalidate and use it to fill unused part of
the bpf_prog_pack with trap instructions when a BPF program is freed.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 0a70319116d1..d1794d9f0154 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -293,3 +293,18 @@ void *bpf_arch_text_copy(void *dst, void *src, size_t len)
 
 	return ret;
 }
+
+int bpf_arch_text_invalidate(void *dst, size_t len)
+{
+	u32 inst = BREAKPOINT_INSTRUCTION;
+	int ret = -EINVAL;
+
+	if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
+		return ret;
+
+	mutex_lock(&text_mutex);
+	ret = patch_instructions(dst, &inst, true, len);
+	mutex_unlock(&text_mutex);
+
+	return ret;
+}
-- 
2.39.2

