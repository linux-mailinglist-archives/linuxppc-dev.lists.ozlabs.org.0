Return-Path: <linuxppc-dev+bounces-8560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D3AB6276
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 07:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy2G50jyBz2yqv;
	Wed, 14 May 2025 15:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::642"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747201149;
	cv=none; b=bk+h9lfqbg5v0ZKC2otvbYIEB0rM/uD2UXyZVRBu79w7/XlUaYIVXwvwsSRUc+tEyvCDzIjPI4IWogW/k+I33cUUUtD38yXaRx+Cvr0/7jNNcQAAJPTkhDvZrgwgxhVMjTFFCLHFScBhuOeL1uYcPXgP7B2s4TfHiG2IlxSZHa4lfrhAVYYKiHd1RMqNBvUXebsy2CVSNttUCCcMow/6dT7gL79Vh+snRL+hPaG1quzhIPv5WcoMNzSQbB8UYDYlKvM7IgdsXOauRHRCniMAQgG4leWL+g+/+2ujSoesquZfa9t8rtOj2plp/VGAvtlmwEWetbt4z0i/hvW+RMKdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747201149; c=relaxed/relaxed;
	bh=rRHcD4o64kpkrmiebc0+P3XyihTjZVS84d+OLMuKgu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coWRJpnGsH00oS0e+0TafUEp17yyX7aAIPmqu51IQOAknurr4b0vuRSbglfE1MOsoUU3EInJx68TIAp1qcGiNZx0OYTlt0HbOhqBeEgH3cuRhaS6ivY42bEtgcKdCIMOKVeTQNPb8AzD8WYsExDjuERdBiRiwjaxqb4gb0Np7Ke+sFW9Agd7na/rVMQwgc/FjBbzkSSbkVDlIAU7LeXUvO/8AhrDStLAgQah/UzZmsmOonmPsvRdUO5X5wZD5DZGEEkCsPOcxJGfGTIgbcRAcWCUReXKIbThU0HqSUlCV5N/gTyri1hp9dRSo7DCwnRIOuAq8V8EtwzBl4dWoQAQMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+alJvrJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+alJvrJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy2G236Gqz2yqm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 15:39:05 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ad241baf856so103744166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 22:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747201141; x=1747805941; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rRHcD4o64kpkrmiebc0+P3XyihTjZVS84d+OLMuKgu0=;
        b=D+alJvrJxRBf1TFgOQuwoZ46A4hHfYcj+abjhY5Y7eofNuADazzbjJErNBTsVzBc6J
         WAl8UkBMul2GIVNkS0hduZNAb5OykiC5zzJMlWc7Ath1UTyjSQjDPw5wyu6BO0Gum4K9
         R/w4Sowb0ppZcOd0IWhd3Vm1FysvRxAp9sk2my8UgfYhQ6gQIrhEJyJDDirqq1A98UUB
         KAydKXS4dqQEixOWFGLR0y+OuNwxKuqQV3PAGUKfu90ifX+lN0aDd0qz5HILBQY1DPxr
         +icpEQaY3uueE9hq1nV8aRJy7BqbM6BkgsheLySFHDxbFDwYiB+UIt3erWuW7xL5qUPc
         r25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747201141; x=1747805941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRHcD4o64kpkrmiebc0+P3XyihTjZVS84d+OLMuKgu0=;
        b=lAQxI/wdVawWwPg4BHHu00ZGGUw8prn1uU/Nfj0VT3ZzmjuWWS40iJPyCIt3xokAkf
         I9KvK3dSs5t6JfGY8QcbrdTSR5svxDAhg6fccUZMTmMS9zxjqfI7BPWCuUL+/SBjKV2B
         bJrUJcm5BUxQVa/1XK6Elh8iZGK4lJ3wacSvFQ+IPhNwsf+CIS9MJ173PaSRFtOHjZEi
         GhzS9gixvxb+DC6bdUw/3O8sgB/RBhEp5WNNG/qu+0YSFFmLUl5QKPyYkAe+yjAYsHnr
         S6it1lKro/XZsApBoR3yhfCh79LMK5dq+Y64n3A+kyHgPYZlBLf7en/Pe/sqlLfUVNwq
         PM9w==
X-Forwarded-Encrypted: i=1; AJvYcCVUFjKpB7I+X5PlI/T7B1fFxKEfarnJ1nSCv93dUTWYNIWri9ZRC6TELKOEWdv5lcFzmz1Ei4adgIQtuRA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzo8DHVAQIp70jDXOvoy5H9es5qOdGIkS6+CXq6H6TdXMcqnrr0
	9I4k47oyZVzqjZzSqjlP1gIdc67zQs33ZtRuwSE3JNCmZ43RyzDc2r8cTSJTJsUAjT41NUNnxT+
	r9xdaUVelQ2ohkMGGpE7lf0gfZWw=
X-Gm-Gg: ASbGncsDyqG+nPwu/01Kvkndf2ckzG3EvBIljZRX0/9czH5bvrpWmZt+x391QCRqhrB
	+pv4+S9ZOVIhhIY73QFMcj0jdAeVkPU1aKPugHYN/IEaTQjufXfOeqguTrcyNfkWqypY6c52Ned
	Jh/gj0J8mlOyloSav49XfZJ+jiUkAy2pM=
X-Google-Smtp-Source: AGHT+IE1CqX0NBMok/Qu/kKHdiB+296j6U4L2iZuYAqefZDP7cDedLQUlSzfA5SJyR8b9OMIRCnTZEuWb3yEfQO1HXk=
X-Received: by 2002:a17:907:1c9c:b0:ad1:ff5f:1460 with SMTP id
 a640c23a62f3a-ad4d4cd6334mr650602666b.6.1747201140708; Tue, 13 May 2025
 22:39:00 -0700 (PDT)
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
Date: Wed, 14 May 2025 01:38:24 -0400
X-Gm-Features: AX0GCFsZdtgAVwNSl7_yfp7bxkIRg361n-aA3yvBc34WlsCAzIMW4XH9M0yyf_U
Message-ID: <CAP01T75y4GuYp-X9x1eGA2s1+eGnVNFoCrf_o5f22Qs-MNAo6A@mail.gmail.com>
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

On Thu, 1 May 2025 at 04:00, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
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

Some comments below, but:

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>  include/linux/bpf_verifier.h                  |  1 +
>  kernel/bpf/verifier.c                         | 78 ++++++++++++++++++-
>  tools/testing/selftests/bpf/progs/bpf_misc.h  |  4 +
>  .../selftests/bpf/progs/verifier_and.c        |  8 +-
>  .../selftests/bpf/progs/verifier_bounds.c     | 61 ++++++++++++---
>  .../selftests/bpf/progs/verifier_movsx.c      | 16 +++-
>  .../selftests/bpf/progs/verifier_unpriv.c     |  8 +-
>  .../bpf/progs/verifier_value_ptr_arith.c      | 16 +++-
>  .../selftests/bpf/verifier/dead_code.c        |  3 +-
>  tools/testing/selftests/bpf/verifier/jmp32.c  | 33 +++-----
>  tools/testing/selftests/bpf/verifier/jset.c   | 10 +--
>  11 files changed, 184 insertions(+), 54 deletions(-)
>
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index cebb67becdad..f1573e093120 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -576,6 +576,7 @@ struct bpf_insn_aux_data {
>         u64 map_key_state; /* constant (32 bit) key tracking for maps */
>         int ctx_field_size; /* the ctx field size for load insn, maybe 0 */
>         u32 seen; /* this insn was processed by the verifier at env->pass_cnt */
> +       bool nospec; /* do not execute this instruction speculatively */
>         bool nospec_result; /* result is unsafe under speculation, nospec must follow */
>         bool zext_dst; /* this insn zero extends dst reg */
>         bool needs_zext; /* alu op needs to clear upper bits */
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 1e1eca85b7a6..db26b477dd45 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -2014,6 +2014,18 @@ static int pop_stack(struct bpf_verifier_env *env, int *prev_insn_idx,
>         return 0;
>  }
>
> +static bool error_recoverable_with_nospec(int err)
> +{
> +       /* Should only return true for non-fatal errors that are allowed to
> +        * occur during speculative verification. For these we can insert a
> +        * nospec and the program might still be accepted. Do not include
> +        * something like ENOMEM because it is likely to re-occur for the next
> +        * architectural path once it has been recovered-from in all speculative
> +        * paths.
> +        */
> +       return err == -EPERM || err == -EACCES || err == -EINVAL;
> +}

Why can't we unconditionally do this? So the path with speculation
that encounters an error (even if EFAULT) is not explored for the
remaining pushed speculative states. If the error remains regardless
of speculation normal symbolic execution will encounter it. The
instructions only explored as part of speculative execution are not
marked as seen (see: sanitize_mark_insn_seen), so they'll be dead code
eliminated and the code doesn't reach the JIT, so no "unsafe gadget"
remains in the program where execution can be steered.

So the simplest thing (without having to reason about these three
error codes, I'm sure things will get out of sync or we'll miss
potential candidates) is probably to just unconditionally mark
cur_aux(env)->nospec.

> +
>  static struct bpf_verifier_state *push_stack(struct bpf_verifier_env *env,
>                                              int insn_idx, int prev_insn_idx,
>                                              bool speculative)
> @@ -11160,7 +11172,7 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
>         return -ENOTSUPP;
>  }
>
> -static struct bpf_insn_aux_data *cur_aux(struct bpf_verifier_env *env)
> +static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
>  {
>         return &env->insn_aux_data[env->insn_idx];
>  }
> @@ -13997,7 +14009,9 @@ static int retrieve_ptr_limit(const struct bpf_reg_state *ptr_reg,
>  static bool can_skip_alu_sanitation(const struct bpf_verifier_env *env,
>                                     const struct bpf_insn *insn)
>  {
> -       return env->bypass_spec_v1 || BPF_SRC(insn->code) == BPF_K;
> +       return env->bypass_spec_v1 ||
> +               BPF_SRC(insn->code) == BPF_K ||
> +               cur_aux(env)->nospec;
>  }
>
>  static int update_alu_sanitation_state(struct bpf_insn_aux_data *aux,
> @@ -19687,10 +19701,41 @@ static int do_check(struct bpf_verifier_env *env)
>                 sanitize_mark_insn_seen(env);
>                 prev_insn_idx = env->insn_idx;
>
> +               /* Reduce verification complexity by stopping speculative path
> +                * verification when a nospec is encountered.
> +                */
> +               if (state->speculative && cur_aux(env)->nospec)
> +                       goto process_bpf_exit;
> +
>                 err = do_check_insn(env, insn, &do_print_state);
> -               if (err < 0) {
> +               if (state->speculative && error_recoverable_with_nospec(err)) {
> +                       /* Prevent this speculative path from ever reaching the
> +                        * insn that would have been unsafe to execute.
> +                        */
> +                       cur_aux(env)->nospec = true;
> +                       /* If it was an ADD/SUB insn, potentially remove any
> +                        * markings for alu sanitization.
> +                        */
> +                       cur_aux(env)->alu_state = 0;
> +                       goto process_bpf_exit;
> +               } else if (err < 0) {
>                         return err;
>                 } else if (err == PROCESS_BPF_EXIT) {
> +                       goto process_bpf_exit;
> +               }
> +               WARN_ON_ONCE(err);
> +
> +               if (state->speculative && cur_aux(env)->nospec_result) {
> +                       /* If we are on a path that performed a jump-op, this
> +                        * may skip a nospec patched-in after the jump. This can
> +                        * currently never happen because nospec_result is only
> +                        * used for the write-ops
> +                        * `*(size*)(dst_reg+off)=src_reg|imm32` which must
> +                        * never skip the following insn. Still, add a warning
> +                        * to document this in case nospec_result is used
> +                        * elsewhere in the future.
> +                        */
> +                       WARN_ON_ONCE(env->insn_idx != prev_insn_idx + 1);

Nice!

>  process_bpf_exit:
>                         mark_verifier_state_scratched(env);
>                         update_branch_counts(env, env->cur_state);
> @@ -19709,7 +19754,6 @@ static int do_check(struct bpf_verifier_env *env)
>                                 continue;
>                         }
>                 }
> -               WARN_ON_ONCE(err);
>         }
>
>         return 0;
> @@ -20838,6 +20882,29 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
>                 bpf_convert_ctx_access_t convert_ctx_access;
>                 u8 mode;
>
> +               if (env->insn_aux_data[i + delta].nospec) {
> +                       WARN_ON_ONCE(env->insn_aux_data[i + delta].alu_state);
> +                       struct bpf_insn patch[] = {
> +                               BPF_ST_NOSPEC(),
> +                               *insn,
> +                       };
> +
> +                       cnt = ARRAY_SIZE(patch);
> +                       new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
> +                       if (!new_prog)
> +                               return -ENOMEM;
> +
> +                       delta    += cnt - 1;
> +                       env->prog = new_prog;
> +                       insn      = new_prog->insnsi + i + delta;
> +                       /* This can not be easily merged with the
> +                        * nospec_result-case, because an insn may require a
> +                        * nospec before and after itself. Therefore also do not
> +                        * 'continue' here but potentially apply further
> +                        * patching to insn. *insn should equal patch[1] now.
> +                        */
> +               }
> +
>                 if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
>                     insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
>                     insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
> @@ -20888,6 +20955,9 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
>
>                 if (type == BPF_WRITE &&
>                     env->insn_aux_data[i + delta].nospec_result) {
> +                       /* nospec_result is only used to mitigate Spectre v4 and
> +                        * to limit verification-time for Spectre v1.
> +                        */
>                         struct bpf_insn patch[] = {
>                                 *insn,
>                                 BPF_ST_NOSPEC(),
> diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
> index 863df7c0fdd0..97c727ab81be 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_misc.h
> +++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
> @@ -230,4 +230,8 @@
>  #define CAN_USE_LOAD_ACQ_STORE_REL
>  #endif
>
> +#if defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86)
> +#define SPEC_V1
> +#endif
> +
>  #endif
> [...]

