Return-Path: <linuxppc-dev+bounces-9345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C292AD8BF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJdsT6WkZz30T9;
	Fri, 13 Jun 2025 22:25:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749802034;
	cv=none; b=TMSXXVMSn/tuZDgPdnely+RTCwlWvdqx5ZF6l8MROxIxtFzZpfKoNqa1ri+nyRZse4KjPbVktRgbzvdtKDp1ZU0Ygyul6SKB0aHSTtKnGs2XaS5IUFpfldkTZFT7S6HIv6yNgixAxc20quSnSOE9BJBfjXtih6UZiTobUdcdgGVn3HnrFquJYbyf+2VVScYTT35iYUCfVSBVcBmKocd+dJ1VSFRfxaggZnBq/H3Yb9hF2LoIISSrJ/BBlqTsl1R2BS836yJWIbA88xlVayGW2e1liOCd0a2MgP0KvOPcdL/aKtIlletopQQiYibpxKoQD3AD0hFz4+2SuqqmFdUV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749802034; c=relaxed/relaxed;
	bh=rWrXudQ87v1aByOGhl67T4UU7KUM5mT6FEm5oZqhcLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFuM0NvYVmPObYtlxnntaKticaNJTUTaJCqBay2C6eNwzxlR3nok4CWNkRAlJBaNszKhPIUrrN+B6gR9BK6U9bC5dX1dVebCpgCtcPwZWhUHxKN8MFPeKzFQ3O0QmY76loEGqElmEYyYSwMBB+ynX2w3QbvgsVQfmOk+PigeW9tzSpwv5+wGAqCnMECSHtsexmejSXzHG4ka1jlP4fw4/suuA8dkTc4Bs22Wzri202i9bmLO3TDAcDpsCxdkB9Z6beKhu6DJOjihmeY5bMvrcChWaXIgoezNHuVnXSZbtmXVk5PZsEIKtypoUYCmpN1plB42ry67pe7uQvfl0CFcEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cAFx4niw; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cAFx4niw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJX733GmFz308P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:07:11 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 11B7158488C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 07:37:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCC6B44506;
	Fri, 13 Jun 2025 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWrXudQ87v1aByOGhl67T4UU7KUM5mT6FEm5oZqhcLg=;
	b=cAFx4niwDDsyQFKGdmMcGf11CvIpcE6i60PNTLVL6XAEHr8QsvAnUtPgghd0BMq2R+ppDC
	FFai5U507SCN+pyoN6wuDoWlTMOjSSoP4TnpNxYiC+w0QbX1ZUzPQlhl134JonesXJvjFx
	OWDw6aSbLFZe7FDXXsBj2S+b7DQHMXAKYwDHAWLiIwLUr5ryMSKFEAsH//6LX4WvBNf7+B
	RTSk1TpiSwF389Xnh71A9SzYutIAanBG+/eJ2O3NS8i6MD2qG3qY8IPYR+kJcbwUdA/tQF
	SzpnBSDBVvIxVqUtGLlQS7VmjGVpj6a1tNP17AMJbhSHMVv02WVX06WVxtBTDQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:10 +0200
Subject: [PATCH bpf 1/7] bpf/x86: use define for max regs count used for
 arguments
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-1-5be9211768c3@bootlin.com>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
In-Reply-To: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: ebpf@linuxfoundation.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

x86 allows using up to 6 registers to pass arguments between function
calls. This value is hardcoded in multiple places, use a define for this
value.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/x86/net/bpf_jit_comp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 15672cb926fc1817f97d2cd1c55d1575803f6958..9689834de1bb1a90fdc28156e0e2a56ac0ff2076 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -61,6 +61,8 @@ static u8 *emit_code(u8 *ptr, u32 bytes, unsigned int len)
 #define EMIT_ENDBR_POISON()
 #endif
 
+#define MAX_REGS_FOR_ARGS	6
+
 static bool is_imm8(int value)
 {
 	return value <= 127 && value >= -128;
@@ -2710,10 +2712,10 @@ static int get_nr_used_regs(const struct btf_func_model *m)
 
 	for (i = 0; i < min_t(int, m->nr_args, MAX_BPF_FUNC_ARGS); i++) {
 		arg_regs = (m->arg_size[i] + 7) / 8;
-		if (nr_used_regs + arg_regs <= 6)
+		if (nr_used_regs + arg_regs <= MAX_REGS_FOR_ARGS)
 			nr_used_regs += arg_regs;
 
-		if (nr_used_regs >= 6)
+		if (nr_used_regs >= MAX_REGS_FOR_ARGS)
 			break;
 	}
 
@@ -2751,7 +2753,7 @@ static void save_args(const struct btf_func_model *m, u8 **prog,
 		 * the arg1-5,arg7 will be passed by regs, and arg6 will
 		 * by stack.
 		 */
-		if (nr_regs + arg_regs > 6) {
+		if (nr_regs + arg_regs > MAX_REGS_FOR_ARGS) {
 			/* copy function arguments from origin stack frame
 			 * into current stack frame.
 			 *
@@ -2811,7 +2813,7 @@ static void restore_regs(const struct btf_func_model *m, u8 **prog,
 	 */
 	for (i = 0; i < min_t(int, m->nr_args, MAX_BPF_FUNC_ARGS); i++) {
 		arg_regs = (m->arg_size[i] + 7) / 8;
-		if (nr_regs + arg_regs <= 6) {
+		if (nr_regs + arg_regs <= MAX_REGS_FOR_ARGS) {
 			for (j = 0; j < arg_regs; j++) {
 				emit_ldx(prog, BPF_DW,
 					 nr_regs == 5 ? X86_REG_R9 : BPF_REG_1 + nr_regs,
@@ -2824,7 +2826,7 @@ static void restore_regs(const struct btf_func_model *m, u8 **prog,
 			stack_size -= 8 * arg_regs;
 		}
 
-		if (nr_regs >= 6)
+		if (nr_regs >= MAX_REGS_FOR_ARGS)
 			break;
 	}
 }
@@ -3149,7 +3151,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	stack_size += (sizeof(struct bpf_tramp_run_ctx) + 7) & ~0x7;
 	run_ctx_off = stack_size;
 
-	if (nr_regs > 6 && (flags & BPF_TRAMP_F_CALL_ORIG)) {
+	if (nr_regs > MAX_REGS_FOR_ARGS && (flags & BPF_TRAMP_F_CALL_ORIG)) {
 		/* the space that used to pass arguments on-stack */
 		stack_size += (nr_regs - get_nr_used_regs(m)) * 8;
 		/* make sure the stack pointer is 16-byte aligned if we

-- 
2.49.0


