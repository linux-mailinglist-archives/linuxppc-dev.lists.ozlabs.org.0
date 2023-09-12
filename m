Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9E79DC3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:51:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QAHPkWEr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlf2M129zz3f0k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:51:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QAHPkWEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxh2BXWz3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:04 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so5736927f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558820; x=1695163620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhUNqTKNJ5t40WxcJkQJJc6NwQozn+LNI3JL0/ULous=;
        b=QAHPkWErANqxLgLRPEtL7Ii/Gux/R4+uJpcP5HRl9zJvMswg/HzasEZ6M7/uvh6xMI
         5bEbFce0ExcK25drH0c0XOz806hjXvf/3eNrogSf0snkVnjOFXTzAzRsHGWLUTxPj5zh
         jyE/Q/7+zUdqgvjR+KQaa6c1wubbr5BXjZbN+yN40qi8LU33AJ8btrWTfRfyl2YxY+cn
         5PNy5pMPyLFfLHRRyTTTGD1JBYBDET895xcVVTBYbHnLNd8p0+lnQqm6bwTSF06jKhBH
         XfaLoyU6gHPjNnbigpeq62sU/s0SRiirVqwWHWTAtpbblzgZQcsJ154jghuqPIInPpx+
         Ereg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558820; x=1695163620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhUNqTKNJ5t40WxcJkQJJc6NwQozn+LNI3JL0/ULous=;
        b=pbbarPM/3bSB4tBlnIHst11oaEUbL5wTLrVpYUR/rXQbLkMOZQZqi9tN23RrxBLtht
         YhqPu/8NJQwlXxAgKXVUfCeTNQ5xaL/coGGRPL8ZzFeyXEAyHWyflyuthSEenhE63Qnw
         t/pQ3Y14V6bKxUc2ESBs18NmI2iW+PCUVljac6GdKhtZxCOoo+Tuq9ObiNHsqEurhDl/
         wNfYchHXdVsgd06POt3doid+pYx3iQVGMdMpuVz9QxKSl77qxz1YbZloRnwhBCILzxTZ
         WSNZaspp4EorM+MxpRi+GS83DSFy9re1G0pnFxG3/q9TKSXVOKvthoTFvwFD05nAWFvG
         F3qg==
X-Gm-Message-State: AOJu0Yy0EWyp0FReTO/2E+4wyb+7COQ8VJ7NTZoZexbWTYC00cCdT9I5
	ZiHG19i4+fFQPj2QkVt/ZNk=
X-Google-Smtp-Source: AGHT+IFgAH0fOtyaF0ehV56I8y/PX0drowIs04cM59dILrqCnUI/euGHNvJaohPj3FXuSexhWOZw7g==
X-Received: by 2002:a5d:628c:0:b0:319:7a9f:c63 with SMTP id k12-20020a5d628c000000b003197a9f0c63mr718103wru.50.1694558820430;
        Tue, 12 Sep 2023 15:47:00 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:47:00 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Wang YanQing <udknight@gmail.com>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 4/6] bpf, powerpc32: Always zero extend for LDX
Date: Tue, 12 Sep 2023 22:46:52 +0000
Message-Id: <20230912224654.6556-5-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: puranjay12@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The JITs should not depend on the verifier for zero extending the upper
32 bits of the destination register when loading a byte, half-word, or
word.

A following patch will make the verifier stop patching zext instructions
after LDX.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 7f91ea064c08..0a952a2cfaac 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -936,14 +936,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				PPC_BCC_SHORT(COND_GT, (ctx->idx + 4) * 4);
 				EMIT(PPC_RAW_LI(dst_reg, 0));
 				/*
-				 * For BPF_DW case, "li reg_h,0" would be needed when
-				 * !fp->aux->verifier_zext. Emit NOP otherwise.
+				 * For BPF_DW case, "li reg_h,0" would be needed emit NOP otherwise.
 				 *
 				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
 				 * if necessary. So, jump there insted of emitting an
 				 * additional "li reg_h,0" instruction.
 				 */
-				if (size == BPF_DW && !fp->aux->verifier_zext)
+				if (size == BPF_DW)
 					EMIT(PPC_RAW_LI(dst_reg_h, 0));
 				else
 					EMIT(PPC_RAW_NOP());
@@ -974,7 +973,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			}
 
-			if (size != BPF_DW && !fp->aux->verifier_zext)
+			if (size != BPF_DW)
 				EMIT(PPC_RAW_LI(dst_reg_h, 0));
 
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
@@ -982,20 +981,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				int jmp_off = 4;
 
 				/*
-				 * In case of BPF_DW, two lwz instructions are emitted, one
-				 * for higher 32-bit and another for lower 32-bit. So, set
-				 * ex->insn to the first of the two and jump over both
-				 * instructions in fixup.
-				 *
-				 * Similarly, with !verifier_zext, two instructions are
-				 * emitted for BPF_B/H/W case. So, set ex->insn to the
-				 * instruction that could fault and skip over both
-				 * instructions.
+				 * Two instructions are emitted for LDX.
+				 * So, set ex->insn to the instruction that could fault and skip
+				 * over both instructions.
 				 */
-				if (size == BPF_DW || !fp->aux->verifier_zext) {
-					insn_idx -= 1;
-					jmp_off += 4;
-				}
+				insn_idx -= 1;
+				jmp_off += 4;
 
 				ret = bpf_add_extable_entry(fp, image, pass, ctx, insn_idx,
 							    jmp_off, dst_reg);
-- 
2.39.2

