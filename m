Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0EA40FCA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9ylJ4Fwyz3ccF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 01:38:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BqhM08+w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BqhM08+w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9ydK43Tmz3bW7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 01:32:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HEsTM0002176; 
 Fri, 17 Sep 2021 11:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=24qTLuGSh9luiW0lMW2NwmUEIzp+jXlKI5eNLaOcUYQ=;
 b=BqhM08+whgNAanP7tE16pHdq/Ad6qJpOMAO2Xkt5D+T3a8Se5YJ/2TrGQvXpKfzM+MhW
 AFH/h72ZdwfqvgKLAC4qslErMt0k0X2C89nygiEa9KfmQEhZ7dlSE3uZIBh6dPYt8FDR
 P0SyGYsmM8tjFJMdBspPq66iD7wa/CcwEEtTCWXhV7Bc/uklDbIh0pRcH3K2h58FtTf7
 OmdX4O1RZrO0Cw/5d49L3vZ5K/RbQki6B2QsIXEIQJV187ys8WgcJES1OBEwE2Suxd9J
 ZVfZ3KwgpBGBMTvhIaDKMZMhIgG8j3FAMMV4vYKd5y8LmI4xcCwCsbimb+zyt2V97v13 Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4tmsdchw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 11:32:34 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18HEsXnX002386;
 Fri, 17 Sep 2021 11:32:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4tmsdcgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 11:32:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18HFH5xs013872;
 Fri, 17 Sep 2021 15:32:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3b0m3ag7qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 15:32:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18HFWONo29229366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 15:32:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0B7F11C04A;
 Fri, 17 Sep 2021 15:32:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14D1C11C05E;
 Fri, 17 Sep 2021 15:32:20 +0000 (GMT)
Received: from hbathini-workstation.ibm.com (unknown [9.43.59.213])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Sep 2021 15:32:19 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, mpe@ellerman.id.au, ast@kernel.org,
 daniel@iogearbox.net
Subject: [PATCH v2 8/8] bpf ppc32: Add addr > TASK_SIZE_MAX explicit check
Date: Fri, 17 Sep 2021 21:00:47 +0530
Message-Id: <20210917153047.177141-9-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917153047.177141-1-hbathini@linux.ibm.com>
References: <20210917153047.177141-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3kpTftO4WFO7XEHNEkf_1gnq_qNaTOYb
X-Proofpoint-ORIG-GUID: xWXdkE_cf2pXtRp1BVzkzYnYhDt8vseu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_06,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170096
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
BPF_PROBE_MEM load only if addr > TASK_SIZE_MAX, otherwise set
dst_reg=0 and move on.

This will catch NULL, valid or invalid userspace pointers. Only bad
kernel pointer will be handled by BPF exception table.

[Alexei suggested for x86]
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* New patch to handle bad userspace pointers on PPC32. 


 arch/powerpc/net/bpf_jit_comp32.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index c6262289dcc4..faa8047fcf4a 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -821,6 +821,45 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		/* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_DW:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
+			/*
+			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
+			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
+			 * load only if addr > TASK_SIZE_MAX, otherwise set dst_reg=0 and move on.
+			 */
+			if (BPF_MODE(code) == BPF_PROBE_MEM) {
+				bool extra_insn_needed = false;
+				unsigned int adjusted_idx;
+
+				/*
+				 * For BPF_DW case, "li reg_h,0" would be needed when
+				 * !fp->aux->verifier_zext. Adjust conditional branch'ing
+				 * address accordingly.
+				 */
+				if ((size == BPF_DW) && !fp->aux->verifier_zext)
+					extra_insn_needed = true;
+
+				/*
+				 * Need to jump two instructions instead of one for BPF_DW case
+				 * as there are two load instructions for dst_reg_h & dst_reg
+				 * respectively.
+				 */
+				adjusted_idx = (size == BPF_DW) ? 1 : 0;
+
+				EMIT(PPC_RAW_ADDI(b2p[TMP_REG], src_reg, off));
+				PPC_LI32(_R0, TASK_SIZE_MAX);
+				EMIT(PPC_RAW_CMPLW(b2p[TMP_REG], _R0));
+				PPC_BCC(COND_GT, (ctx->idx + 4 + (extra_insn_needed ? 1 : 0)) * 4);
+				EMIT(PPC_RAW_LI(dst_reg, 0));
+				/*
+				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
+				 * if necessary. So, jump there insted of emitting an
+				 * additional "li reg_h,0" instruction.
+				 */
+				if (extra_insn_needed)
+					EMIT(PPC_RAW_LI(dst_reg_h, 0));
+				PPC_JMP((ctx->idx + 2 + adjusted_idx) * 4);
+			}
+
 			switch (size) {
 			case BPF_B:
 				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-- 
2.31.1

