Return-Path: <linuxppc-dev+bounces-9346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC7AD8BFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:26:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJdtS6LZtz30T3;
	Fri, 13 Jun 2025 22:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749802034;
	cv=none; b=kJkihnP0GVTPxrKq5nOLpjWe/8Qpcr4iXzuRzpTy4btThotvYBDiTPHNJD14NSSzddLXKUmk4p3RaK7tOcZ4vKea/E+yoDQ/wosWZtm/+caRIoN3nf5owhEgxw+48emaQ3LHuHjgkyz0qxgAA8e8D96jF/z7tChVDCU8NahbJuDL91Qz2qZT52bcfTN4dg+G82pDFoFMseGjOhrVH0NxSzdFu2qW0M9IGRGSHCVt22v7+arMCabP1nRWU2T3CNYM01V5hKUTi7Am8ARNLR7SjL5UxKxydggOrtrJy6Wex7oF5Mr3JwrcG0pGQ+Oa5EYl4khKJL/VD+h3q/YBHHeWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749802034; c=relaxed/relaxed;
	bh=beEBVGnU6qU0wggmtWKWRNXrz1xxl7Gdx9jeDS6+tJk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c1Ogr+Fac+VRgKLWNjnBM7BwV1tMQ/totU66I8nDgbFQgZFd8Q+8s8QRKkrIHugxi3ezdk1epKvb5gh4p9Vlc/HArb2gtPQPbQiQ+EauHVtgiL/THBN6/C+WC23UKX2mKnN5hrDllUN43fC0ImKkQ9MxyhdNV6E1cUnTyzUF8BjC75LbunkdadJMgw5DZGkcPcT6gjWTuocbEDppX8Lj+okzB1au6nOE/BLM11JYfod9RS80pgTlJeasZCjaX2KmvuMnUjj1pEjpBGq44HpyhhhNuiQ8DCr5T0114XpZ2ux5JTx0VM0qLHgQq5EbyanltkMVrEdur6ymUekEV6PSjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kbxOkqLB; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kbxOkqLB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJX732px2z2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:07:11 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id CFEDB584877
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 07:37:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86F1944503;
	Fri, 13 Jun 2025 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749800247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=beEBVGnU6qU0wggmtWKWRNXrz1xxl7Gdx9jeDS6+tJk=;
	b=kbxOkqLBWMYw2LKAd/IW2RyGj/nP5qTDA3nQe30746ZNf401cfIfLbPiuY4UCGLIThgg52
	3SDjkKUlcjrkpsB7uie+NFd+q+khw4Qzg1V7FhH7kqzzDUETsK2pGbu4SLKi+3xHGZA5Px
	K8dourdAUK5hDgryw11qFf0uNWCLOjes5mH1frWPNr1onGZSx9hzPoBxJ8F4ePD6fSr9AO
	tPte1M9ivmGyxjku7Xi4XGOT8+ifFHjA0HhTgsLAKFka6UJZWMMHXlJDmbcy5ef57nUIR7
	33LybB/oSKZ4GDWXEWCuppTs2482C4hbZA/bJ1nk+is7e8e0Di4ud3snPwKt0Q==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [PATCH bpf 0/7] bpf: deny trampoline attachment if args can not be
 located exactly on stack
Date: Fri, 13 Jun 2025 09:37:09 +0200
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIACXVS2gC/x2NQQrCMBAAv1L2bCANtKJfEQnJZquLugnZKErp3
 xu8zVxmVlCqTArnYYVKH1bO0mU8DID3IDcynLqDs26ysz2ZRPLzrYZXyU8W8trqG5v6LB0DPsw
 UIx4jOpvSCD1TKi38/S8uEMsC123bAYJUNa93AAAA
X-Change-ID: 20250609-deny_trampoline_structs_on_stack-5bbc7bc20dd1
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeuuefggeeiuedutdeghffhtefguefffeelledttdfgjeejueeggeeugfdugfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepheekpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrghhorhguvggvvheslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvhesl
 hhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopehsvhgvnhhssehlihhnuhigrdhisghmrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,
this series follows some discussions started in [1] around bpf
trampolines limitations on specific cases. When a trampoline is
generated for a target function involving many arguments, it has to
properly find and save the arguments that has been passed through stack.
While this is doable with basic types (eg: scalars), it brings more
uncertainty when dealing with specific types like structs (many ABIs
allow to pass structures by value if they fit in a register or a pair of
registers). The issue is that those structures layout and location on
the stack can be altered (ie with attributes, like packed or
aligned(x)), and this kind of alteration is not encoded in dwarf or BTF,
making the trampolines clueless about the needed adjustments. Rather
than trying to support this specific case, as agreed in [2], this series
aims to properly deny it.

It targets all the architectures currently implementing
arch_prepare_bpf_trampoline (except aarch64, since it has been handled
while adding the support for many args):
- x86
- s390
- riscv
- powerpc

A small validation function is added in the JIT compiler for each of
those architectures, ensuring that no argument passed on stack is a
struct. If so, the trampoline creation is cancelled. Any check on args
already implemented in a JIT comp has been moved in this new function.
On top of that, it updates the tracing_struct_many_args test, which
now merely checks that this case is indeed denied.

[1] https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com/
[2] https://lore.kernel.org/bpf/CAADnVQKr3ftNt1uQVrXBE0a2o37ZYRo2PHqCoHUnw6PE5T2LoA@mail.gmail.com/

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Alexis Lothoré (eBPF Foundation) (7):
      bpf/x86: use define for max regs count used for arguments
      bpf/x86: prevent trampoline attachment when args location on stack is uncertain
      bpf/riscv: prevent trampoline attachment when args location on stack is uncertain
      bpf/s390: prevent trampoline attachment when args location on stack is uncertain
      bpf/powerpc64: use define for max regs count used for arguments
      bpf/powerpc64: prevent trampoline attachment when args location on stack is uncertain
      selftests/bpf: ensure that functions passing structs on stack can not be hooked

 arch/powerpc/net/bpf_jit_comp.c                    | 38 ++++++++++--
 arch/riscv/net/bpf_jit_comp64.c                    | 26 +++++++-
 arch/s390/net/bpf_jit_comp.c                       | 33 ++++++++--
 arch/x86/net/bpf_jit_comp.c                        | 50 ++++++++++++----
 .../selftests/bpf/prog_tests/tracing_struct.c      | 37 +-----------
 .../selftests/bpf/progs/tracing_struct_many_args.c | 70 ----------------------
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c | 43 ++-----------
 7 files changed, 129 insertions(+), 168 deletions(-)
---
base-commit: c4f4f8da70044d8b28fccf73016b4119f3e2fd50
change-id: 20250609-deny_trampoline_structs_on_stack-5bbc7bc20dd1

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


