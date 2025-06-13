Return-Path: <linuxppc-dev+bounces-9333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83BAD85AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 10:31:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXfm1Nt4z2yb9;
	Fri, 13 Jun 2025 18:31:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749803472;
	cv=none; b=XiqVTjjjF+236N1bUxAd106l82KrHuAGokJpnxo47Kh2ehBb8I9qzQdT+Bx6IBcHgkV44tTB6g0iZrr4K3KP09N4F0QWTyVwhHKrjJiXR4P2IdNU1lRYSHJd/iXNSLqf28kfddiE8TKoiYeII4isD3RtaSe54NZx3iJ2Lrb96CVTsXoA2mez1nvGEA1tWiZp5JCAa6Fmap571idq+qSW5/bw2jWhi9Md6EyKy2nvPVZkG1/dL0o74Y8zs/iLr4cDn7Z1rqaQ5hZWVt+FC+MJC3q8qNXz0N+Ky91n/YMgWwUkz4ss2jFGvmf4ayRXQsxxQTIEEIbj4tOaEfIBNeoO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749803472; c=relaxed/relaxed;
	bh=m4XILQdlyhOEuGIrG8GkhmJQpyqVphUns6R2oeWJu9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEAcSQJoxTba/DxXSJD3mJP4DzdnzjLp9XR2R25ArtXQgxTlqLi2lXFuNL1ZwwCzzBPzvtBGY9jFXqg5ceAoLOqMSNkNeEPPugzuDeo8aGcrirweaRVU5Dmf3kTz+s/6K3XXKUrO/LGkVwu0JOrQd/hVCEjS4il9EDUSKqFVpqF+F98ZQ7olNN+tbbnQx+3SPgZ54TD3AzpWJVM6yfwOnI7nvXXF+5Tp2H4F1VZPsM9ZFXj30MLZEfb4u1FwhYKA91Y9IoLnD9PYWRr9mrvm7T5a+H0nPyT0ylvu0ZfU4kRw2h3SpqLNNeQv7nB01FBJeqlPl29IkucdFpFGhfGSYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f3LAUdt5; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f3LAUdt5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJXfd2H4Rz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:31:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m4XILQdlyhOEuGIrG8GkhmJQpyqVphUns6R2oeWJu9E=; b=f3LAUdt5CXosLIWHTG1Gn2PqbK
	uw/eNAwNwnZ7Ad1daZCeRDp/bnOhoqQM5Mn/GdZreNWOuJ0RhhyqKggEr6V0TRSHUSyNjLYbpDFBc
	LXhiSHFdUqcld4K+jE+bpdoag0YeedzOI2w3hVHWJN92pBzd16viaDbOhzBWRJynFhd712ScZYy3I
	+M4GEXUTTr2XfF+o14XniGTwivG8YqhQ7knBL1UQbCQwyknCcFLcteoDNuwd0zc8aEJYFa8HH8Tkc
	yauPRRnQs89VhaSNWzqCn0BH9o+r+7+/tHBn/b2R1OM4E7IJfGDeSMF/O2D2y6Tn0172qdOz/P6S+
	066LXRWg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzVw-0000000Ciov-0OfZ;
	Fri, 13 Jun 2025 08:11:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DDD5E30BC59; Fri, 13 Jun 2025 10:11:50 +0200 (CEST)
Date: Fri, 13 Jun 2025 10:11:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
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
Message-ID: <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
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
In-Reply-To: <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> When the target function receives more arguments than available
> registers, the additional arguments are passed on stack, and so the
> generated trampoline needs to read those to prepare the bpf context,
> but also to prepare the target function stack when it is in charge of
> calling it. This works well for scalar types, but if the value is a
> struct, we can not know for sure the exact struct location, as it may
> have been packed or manually aligned to a greater value.

https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf

Has fairly clear rules on how arguments are encoded. Broadly speaking
for the kernel, if the structure exceeds 2 registers in size, it is
passed as a reference, otherwise it is passed as two registers.



