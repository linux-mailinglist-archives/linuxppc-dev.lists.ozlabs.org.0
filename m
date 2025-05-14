Return-Path: <linuxppc-dev+bounces-8563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F4AB6317
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 08:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy3Mw462sz2yrX;
	Wed, 14 May 2025 16:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::641"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747204156;
	cv=none; b=Fq1Y4fR0K7iS5Q/VDHMmB2ph3GOqjfqLDkKL+ytH/KH0Z+Nh3yk+/mn7NXIu1tYSQEA+Ra858WGdTUaGryIDFaQlNRPusv77cyAgHNSF0iMVimNqGOjYofAx2OsJHOAne8ecQQrSVeWfY9Y+siFGHHSFOVd/zpB0U0+bIZ0jk07LTexMrSjRia2YPYe6pLbIIAU/YDng5HKgcveYwX29pPPtDJhhwP8jFy7wHOUVd/3ZS2Xz9lOo062cpamD6/32P/42VhtucmzMF8bfqKpj+Td29bUHJ3M8y4+nrCqjtFI55HFw61AoXQN8+BDsPh3DcfFTXWU4zv00b+6lJHuyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747204156; c=relaxed/relaxed;
	bh=PaYjBZppfnvZ2HRcS6OlMJ9h+JyKAs+WdSh7y/nlHX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yw36ex3VFjpUqXpkue0fz3hJsB+a9LWldF87Itoo/WsJy5obAnYs6abRZi2eZXOGn81OEBgDAj7c5hAXbykMdZQkC87RBcIPmB2MTkckoGRkv6lp5cz4fX+kKifsCAXNua0/jhQ9/BVaAVNUcvkJzaUhvcnGvm6E6MMUQNPB235p3SyxGoecinU1H7GoXMocLJeSKqC90thdmB1pLryAfw9MwaVwG+dfi2YLL5JqUYvcbM7CkNnzkv1d9OLNGmwnkWqL8KqjbJof0+yLJTnLXjMAGlha1Y17owNaicdVXNK6C2uQnG+8TvsOPmtRo0qTE84LjH3qScfyWgLIJfgnGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GChThg0Y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GChThg0Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy3Mv3n4bz2yrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 16:29:14 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-ad23ec87134so9839566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 23:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747204152; x=1747808952; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PaYjBZppfnvZ2HRcS6OlMJ9h+JyKAs+WdSh7y/nlHX4=;
        b=GChThg0YRPvxHINVTILZHDKk8NKmEpMO5lXv8z1Woj3doFXNV/+yyteq9PyiarqmBn
         w44nt2ikr0morGdF/JnFMzcjK9uJ89/kgu9C3/oPOTA1aPQ+DgWe5tXV2aOAS65iMW7w
         88WVteAvA1rTkCCLn277rhZAn/nDkpE+AckrkBYTE9IqkLdL5owhxc2zgJx+ogzmuOmR
         9boKENoPc+TSsn9DlSaZ9hbuZcJdgpvsJRtMQCzlZvgx0Zs774yBCUH/JIRlKjB+ZQ0x
         MNNCuQPO71Fy5xafUFBexkzkYt/MnDvBfVaxRAkvaYoek52nnWt9rWHV7EPX38/bXe0F
         OboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204152; x=1747808952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaYjBZppfnvZ2HRcS6OlMJ9h+JyKAs+WdSh7y/nlHX4=;
        b=wHeGEdrminiQ4A8JHXp9GSwlESmwVQqDjLluGrd/lwR1bK5sIf2BxugSevouTegkX3
         Ahvdq83ecX8oGnJcJRtej8Va5l9fHri2IFSmUaEWrvkzLJQF/M54MCZyrOlWSMLm1lId
         xyZgH3urKUh82fbFEI3ymInjQ1wcHqzvOzDwHabsWAcuxfFvdTB2njFYRcUfjzOwzbfT
         zzQHpWD4DoPoVJKUeb/Q4yhukONsJBj1KShCjwXEk0QqPQF6ZKrIqc/5bhApSoplfqKr
         xWra3mzTuHdT5WDMjUWzvrDCEWMadzsfo770+yTFeiTmmx5qZZEzxeIsN2BPJiF6sA6a
         hcbg==
X-Forwarded-Encrypted: i=1; AJvYcCVPlKCdywilXXn3kRwadNSqrZG7e9KSM4n1DnCL6s6vAwExgWa39R6cDm+UuBOhwwXIF88shFzS4XpvB80=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyqdj9J5gFxjs5M7Vji1jaoU/exNigUWyzLj628g5+isN7fPiTy
	uPJGmvS96BOfVzd8Se3mfQk+N2skvJMpuLZMZk3kLcDW+hWSPmeDhr3vWq0EQmER9nbAt1YLuuC
	jthYSBcvHVu4JZNip9YKwa5UQLKA=
X-Gm-Gg: ASbGncvsloA1QWT37ar7u9Na5lwnhJWhv4v03jaqUtQ5+Fy743BjNUSKxNjd8niHiVT
	yNjPxg3krAyxGGbXZGC1Ka6tazlEvkKzrBc/gLTG//ukdg+Y1FvlK9D4pVmM8Kskz+d84ELNbMq
	TgPPFIdyRwRF5/F19hIdfJAjUC2hcGSCU=
X-Google-Smtp-Source: AGHT+IHLi9l3uVX4nW5VLQgBm2lV8tVCO9VuPjaDsf+SxaW0IV+yhko+vLUnG1ihrIh/6U5EoZfOVotR/SX2Qpqfql0=
X-Received: by 2002:a17:907:a0ca:b0:ad2:33a5:f468 with SMTP id
 a640c23a62f3a-ad4f74a5448mr235593066b.54.1747204152004; Tue, 13 May 2025
 23:29:12 -0700 (PDT)
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
Date: Wed, 14 May 2025 02:28:35 -0400
X-Gm-Features: AX0GCFs-O_hhLomt9V3PLJCcKSURYY7CSGwd6Ua6n88FsUsqIjk4ubR7DgQIDuI
Message-ID: <CAP01T75oU0zfZCiymEcH3r-GQ5A6GOc6GmYzJEnMa3=53XuUQQ@mail.gmail.com>
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

On Thu, 1 May 2025 at 04:17, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
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

Please also address sanitize_check_bounds, it's probably prevented by
retrieve_ptr_limit rejecting other types but it'd be better to add a
default statement for clarity.

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

