Return-Path: <linuxppc-dev+bounces-9349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F199AD8C11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:28:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJdwV05jWz30GV;
	Fri, 13 Jun 2025 22:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749802040;
	cv=none; b=E9E9DZ4W+dDiIwEjuft9mfTlKBC3H9154Tq7U+RRmCyGSm3x+Fs4xOcwmli/hSx4cbjRa/sTK6p5hQ6z8E8ANFm9uFYv5e6f9+wyeMcJTZ4w4KI8Uyv8jfYWcwCCxnVVmLspy/nCn4EuPoth66cSK6PAbgBHbWyyj5My5CmPen8IiqfQ9aqG4m1OHH4eHHKd2eId94dJ7wbF6LCMH0BuoPv5O0K/diIo5BEIuHDjrr+Hx32UUf21NSzg1GY8x/F3E4BBWx6D2j6qv0qj0gaZIv5FtZU70oSn4PdYlAQFfgl5a/Olsal05G/Bj7LWtXd7GbkjetY/2xUeMskisM5NYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749802040; c=relaxed/relaxed;
	bh=hKtkaErlksV8Vai/mKr2KqKy0M00KlPerZSqFi6ERyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSqikeDJcwyCR3HtwuxKQuwkBbfDEIvxXs7Y+ZgZ+PNdr/BEw8KBkAUoJe+rF/IstA7qNxTvgkRPTDhly+3ULP+Kcm+kwJIij/dbhsHLYLBV051bnaAPLKx+lWCjlJEEvnSxBsdlpHO9yA76v0O9FElGLdEV1MirO7+F2cfQBcJWq3h1uUmVh4H3gXxybvNgztQ7urxgXNZST599pUhJ3PCvXdVggQAXVDv4Z4ett6ZwkiGoXyHdqwBGC5fFjOF/G7bGQoLL2UXiOQnF1o4G0GrbctkE8BSEWk+AVVBmO7YHx/c7II8LchKvO+znmcWFItmiXnv14r5uGKZ0NUyp6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dwebunOK; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dwebunOK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJX7B71f8z2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:07:18 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 7A75B5848D8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 07:37:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEC8444521;
	Fri, 13 Jun 2025 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKtkaErlksV8Vai/mKr2KqKy0M00KlPerZSqFi6ERyQ=;
	b=dwebunOKGliUOBu0dNuEzYlEobxLghh6N2AjWZRVOv7pySHnZ4d90y3u/LKtoLu/V3/LfP
	2KiFKa2Y0NEQldNzq3K71KBjpIjMQI1puCXBRaFQo7HCyQkh2gTujOhu67NHiEeLBb1DF1
	BPYsOl4mfk7z7+G5sHARa5gXMvyImzjZDetFx+lZny8idRUIrudoAxb3Y1NTVEefG4NQCz
	6ZbGLS+MmTGkdgFGSJY9hMfB0KAavEySPzPqdMYT8Gr0dOjwNLA5KFoIs1ibbeMRPL3EdA
	HQg1LeNMpm2RaUfwjAMZ1ai3nQJE4grrAFbz0KzRPMp0sg9141N7Zje4pN6WNg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:15 +0200
Subject: [PATCH bpf 6/7] bpf/powerpc64: prevent trampoline attachment when
 args location on stack is uncertain
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
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-6-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepmhihkhholhgrlhesfhgsrdgtohhmpdhrtghpthhtohepshhvvghnsheslhhinhhugidrihgsmhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When the target function receives more arguments than available
registers, the additional arguments are passed on stack, and so the
generated trampoline needs to read those to prepare the bpf context, but
also to prepare the target function stack when it is in charge of
calling it. This works well for scalar types, but if the value is a
struct, we can not know for sure the exact struct location, as it may
have been packed or manually aligned to a greater value.

Prevent wrong readings by refusing trampoline attachment if the target
function receives a struct on stack. While at it, move the max bpf args
check in the new function.

Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index d313920a42c2310c6b5deab6d82e13af49c8ecb1..97f5209a25adb4865e3cc342292c8f15b1985156 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -648,6 +648,24 @@ static void bpf_trampoline_restore_args_stack(u32 *image, struct codegen_context
 	bpf_trampoline_restore_args_regs(image, ctx, nr_regs, regs_off);
 }
 
+static int validate_args(const struct btf_func_model *m)
+{
+	int nr_regs = m->nr_args, i;
+
+	for (i = 0; i < m->nr_args; i++) {
+		if (m->arg_size[i] > SZL)
+			nr_regs += round_up(m->arg_size[i], SZL) / SZL - 1;
+		if (i > MAX_REGS_FOR_ARGS &&
+		    m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
+			return -ENOTSUPP;
+	}
+
+	if (nr_regs > MAX_BPF_FUNC_ARGS)
+		return -ENOTSUPP;
+
+	return 0;
+}
+
 static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_image,
 					 void *rw_image_end, void *ro_image,
 					 const struct btf_func_model *m, u32 flags,
@@ -668,15 +686,19 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	if (IS_ENABLED(CONFIG_PPC32))
 		return -EOPNOTSUPP;
 
+	/* make sure that any argument can be located and processed by the
+	 * trampoline
+	 */
+	ret = validate_args(m);
+	if (ret)
+		return ret;
+
 	nr_regs = m->nr_args;
 	/* Extra registers for struct arguments */
 	for (i = 0; i < m->nr_args; i++)
 		if (m->arg_size[i] > SZL)
 			nr_regs += round_up(m->arg_size[i], SZL) / SZL - 1;
 
-	if (nr_regs > MAX_BPF_FUNC_ARGS)
-		return -EOPNOTSUPP;
-
 	ctx = &codegen_ctx;
 	memset(ctx, 0, sizeof(*ctx));
 

-- 
2.49.0


