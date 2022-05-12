Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A87524763
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:50:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzP8N4PJFz3dqy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 17:50:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U7qpwa6F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U7qpwa6F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzP4Y2vhYz3bXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 17:47:09 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C4tf1p011245;
 Thu, 12 May 2022 07:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sJNqtW7ebykqIJ6MGEZr6hWe/bMGGF1zGAs008xihKQ=;
 b=U7qpwa6FFc9DwyTK5ybiNdjGISAEZUA9ayUluK9WVY6jih3efRrAToAKpI24Hf2wE4De
 2zSdIjIaHa2uRa/vFwsv120UOekDU8AtOUZ+nceOQxPwvJBUqL+ku7Affz4cdoDMjHn5
 +eTOS68WeLAGKR6Kup5yzbsRTTPTeuLCj+dIiy8x88/29QY9bLYgZHakITdVSuNbeJF4
 UKd2KSGGrbu3L2MSp0orpG5VL+uWDw0+a6SfDkEfyH1cVc5Vys/E/a/d4xbHOK10rQUy
 UyipFFpkbq7RpjZp9fxLpRWPSZEJy92wiNDSsOfWA4Z2NE9OuCOHMWNCdgHKwyxi/dEO zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0un2jxek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 07:46:48 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24C7Ia6b022328;
 Thu, 12 May 2022 07:46:48 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0un2jxd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 07:46:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24C7bckD028290;
 Thu, 12 May 2022 07:46:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3fwgd8n500-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 07:46:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24C7kKCb29360470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 07:46:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DAC7A4051;
 Thu, 12 May 2022 07:46:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BC89A4040;
 Thu, 12 May 2022 07:46:33 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.211.109.30])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 May 2022 07:46:33 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 5/5] bpf ppc32: Add instructions for atomic_[cmp]xchg
Date: Thu, 12 May 2022 13:15:46 +0530
Message-Id: <20220512074546.231616-6-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512074546.231616-1-hbathini@linux.ibm.com>
References: <20220512074546.231616-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r8QtyRJIHN0NPICWmDmD1c4VvQ9qLDwN
X-Proofpoint-ORIG-GUID: DS3bfz7Bz7Ook08vLsStW7dHE20VY3uT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205120034
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Jordan Niethe <jniethe5@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds two atomic opcodes BPF_XCHG and BPF_CMPXCHG on ppc32, both
of which include the BPF_FETCH flag.  The kernel's atomic_cmpxchg
operation fundamentally has 3 operands, but we only have two register
fields. Therefore the operand we compare against (the kernel's API
calls it 'old') is hard-coded to be BPF_REG_R0. Also, kernel's
atomic_cmpxchg returns the previous value at dst_reg + off. JIT the
same for BPF too with return value put in BPF_REG_0.

  BPF_REG_R0 = atomic_cmpxchg(dst_reg + off, BPF_REG_R0, src_reg);

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 5604ae1b60ab..4690fd6e9e52 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -829,6 +829,23 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				/* we're done if this succeeded */
 				PPC_BCC_SHORT(COND_NE, tmp_idx);
 				break;
+			case BPF_CMPXCHG:
+				/* Compare with old value in BPF_REG_0 */
+				EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), _R0));
+				/* Don't set if different from old value */
+				PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
+				fallthrough;
+			case BPF_XCHG:
+				/* store new value */
+				EMIT(PPC_RAW_STWCX(src_reg, tmp_reg, dst_reg));
+				PPC_BCC_SHORT(COND_NE, tmp_idx);
+				/*
+				 * Return old value in src_reg for BPF_XCHG &
+				 * BPF_REG_0 for BPF_CMPXCHG.
+				 */
+				EMIT(PPC_RAW_MR(imm == BPF_XCHG ? src_reg : bpf_to_ppc(BPF_REG_0),
+						_R0));
+				break;
 			default:
 				pr_err_ratelimited("eBPF filter atomic op code %02x (@%d) unsupported\n",
 						   code, i);
-- 
2.35.1

