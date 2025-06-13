Return-Path: <linuxppc-dev+bounces-9348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E647EAD8C08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJdv04W0Xz30VM;
	Fri, 13 Jun 2025 22:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749802039;
	cv=none; b=azpgYmSNdC3rAqzs7rX4zHP1botUQBXFsKKVo9KiBSgv5/HcbuL2wpN3Wo0yw61beJTaHZTWLlTDPmPImLn4xKogTbrxLbBNU/OD4HYPVIG8nZ+2tvio9m7NBLBXqMxgF6gilijoJajRk4tsL3I5V2cINDlWskrb1BwH+VYUaZ/qgUNs6AD0tg2u6vdNORlID3H8BvP57l1lkCorrnahnYNAhwbxJorWQ96QbX7IAS/uuzJDCLprZkXJlgfdXU80Wz2i/RgSwO7O04PCwH51FIR+rU9LmQl81x5HTKcn31n/vWReJDPsOJWtFbxjkDhKNYdwyNR84F2Dh3IbFX1AeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749802039; c=relaxed/relaxed;
	bh=iCXQsbKGx+Ub2FZUU4QMyCt/kow3TrN3wSQz5BFCUkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N32NvaGBOVAnuheD0Jzwsh2C7bwGzdRx6T34qnV05lGihzeT24z+dNQ8Vqd/uvJtUbwdNFioPzx/HmywnC2sPlZEDGWUZ1KcDx+V/Wt/JB8CRpc5QxiZ2K4n/K93bFg4+kfQFVH0OH2nJK1Yt1eQBU4oww0O3vNU/UjN6OqWU19vW7rKISWDIKcFJxUZdwKqRtYKCS0cC0Hg9K1pH8OZqOGY714eJb0Epx9G1GNSIBVRM1nSySYTMWDjZR8nNb8XxafK2K9GhZyUPhTetIGJ8XKFTLy9XBq9Dv0fCFzsrFRXZDZjQhk+f1OaqmflexZvohOaS/SjdsmncqgEaIiEww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DF3THJ1s; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DF3THJ1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJX7B5yhLz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:07:18 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id AAC3E5848EF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 07:37:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4598444FF;
	Fri, 13 Jun 2025 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCXQsbKGx+Ub2FZUU4QMyCt/kow3TrN3wSQz5BFCUkM=;
	b=DF3THJ1s5ZoAGCH1tZpg/RgBTuqlcD8+Gdp1vl6l3EZKPdA2tmFvAy1qMrIUlDHacBw4me
	MFS+0Sj5NOI/giQFNCWdzjxRiAp4lUkXcxkcSwknp830UZbsZnCfr+63KS5svSG/F5+h0x
	Xe5wnzxSG36kWva694mtZMJYDhN2O8YZ+YXrJGUBk2ss876kL+FBbj0adn2daygE8jAO8P
	H+0jdrFMZscJazoKecvPWyiAYqc3a/B78GATwVOa9kkr33jFZTIMZlD3JELF5jRjxklPRm
	9bQZmKQvEyDNn6uS2dJ9g/6g/dFX2YDKHhe3YqOf6hSrWJxpe6km0MRjuTq7Vg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:16 +0200
Subject: [PATCH bpf 7/7] selftests/bpf: ensure that functions passing
 structs on stack can not be hooked
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
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-7-5be9211768c3@bootlin.com>
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

When attaching ebpf programs to functions through fentry/fexit, the
generated trampolines can not really make sure about the arguments exact
location on the stack if those are structures: those structures can be
altered with attributes such as packed or aligned(x), but this
information is not encoded in BTF.

Update tracing_struct_many_args test to check that programs can not be
attached on those specific functions. Not all architectures can use the
same number of registers to pass arguments, so define a testing function
that makes all currently supported architectures start passing arguments
on stack (-> more than 8 args)

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 .../selftests/bpf/prog_tests/tracing_struct.c      | 37 +-----------
 .../selftests/bpf/progs/tracing_struct_many_args.c | 70 ----------------------
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c | 43 ++-----------
 3 files changed, 6 insertions(+), 144 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_struct.c b/tools/testing/selftests/bpf/prog_tests/tracing_struct.c
index 19e68d4b353278bf8e2917e62f62c89d14d7fe80..a084f6e5eca4e97b463950feba2142a628e9ec72 100644
--- a/tools/testing/selftests/bpf/prog_tests/tracing_struct.c
+++ b/tools/testing/selftests/bpf/prog_tests/tracing_struct.c
@@ -70,44 +70,9 @@ static void test_struct_many_args(void)
 		return;
 
 	err = tracing_struct_many_args__attach(skel);
-	if (!ASSERT_OK(err, "tracing_struct_many_args__attach"))
+	if (!ASSERT_EQ(err, -ENOTSUPP, "tracing_struct_many_args__attach"))
 		goto destroy_skel;
 
-	ASSERT_OK(trigger_module_test_read(256), "trigger_read");
-
-	ASSERT_EQ(skel->bss->t7_a, 16, "t7:a");
-	ASSERT_EQ(skel->bss->t7_b, 17, "t7:b");
-	ASSERT_EQ(skel->bss->t7_c, 18, "t7:c");
-	ASSERT_EQ(skel->bss->t7_d, 19, "t7:d");
-	ASSERT_EQ(skel->bss->t7_e, 20, "t7:e");
-	ASSERT_EQ(skel->bss->t7_f_a, 21, "t7:f.a");
-	ASSERT_EQ(skel->bss->t7_f_b, 22, "t7:f.b");
-	ASSERT_EQ(skel->bss->t7_ret, 133, "t7 ret");
-
-	ASSERT_EQ(skel->bss->t8_a, 16, "t8:a");
-	ASSERT_EQ(skel->bss->t8_b, 17, "t8:b");
-	ASSERT_EQ(skel->bss->t8_c, 18, "t8:c");
-	ASSERT_EQ(skel->bss->t8_d, 19, "t8:d");
-	ASSERT_EQ(skel->bss->t8_e, 20, "t8:e");
-	ASSERT_EQ(skel->bss->t8_f_a, 21, "t8:f.a");
-	ASSERT_EQ(skel->bss->t8_f_b, 22, "t8:f.b");
-	ASSERT_EQ(skel->bss->t8_g, 23, "t8:g");
-	ASSERT_EQ(skel->bss->t8_ret, 156, "t8 ret");
-
-	ASSERT_EQ(skel->bss->t9_a, 16, "t9:a");
-	ASSERT_EQ(skel->bss->t9_b, 17, "t9:b");
-	ASSERT_EQ(skel->bss->t9_c, 18, "t9:c");
-	ASSERT_EQ(skel->bss->t9_d, 19, "t9:d");
-	ASSERT_EQ(skel->bss->t9_e, 20, "t9:e");
-	ASSERT_EQ(skel->bss->t9_f, 21, "t9:f");
-	ASSERT_EQ(skel->bss->t9_g, 22, "t9:f");
-	ASSERT_EQ(skel->bss->t9_h_a, 23, "t9:h.a");
-	ASSERT_EQ(skel->bss->t9_h_b, 24, "t9:h.b");
-	ASSERT_EQ(skel->bss->t9_h_c, 25, "t9:h.c");
-	ASSERT_EQ(skel->bss->t9_h_d, 26, "t9:h.d");
-	ASSERT_EQ(skel->bss->t9_i, 27, "t9:i");
-	ASSERT_EQ(skel->bss->t9_ret, 258, "t9 ret");
-
 destroy_skel:
 	tracing_struct_many_args__destroy(skel);
 }
diff --git a/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
index 4742012ace06af949d7f15a21131aaef7ab006e4..1cbedcdc1c42e1fe2f118fdbd1a4ab7fe48b52fb 100644
--- a/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
+++ b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
@@ -8,28 +8,11 @@ struct bpf_testmod_struct_arg_4 {
 	int b;
 };
 
-struct bpf_testmod_struct_arg_5 {
-	char a;
-	short b;
-	int c;
-	long d;
-};
-
-long t7_a, t7_b, t7_c, t7_d, t7_e, t7_f_a, t7_f_b, t7_ret;
-long t8_a, t8_b, t8_c, t8_d, t8_e, t8_f_a, t8_f_b, t8_g, t8_ret;
-long t9_a, t9_b, t9_c, t9_d, t9_e, t9_f, t9_g, t9_h_a, t9_h_b, t9_h_c, t9_h_d, t9_i, t9_ret;
 
 SEC("fentry/bpf_testmod_test_struct_arg_7")
 int BPF_PROG2(test_struct_many_args_1, __u64, a, void *, b, short, c, int, d,
 	      void *, e, struct bpf_testmod_struct_arg_4, f)
 {
-	t7_a = a;
-	t7_b = (long)b;
-	t7_c = c;
-	t7_d = d;
-	t7_e = (long)e;
-	t7_f_a = f.a;
-	t7_f_b = f.b;
 	return 0;
 }
 
@@ -37,59 +20,6 @@ SEC("fexit/bpf_testmod_test_struct_arg_7")
 int BPF_PROG2(test_struct_many_args_2, __u64, a, void *, b, short, c, int, d,
 	      void *, e, struct bpf_testmod_struct_arg_4, f, int, ret)
 {
-	t7_ret = ret;
-	return 0;
-}
-
-SEC("fentry/bpf_testmod_test_struct_arg_8")
-int BPF_PROG2(test_struct_many_args_3, __u64, a, void *, b, short, c, int, d,
-	      void *, e, struct bpf_testmod_struct_arg_4, f, int, g)
-{
-	t8_a = a;
-	t8_b = (long)b;
-	t8_c = c;
-	t8_d = d;
-	t8_e = (long)e;
-	t8_f_a = f.a;
-	t8_f_b = f.b;
-	t8_g = g;
-	return 0;
-}
-
-SEC("fexit/bpf_testmod_test_struct_arg_8")
-int BPF_PROG2(test_struct_many_args_4, __u64, a, void *, b, short, c, int, d,
-	      void *, e, struct bpf_testmod_struct_arg_4, f, int, g,
-	      int, ret)
-{
-	t8_ret = ret;
 	return 0;
 }
-
-SEC("fentry/bpf_testmod_test_struct_arg_9")
-int BPF_PROG2(test_struct_many_args_5, __u64, a, void *, b, short, c, int, d, void *, e,
-	      char, f, short, g, struct bpf_testmod_struct_arg_5, h, long, i)
-{
-	t9_a = a;
-	t9_b = (long)b;
-	t9_c = c;
-	t9_d = d;
-	t9_e = (long)e;
-	t9_f = f;
-	t9_g = g;
-	t9_h_a = h.a;
-	t9_h_b = h.b;
-	t9_h_c = h.c;
-	t9_h_d = h.d;
-	t9_i = i;
-	return 0;
-}
-
-SEC("fexit/bpf_testmod_test_struct_arg_9")
-int BPF_PROG2(test_struct_many_args_6, __u64, a, void *, b, short, c, int, d, void *, e,
-	      char, f, short, g, struct bpf_testmod_struct_arg_5, h, long, i, int, ret)
-{
-	t9_ret = ret;
-	return 0;
-}
-
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index e9e918cdf31ff2b15bf41302ad429e8683b834d6..ff6a4a0fb73679c6c4831ae0662bce2080e53c23 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -55,13 +55,6 @@ struct bpf_testmod_struct_arg_4 {
 	int b;
 };
 
-struct bpf_testmod_struct_arg_5 {
-	char a;
-	short b;
-	int c;
-	long d;
-};
-
 __bpf_hook_start();
 
 noinline int
@@ -101,30 +94,10 @@ bpf_testmod_test_struct_arg_6(struct bpf_testmod_struct_arg_3 *a) {
 	return bpf_testmod_test_struct_arg_result;
 }
 
-noinline int
-bpf_testmod_test_struct_arg_7(u64 a, void *b, short c, int d, void *e,
-			      struct bpf_testmod_struct_arg_4 f)
-{
-	bpf_testmod_test_struct_arg_result = a + (long)b + c + d +
-		(long)e + f.a + f.b;
-	return bpf_testmod_test_struct_arg_result;
-}
-
-noinline int
-bpf_testmod_test_struct_arg_8(u64 a, void *b, short c, int d, void *e,
-			      struct bpf_testmod_struct_arg_4 f, int g)
+noinline int bpf_testmod_test_struct_arg_7(u64 a, void *b, short c, int d,
+					   void *e, u64 f, u64 g, u64 h,
+					   struct bpf_testmod_struct_arg_4 i)
 {
-	bpf_testmod_test_struct_arg_result = a + (long)b + c + d +
-		(long)e + f.a + f.b + g;
-	return bpf_testmod_test_struct_arg_result;
-}
-
-noinline int
-bpf_testmod_test_struct_arg_9(u64 a, void *b, short c, int d, void *e, char f,
-			      short g, struct bpf_testmod_struct_arg_5 h, long i)
-{
-	bpf_testmod_test_struct_arg_result = a + (long)b + c + d + (long)e +
-		f + g + h.a + h.b + h.c + h.d + i;
 	return bpf_testmod_test_struct_arg_result;
 }
 
@@ -397,7 +370,6 @@ bpf_testmod_test_read(struct file *file, struct kobject *kobj,
 	struct bpf_testmod_struct_arg_2 struct_arg2 = {2, 3};
 	struct bpf_testmod_struct_arg_3 *struct_arg3;
 	struct bpf_testmod_struct_arg_4 struct_arg4 = {21, 22};
-	struct bpf_testmod_struct_arg_5 struct_arg5 = {23, 24, 25, 26};
 	int i = 1;
 
 	while (bpf_testmod_return_ptr(i))
@@ -408,13 +380,8 @@ bpf_testmod_test_read(struct file *file, struct kobject *kobj,
 	(void)bpf_testmod_test_struct_arg_3(1, 4, struct_arg2);
 	(void)bpf_testmod_test_struct_arg_4(struct_arg1, 1, 2, 3, struct_arg2);
 	(void)bpf_testmod_test_struct_arg_5();
-	(void)bpf_testmod_test_struct_arg_7(16, (void *)17, 18, 19,
-					    (void *)20, struct_arg4);
-	(void)bpf_testmod_test_struct_arg_8(16, (void *)17, 18, 19,
-					    (void *)20, struct_arg4, 23);
-	(void)bpf_testmod_test_struct_arg_9(16, (void *)17, 18, 19, (void *)20,
-					    21, 22, struct_arg5, 27);
-
+	(void)bpf_testmod_test_struct_arg_7(16, (void *)17, 18, 19, (void *)20,
+					    21, 22, 23, struct_arg4);
 	(void)bpf_testmod_test_arg_ptr_to_struct(&struct_arg1_2);
 
 	(void)trace_bpf_testmod_test_raw_tp_null_tp(NULL);

-- 
2.49.0


