Return-Path: <linuxppc-dev+bounces-9237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2532AD2D4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 07:31:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGcq83PgWz2yVV;
	Tue, 10 Jun 2025 15:31:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749533508;
	cv=none; b=hMxbaAvU3e0GPRFa8Hpd1Azx4pxb3ozvds/7N6qTGU2OYBmn8R+IQkpSWqM093UZ9S9tJ6FJu0DvFK83dxn9RwIh02G9Ll3hdy+z9Crmdgle+ncN0L0Aj52eLnceY8lTLqFHlj9L8VWh0XYdXQ82iXOo1PiDtjbl19Q/t1YlCK8DZO+cUs7LnCXQ8uqpZQPMQZEHWRbpVSnGQO5AMGBHpKKd650uv7CeUfQCu/gx8rUajpZwcmHNaJElvqJ/YQ6xJmQLqZKBZc4O9yziYr+9gkJHumh0J8JjNnNGkuduV9awQNjix2X+t3LEBaKg2zVOIcI5DC0/uzqiax5Umxedeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749533508; c=relaxed/relaxed;
	bh=f6NSSSUaPkJ2Knx1I9AqaaAXzKIj7ARZfjyL5txYCRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cuwx9P/aabfEhhfY/fmMYodDrRG6MPABpUbPA7zCVZgppL2yWGiG7aLIaz7UhWJ5AR74THmN+vq94Qxpw7fhwvcydNh9XfWvndTX5h6h8fZQ2Y0lG6wYu1hQ+ggjqryOEboF3Y3YQhSeYz9yYPw/IBHiVuaUzZHv7maWZi0+ebzPfHwZGWqCyK7YNJnfpG7XrInN74852bfZTk4t5CIhHv7hwrXzaHedftIMd7OZ4MVkz/3C+e9JXqkBxW9P8d7VxsmZFmVfueCf/PK6KLpeDD/c6FYk37+0TF/7AY84x69x5s+gIw7tTeko+BhcfPkpESz+QEr0zw1tdxty+tTZaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOHrJc8g; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOHrJc8g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGcq66dQkz2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 15:31:46 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so32195925e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jun 2025 22:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749533503; x=1750138303; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6NSSSUaPkJ2Knx1I9AqaaAXzKIj7ARZfjyL5txYCRc=;
        b=gOHrJc8gIU1OHvlYPppFr8Jg8hka9PhvpU33AGxuKbb2wExxzUP4xM6u68HxZivg4i
         vQy2oM1TvEVJyI6flTZoMZ6HsyRgWHnKxsliM0w4jj4zVC5CdsTx8F8ovISogDeCZKk6
         YTxtqQTsk6m0IlOyM8FBzY+Yw39o9Y3c7kC53Zjef9viUgJKcIe/gjdrfqcVjvVnB3hq
         MwLc4+nyHtWlZ/XKwGJOPJcA80Rv/95yX4OVbGAabhneh6mhm5U7B/HdZPuPU2RHzlDR
         rWlGgGvdRtLQD2QjZsEWBTcNllfSWC6dbEyWvFQAsW7Y7QUzyM5udXhXREZPXkkgrZCe
         +EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749533503; x=1750138303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6NSSSUaPkJ2Knx1I9AqaaAXzKIj7ARZfjyL5txYCRc=;
        b=UKpEir/fldRSccMKycrIxoaXxuf6mZ9nBdmPioCvKtnN+SViBmjmp8dpmOYl7HYvNh
         3wxwm07lvM5biKaIaNpRqglP0U1laodp6NeTp6sbBR+eIJWQLdlwIhMN8zeT4CPwKFHj
         gjFdTc6/v8ZunoSca1gBfjyDKC4zlgnUFVuKymdEgOhQUSqJ6QISE7aLhNndEc2H94gi
         8557Dss3IW/u1nWEbRtdCW3KjFHC5PXw5LTDUDKBewG9vT1BF6+L4qKV3VB+b0OURiSv
         ukacuymODcK2Iec8sJVpfQP1ujzRauOUZ5DQ7Fo9jFLSM9dqTjgQ0VgxkE0z7byYsEMm
         Y3xw==
X-Forwarded-Encrypted: i=1; AJvYcCV4xGreE0+qHwFZna4mxh4UNM0wP2FcMn60rWNJ0d/PmYgn9wGaw2a8CSgE8y6i1yX5kBBwLT8t5Q92ghI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIRk+Wpq462CcWoILfVCZmnTW45pEBJyL34bTE2TXW6H20bCGx
	L58MG+JXp6uXoFuKazJZWIP5NmnVf075CjrQL6yKHwwXWxKVQOldTQ7+iNwBt11c4fi6erJwgKg
	+eUm7dhNvQmfTZOq3mk0efpOXjk0b55U=
X-Gm-Gg: ASbGncvqKVOsf+P5LME2WUcVrkaDICzE3ZLbtdRoMcDHMrz4KFJA/GyYtY5EPjgToxu
	ijfdcePvA6K0V9XW684qXUjl0rfZka585kv7YGmQa8XdUfdLW5oE3srdeRiu7IpnEGNuAoOhXwH
	dXGjxTk0A9G5Buze90hXXT1OWhszB844y0PwXvcvrYBYfnketBWpf+cT/aHhKsF36/Hs34dHNY
X-Google-Smtp-Source: AGHT+IGnCeVQwIATlfQCLPScvjR4zfSPZh3YpkxJkw/tAxQe10VCPdtaHGA0BCwCT9Hg5US8pQ1ILNVZfG578sV+3Yo=
X-Received: by 2002:a05:600c:34d2:b0:441:d4e8:76c6 with SMTP id
 5b1f17b1804b1-4531de9f85amr9648765e9.30.1749533502763; Mon, 09 Jun 2025
 22:31:42 -0700 (PDT)
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
References: <20250603205800.334980-1-luis.gerhorst@fau.de> <20250603213232.339242-1-luis.gerhorst@fau.de>
In-Reply-To: <20250603213232.339242-1-luis.gerhorst@fau.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Jun 2025 22:31:31 -0700
X-Gm-Features: AX0GCFu_O3ZRZr-RlnDuwnEJp2OCNNw_nXP9ivn8MSmq6jESTI3dBrI5bUO4Iuo
Message-ID: <CAADnVQLC_zViaCs5Huu63Jr2oCx1NGY3f_VCkJhrKvqst7HL=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 9/9] bpf: Fall back to nospec for sanitization-failures
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
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 3, 2025 at 2:32=E2=80=AFPM Luis Gerhorst <luis.gerhorst@fau.de>=
 wrote:
>
> ALU sanitization was introduced to ensure that a subsequent ptr access
> can never go OOB, even under speculation. This is required because we
> currently allow speculative scalar confusion. Spec. scalar confusion is
> possible because Spectre v4 sanitization only adds a nospec after
> critical stores (e.g., scalar overwritten with a pointer).
>
> If we add a nospec before the ALU op, none of the operands can be
> subject to scalar confusion. As an ADD/SUB can not introduce scalar
> confusion itself, the result will also not be subject to scalar
> confusion. Therefore, the subsequent ptr access is always safe.
>
> We directly fall back to nospec for the sanitization errors
> REASON_BOUNDS, _TYPE, _PATHS, and _LIMIT, even if we are not on a
> speculative path.
>
> For REASON_STACK, we return the error -ENOMEM directly now. Previously,
> sanitize_err() returned -EACCES for this case but we change it to
> -ENOMEM because doing so prevents do_check() from falling back to a
> nospec if we are on a speculative path. This would not be a serious
> issue (the verifier would probably run into the -ENOMEM again shortly on
> the next non-speculative path and still abort verification), but -ENOMEM
> is more fitting here anyway. An alternative would be -EFAULT, which is
> also returned for some of the other cases where push_stack() fails, but
> this is more frequently used for verifier-internal bugs.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---
>  kernel/bpf/verifier.c                         | 89 ++++++-----------
>  .../selftests/bpf/progs/verifier_bounds.c     |  5 +-
>  .../bpf/progs/verifier_bounds_deduction.c     | 45 ++++++---
>  .../selftests/bpf/progs/verifier_map_ptr.c    | 20 +++-
>  .../bpf/progs/verifier_value_ptr_arith.c      | 97 ++++++++++++++++---
>  5 files changed, 160 insertions(+), 96 deletions(-)

I applied the first 8, but this patch had odd merge conflicts
and I didn't want to risk it. Please rebase.

