Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839E42A4AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 14:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTFYk0gSgz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 23:37:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VIxCvr3o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VIxCvr3o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTFTs3ySnz3c4s
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:34:25 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CABsa4031664; 
 Tue, 12 Oct 2021 08:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CH7tXTemRJ6G+z3J8YXB1Cn/2ims7bvwNfXzaWxCfVc=;
 b=VIxCvr3oCuj4W98v/5W9E/+nRNrkAwgcQb2BFttPTRTwxs5MaGhA6UWsHIBMeuyQVCDJ
 3o37dpi3PjZLhe2OZPJP8+a79dYHUOVPFxH4BOIHmkOJ59akQAjEl7qEeMUWHBR+9K31
 kiCfv99fHiFgwmYAQ6RZBKmw7TjDz3u+uAB1zKt3owsBwyw05FpbFqCj5SujJRqFc1I3
 0GxqluubyiOpNZmNQ3korrWuYMiWyFigBZZ+4DBCPmvLSIrNUbI+GDCzgbXE4u0IJsBk
 fq94liFgXd7NuO0balZTa3pvmiTKneins8Wkwr7R1bLj3v1UApW6t4BAC//1bQMESewX RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bn8d133ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 08:33:55 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19CCHU4T021930;
 Tue, 12 Oct 2021 08:33:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bn8d133kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 08:33:54 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19CCXNHf019550;
 Tue, 12 Oct 2021 12:33:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3bk2qa0d86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 12:33:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19CCS4MU58786276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 12:28:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F5FEA407E;
 Tue, 12 Oct 2021 12:33:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C934A405B;
 Tue, 12 Oct 2021 12:33:23 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.27.69])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Oct 2021 12:33:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
Subject: [RESEND PATCH v4 8/8] bpf ppc32: Access only if addr is kernel address
Date: Tue, 12 Oct 2021 18:00:56 +0530
Message-Id: <20211012123056.485795-9-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012123056.485795-1-hbathini@linux.ibm.com>
References: <20211012123056.485795-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OXijioM1Bj6jGOTkjRyHR8SNHUxaI92p
X-Proofpoint-GUID: VrfRdIgh71vNqGSSN3W-OQ9BNE7HUiz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_03,2021-10-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120073
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With KUAP enabled, any kernel code which wants to access userspace
needs to be surrounded by disable-enable KUAP. But that is not
happening for BPF_PROBE_MEM load instruction. Though PPC32 does not
support read protection, considering the fact that PTR_TO_BTF_ID
(which uses BPF_PROBE_MEM mode) could either be a valid kernel pointer
or NULL but should never be a pointer to userspace address, execute
BPF_PROBE_MEM load only if addr is kernel address, otherwise set
dst_reg=0 and move on.

This will catch NULL, valid or invalid userspace pointers. Only bad
kernel pointer will be handled by BPF exception table.

[Alexei suggested for x86]
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---

Changes in v4:
* Adjusted the emit code to avoid using temporary reg.


 arch/powerpc/net/bpf_jit_comp32.c | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 5dc45e393d1d..d3a52cd42f53 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -820,6 +820,40 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
 		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
+			/*
+			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
+			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
+			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
+			 * set dst_reg=0 and move on.
+			 */
+			if (BPF_MODE(code) == BPF_PROBE_MEM) {
+				PPC_LI32(_R0, TASK_SIZE - off);
+				EMIT(PPC_RAW_CMPLW(src_reg, _R0));
+				PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
+				EMIT(PPC_RAW_LI(dst_reg, 0));
+				/*
+				 * For BPF_DW case, "li reg_h,0" would be needed when
+				 * !fp->aux->verifier_zext. Emit NOP otherwise.
+				 *
+				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
+				 * if necessary. So, jump there insted of emitting an
+				 * additional "li reg_h,0" instruction.
+				 */
+				if (size == BPF_DW && !fp->aux->verifier_zext)
+					EMIT(PPC_RAW_LI(dst_reg_h, 0));
+				else
+					EMIT(PPC_RAW_NOP());
+				/*
+				 * Need to jump two instructions instead of one for BPF_DW case
+				 * as there are two load instructions for dst_reg_h & dst_reg
+				 * respectively.
+				 */
+				if (size == BPF_DW)
+					PPC_JMP((ctx->idx + 3) * 4);
+				else
+					PPC_JMP((ctx->idx + 2) * 4);
+			}
+
 			switch (size) {
 			case BPF_B:
 				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-- 
2.31.1

