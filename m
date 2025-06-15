Return-Path: <linuxppc-dev+bounces-9386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1339CADA276
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 17:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKyB612kmz2ySg;
	Mon, 16 Jun 2025 01:44:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750002286;
	cv=none; b=lvoEecgQCgEqfJaWoX6/qUIBIpwxmvFlmnxaU+WBDInF+XqD3B7hRCf4mosRUuL9hI8lRTuyd+tlT+UOUcJiR21sGxwufiEyQFCkcU7w1GuXT50ANKcisOND7DAnMQjxr86R/vFLyeJTpumBlbGSznvCxdyAHEo7Qna3DyGHi3GlWSWY4oaBIRDduUNZGs8p1IN9MnO9caHHYxvfSgaOOH6mqESRxKcGT1V4ya0YL8C7TW4zARwxkhsJFlqVW3rqnXW6ith2iBdzCTt0onf84KI1bYJc7bCSCmJnAoy32A7AQUbearV5Ar1FqrQjSRbaBcjO8niUfR2/ozZv1csGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750002286; c=relaxed/relaxed;
	bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6ISjfx8koYFfc43ylhP/Ko7qdU/OKJF/BuNe1fWstDK4t/AU1UEYAl7t3vRrY1fUBTCu2v0UvGzUhWjWQtXlcVICVfDzBMtlsyWF5qaoA1kKXifFwTMMloyWez54Hws5oe481vxa0t6Krs5Ji6S7VmjtpHdFtrIcovpPs3X50UY8vB4SbqxG8+C3Rw1NnvSa5qP0AM5QkxsjEjA2iZn7Rg6yVdVcau1H2wTg71jw44ihy3BZBIY29DAQYjlfLgI9XpG+Tvy3QmQH+EF/EiuHAKHdLlB61XL5ZG9nn+pMGcUZN+DU1w2pdGJJqN77dhohbhNO+09HcXin4On+NzDNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z/Jq+7ig; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z/Jq+7ig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKyB173Pyz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 01:44:40 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2437511f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750002275; x=1750607075; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
        b=Z/Jq+7igDXQ6uCI7mS1wqu1VAfWa3NqPVhBjl55xua3oKidUBdqIBf+lerUR11S7tB
         xBj4ruU9V8Y/E0LIezT0BUQBa0/w+Ptff2ob9A/0pbgA2EpnmkUBI4Z++TdWi9+UWpn/
         oW6pANRXlJ6tOojTaMIfcGk5J2sgKac0xeuzaGNpFgzl08c3E2ZIZ56NuNGY6JGGsvJ2
         rx33FA5vxpwYKsP/AzbegJzC5G5EkDGRIA+FJRVemyJ4dZC6iiAEeVIb7WZ4HrEFrgfD
         XhTVFBPF5FF83vJvv7z7ajNXSdOEvnLTmZQP4nqU4LjKnshkIPXuYV5n2zjCZExq+UCP
         kTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750002275; x=1750607075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
        b=R4JoF5bbUazmdkkTCp5zE/Hn/wWa4GCYffNUNT6ai0pm6d6YdwJmIrEgBi/ofT0TRx
         kZOKwMY2LbK5aBjNO/ztTDVRTUP9tdMVvVVk5Fw0JknbQ+hzNmLawp8KRYOCxreUcUqD
         v03phTxIGJp9QakqbO0wQVeWotjVTHeyYYqbQ6wsPWeu0i1IPFgAM3+X+OV1gucZcubu
         dN2b+/A4KbydMcr9C/hf1g5QI/sQj8EZ40sI2q0gL+K6sJNOT+ow5q73eCcRv5Icu/E8
         F//9bRVJbx+YmicxF0chnCeaxNaysQXiO5Ceto8lOAxTFwt+9i7X+IUxzqcJ0HwIZMD9
         g4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXWJ8lL4cTNtdVVlxBOdGyqaUHd5mJv+CmR/NLFB22rD86Xx9zLvZoN4MoPBQT5pbzV7EOwjMRNVdpDEqg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzU2JzBOlHYlGhU54zhU77OXNmWW9yX8lTcY39JpqxCIw/P4jMq
	ruHDjShFOYLEFXKNRxxEa66RKdFldQRApIuEdrLFnNhv5TvA23XyRps20toxMfOQQ9RwMKCwJK/
	2iIdTIemu6Z6dWBaMDi9qw+g7hbsrfJw=
X-Gm-Gg: ASbGncvcikA1jP3NeumLqbUT63+z+gHOCmkBLyaD+dVcXbvhjH/SQoBWcn5sPBwd18k
	ZS/Sv4sR8VMjHoxYO5DGc3r2j2j2KBz64M836wWN6UWo/Eg9HXt8xdO3A5sTFPABx2ILIuGI9Gq
	4DtQAqAmMX401Vh6RckehCL5n8Na7MuG2PoIXCJRoTdUKLkEJZlmcGsA==
X-Google-Smtp-Source: AGHT+IEVMqrf36wFDwIu+Qav+T1hxhMtiOfYIpsqMlJITLohO7pPVX7dQmL5OFhL7NsYv2qBiULo8wqoJRikRf0wek4=
X-Received: by 2002:a05:6000:718:b0:3a5:3b63:58f0 with SMTP id
 ffacd0b85a97d-3a57237178dmr4884718f8f.18.1750002274959; Sun, 15 Jun 2025
 08:44:34 -0700 (PDT)
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
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
 <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com> <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
 <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
In-Reply-To: <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 15 Jun 2025 08:44:23 -0700
X-Gm-Features: AX0GCFum0GptEjJNe1zyPyz2oALA4PaNl_E8ueRtmTM4_c9kw_4GcQiqb2A1p90
Message-ID: <CAADnVQJPQNC5VaybR_GZry5YZhNcJmWSSouuTSsU1XKhDfXYwQ@mail.gmail.com>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when args
 location on stack is uncertain
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dwarves <dwarves@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jun 15, 2025 at 7:00=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Sat Jun 14, 2025 at 12:35 AM CEST, Alexei Starovoitov wrote:
> > On Fri, Jun 13, 2025 at 1:59=E2=80=AFAM Alexis Lothor=C3=A9
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> On Fri Jun 13, 2025 at 10:32 AM CEST, Peter Zijlstra wrote:
> >> > On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothor=C3=A9 wrote:
>
> [...]
>
> >> If I need to respin, I'll rewrite the commit message to include the de=
tails
> >> above.
> >
> > No need to respin. The cover letter is quite detailed already.
> >
> > But looking at the patch and this thread I think we need to agree
> > on the long term approach to BTF, since people assume that
> > it's a more compact dwarf and any missing information
> > should be added to it.
> > Like in this case special alignment case and packed attributes
> > are not expressed in BTF and I believe they should not be.
> > BTF is not a debug format and not a substitute for dwarf.
> > There is no goal to express everything possible in C.
> > It's minimal, because BTF is _practical_ description of
> > types and data present in the kernel.
> > I don't think the special case of packing and alignment exists
> > in the kernel today, so the current format is sufficient.
> > It doesn't miss anything.
> > I think we made arm64 JIT unnecessary restrictive and now considering
> > to make all other JITs restrictive too for hypothetical case
> > of some future kernel functions.
> > I feel we're going in the wrong direction.
> > Instead we should teach pahole to sanitize BTF where functions
> > are using this fancy alignment and packed structs.
> > pahole can see it in dwarf and can skip emitting BTF for such
> > functions. Then the kernel JITs on all architectures won't even
> > see such cases.
> >
> > The issue was initially discovered by a selftest:
> > https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-3-0a32fe72339e@=
bootlin.com/
> > that attempted to support these two types:
> > +struct bpf_testmod_struct_arg_4 {
> > + __u64 a;
> > + __u64 b;
> > +};
> > +
> > +struct bpf_testmod_struct_arg_5 {
> > + __int128 a;
> > +};
> >
> > The former is present in the kernel. It's more or less sockptr_t,
> > and people want to access it for observability in tracing.
> > The latter doesn't exist in the kernel and we cannot represent
> > it properly in BTF without losing alignment.
> >
> > So I think we should go back to that series:
> > https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-0-0a32fe72339e@=
bootlin.com/
> >
> > remove __int128 selftest, but also teach pahole
> > to recognize types that cannot be represented in BTF and
> > don't emit them either into vmlinux or in kernel module
> > (like in this case it was bpf_testmod.ko)
> > I think that would be a better path forward aligned
> > with the long term goal of BTF.
> >
> > And before people ask... pahole is a trusted component of the build
> > system. We trust it just as we trust gcc, clang, linker, objtool.
>
> So if I understand correctly your point, it would be better to just move =
out
> those constraints from the JIT compilers, and just not represent those sp=
ecial
> cases in BTF, so that it becomes impossible to hook programs on those fun=
ctions,
> since they are not event present in BTF info.
> And so:
> - cancel this series
> - revert the small ARM64 check about struct passed on stack
> - update pahole to make sure that it does not encode info about this spec=
ific
>   kind of functions.

yes

> I still expect some challenges with this. AFAIU pahole uses DWARF to gene=
rate
> BTF, and discussions in [1] highlighted the fact that the attributes alte=
ring
> the structs alignment are not reliably encoded in DWARF. Maybe pahole can
> "guess" if a struct has been altered, by doing something like
> btf_is_struct_packed in libbpf ? As Andrii mentioned in [2], it may not b=
e
> able to cover all cases, but that could  be a start. If that's indeed the
> desired direction, I can take a further look at this.

so be it. If syzbot was taught to fuzz dwarf I'm sure it would
have exposed hundreds of bugs in the format itself and compilers,
but since such convoluted constructs are not present in the kernel
source code it's not a concern.

