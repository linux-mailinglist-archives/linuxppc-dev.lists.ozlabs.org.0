Return-Path: <linuxppc-dev+bounces-9365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22754AD9843
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 00:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJvPs2Bmqz2xPc;
	Sat, 14 Jun 2025 08:36:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749854177;
	cv=none; b=QxR58JwgeytWGP5a1yRnZo3Kj5BcKSpVy5HklLhfKNPEErtxZxBiQyPdZa2duR+e++d9WhXpzsgXd0bSQz1Jlp3h+4gYRMDrUDZeHbJ4Sp7wpg0JdJ5sTw6Y/euh7hijMXYVxWXsl+9Y6mpbedpy2BuTRwzaOtftyKaDysfrcJ8kNmfwkEuDSVo94CiH7OEaRSBQQGT69VkYSWLvm/TBj1Zd94DxVsaWdxBsqBAleaDdQnR6w6/IloNUqss6JosH0X9McGPqIVqrDieMJ1RQ4zSEqo3cgJcTwHybUCS0N5ebwbp1ArjZqXzaAEnJ+Rpr/99Qc7GtYactMvxYJjdQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749854177; c=relaxed/relaxed;
	bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AU88FgwlQzf/NXFIkhLrpRQVNSV9lrWVg50YEO2QGACFGsUBa8NmoKemHscnUBvt4hPThrexgS5NLwlJz2K3+h27vF1Dm5fd0Usnryd96Cc+jtGHkj/w2i7YQXrrKEctSXPmtxNFrIMioJXe8ELLk9yfYtPBBUnPGjpzWGppzLRZVErFr3FCcWlL3E4oMDoddzhPKpahUuB/GeopouU5JXhkS0K05UIBi3QztG4dqXPWnvapo30CWxpm7DmaKUbeq+Au1A2lhLpcx3BNJQzPJNDb36aAgbohMoB5bo8+Z3uLT8iEysKPqcxgBi3dgeNZKnBgPlJm0xopCz2xfrVHyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YF8CVT2H; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YF8CVT2H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJvPq0SkHz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 08:36:13 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so33775225e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 15:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749854169; x=1750458969; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
        b=YF8CVT2HvuHVG3KRNSE++IsxcQbuLQR0eaHYbEviQV/KoIaihGkV0RFWyHCArn/fSC
         HWAlyn3PeamPYouZulCo0fGc05kGyo2YGNwDuw3TSJt2CuLU/uOYxKVowm9OoRnUkTi4
         eIbjl1LBiv92gYsCvCSXnlz6TMnBd0VzmtIsAXnht9jTjdnKeBOEjkKlrncX4GsM9k+T
         DwvX0G9WqStGvkmAdSAQWs2bw8EBg+1Q2feolSpvCIijbmCsgLybzPD1YtFGCReoHLMo
         oLUloxB3GIZgBneySrf0yXS/HhtC2lUM6dRa8/ulnASt49ajzWXpJplJLXH0DE54QeCa
         QtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749854169; x=1750458969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDhN0PQzQ9wgEHlw7OXTzGjuQH3XOnQA5xq1WBIqnek=;
        b=f+VAWNw+Nqe3iGG2e4Si0/9+spmaIwCqXh8o4sVjbUYy3DpeXa/locBMomxjW36CSw
         3qfmGVH0AZkEiw37iBWfvG+PBUzltOQTJ3Hn/URocr55/+Bm1uMXOCKgJXoWX1Kv3E73
         ro6eI3yC8PlBsZRHja49RX/c0c8wst0CdGGAm3xUB+1VmDLfxCKII/asQTh4idI7owoX
         6RG/9aECDBEzY2VxD9lufG37Tuq1aOeFPBtEkUnTVG5h/TZGsZJ+HpE4Ne7vYUyJBQQV
         0D6Sbj27FNGtjHL59kxxk5Cp6Q05p+AuJ+mcsQACcVUNJJWBMHMdjWi3tFJjhaSec6bu
         utWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIuegtYSNpTAYwOMUR/Ctcand8nt6JHZjnEv4eAiM2N0hdQMC+qH1aLGXtaUq6Rh9rtAXLUev08CN/bcI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8MZp2qpjt1NBw62BrmmxcLzCcLOgdZjEXn/MrmAkteuD2661G
	G0ZOEW1ExBv59E65aF9ApUeoEPZkEYfw59AXOGqrK44T+sNOSh8lJyu0nRQ4glhPbnRfbperMEA
	yUVpHYXfVa9mZNhVlK6praYA0wyUQ+3Y=
X-Gm-Gg: ASbGncvvDeUrR4QqHIvcnd4U6itxAf8iWYcl2VSExPO5ZoCydws693Cm1rSCprUvK30
	HUoMOH3eS9yb6VvYtFJBivwNmr/ptDWYg8/nY7XsaVwGeDbpQ8T3Zv2gBdNad79Q2DNkL8hpVAS
	hY2AQ7JnPDXmPLWKJqnUV2jWHwlcdIC4sPRyCNAYsBw94dvCqppwAxlQLS5BZBr+fzN4F10kXV
X-Google-Smtp-Source: AGHT+IGvAZU4d5tXw0nhgWlSwGRKFbuaQhR8GZiHa22TV57O0MRl7T0f9v9YaYzOJredMJW3TgBMxueem5pPB3YsBNg=
X-Received: by 2002:a05:6000:40dd:b0:3a5:2694:d75f with SMTP id
 ffacd0b85a97d-3a572e895fbmr1535518f8f.52.1749854168416; Fri, 13 Jun 2025
 15:36:08 -0700 (PDT)
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
 <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
In-Reply-To: <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 13 Jun 2025 15:35:57 -0700
X-Gm-Features: AX0GCFvxnM-s8AungljiWEt_LCtzKmPe0DGMu2VqQrNsxFmjrZ6Pec_NoZEOn-E
Message-ID: <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
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
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 1:59=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Fri Jun 13, 2025 at 10:32 AM CEST, Peter Zijlstra wrote:
> > On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothor=C3=A9 wrote:
> >> Hi Peter,
> >>
> >> On Fri Jun 13, 2025 at 10:11 AM CEST, Peter Zijlstra wrote:
> >> > On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=C3=A9 (eBPF =
Foundation) wrote:
>
> [...]
>
> >> Maybe my commit wording is not precise enough, but indeed, there's not
> >> doubt about whether the struct value is passed on the stack or through=
 a
> >> register/a pair of registers. The doubt is rather about the struct loc=
ation
> >> when it is passed _by value_ and _on the stack_: the ABI indeed clearl=
y
> >> states that "Structures and unions assume the alignment of their most
> >> strictly aligned component" (p.13), but this rule is "silently broken"=
 when
> >> a struct has an __attribute__((packed)) or and __attribute__((aligned(=
X))),
> >> and AFAICT this case can not be detected at runtime with current BTF i=
nfo.
> >
> > Ah, okay. So it is a failure of BTF. That was indeed not clear.
>
> If I need to respin, I'll rewrite the commit message to include the detai=
ls
> above.

No need to respin. The cover letter is quite detailed already.

But looking at the patch and this thread I think we need to agree
on the long term approach to BTF, since people assume that
it's a more compact dwarf and any missing information
should be added to it.
Like in this case special alignment case and packed attributes
are not expressed in BTF and I believe they should not be.
BTF is not a debug format and not a substitute for dwarf.
There is no goal to express everything possible in C.
It's minimal, because BTF is _practical_ description of
types and data present in the kernel.
I don't think the special case of packing and alignment exists
in the kernel today, so the current format is sufficient.
It doesn't miss anything.
I think we made arm64 JIT unnecessary restrictive and now considering
to make all other JITs restrictive too for hypothetical case
of some future kernel functions.
I feel we're going in the wrong direction.
Instead we should teach pahole to sanitize BTF where functions
are using this fancy alignment and packed structs.
pahole can see it in dwarf and can skip emitting BTF for such
functions. Then the kernel JITs on all architectures won't even
see such cases.

The issue was initially discovered by a selftest:
https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-3-0a32fe72339e@boot=
lin.com/
that attempted to support these two types:
+struct bpf_testmod_struct_arg_4 {
+ __u64 a;
+ __u64 b;
+};
+
+struct bpf_testmod_struct_arg_5 {
+ __int128 a;
+};

The former is present in the kernel. It's more or less sockptr_t,
and people want to access it for observability in tracing.
The latter doesn't exist in the kernel and we cannot represent
it properly in BTF without losing alignment.

So I think we should go back to that series:
https://lore.kernel.org/bpf/20250411-many_args_arm64-v1-0-0a32fe72339e@boot=
lin.com/

remove __int128 selftest, but also teach pahole
to recognize types that cannot be represented in BTF and
don't emit them either into vmlinux or in kernel module
(like in this case it was bpf_testmod.ko)
I think that would be a better path forward aligned
with the long term goal of BTF.

And before people ask... pahole is a trusted component of the build
system. We trust it just as we trust gcc, clang, linker, objtool.

