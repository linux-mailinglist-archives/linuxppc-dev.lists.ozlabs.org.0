Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3D42A493
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 14:35:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTFWC4qqzz2yp2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 23:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jLfSLoz1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jLfSLoz1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTFT42JcBz305p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:33:43 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CB4eA0025528; 
 Tue, 12 Oct 2021 08:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D22vMXXa93WwDLSOBYTK5cnP0Rlp8GoszfTJSexAMyA=;
 b=jLfSLoz1sSDK/WwmBcSg5xUmQj/hLBu48tPT3mWa4Irar2bpfJeEkg7t/T8EuitjfAyu
 6KE3Jai+7vlsvIkuU9zc6t4GRyQxhK+5Npebt2DPh/uU5tbKviGoKrVZT+AuQIla3Xtf
 Aa5aB+YxkX9GBrDEYKhCFIQzupHyaBPUHpkanjqIVJwJkNAdOBTMCZXlJq48qUcU1tLZ
 TyWwl5zo8+mVXruRn1DGjI1mtiw4mdWS1/U+pQeIbqEFLRryvW/8hWVWYN40+QvbQTGN
 oc4jkwEFYeZ+MyF15z2DMDhHi6+G0K2UFlODuWUlO0FSsrQjVNLWZ66BvCs9izy800kN Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bn0x2uyn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 08:33:24 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19CBInUA019973;
 Tue, 12 Oct 2021 08:33:23 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bn0x2uym3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 08:33:23 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19CCDP7e015935;
 Tue, 12 Oct 2021 12:33:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3bk2qa0d3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 12:33:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19CCRU2l46661970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 12:27:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76475A4078;
 Tue, 12 Oct 2021 12:33:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C19EA405D;
 Tue, 12 Oct 2021 12:32:49 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.27.69])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Oct 2021 12:32:48 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
Subject: [RESEND PATCH v4 6/8] bpf ppc64: Access only if addr is kernel address
Date: Tue, 12 Oct 2021 18:00:54 +0530
Message-Id: <20211012123056.485795-7-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012123056.485795-1-hbathini@linux.ibm.com>
References: <20211012123056.485795-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZXjD5QUOfNPx_FCY36SMGKiON-0xuzkV
X-Proofpoint-GUID: -T165y0QX1ax1L4pUBRYe6qHgjvSRpwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_03,2021-10-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, songliubraving@fb.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, andrii@kernel.org,
 kpsingh@kernel.org, paulus@samba.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

On PPC64 with KUAP enabled, any kernel code which wants to
access userspace needs to be surrounded by disable-enable KUAP.
But that is not happening for BPF_PROBE_MEM load instruction.
So, when BPF program tries to access invalid userspace address,
page-fault handler considers it as bad KUAP fault:

  Kernel attempted to read user page (d0000000) - exploit attempt? (uid: 0)

Considering the fact that PTR_TO_BTF_ID (which uses BPF_PROBE_MEM
mode) could either be a valid kernel pointer or NULL but should
never be a pointer to userspace address, execute BPF_PROBE_MEM load
only if addr is kernel address, otherwise set dst_reg=0 and move on.

This will catch NULL, valid or invalid userspace pointers. Only bad
kernel pointer will be handled by BPF exception table.

[Alexei suggested for x86]
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---

Changes in v4:
* Used IS_ENABLED() instead of #ifdef.
* Dropped the else case that is not applicable for PPC64.


 arch/powerpc/net/bpf_jit_comp64.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index ede8cb3e453f..472d4a551945 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -789,6 +789,32 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		/* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_DW:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
+			/*
+			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
+			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
+			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
+			 * set dst_reg=0 and move on.
+			 */
+			if (BPF_MODE(code) == BPF_PROBE_MEM) {
+				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
+				if (IS_ENABLED(CONFIG_PPC_BOOK3E_64))
+					PPC_LI64(b2p[TMP_REG_2], 0x8000000000000000ul);
+				else /* BOOK3S_64 */
+					PPC_LI64(b2p[TMP_REG_2], PAGE_OFFSET);
+				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
+				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
+				EMIT(PPC_RAW_LI(dst_reg, 0));
+				/*
+				 * Check if 'off' is word aligned because PPC_BPF_LL()
+				 * (BPF_DW case) generates two instructions if 'off' is not
+				 * word-aligned and one instruction otherwise.
+				 */
+				if (BPF_SIZE(code) == BPF_DW && (off & 3))
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

