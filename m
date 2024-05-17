Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E348C8650
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 14:33:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak2dOZCo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak2dOZCo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgmbQ0DD8z3dFy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 22:33:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak2dOZCo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ak2dOZCo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=asavkov@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgfSS4P34z30V0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 17:57:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715932629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cd2FKBCCbPYSn62NGk1dvMv2wELGjjJmJdCabLrNLS4=;
	b=Ak2dOZCoZoea8P8LyKYVOMtwOmNpmSAKRxmVzixyR9JiUCAhlUJJtWYQpVzTlYJjTDx72f
	t8zPKwvRtm3lYRu/LCyB1hAdMvmUFb/OhalTmoW+j53KvCSkxEoCuSbMyG0I//dCQkXJVi
	EHPyM/m0TZyxTtSVsImC0Q1l4kigeBI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715932629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cd2FKBCCbPYSn62NGk1dvMv2wELGjjJmJdCabLrNLS4=;
	b=Ak2dOZCoZoea8P8LyKYVOMtwOmNpmSAKRxmVzixyR9JiUCAhlUJJtWYQpVzTlYJjTDx72f
	t8zPKwvRtm3lYRu/LCyB1hAdMvmUFb/OhalTmoW+j53KvCSkxEoCuSbMyG0I//dCQkXJVi
	EHPyM/m0TZyxTtSVsImC0Q1l4kigeBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-7oOlzHjNPLyc9PnqOvSHLQ-1; Fri, 17 May 2024 03:57:03 -0400
X-MC-Unique: 7oOlzHjNPLyc9PnqOvSHLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A87185A783;
	Fri, 17 May 2024 07:57:02 +0000 (UTC)
Received: from alecto.usersys.redhat.com (unknown [10.43.17.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB08740F;
	Fri, 17 May 2024 07:57:01 +0000 (UTC)
From: Artem Savkov <asavkov@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc64/bpf: jit support for sign extended load
Date: Fri, 17 May 2024 09:56:48 +0200
Message-ID: <20240517075650.248801-4-asavkov@redhat.com>
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

Add jit support for sign extended load. Tested using test_bpf module.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/net/bpf_jit_comp64.c     | 61 ++++++++++++++++++---------
 2 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 076ae60b4a55d..76cc9a2d82065 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -471,6 +471,7 @@
 #define PPC_RAW_VCMPEQUB_RC(vrt, vra, vrb) \
 	(0x10000006 | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC21)
 #define PPC_RAW_LD(r, base, i)		(0xe8000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_DS(i))
+#define PPC_RAW_LWA(r, base, i)		(0xe8000002 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_DS(i))
 #define PPC_RAW_LWZ(r, base, i)		(0x80000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
 #define PPC_RAW_LWZX(t, a, b)		(0x7c00002e | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_STD(r, base, i)		(0xf8000000 | ___PPC_RS(r) | ___PPC_RA(base) | IMM_DS(i))
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 97191cf091bbf..b9f47398b311d 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -925,13 +925,19 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 */
 		/* dst = *(u8 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_B:
+		case BPF_LDX | BPF_MEMSX | BPF_B:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_B:
+		case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 		/* dst = *(u16 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_H:
+		case BPF_LDX | BPF_MEMSX | BPF_H:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_H:
+		case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 		/* dst = *(u32 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_W:
+		case BPF_LDX | BPF_MEMSX | BPF_W:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
+		case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
 		/* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_DW:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
@@ -941,7 +947,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
 			 * set dst_reg=0 and move on.
 			 */
-			if (BPF_MODE(code) == BPF_PROBE_MEM) {
+			if (BPF_MODE(code) == BPF_PROBE_MEM || BPF_MODE(code) == BPF_PROBE_MEMSX) {
 				EMIT(PPC_RAW_ADDI(tmp1_reg, src_reg, off));
 				if (IS_ENABLED(CONFIG_PPC_BOOK3E_64))
 					PPC_LI64(tmp2_reg, 0x8000000000000000ul);
@@ -954,30 +960,47 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				 * Check if 'off' is word aligned for BPF_DW, because
 				 * we might generate two instructions.
 				 */
-				if (BPF_SIZE(code) == BPF_DW && (off & 3))
+				if ((BPF_SIZE(code) == BPF_DW ||
+				    (BPF_SIZE(code) == BPF_B && BPF_MODE(code) == BPF_PROBE_MEMSX)) &&
+						(off & 3))
 					PPC_JMP((ctx->idx + 3) * 4);
 				else
 					PPC_JMP((ctx->idx + 2) * 4);
 			}
 
-			switch (size) {
-			case BPF_B:
-				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-				break;
-			case BPF_H:
-				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
-				break;
-			case BPF_W:
-				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
-				break;
-			case BPF_DW:
-				if (off % 4) {
-					EMIT(PPC_RAW_LI(tmp1_reg, off));
-					EMIT(PPC_RAW_LDX(dst_reg, src_reg, tmp1_reg));
-				} else {
-					EMIT(PPC_RAW_LD(dst_reg, src_reg, off));
+			if (BPF_MODE(code) == BPF_MEMSX || BPF_MODE(code) == BPF_PROBE_MEMSX) {
+				switch (size) {
+				case BPF_B:
+					EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+					EMIT(PPC_RAW_EXTSB(dst_reg, dst_reg));
+					break;
+				case BPF_H:
+					EMIT(PPC_RAW_LHA(dst_reg, src_reg, off));
+					break;
+				case BPF_W:
+					EMIT(PPC_RAW_LWA(dst_reg, src_reg, off));
+					break;
+				}
+			} else {
+				switch (size) {
+				case BPF_B:
+					EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+					break;
+				case BPF_H:
+					EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
+					break;
+				case BPF_W:
+					EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
+					break;
+				case BPF_DW:
+					if (off % 4) {
+						EMIT(PPC_RAW_LI(tmp1_reg, off));
+						EMIT(PPC_RAW_LDX(dst_reg, src_reg, tmp1_reg));
+					} else {
+						EMIT(PPC_RAW_LD(dst_reg, src_reg, off));
+					}
+					break;
 				}
-				break;
 			}
 
 			if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
-- 
2.45.0

