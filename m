Return-Path: <linuxppc-dev+bounces-8238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16586AA69D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 06:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpdSj3Mjwz3020;
	Fri,  2 May 2025 14:37:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::641"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746143800;
	cv=none; b=Efk3wityp2WoOWAsSAS45yM+ijYmb9iORdHSPi7p7N57iqoMhggaQgASbR71NdGtznpMSc26kKkAVtkMnIgVyxJnGU68YERs4a7cQLorctAzhR6xhLnF8+QbAGNRqNVZU29EOsq9/6p0vk6rZxmVHPrflaX0vPaQ/ackwIeTrrO/yM5A4zzB2AnghHNr5rDpi1jJ20bK7XcFu1U6y+kVkzwyXsWinGDNyTKXuwzfO3D0tsZZIGPOwOs06zKC/tjVOzIaKza+DdPDIzShI1YhZW9T/ZHotx3oYsry4fAROz5vdQkpWRwOFm6AQvOs4hUVjCEb8r8TVraCBg+hxgaagg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746143800; c=relaxed/relaxed;
	bh=IpqcdB5HKLcvCClWag1YAOoCR5dOaM4sia0jSQ91WTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omUY6wY5+4/DSaqgxpe/jellXlM2h19awjLPNf3jMCAZ0bIPAvK70HLBnNyTxJv1bbX2BXUFF2+EHd5cbcWAIDAwUmWSOB7VnnXJ5Iyjo6/ychP3WEZSNzpkmzIxzihpt0ieh+9hP9aporqtq+AHfMc88vLaaNQBoxMfvjwAPJpbtaRcgG8RseSApb8ZLTTrLx/+GnbNBaittzrShZ4MK+axPyRgV2VJ0ZWO9wCWtxoWyhyioEFGpAkfJ+/gO4CQbBVhh1d7l7ker9csEMB+2afIDjWWl0dcwpuyAtJYQOrNcg+6NcZ4XPSoVa4QE6EXOx8+lZQbEIdlcb4/WQFYSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jGU/WiAP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jGU/WiAP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpWDP4fg1z2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 09:56:36 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-acec5b99052so228516166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746143791; x=1746748591; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpqcdB5HKLcvCClWag1YAOoCR5dOaM4sia0jSQ91WTc=;
        b=jGU/WiAPt7l3gxxPSluXhLVtEtUEggLSspMvzllyS27d6MgTJFoFW67cvqNLXxrxNl
         w22H546dOYeNKS7eFi1WWBeEC/Kj1JF/TYIXPsCfLkoH6r3Ox4Ahh26429AVgjmplXWJ
         dcPCByptiPa9oZcOqfcdYwffZrIEZLbR5FAE0FF9aTsIl6wS+Fs/kR0tGZprAUjAgUeV
         u3CWYX/eaYSVC2qo6v1sXnITCi2ge89pRFAHdIKnTed9cnGBM0Q0qzsogItfO0GZOsvp
         JYL/UNHoOR6+l/l8l3Lzov6SZMBcJ7Af9fAoWMWJHo4ixVpyeuwvbGCMECADTr0CFsSi
         k3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143791; x=1746748591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpqcdB5HKLcvCClWag1YAOoCR5dOaM4sia0jSQ91WTc=;
        b=QETNQGdJP7UJ6QRlInlux83EXaPjVYl3tT0wPNaxiji3dpuQSpAfNmMAMpcTQdyBF3
         hg3WgW6cpcA61KWLXgZTvb2YlETCY32aXLjASTpeYjc3T/sg2gpmR9TsISSvi2o2MIEn
         Tm9eDKdGdMw5Yrd59FUliacxpIcC3mpZcwoYwTXH6Br6evgh5zRlUciV26FTI6mowhXG
         HnFNbJB1sVMUkS76m7K9a5iJgELDe8FtqBl7lX7t5BOVYtKPzpCAPfClQM/wXoJEeSNq
         W1ZFDq/35Dbt7t5aKzCZnuVVdLri5BSrHGUtN9YjsVI/NdAAdbnBf2+DyITcjQnHfNmS
         Xljg==
X-Forwarded-Encrypted: i=1; AJvYcCWrUZGRY67Thz2/9hZngwpv071txgJhC8hGgQU6p8A3b8JYAPIKXund/EFyWuPExXqon4YqBDdmoR3CahM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyflGNaOcgwAIw2qMoQwjC/kBRXJUUF7ncJaE2dMw5oA7r5GGdo
	M1EM6eLNeih5KdMDUmn1fuDd16Vgzrzgis8/hN57gzt4f0N8gFfaVIEOtbyhQwog7x4rWoaLGws
	QkAP5TqdjQNTNO4NTVcAi2FTQEWw=
X-Gm-Gg: ASbGncu3+euQNBJITrCmBM2wFSA6+r/L3MA4Tmfpj+o3YiQPyB/PW04fkKfIBXn7yJY
	QpmsHlOPRfsuMkHZq39B+jSw8ggy3nwRbnjMbUYRrv85oYdMc8Tu0RY/ZNJsJcJGdpUu0zLtrGx
	He7quIzF5umLwrvCe4XF2YC1cOPlzDQiojEqJjrDDw6c0huMtAV5BfeA==
X-Google-Smtp-Source: AGHT+IE8rFYVy5AEV69cNgB7LjR9j9JDMd63wN3Vtcz9MvmQSCvUFlM2VwRHa8i1gy3jD9Ei18VDPKGcCjJ/nJCaAQ0=
X-Received: by 2002:a17:907:a587:b0:ac7:3912:5ea5 with SMTP id
 a640c23a62f3a-ad17af80715mr93822666b.58.1746143791303; Thu, 01 May 2025
 16:56:31 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-9-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-9-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 01:55:54 +0200
X-Gm-Features: ATxdqUGuoTBKs9l0zhe3Yzsic4wyHg46bSXEHmrxNhmAcDg2gPFfcMFHEjWXEc4
Message-ID: <CAP01T76kOixPct5cOPHGKubFWSbSS7ztEnZc02v2wWGPOUYRCQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 08/11] bpf: Fall back to nospec for Spectre v1
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 1 May 2025 at 10:00, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This implements the core of the series and causes the verifier to fall
> back to mitigating Spectre v1 using speculation barriers. The approach
> was presented at LPC'24 [1] and RAID'24 [2].
>
> If we find any forbidden behavior on a speculative path, we insert a
> nospec (e.g., lfence speculation barrier on x86) before the instruction
> and stop verifying the path. While verifying a speculative path, we can
> furthermore stop verification of that path whenever we encounter a
> nospec instruction.
>
> A minimal example program would look as follows:
>
>         A = true
>         B = true
>         if A goto e
>         f()
>         if B goto e
>         unsafe()
> e:      exit
>
> There are the following speculative and non-speculative paths
> (`cur->speculative` and `speculative` referring to the value of the
> push_stack() parameters):
>
> - A = true
> - B = true
> - if A goto e
>   - A && !cur->speculative && !speculative
>     - exit
>   - !A && !cur->speculative && speculative
>     - f()
>     - if B goto e
>       - B && cur->speculative && !speculative
>         - exit
>       - !B && cur->speculative && speculative
>         - unsafe()
>
> If f() contains any unsafe behavior under Spectre v1 and the unsafe
> behavior matches `state->speculative &&
> error_recoverable_with_nospec(err)`, do_check() will now add a nospec
> before f() instead of rejecting the program:
>
>         A = true
>         B = true
>         if A goto e
>         nospec
>         f()
>         if B goto e
>         unsafe()
> e:      exit
>
> Alternatively, the algorithm also takes advantage of nospec instructions
> inserted for other reasons (e.g., Spectre v4). Taking the program above
> as an example, speculative path exploration can stop before f() if a
> nospec was inserted there because of Spectre v4 sanitization.
>
> In this example, all instructions after the nospec are dead code (and
> with the nospec they are also dead code speculatively).
>
> On x86_64, this depends on the following property of lfence [3]:
>
>         An LFENCE instruction or a serializing instruction will ensure that no
>         later instructions execute, even speculatively, until all prior
>         instructions complete locally. [...] Inserting an LFENCE instruction
>         after a bounds check prevents later operations from executing before
>         the bound check completes.
>
> Regarding the example, this implies that `if B goto e` will not execute
> before `if A goto e` completes. Once `if A goto e` completes, the CPU
> should find that the speculation was wrong and continue with `exit`.
>
> If there is any other path that leads to `if B goto e` (and therefore
> `unsafe()`) without going through `if A goto e`, then a nospec will
> still be needed there. However, this patch assumes this other path will
> be explored separately and therefore be discovered by the verifier even
> if the exploration discussed here stops at the nospec.
>
> This patch furthermore has the unfortunate consequence that Spectre v1
> mitigations now only support architectures which implement BPF_NOSPEC.
> Before this commit, Spectre v1 mitigations prevented exploits by
> rejecting the programs on all architectures. Because some JITs do not
> implement BPF_NOSPEC, this patch therefore may regress unpriv BPF's
> security to a limited extent:
>
> * The regression is limited to systems vulnerable to Spectre v1, have
>   unprivileged BPF enabled, and do NOT emit insns for BPF_NOSPEC. The
>   latter is not the case for x86 64- and 32-bit, arm64, and powerpc
>   64-bit and they are therefore not affected by the regression.
>   According to commit a6f6a95f2580 ("LoongArch, bpf: Fix jit to skip
>   speculation barrier opcode"), LoongArch is not vulnerable to Spectre
>   v1 and therefore also not affected by the regression.
>
> * To the best of my knowledge this regression may therefore only affect
>   MIPS. This is deemed acceptable because unpriv BPF is still disabled
>   there by default. As stated in a previous commit, BPF_NOSPEC could be
>   implemented for MIPS based on GCC's speculation_barrier
>   implementation.
>
> * It is unclear which other architectures (besides x86 64- and 32-bit,
>   ARM64, PowerPC 64-bit, LoongArch, and MIPS) supported by the kernel
>   are vulnerable to Spectre v1. Also, it is not clear if barriers are
>   available on these architectures. Implementing BPF_NOSPEC on these
>   architectures therefore is non-trivial. Searching GCC and the kernel
>   for speculation barrier implementations for these architectures
>   yielded no result.
>
> * If any of those regressed systems is also vulnerable to Spectre v4,
>   the system was already vulnerable to Spectre v4 attacks based on
>   unpriv BPF before this patch and the impact is therefore further
>   limited.
>
> As an alternative to regressing security, one could still reject
> programs if the architecture does not emit BPF_NOSPEC (e.g., by removing
> the empty BPF_NOSPEC-case from all JITs except for LoongArch where it
> appears justified). However, this will cause rejections on these archs
> that are likely unfounded in the vast majority of cases.
>
> In the tests, some are now successful where we previously had a
> false-positive (i.e., rejection). Change them to reflect where the
> nospec should be inserted (using __xlated_unpriv) and modify the error
> message if the nospec is able to mitigate a problem that previously
> shadowed another problem (in that case __xlated_unpriv does not work,
> therefore just add a comment).
>
> Define SPEC_V1 to avoid duplicating this ifdef whenever we check for
> nospec insns using __xlated_unpriv, define it here once. This also
> improves readability. PowerPC can probably also be added here. However,
> omit it for now because the BPF CI currently does not include a test.
>
> Briefly went through all the occurrences of EPERM, EINVAL, and EACCESS
> in the verifier in order to validate that catching them like this makes
> sense.
>
> [1] https://lpc.events/event/18/contributions/1954/ ("Mitigating
>     Spectre-PHT using Speculation Barriers in Linux eBPF")
> [2] https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and
>     Precise Spectre Defenses for Untrusted Linux Kernel Extensions")
> [3] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/runtime-speculative-side-channel-mitigations.html
>     ("Managed Runtime Speculative Execution Side Channel Mitigations")
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

The patches from here on look good in general, I will ack after taking
another look later.

I had a more high-level question though.
Back when all of this surfaced, compiler folks came up with another
solution, to rely on Intel's guarantee that conditional moves are not
predicted.

if (condition) {
   mask = !condition ? 0UL : ~0UL; // CMOVcc
   ptr &= mask;
   x = *ptr;
}

In case the condition being true in the speculative domain leads to
problems, the speculative domain will just read from NULL and not leak
sensitive data.
The assumption is that cost of instrumentation in speculative domain <
completely stalling it until prior instructions are done using lfence.
So speculation is still helpful when the branch is not mispredicted.
Now I imagine it's not fun to do such analysis in the verifier (I've
tried), but theoretically we could break it down into emitting
bytecode from the compiler side, and lifting the compiler to do it for
us, and ensuring the end result produced is sane (by still following
speculative paths) from the verifier.

You talk about this in the paper and in the presentation as future work.
My question is mainly whether you considered implementing this, if
yes, what made you choose a nospec barrier over something like above?
Was it the complexity of realizing this during verification?
Are there any implications of reading from NULL that would cause problems?
Also, did you characterize how much difference it could make?
The drop in SCTP throughput seems to suggest so, since CPU-bound
computation was moved into the program.
Otherwise most programs mostly defer to helpers for heavy lifting.
Not that it was as fast as a helper would be, even without nospec, but still.

Also a bit sad we don't split the program into BBs already, which
could help reduce your mitigation's cost + plus also reduce cost of
instruction patching (unrelated).

Anyway, all that said, this is valuable stuff, so I was just curious.

