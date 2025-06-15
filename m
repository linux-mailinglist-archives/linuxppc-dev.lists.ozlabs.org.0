Return-Path: <linuxppc-dev+bounces-9385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074DADA1FD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 16:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKvt82kRbz2yft;
	Mon, 16 Jun 2025 00:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.195
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749996048;
	cv=none; b=YZrZhFTBjwCos4eYgOcKqll5GYFublmGo0ptfLeP0w3DKkI1kd0oDSsaGw8WRYuFkG0e1byhq/TCr6XMqVWNBkyCX1rzyo8Y3ldiBg98WpPspPDMBADDinA/GZigOXkp1jmVgIEPVACY/YygKtW3vdT+fRRkQMSfnHkr/VF6mf9pciA04cTQeFkUBw8gFdSKU5/vQtNIqDg4EFBAogo0M9jibJoao29tk59xDyzd8p36NjYOk+41kXPeXfhCaB3TQ2nSdO44Nh0u8iBKA5QxjGg/MSgb/66FiGEZ+jTIfS9YMA4j3yH6IvtvznaRj4KUhQgv3lAUDIgg4PbLOoF93w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749996048; c=relaxed/relaxed;
	bh=YxXS5lj0DrF49L/g0V9R5FkVyXH9S7gR1QjB4hu3uuE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rm4r9UErRWb50el404qLYAaDXjSsmg9xVC5LQHkji9RacZ2N4hcqVQHevLj6iJDmMkZtEtBtqCChDlbc5dzcS/BkeF8zCR9caRileEa6Y/nB/Eg67FiOriIASJf+FPwMOWxM9GzR4VNt2JxaisURRHiFlr17ga/t7xyrpRW4JGMoTVXDUapTAfMtBIZbZlhC+VWdkQ2QinIk05Z5E89LMnApxz8mWFQTd2zeSxOUGgT9briHKO05QYwqoHIl1Xk3YN59fqXl5o2305Z1zjSTap6OENMzZOVzHXqKY2LZYgCN5y7ycT26PPpIWFEzHcom/rnrYZOo63Up2QTnsLadDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A7TiUfOZ; dkim-atps=neutral; spf=pass (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A7TiUfOZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKvt60Nj4z2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 00:00:42 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7A6B205B1;
	Sun, 15 Jun 2025 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749996037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxXS5lj0DrF49L/g0V9R5FkVyXH9S7gR1QjB4hu3uuE=;
	b=A7TiUfOZSoNCNlpd3feyEIMq7JweNSA26Ki+asH1Rd/WvFZi6wU8mGFvLOiyagoFjwL8JL
	xo9M58/kDnjnSORKMzRqxzrCLgPAGB8Bu5MzN3EMIYoY6aN+6oHKGrYFTIO3qN/Pw67h/B
	IMc2jyqqF5WnGXYgwIPTBVuwK7QfL9I9ZUJ6sI7veC8g4rtStWZ/IVP4WS757EaSs2cq3B
	2xNCG4rBNC84HJC/1B3ddFVbvd1E5riocXBoJdq4moXdkt4MuVYmrwo0+OjTp/wdmH6h4R
	eSQhByt4F2xarijNXWHhMAAbmtcVLzvls0lGIxnTZz73uWzR5oqhqzM6rTospw==
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
Date: Sun, 15 Jun 2025 16:00:30 +0200
Message-Id: <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, "David Ahern"
 <dsahern@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "X86 ML" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Menglong Dong" <imagedong@tencent.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Ilya Leoshkevich" <iii@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
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
 <bastien.curutchet@bootlin.com>, "Network Development"
 <netdev@vger.kernel.org>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>, "linux-riscv" <linux-riscv@lists.infradead.org>,
 "linux-s390" <linux-s390@vger.kernel.org>, "ppc-dev"
 <linuxppc-dev@lists.ozlabs.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "dwarves" <dwarves@vger.kernel.org>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when
 args location on stack is uncertain
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com> <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com> <20250613081150.GJ2273038@noisy.programming.kicks-ass.net> <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net> <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com> <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
In-Reply-To: <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekleehffevvedvudfhueelffeugfdtveefvdfguefgffehtdekleetheelleffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemsgehvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmegshegvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedtpdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgso
 higrdhnvghtpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat Jun 14, 2025 at 12:35 AM CEST, Alexei Starovoitov wrote:
> On Fri, Jun 13, 2025 at 1:59=E2=80=AFAM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:
>>
>> On Fri Jun 13, 2025 at 10:32 AM CEST, Peter Zijlstra wrote:
>> > On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothor=C3=A9 wrote:

[...]

>> If I need to respin, I'll rewrite the commit message to include the deta=
ils
>> above.
>
> No need to respin. The cover letter is quite detailed already.
>
> But looking at the patch and this thread I think we need to agree
> on the long term approach to BTF, since people assume that
> it's a more compact dwarf and any missing information
> should be added to it.
> Like in this case special alignment case and packed attributes
> are not expressed in BTF and I believe they should not be.
> BTF is not a debug format and not a substitute for dwarf.
> There is no goal to express everything possible in C.
> It's minimal, because BTF is _practical_ description of
> types and data present in the kernel.
> I don't think the special case of packing and alignment exists
> in the kernel today, so the current format is sufficient.
> It doesn't miss anything.
> I think we made arm64 JIT unnecessary restrictive and now considering
> to make all other JITs restrictive too for hypothetical case
> of some future kernel functions.
> I feel we're going in the wrong direction.
> Instead we should teach pahole to sanitize BTF where functions
> are using this fancy alignment and packed structs.
> pahole can see it in dwarf and can skip emitting BTF for such
> functions. Then the kernel JITs on all architectures won't even
> see such cases.
>
> The issue was initially discovered by a selftest:
> https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-3-0a32fe72339e@bo=
otlin.com/
> that attempted to support these two types:
> +struct bpf_testmod_struct_arg_4 {
> + __u64 a;
> + __u64 b;
> +};
> +
> +struct bpf_testmod_struct_arg_5 {
> + __int128 a;
> +};
>
> The former is present in the kernel. It's more or less sockptr_t,
> and people want to access it for observability in tracing.
> The latter doesn't exist in the kernel and we cannot represent
> it properly in BTF without losing alignment.
>
> So I think we should go back to that series:
> https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-0-0a32fe72339e@bo=
otlin.com/
>
> remove __int128 selftest, but also teach pahole
> to recognize types that cannot be represented in BTF and
> don't emit them either into vmlinux or in kernel module
> (like in this case it was bpf_testmod.ko)
> I think that would be a better path forward aligned
> with the long term goal of BTF.
>
> And before people ask... pahole is a trusted component of the build
> system. We trust it just as we trust gcc, clang, linker, objtool.

So if I understand correctly your point, it would be better to just move ou=
t
those constraints from the JIT compilers, and just not represent those spec=
ial
cases in BTF, so that it becomes impossible to hook programs on those funct=
ions,
since they are not event present in BTF info.
And so:
- cancel this series
- revert the small ARM64 check about struct passed on stack
- update pahole to make sure that it does not encode info about this specif=
ic
  kind of functions.

I still expect some challenges with this. AFAIU pahole uses DWARF to genera=
te
BTF, and discussions in [1] highlighted the fact that the attributes alteri=
ng
the structs alignment are not reliably encoded in DWARF. Maybe pahole can
"guess" if a struct has been altered, by doing something like
btf_is_struct_packed in libbpf ? As Andrii mentioned in [2], it may not be
able to cover all cases, but that could  be a start. If that's indeed the
desired direction, I can take a further look at this.

+ CC dwarves ML

Alexis

[1] https://lore.kernel.org/bpf/9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.=
dev/
[2] https://lore.kernel.org/bpf/CAEf4BzZHMYyGDZ4c4eNXG7Fm=3DecxCCbKhKbQTbCj=
vWmKtdwvBw@mail.gmail.com/


