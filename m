Return-Path: <linuxppc-dev+bounces-8566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FFEAB6373
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 08:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy3p432mSz2yrn;
	Wed, 14 May 2025 16:48:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::643"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747205308;
	cv=none; b=VBVoIrklLcIIsAHfrP8DkZW25F1bmlmKxHSY3zs71BbqqzITN2wqvzRYqKnwu95j9xi2TKwWU3ES4Hs2CxrX5mq5QUNVOAtWNwBk/5v5dpVFeAH0pZ5hpNwda/v0HVSxSijoX7fEg8V3Nj6PysoR3bytU/jk3Y89GG4Iu+EOPN3OZzmidtXhNDIWHn4sg8BQxNUowX2ru7RpWKH4aU20VGDPZExP7uXbTFmEb1IzoZyqY4wW1nBN+hVty/bCgD6bQDs8sK0mPFfJiB3sdmLkbUl/S+HvQ4CscEGU5/gPPei2vVc0RimgnuvYACjC8f1YBVMgqQ5fjlp9evfAbsRI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747205308; c=relaxed/relaxed;
	bh=HGZdJZIHRL1GtxweWrW4A40ao0eooBXQDxu8kYszvsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVE+IYOme0XSUezB0ETkiM6sRoqoGGQNNDUSo5fFoAGYX6QfV4TxahKFysROyLfFvBpTpKHc3rUyvazzXysK2V4UQsf7SW6JVDuN1dxSyKCcKphTODJ7jL8Hps9TWcYuM4q7puAKpnSGTEInvzIGeRaJYEQyjo9FSzs/POnWKWIKoQMPPFu57xT9uOZ0//ej4uRQoS2VfL+8dURFEVGarr7zcpIoBUdTIa/sIr5XMFBHuNO9n/xKO2g1AR4s1j7iBR8ACgrkVvueFgd43N+vN9zHPYwI2QaRupdOtcVe7q/uVsfNiRJeUlmmz4VSDRQKRNoiZWp0/kxPcC0TLpjbYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KyxUEWlY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KyxUEWlY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy3p342dlz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 16:48:27 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-ad21cc2594eso202988966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 23:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747205301; x=1747810101; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGZdJZIHRL1GtxweWrW4A40ao0eooBXQDxu8kYszvsY=;
        b=KyxUEWlYyMWl6dwEN02YagDKGHqDcODClVavL59JbEWLQj3vx/ZN5TOOJTWRB8H+ys
         CaZGBtT4Qrf+GaPUmuumQercRPoHaSSWFnAiCA3ntrXwcHfXNoTjRBfsQQWGIcmB/yxE
         FgjWYQTRHF8SJu/xbg25NDiQQLzd9dt+Hwj5WNZQKy6Xdpe8fS3ybOyvALvbgxC5//0b
         IzRs59MGFP9HipVUJmolo0N49NLgMIGv/IlJfgV5KOuQi8VbwCVie6BGrTC8GgW3HGRv
         2J1J/Iy5CrXjn6thm2nUx2US/YwxvyhCZDS2am9TvhMweL7wlnqsw/jHYOVRmD7numXT
         CaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205301; x=1747810101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGZdJZIHRL1GtxweWrW4A40ao0eooBXQDxu8kYszvsY=;
        b=FZl0+sn0Q4Ctz8/T5N04F/iH5E9DLbJPLKFi7jli4PEiIauRUkDCTNGLxUXBK2F8SS
         VdqOpfaX236R6OPD2fIOtUvriMgLVeqemMPMui4fB/M9+5LZTelNlEvAXsykCsVwhGWb
         2A/M2Fqs+fisyIZzMl69oehQZeBlKpj+LSCf9Di/OTdsMMsrT+pJtnrJY31EVt07Oyec
         hadEe10ZdzRE+/jmzs+1PudrqLgxj9YKjsDKcvBPEPXU/zlJ78B6zHOo59VoIjyD1gPv
         R2O8AQwvWji/lcb3ClMLms/sMK3qEvOYu94runqgGoF8m8xbg8T5dsMd40hcL7Ci3T4K
         Gk1w==
X-Forwarded-Encrypted: i=1; AJvYcCWFiF3WjsLgy11iJNHrlDedCUMhbZgTiY4bCgTtGvA1ULz3VCkcqowCJAxA6sWVmEQAcsRzVgRHFOOzkWs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKq82XOYGEDml4VrTF8EU44Zkj4as5QWzz7J4o6EHoIHg6UHOf
	xSPGPggyCu9gJicWeXdm1k+8iAGbE3x+i31GKPeTCHWQSAfwmkxCVWPN4+G9fJI6giS9DQ5/AGD
	vtI5jPs1rrpvSCgVVNo7GBl+ekUo=
X-Gm-Gg: ASbGncvnhWXmk8e5ICkXOONN+spz0f2fbp0Ipd91nWl9Y+YgYaRY0M3CULuJueKyXsf
	/dEsuQ43Qa0Dqs5HJ0UB90RU5mbSYxIR/j8hyXqxfNrmOrQNKoMPjuUDNpVUhjSFCrKOBL/pO5X
	wY5hL9zpGZS16nkanZ2d4ffVnt+S4a2FA1I+VUvUYwtg==
X-Google-Smtp-Source: AGHT+IHR4iBb/I4Enb7BPpeT9sltrJqA0gSsnQXL1n3QG7K11/B1K1G20PjKfwnEwjCdCRskmsSlv58eOyHiQdilNDc=
X-Received: by 2002:a17:906:3bc8:b0:ad2:404d:cade with SMTP id
 a640c23a62f3a-ad4f72411e0mr183082466b.27.1747205301209; Tue, 13 May 2025
 23:48:21 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-12-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-12-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 02:47:44 -0400
X-Gm-Features: AX0GCFun9-2MfM8_J1zhSkgZ3q4nYAOUK-g_v7fEm1Fc1hj9Yjf5b4J_glq1BvA
Message-ID: <CAP01T76jeSg3W-OyfBfSbAjpEhBr_h8rbS-Hubk6gDdrkeEj_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 11/11] bpf: Fall back to nospec for sanitization-failures
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

On Thu, 1 May 2025 at 04:10, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
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

Hm, now looking at this and thinking more about this, I think
recoverable error logic is probably ok as is.
Scratch my earlier suggestion about unconditional handling. I guess
what would be better would be
handling everything except fatal ones. In case of fatal ones we should
really quit verification and return.
We may make partial changes to verifier state / env and try to bail
out using -ENOMEM and -EFAULT.
So unconditional continuation would be problematic as we'd act in a
partial state never meant to be seen.

The logic otherwise looks ok, so:

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>
> [...]
>

