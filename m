Return-Path: <linuxppc-dev+bounces-9334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E08AD85B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 10:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXhn2HXlz30KY;
	Fri, 13 Jun 2025 18:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749803577;
	cv=none; b=Ig68xkN/5rbFTOrQvbXttA/ULl+ueLne0MSqUUwL9Fdc0UREbOe4Mou7X67kcBVRglddzbfuWcBGkiLX/wQOxYsm/86aaH1GhTNS9DOFZXHELoDTQp6aDgioxgl2/6nTMhvFHTFJkdiicsavGgmz2o0yYDB71tHXB7ghczOr7/tfZBEd9abwQiBjfD1W4tZOgKjpJoPeI4E9lHAWDJfV6LR8HGUIdQ5B2xbA5wbm5UmePAIshVJUBJ0/z6WlB+WyPo4uHjhi0JE3yv7O3e1zl9LUo+w+wZpzRKYvN/sBvAgbGsdq4PBFxyjkch5jgLhTCvzPXYoaA69/OObL/Y5ZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749803577; c=relaxed/relaxed;
	bh=ceyQVU1s/TeC1A0uuWSXGNuCFCVzbMABPNZsJKr21a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAa9MZngpA/vumswY6v5Wr1Y5xfuj/cz77AG72kJyxH/D0cUP4xskWjy11AB6Zwk40R2xJko6+BzQTW5RekR/0rdvEMQiNqCvMLyWRx2dc4dAH2rofIEQcC56yFSDtssYPKIPCGk4b+DHhEZDNrdFSTyO6dAb5EE59hu1gom6E7h8khl3bcm7fC469acP3VoLif35L0VBZfH5S98uWuO4MXF9eFG09OZgxz+s6NjFc05MoA7R81daJ9DOA2mM/AIrna7dyulcqLmMtOki1FN/yVYlqqCg+a82Qd6vwrV1ST6ZoJbfQ+bG5NX4KaxaiYRmwb3NJuEo7f+nmQEnbvYfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dqNTC/tN; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dqNTC/tN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJXhm128tz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:32:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ceyQVU1s/TeC1A0uuWSXGNuCFCVzbMABPNZsJKr21a4=; b=dqNTC/tN4NktIpsvVSNzGd1Nnb
	Ldq+PhqaTIoeFX8VZpUciXtoyr5CFokw7L8HNdBGwoPl6xSK9X6o+V3RpCm62st+eycrHXRgyrId4
	4Po3+C8crMT914IOhhj9CrqolkUd9H7EV3hacaFcjxbQeteCWjgcHJNLo0dtEgYJ//ndXjdQcuL4N
	z/E164M1C5AX4Ddk5/Hz9YfZerFiy/DnFQ7B3Dv1S4TZ3MHKdeMIkMZRh1le5FPGjoELyUx3VYPnV
	42klzQnynHAr/Mz3kmKTN9vJgW3XYeQsbsKdIXLcdMzaRYWGAnXyk4I0cC1V92HJfqr7/zrHNZxlG
	ZinrIPZg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzpx-0000000Cjg6-2v0S;
	Fri, 13 Jun 2025 08:32:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 94D9E300969; Fri, 13 Jun 2025 10:32:32 +0200 (CEST)
Date: Fri, 13 Jun 2025 10:32:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Menglong Dong <imagedong@tencent.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	ebpf@linuxfoundation.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when args
 location on stack is uncertain
Message-ID: <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothoré wrote:
> Hi Peter,
> 
> On Fri Jun 13, 2025 at 10:11 AM CEST, Peter Zijlstra wrote:
> > On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> >> When the target function receives more arguments than available
> >> registers, the additional arguments are passed on stack, and so the
> >> generated trampoline needs to read those to prepare the bpf context,
> >> but also to prepare the target function stack when it is in charge of
> >> calling it. This works well for scalar types, but if the value is a
> >> struct, we can not know for sure the exact struct location, as it may
> >> have been packed or manually aligned to a greater value.
> >
> > https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf
> >
> > Has fairly clear rules on how arguments are encoded. Broadly speaking
> > for the kernel, if the structure exceeds 2 registers in size, it is
> > passed as a reference, otherwise it is passed as two registers.
> 
> Maybe my commit wording is not precise enough, but indeed, there's not
> doubt about whether the struct value is passed on the stack or through a
> register/a pair of registers. The doubt is rather about the struct location
> when it is passed _by value_ and _on the stack_: the ABI indeed clearly
> states that "Structures and unions assume the alignment of their most
> strictly aligned component" (p.13), but this rule is "silently broken" when
> a struct has an __attribute__((packed)) or and __attribute__((aligned(X))),
> and AFAICT this case can not be detected at runtime with current BTF info.

Ah, okay. So it is a failure of BTF. That was indeed not clear.

