Return-Path: <linuxppc-dev+bounces-9350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFFDAD8C27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:30:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJdzC6Tqjz30MZ;
	Fri, 13 Jun 2025 22:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::227"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749803209;
	cv=none; b=Yk7dixMmL0isQr253Xc4asvtZtdJ7S2cNpGSt00Vtv4OFk9d8fSitXnBeYLUv2Hjn2IQUjm/HqmZe2TkTHuOoWb/Dp1h96nQVvV4dyQ3+ttemPcMhPwA49Y7uCLzq3396vYZ/8fMhsR+hf9qtZ53sd+XFmeWwgqLBCyjCkAVIAuZgTBoDG6piWJUXeYtvW2dLf2UBmUbfW7jNh3s51C70DNrsjgDlbVMLKjYQimR7KAWD3ztLiatlTMGhFA+Gb5MzFhyr8EwVXCAsJpbX4IcBMrSa0GwFnsf+doMFZ1Ew96337cQxlodK2ynK/xUiKS0sMhSR4++g5ZOHoaFNZFNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749803209; c=relaxed/relaxed;
	bh=oy7cnpuIfUbxnBIHzSxSzs3wF3pN160eEFEtn1XrHHA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X9viYEmTQublVnIHdWHNSOfSgGRx4jy2m9YYZxIqyT6LPlWVaLzVjPt+OZCo/uFZ3pN9c5dA4+MmDd7Xaoq7xG8TwQR8WxxlvYEIl6/G14yW8is/IWaoE+nhTh9b49UyaNwA924+MIn7pewGPyDXbMUjg1YtmxscBZLCzQoqMssqmlLYvy5D5oa2XU8ui15KmzqVC4sTEf+iZvkZpon1q1CDn1HIz9mqfivcDRSf6y7KdnmBgDlADzvmlFINhik1g7/I69gNUE3Rm6LbDLhIXkLxpKsQwWm/xvYvWDqW4zx+dZvVfgVrfIIw8KorwnIHFj6OkVAJofbBdpkNefGMXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BnJGbMk/; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BnJGbMk/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2955 seconds by postgrey-1.37 at boromir; Fri, 13 Jun 2025 18:26:48 AEST
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJXYh5VnGz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:26:47 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B142A41C06;
	Fri, 13 Jun 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749803203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oy7cnpuIfUbxnBIHzSxSzs3wF3pN160eEFEtn1XrHHA=;
	b=BnJGbMk/e7fYDOccAaKbhkPl6Zkb+CJk54xIzM7oGJ/68LdgKmC814rIU32t6tdn2RLttv
	x15WZiOubSuud24F243NbAQNPG2k3Dui7U5bdWbzo6Lo7AjeJ+KSplTU5N9Z/cTjXj0Rr9
	AtxWE42xFJSR7fqyJtvD37GTtg2rovAwTR+VAfdN1C4ZXMlk7rhOwNdTxFQnBalxqPz9tm
	e/OD8ENjC+yzoBhzLvEBBNcwIj7ZN9YK2gi89xBilq+iVetQOvwYaFKA3l+J6erZ08hSMo
	zVQuK+p9cI9MOofvRUYJC5RnI8Wf/o3bDNy4BjM6rT5BKMfG/sqEM22GLR1tVQ==
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
Date: Fri, 13 Jun 2025 10:26:37 +0200
Message-Id: <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
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
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com> <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com> <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfftdejhefhieelvefhgeffvddulefhfeegleegkefgffejgeffjeeigfdtveeinecuffhomhgrihhnpehlihhnuhigsggrshgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehkedprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiihesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Peter,

On Fri Jun 13, 2025 at 10:11 AM CEST, Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=C3=A9 (eBPF Found=
ation) wrote:
>> When the target function receives more arguments than available
>> registers, the additional arguments are passed on stack, and so the
>> generated trampoline needs to read those to prepare the bpf context,
>> but also to prepare the target function stack when it is in charge of
>> calling it. This works well for scalar types, but if the value is a
>> struct, we can not know for sure the exact struct location, as it may
>> have been packed or manually aligned to a greater value.
>
> https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf
>
> Has fairly clear rules on how arguments are encoded. Broadly speaking
> for the kernel, if the structure exceeds 2 registers in size, it is
> passed as a reference, otherwise it is passed as two registers.

Maybe my commit wording is not precise enough, but indeed, there's not
doubt about whether the struct value is passed on the stack or through a
register/a pair of registers. The doubt is rather about the struct location
when it is passed _by value_ and _on the stack_: the ABI indeed clearly
states that "Structures and unions assume the alignment of their most
strictly aligned component" (p.13), but this rule is "silently broken" when
a struct has an __attribute__((packed)) or and __attribute__((aligned(X))),
and AFAICT this case can not be detected at runtime with current BTF info.

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


