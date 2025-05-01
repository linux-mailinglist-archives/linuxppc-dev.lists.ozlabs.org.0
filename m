Return-Path: <linuxppc-dev+bounces-8234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE9BAA665A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 00:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpTb80XKXz2ySf;
	Fri,  2 May 2025 08:42:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::543"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746137725;
	cv=none; b=F0q0qgC0rPA5rooGT078PkclFdUwrUFCo+xpxJ9Vx95TFzjRkbOWIjCBUZ1hK64xEsIsLByhW/Jocqv9wTZm02JFnERB9mS5n3MjC5iQ9ejqtxEhE0XbZr904Z3xXAkrBIIgHRID/GGH4iB8leA0YvzsFZb0vZ9GxP1jcycVbuBDiUbLPLn1LdUgEo2noqmlHgXN8Ki1MlI7c1Pup3kBT+IetX8F/3JjsTw/AikUIwNe1XNPs/HyHVaNGayP/cN2QSdC9bH6FxrTdJlGus2/Peu6HFrDxLpZ0Iku3nNjeT30ACWcFL27ChBVj+rDYHD9kn1C0vy+XtDOHAfACbRZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746137725; c=relaxed/relaxed;
	bh=/7Mfr+YCIEUC+WGMETL1yHxE2lGiThA8SMe4ul3SumM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crK7Ua4VmjCFpVRMbFiXpGbDrXMXgHtq9/oAWEoArXZCYeQBwDg3MzDcdJ0/0KShG+MYoUU9dHhlGv2Qy29RxBCTeB6yuEEAubRaFjDE3CKgSgTUay+te7xDB4K3oSFi9Uu9spCIA033yZt+HowRwjRrLlByjySEuv5fE+xDCV0f0qBuzsXUhsOZKfURdNuzG8ZC4T/sAVmEt9CYsT2guC0R5MGpupP0gdkSWBpx38/2P86naBJcLgsaCABdDqC28B+3u3HnQgHXP8ekpNI7Jvnknr4d07puzQPjz76laMrY8MF+KH4zWR6gARfuMn0qCbRUV4LnK9gXWBFzyA/w7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V2vC6bJi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V2vC6bJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpSzc1RLBz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 08:15:22 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso2706091a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 15:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137720; x=1746742520; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Mfr+YCIEUC+WGMETL1yHxE2lGiThA8SMe4ul3SumM=;
        b=V2vC6bJi3/gHY/SDRMhG7pcrtK8xk+g6FpUjRwFdK5+/FEJ31IpZTgqOmkwX1XVUAh
         ckKGKquWuVCiE3bM+6KnPMQ2sz4O1ssYdAA1ZpvKVrRLfr+KeAglfDyX8ntB9SqTvi6g
         g2z6+OkwhU23hOj8jL7MUpxsL/EsnzikHnlI7TV9EUiAa2TtAVVJ4BfcMNdEahO35O92
         Yz6PSEmFMJzfTOZ0lLZsr323iZ90Y0ZagAVMqxZhcJ9A23ATf2oWpbeNEEPmEzfCOSAj
         z3K8uLG1zLqqsFXw5ClYBcCGVs/bkcEwz2fT4rCU8hS/uBn41KWbUjfIIz2m5ryVtflc
         unhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137720; x=1746742520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7Mfr+YCIEUC+WGMETL1yHxE2lGiThA8SMe4ul3SumM=;
        b=SUDzt7jWFgJBfYrB1mOnO8J9gpXh7u0m6g2fINl/MQsehF0fUt6fYDvuZazm+6hvBB
         Dez5T2km1+wzFlzYXj0VUWdmgvnPYbkPBnJFlb5YO7hGf4tq8dWOOQknTsvdZzydqS0K
         Z4In73sISJLaT5UV+vOeu2MRzWANqvxTGHcc/kSLuYNyc8C6pVPHvkVvqQoDE40TRa22
         Vmdnwxq+FESof+T9Ydwk4U9haEJ2Dd4sY7xP7MGw0prpPW9OBttQ6KjKPere0tzmvJ+r
         fRqubkbrSQytF+LLxKDb5xoi2xyezk8GFAKqQN/BCH8ALrMfLIFEUg2ElMcnY9riqCDe
         U7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXSMO6tN8lcL0cG9pIkUeBwdFgtd50Bk/UDh7hPQnkYLnqydHBgtNRJUtizCbITISarFAeir7Ald7Ll1Cs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5PQqXtFKssRLY6kf8mBJasj0hWvZ79c5QoSzjj2+hWLQv7oPT
	ZR7uZqkbeDDmC+JDXhQBH2VQCVgcetb05LBT3zzE7OzMJhuvOruBk8h0kDhB2KqIbXgleA72mvj
	MA2Wgz19MjCNxxN7E7oFb2XZcD1o=
X-Gm-Gg: ASbGnctGadnwQ/pAhtVgVAYd4yzStx1mndo5GIRHR2fns1Ra3q7RX/x+KM4PPhKip3G
	2nYGNE+xec/aGFNXZOCdMIwzxamcLg/4yrA+5lvv+94qFxxXUz3wdH2E7Q9P8pkZPmoZmVosZC8
	dQCnvPPFBfcpZCqX6/myRWNHgplxKlV1B7S0ldiESdtOY=
X-Google-Smtp-Source: AGHT+IHxMI99F+IAtZWxOMYa1RyucSD8miaYHECSOpW4gS3Z55ThRLvG0fNtcGLqM04BGbFYK8mK+bgTTvgVJVDex7k=
X-Received: by 2002:a05:6402:3591:b0:5f5:7c7e:40e1 with SMTP id
 4fb4d7f45d1cf-5fa788a2855mr314784a12.24.1746137719499; Thu, 01 May 2025
 15:15:19 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-6-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-6-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:14:43 +0200
X-Gm-Features: ATxdqUHQc0v79awdKG4uwMc53xWSprS6fNByWA3pwGc9veJx_oqCH0vQZ7i8uF0
Message-ID: <CAP01T77v0vdKiqQSOk3X3t2R3xG97x13fXWE8QKF=7zX-8c_PA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 05/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
To: Luis Gerhorst <luis.gerhorst@fau.de>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
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

On Thu, 1 May 2025 at 09:51, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> JITs can set bpf_jit_bypass_spec_v1/v4() if they want the verifier to
> skip analysis/patching for the respective vulnerability. For v4, this
> will reduce the number of barriers the verifier inserts. For v1, it
> allows more programs to be accepted.
>
> The primary motivation for this is to not regress unpriv BPF's
> performance on ARM64 in a future commit where BPF_NOSPEC is also used
> against Spectre v1.
>
> This has the user-visible change that v1-induced rejections on
> non-vulnerable PowerPC CPUs are avoided.
>
> For now, this does not change the semantics of BPF_NOSPEC. It is still a
> v4-only barrier and must not be implemented if bypass_spec_v4 is always
> true for the arch. Changing it to a v1 AND v4-barrier is done in a
> future commit.
>
> As an alternative to bypass_spec_v1/v4, one could introduce NOSPEC_V1
> AND NOSPEC_V4 instructions and allow backends to skip their lowering as
> suggested by commit f5e81d111750 ("bpf: Introduce BPF nospec instruction
> for mitigating Spectre v4"). Adding bpf_jit_bypass_spec_v1/v4() was
> found to be preferable for the following reason:
>
> * bypass_spec_v1/v4 benefits non-vulnerable CPUs: Always performing the
>   same analysis (not taking into account whether the current CPU is
>   vulnerable), needlessly restricts users of CPUs that are not
>   vulnerable. The only use case for this would be portability-testing,
>   but this can later be added easily when needed by allowing users to
>   force bypass_spec_v1/v4 to false.
>
> * Portability is still acceptable: Directly disabling the analysis
>   instead of skipping the lowering of BPF_NOSPEC(_V1/V4) might allow
>   programs on non-vulnerable CPUs to be accepted while the program will
>   be rejected on vulnerable CPUs. With the fallback to speculation
>   barriers for Spectre v1 implemented in a future commit, this will only
>   affect programs that do variable stack-accesses or are very complex.
>
> For PowerPC, the SEC_FTR checking in bpf_jit_bypass_spec_v4() is based
> on the check that was previously located in the BPF_NOSPEC case.
>
> For LoongArch, it would likely be safe to set both
> bpf_jit_bypass_spec_v1() and _v4() according to
> commit a6f6a95f2580 ("LoongArch, bpf: Fix jit to skip speculation
> barrier opcode"). This is omitted here as I am unable to do any testing
> for LoongArch.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Cc: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

I think this and the next patch should have acks from arm and powerpc experts.

