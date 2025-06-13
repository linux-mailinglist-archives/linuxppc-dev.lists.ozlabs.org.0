Return-Path: <linuxppc-dev+bounces-9344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C34AD8BF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJds62nxLz30Sy;
	Fri, 13 Jun 2025 22:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749802033;
	cv=none; b=PjKuKB1xSX5G+dvuG+OUN5+vhvWCzEGu0rEesYZYjp9YhxB9cSnJ/cWL9Ovgagnk0KXhJm2QtGqDh8I7+iRoSlXhYsPszdp6K1TsMxli0P3MNvEOvPpNGi9ZGKkz7KUf7qH1035xry/PXmX7MC3o0N3iEHHckQsuumIYRe0YGoJsRz2B5HuKsrILfPooRa9TaDVvOmJmgvKRXzERK1oLJgn5v4at3G+FIo6y6awY7/SXbXdPH6ma9SFOvDnPK+h+PpJaCoxloCopB2W9JdORoLDnQMLshmQB4tTEGSukAZEIrmz6W93tNPkJJDm9VCNUWlSrImjh3fwZL7lKbtRO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749802033; c=relaxed/relaxed;
	bh=WLtF15o+Ex4Ed3vWHcKorxdQYUZ/IggFlAe1+Bvb1bQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbh1XTkUrDSUEedEGRRhHdSB2NSvvjufy7co6FGpDPkVUVS9UnC/jLOHo2eIF8WiPSAT0NveuG+O6Osfzu3GgVGT79R6DLsWyW1UmGYhW4EpyWPxl0f1oViK+XOZ0zwAw1APaKGXTqXKPgGXc20sxFj4tuUI4JUEcpdYrQAtX3nlXBLfmiyqewxQ8oTE/84PJO2A4h1jSB/QSmCW5b++UM55A0CvaB8eCOzcB0vpwV1k8Lh74i0n/MtfLmSYbzJxzE2RXG0jOcYHO6MBNTmrg+NYFM6sh+zpG6tLa3cRWYWKlCr6jnN2a31TAft8NHF7Az31GCXhSC40M92PGk6Gcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fYTs9Jbt; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fYTs9Jbt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJX732gfqz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:07:11 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 2B5CE5848B0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 07:37:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4737044515;
	Fri, 13 Jun 2025 07:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLtF15o+Ex4Ed3vWHcKorxdQYUZ/IggFlAe1+Bvb1bQ=;
	b=fYTs9JbtnbQa0LG78Ip8By4e8kxfeBYaAkBZGd4wF2a4/6esqJ7MVj2PbEj1VGMwdzrKHn
	7XSJaqODDAiuBQDbcyOJ7ITyuZE+Zts95dmJNmUCOudt2D1o/fCHsHwfW7ERCyNo9O1egn
	/LwdsL+26wj2ktOlxMEyz4YwoQPhxWG3YI5wtVxeYPnSz7g19gMYyM6asNdvVsnq2m9Nud
	WCK4DjKtHb+62+sqH6m5ov7tSnrcJSJbY8GgNj68E54TrE24BXl7RVaYv4PAxT+EIQDmaB
	TM9B8Eacu+Xd3qzw1RWvru499qrPa8XL5GB3APEztX4F4YDKWoL4Z2Ne93qTdQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:12 +0200
Subject: [PATCH bpf 3/7] bpf/riscv: prevent trampoline attachment when args
 location on stack is uncertain
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
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-3-5be9211768c3@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigq
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

Fixes: 6801b0aef79d ("riscv, bpf: Add 12-argument support for RV64 bpf trampoline")
Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 10e01ff06312d9f1e6e213bb069c6ea749ea9af2..ea3a1c3af6bc129057c16a4070c33dbf00e6c611 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1005,6 +1005,24 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	return ret;
 }
 
+static int validate_args(const struct btf_func_model *m)
+{
+	int i, nr_arg_slots, nr_regs = 0;
+
+	if (m->nr_args > MAX_BPF_FUNC_ARGS)
+		return -ENOTSUPP;
+
+	for (i = 0; i < m->nr_args; i++) {
+		nr_arg_slots = round_up(m->arg_size[i], 8) / 8;
+		if (nr_regs + nr_arg_slots > RV_MAX_REG_ARGS &&
+		    m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
+			return -ENOTSUPP;
+		nr_regs += nr_arg_slots;
+	}
+
+	return 0;
+}
+
 static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 					 const struct btf_func_model *m,
 					 struct bpf_tramp_links *tlinks,
@@ -1069,8 +1087,12 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
 		return -ENOTSUPP;
 
-	if (m->nr_args > MAX_BPF_FUNC_ARGS)
-		return -ENOTSUPP;
+	/* make sure that any argument can be located and processed by the
+	 * trampoline
+	 */
+	ret = validate_args(m);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < m->nr_args; i++)
 		nr_arg_slots += round_up(m->arg_size[i], 8) / 8;

-- 
2.49.0


