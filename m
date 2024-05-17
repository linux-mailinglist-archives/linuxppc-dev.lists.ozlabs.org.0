Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C369D8C8651
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 14:34:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xc/3HdpK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZTT3xFjJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgmcB1m8Mz3cXW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 22:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xc/3HdpK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZTT3xFjJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=asavkov@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgfST4tLTz30V0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 17:57:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715932630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojtsOOMpEVSQ1qTErBfqA1ZFUuWuw8zuknPaEwojp0k=;
	b=Xc/3HdpKaxxCxdyd26MoZLl3SZFzzsempxvsk6HsAkkeNArtdj66hh8HR6DIXfkRdPJvQT
	VW+9cRa6ktInMXVUFHSs5RLbDqSUeXYXmjsfDlSJzHdBLmp2noLVSMbI6BjqhKk+J0aEZx
	quc94v7m5xegWfxZcfUPyA35iBO2t58=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715932631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojtsOOMpEVSQ1qTErBfqA1ZFUuWuw8zuknPaEwojp0k=;
	b=ZTT3xFjJNojnHslG9pBJVicicyD+63hcpzzbZufcxNRxmjyrkCXmbyeOzOgu4UVG6Z93zu
	R/vsAxINjG42cushyNUUmONDzVdmj07mQFqMLgSzKzmZ8EZEQqSsx4Y48tETp8THpAxUit
	QeSqaPCZl+yQ2NJD7WfnOSO3TCPPmvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-E7lV0bIaOeCWPztpMpSOSg-1; Fri, 17 May 2024 03:57:06 -0400
X-MC-Unique: E7lV0bIaOeCWPztpMpSOSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4540B8001F7;
	Fri, 17 May 2024 07:57:06 +0000 (UTC)
Received: from alecto.usersys.redhat.com (unknown [10.43.17.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB50C740F;
	Fri, 17 May 2024 07:57:04 +0000 (UTC)
From: Artem Savkov <asavkov@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc64/bpf: jit support for signed division and modulo
Date: Fri, 17 May 2024 09:56:50 +0200
Message-ID: <20240517075650.248801-6-asavkov@redhat.com>
In-Reply-To: <20240517075650.248801-1-asavkov@redhat.com>
References: <20240517075650.248801-1-asavkov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mailman-Approved-At: Fri, 17 May 2024 22:30:12 +1000
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, Artem Savkov <asavkov@redhat.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add jit support for sign division and modulo. Tested using test_bpf
module.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/net/bpf_jit_comp64.c     | 41 +++++++++++++++++++++------
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 76cc9a2d82065..b98a9e982c03b 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -536,6 +536,7 @@
 #define PPC_RAW_MULI(d, a, i)		(0x1c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_DIVW(d, a, b)		(0x7c0003d6 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVWU(d, a, b)		(0x7c000396 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_DIVD(d, a, b)		(0x7c0003d2 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVDU(d, a, b)		(0x7c000392 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVDE(t, a, b)		(0x7c000352 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVDE_DOT(t, a, b)	(0x7c000352 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 811775cfd3a1b..1f5f93926e424 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -510,20 +510,33 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
 		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
 			if (BPF_OP(code) == BPF_MOD) {
-				EMIT(PPC_RAW_DIVWU(tmp1_reg, dst_reg, src_reg));
+				if (off)
+					EMIT(PPC_RAW_DIVW(tmp1_reg, dst_reg, src_reg));
+				else
+					EMIT(PPC_RAW_DIVWU(tmp1_reg, dst_reg, src_reg));
+
 				EMIT(PPC_RAW_MULW(tmp1_reg, src_reg, tmp1_reg));
 				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			} else
-				EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
+				if (off)
+					EMIT(PPC_RAW_DIVW(dst_reg, dst_reg, src_reg));
+				else
+					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
 			if (BPF_OP(code) == BPF_MOD) {
-				EMIT(PPC_RAW_DIVDU(tmp1_reg, dst_reg, src_reg));
+				if (off)
+					EMIT(PPC_RAW_DIVD(tmp1_reg, dst_reg, src_reg));
+				else
+					EMIT(PPC_RAW_DIVDU(tmp1_reg, dst_reg, src_reg));
 				EMIT(PPC_RAW_MULD(tmp1_reg, src_reg, tmp1_reg));
 				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			} else
-				EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, src_reg));
+				if (off)
+					EMIT(PPC_RAW_DIVD(dst_reg, dst_reg, src_reg));
+				else
+					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
 		case BPF_ALU | BPF_DIV | BPF_K: /* (u32) dst /= (u32) imm */
@@ -544,19 +557,31 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			switch (BPF_CLASS(code)) {
 			case BPF_ALU:
 				if (BPF_OP(code) == BPF_MOD) {
-					EMIT(PPC_RAW_DIVWU(tmp2_reg, dst_reg, tmp1_reg));
+					if (off)
+						EMIT(PPC_RAW_DIVW(tmp2_reg, dst_reg, tmp1_reg));
+					else
+						EMIT(PPC_RAW_DIVWU(tmp2_reg, dst_reg, tmp1_reg));
 					EMIT(PPC_RAW_MULW(tmp1_reg, tmp1_reg, tmp2_reg));
 					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 				} else
-					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, tmp1_reg));
+					if (off)
+						EMIT(PPC_RAW_DIVW(dst_reg, dst_reg, tmp1_reg));
+					else
+						EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, tmp1_reg));
 				break;
 			case BPF_ALU64:
 				if (BPF_OP(code) == BPF_MOD) {
-					EMIT(PPC_RAW_DIVDU(tmp2_reg, dst_reg, tmp1_reg));
+					if (off)
+						EMIT(PPC_RAW_DIVD(tmp2_reg, dst_reg, tmp1_reg));
+					else
+						EMIT(PPC_RAW_DIVDU(tmp2_reg, dst_reg, tmp1_reg));
 					EMIT(PPC_RAW_MULD(tmp1_reg, tmp1_reg, tmp2_reg));
 					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 				} else
-					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, tmp1_reg));
+					if (off)
+						EMIT(PPC_RAW_DIVD(dst_reg, dst_reg, tmp1_reg));
+					else
+						EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, tmp1_reg));
 				break;
 			}
 			goto bpf_alu32_trunc;
-- 
2.45.0

