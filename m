Return-Path: <linuxppc-dev+bounces-9351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12553AD8C2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:31:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJf0R6VL6z30P3;
	Fri, 13 Jun 2025 22:31:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.197
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749805185;
	cv=none; b=IBCuYx//CoyOaY++dxX/vWmpC3tNoNC/61Mf5x3otmCKGneOok28e8U+Fowk1E73JJQBGQlkXNjND9Z2xmFakb7143lBBw05j0wX1r0bBeA2opAL5Ii3XateJfIyoHHyieCNdMxRJo7CrZJqj3ch1Q2YIPZXdiQqLLn2u5HDQZpRX/WzDH4Gbz4AisUpnokMeAZx5EGVXmVFGjfFDY4pKvB+xoTfFx5KzEwo9P1PsdT15o3xBtTG7XHrt4KBdta6OQ5iy5xIAjZ8c035eFDBLJMvxAITfJPgR3AN/FvOFkk79nX/qxGdTJoDYHRLU1xY2NvZxeQ9YV7ax/oQz2bYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749805185; c=relaxed/relaxed;
	bh=SUCUXJtX/FQ0n2RuIYjo9mN42TY+/sRw81vNJDMJO0A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mm7jALOUct9UIpMjXsLpQCuMAN/sZWMzQaoUrayfoNm1slcTuOF2Q5L5ZD6kNFgVG4zsdA1/52OxVOdGCdidi7gTNsfV1QJSH+z2crYq1Mz587ScWO6kZvyntrqQ7KoL1+Xc7p9DwrfThaL9Ci9N4LTz7BIEyVr3aXb/sUOywepAW20lfGKy/t9QZnLiS28mFe25CPPaPWarughxLt3g6wGIQi7c3ekZ0Qo94wnnDy7bkywJGcyEXeY+1TN5P0ELIb0pWJVavP1QGUvQULzIXqPAyQNDBAQ1f5Hl7QiPg8Ldh9gy7Y/N6DV0Hs9ANUW8x5Igu32XjhWVq0OVkwN7bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=odU2qoVO; dkim-atps=neutral; spf=pass (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=odU2qoVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4927 seconds by postgrey-1.37 at boromir; Fri, 13 Jun 2025 18:59:41 AEST
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJYHd622Hz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:59:40 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DEFE42E7E;
	Fri, 13 Jun 2025 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749805174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUCUXJtX/FQ0n2RuIYjo9mN42TY+/sRw81vNJDMJO0A=;
	b=odU2qoVOJqtmWsv4zb4lepGDdwIrGFVx1azJXmapyDqL96WcBHU3wmTN7q7dQPmyKFqCHI
	rAqafMySpH/EFaSvZ1mPA8XPB64itYMWMRjLI+y9JhypSBAVbn7uBWi7ZcMRo/IBOnvwbQ
	5esOyHBXJvmN2G+ljk317R7i3D4fcRlCkLEQ6ICe/sb+aRuObTcakshd3/wdZEUJ2LrUgk
	5TMr9mGozxkHTrm+MRwSTF64qE4g2cgcgr48VeDhBLpdVtT0mS0PBL7DckMWmv65tfLxtu
	MspFh3LUUD6IifvG5Ga5z6d3PYGcXoafBp+C4hw7u5Y8qm4JyGJ0DAuSLAMGzw==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 10:59:28 +0200
Message-Id: <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Menglong Dong"
 <imagedong@tencent.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, "Pu Lehui" <pulehui@huawei.com>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Hari
 Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Mykola
 Lysenko" <mykolal@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, <ebpf@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when
 args location on stack is uncertain
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com> <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com> <20250613081150.GJ2273038@noisy.programming.kicks-ass.net> <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleekheeihfefheevhfdtgeeuleekheffffffuedvkeekkeduvdeugeeugfeiueeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri Jun 13, 2025 at 10:32 AM CEST, Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothor=C3=A9 wrote:
>> Hi Peter,
>>=20
>> On Fri Jun 13, 2025 at 10:11 AM CEST, Peter Zijlstra wrote:
>> > On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=C3=A9 (eBPF Fo=
undation) wrote:

[...]

>> Maybe my commit wording is not precise enough, but indeed, there's not
>> doubt about whether the struct value is passed on the stack or through a
>> register/a pair of registers. The doubt is rather about the struct locat=
ion
>> when it is passed _by value_ and _on the stack_: the ABI indeed clearly
>> states that "Structures and unions assume the alignment of their most
>> strictly aligned component" (p.13), but this rule is "silently broken" w=
hen
>> a struct has an __attribute__((packed)) or and __attribute__((aligned(X)=
)),
>> and AFAICT this case can not be detected at runtime with current BTF inf=
o.
>
> Ah, okay. So it is a failure of BTF. That was indeed not clear.

If I need to respin, I'll rewrite the commit message to include the details
above.

Alexis




--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


