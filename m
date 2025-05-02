Return-Path: <linuxppc-dev+bounces-8239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D5AA69DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 06:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpdTS3PZgz30DP;
	Fri,  2 May 2025 14:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::541"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746144235;
	cv=none; b=S8hsMXiW4vrePhtVct3lWF0CyhTAFCkxDDBAPHXC1NYSvGIPPBvmG+HjjEuQjyYp3FEtMIypU1UjqIdW0MeynsqvQ9kSFk6jDj4WEBsY4d+1eIHT3/uPVdkF/CixZ3C9RJj8az3Rxv8EP6OpAV5L859Xjn+FRlhcXBcLPjDv02jPKcxOAbiLs8d5Ghmuokda8DkzlgwYBTYN4KfMHRXryZoAevOgAbWYqnwVP29PDYFvmenETPtatc9HO8D9kZwetdcyXQnTQ0Z22TWT7gGf99cF5tam/fDx+pOAA5at0Mri8MT4AZEzr375BePPotdPQi1jilVzDOm6+hvD3Q2BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746144235; c=relaxed/relaxed;
	bh=BAdrSpHVasOUL/GpRMRQtUO4sMi+w7FhQalzllF+FBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUrQbl6XP1WVJRVfX8WcUnHsJuXARScFWMG7zqeGD4LzfUsj1zwqZ6dTUaYDtEf3xO1FBhheqSfFHnF2uDNc3THmrq0a8ml/hlFktF94gfvV/yq3/H9KfHaFH+3tlvJTbaG2GB4fGO1DO1M9FSX72pNTrSv+Y/xxrFAVZCwzpoR0d9H4EIFu0p7ra2QpaV5FU17SdFI28YuD97UeHTC+W+d2UXRkquMsxTQgEAcrZi75D6qHeqANZq4KHI892/yCTc+zjbj/bWut3QUjXfpgTepni1mjIvUc6N/CUcV7MWknAO6aTUsPhJvFb90JJ2OfrPUxRAGQf6OMKEVjvJN+wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y05uXiWM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y05uXiWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpWNm5mT5z2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 10:03:51 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso2636729a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 17:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746144229; x=1746749029; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAdrSpHVasOUL/GpRMRQtUO4sMi+w7FhQalzllF+FBE=;
        b=Y05uXiWMMorYM9tsBxkdfLOXacpiCTw4YUOeOiDfP7XhP4P2K5yxLPxmBaGAkuUpEM
         7pfdugFzKAYSFnOn4pibClAhVsTr9QqXMqLMHWs3Z1clFe8VYGC5IhnX/3tsbU8fDQm/
         WkCsbDoAp5J7Q1kVK20R1drPuhNcl7cERr7BKVO/ygUNdmX6CyU3H2F5Ke1qeyW9vUNU
         9jKoL7D0j+ETJN978YP0+jqqif+l0FELgi/fNKwatPuahC8ZRneq5RbPABYvzlqlHkQ9
         +aOof62lpdgPbxhLYrSK8v2oTu9Sam6r88No8xX6emSzaVkti5iN7kHq54Lggf6YXXRV
         OdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746144229; x=1746749029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAdrSpHVasOUL/GpRMRQtUO4sMi+w7FhQalzllF+FBE=;
        b=cI6RIh01cAgh4AccRd2tWfGPLqUIBakG8iaZsr9C1Gj/yDcPGXJLB77CTZz5bZStRz
         WbsahzmBr5HK3SUjLmELfw3+qSkRObqjdA51gFaMJnT/Bf6UpLBah4IyFmOqBKNIjzml
         XDWnEIPvEtE9XAC3ET6RsHnmWJjC24ltppn0XLccEyaW1hrykEwpP7VC+atjE6VNUs5t
         f4qNGOCFJpvu/vf3f7F/yPmev3R6s44jOtR5WFuOhkPqoCXWDFP6hw2O1HbyQoVSSyLY
         ZBQzRP7KA5HOW/UqS9DrsolPHypWr1NqSC121UA+fDm/xPZ/8ddhT8g2Cprd39rBXY7a
         /wXg==
X-Forwarded-Encrypted: i=1; AJvYcCVigbZn/bDXxQ545ulLLBsGbotvTzSXEKYVE30MWXMr9jO5hVR7zZrIqINazTuCgojzoIaRqbMLW2IdIhA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4SVfOWyjS+aYBE7wS3XbO4M7mw6tWcMG+lgBCfbQhP5U2jd+e
	6dy1iX8Kzm45gGEOS27aqgR2SOI498U+hKCPpdV+WSYydTlhHxV+ceCkYRiQozzgjL0S8XdVu/r
	T5eTR8r8zh8fNlaRdMyKPdH712/Q=
X-Gm-Gg: ASbGncsxFgnHPAOn/devLslRNoCIfHhI4rZTEyJC07uesK339GJvLkPeyhVdn0O8pjb
	ZCoj2vmV91vUy9C236KjxJhmL8AjJ92IkJe+Om2KeQAWrfQ+waE7q1uh3F9UppeSdp5kjH3Mh4e
	NRt1YdayY9V/GV8SDlqXrO3bioWbtqkn39vRYd1r1HgiI=
X-Google-Smtp-Source: AGHT+IEZmaXKlPg2SX6D1Gg4Ct+dglKTu1NfoiUsMrHJ97ikPtGkPZ2woUqGvcz2mbdKYLABZveqW+MvsUkMW/lyo9o=
X-Received: by 2002:a05:6402:51d3:b0:5ec:fb3d:f51f with SMTP id
 4fb4d7f45d1cf-5fa78006329mr578324a12.10.1746144228590; Thu, 01 May 2025
 17:03:48 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-11-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-11-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 02:03:12 +0200
X-Gm-Features: ATxdqUHVm1hIS_v_8Z_z0qlxAyMnE3MrBINfcmLce0vU9ymsmOtLw6c47Fn4EGE
Message-ID: <CAP01T76HZ+s5h+_REqRFkRjjoKwnZZn9YswpSVinGicah1pGJw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 10/11] bpf: Allow nospec-protected var-offset
 stack access
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

On Thu, 1 May 2025 at 10:17, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Insert a nospec before the access to prevent it from ever using an index
> that is subject to speculative scalar-confusion.
>
> The access itself can either happen directly in the BPF program (reads
> only, check_stack_read_var_off()) or in a helper (read/write,
> check_helper_mem_access()).
>
> This relies on the fact that the speculative scalar confusion that leads
> to the variable-stack access going OOBs must stem from a prior
> speculative store or branch bypass. Adding a nospec before the
> variable-stack access will force all previously bypassed stores/branches
> to complete and cause the stack access to only ever go to the stack slot
> that is accessed architecturally.
>
> Alternatively, the variable-offset stack access might be a write that
> can itself be subject to speculative store bypass (this can happen in
> theory even if this code adds a nospec /before/ the variable-offset
> write). Only indirect writes by helpers might be affected here (e.g.,
> those taking ARG_PTR_TO_MAP_VALUE). (Because check_stack_write_var_off()
> does not use check_stack_range_initialized(), in-program variable-offset
> writes are not affected.) If the in-helper write can be subject to
> Spectre v4 and the helper writes/overwrites pointers on the BPF stack,
> they are already a problem for fixed-offset stack accesses and should be
> subject to Spectre v4 sanitization.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---
>  kernel/bpf/verifier.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index db26b477dd45..1fbafea3ed69 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -7894,6 +7894,11 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
>         }
>  }
>
> +static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
> +{
> +       return &env->insn_aux_data[env->insn_idx];
> +}
> +
>  /* When register 'regno' is used to read the stack (either directly or through
>   * a helper function) make sure that it's within stack boundary and, depending
>   * on the access type and privileges, that all elements of the stack are
> @@ -7933,18 +7938,18 @@ static int check_stack_range_initialized(
>         if (tnum_is_const(reg->var_off)) {
>                 min_off = max_off = reg->var_off.value + off;
>         } else {
> -               /* Variable offset is prohibited for unprivileged mode for
> +               /* Variable offset requires a nospec for unprivileged mode for
>                  * simplicity since it requires corresponding support in
>                  * Spectre masking for stack ALU.
>                  * See also retrieve_ptr_limit().
>                  */
>                 if (!env->bypass_spec_v1) {
> -                       char tn_buf[48];
> -
> -                       tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
> -                       verbose(env, "R%d variable offset stack access prohibited for !root, var_off=%s\n",
> -                               regno, tn_buf);
> -                       return -EACCES;
> +                       /* Allow the access, but prevent it from using a
> +                        * speculative offset using a nospec before the
> +                        * dereference op.
> +                        */
> +                       cur_aux(env)->nospec = true;
> +                       WARN_ON_ONCE(cur_aux(env)->alu_state);
>                 }
>                 /* Only initialized buffer on stack is allowed to be accessed
>                  * with variable offset. With uninitialized buffer it's hard to
> @@ -11172,11 +11177,6 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
>         return -ENOTSUPP;
>  }

Hmm, while reading related code, I noticed that sanitize_check_bounds
returns 0 in case the type is not map_value or stack.
It seems like it should be returning an error, cannot check right now
but I'm pretty sure these are not the two pointer types unprivileged
programs can access?
So smells like a bug?

>
> -static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
> -{
> -       return &env->insn_aux_data[env->insn_idx];
> -}
> -
>  static bool loop_flag_is_zero(struct bpf_verifier_env *env)
>  {
>         struct bpf_reg_state *regs = cur_regs(env);
> --
> 2.49.0
>
>

