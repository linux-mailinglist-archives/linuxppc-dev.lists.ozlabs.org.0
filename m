Return-Path: <linuxppc-dev+bounces-8235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CDAA665B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 00:43:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpTbR03wJz2yWK;
	Fri,  2 May 2025 08:42:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::542"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746138651;
	cv=none; b=gwqC506pemArrTAAW4sE7Z5EgmawQIh4sercjyLB7bUKLl442xKG5q2HD1c7vLbnFyhvqrCjxEYZuSFvKRLFi4dDauqQJ2bgcH4A6UUgBsDV47KbfLOGK1+UKMewc7ka4Wm6RSXttcfzbm3RK7Rvg//01j6DWYzaDrSwlmxNCPqRukRwRhd9hooNaRvjMtjr35dcgm5dL2rYXdOsK8EkAMXBKsx9nrz/xWbDJ4gZ1xhcWF7WqvtnNkAdN4jTfxQp2KlblJYEoIhNeSc6daAomhMd1lTk3BrWF0rLiDe2iaA5Rmm5XFVQ24yG9YdD7vRsdN+hAvZpnFEcwWkGZtPo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746138651; c=relaxed/relaxed;
	bh=+DIhbp2zBCUUrZHkv3NTANy3q1+8YPM4ngw/q64EdRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URM1sUHYCqPlnUXhy88Mo+tfQnKv1EL1YqoQITw6vJsij+DTZKJz23DcWi4gmk4I91+lkljMyoJ/aMtMOFoUQIjqskLHumbS8ZWwjQxnsfsgQ7IdzZHa3urU1wwfDlrlpZl0HJLXES/KuR8XN9+MNRNTJAW+v4MvelCFHXrM2lntsiADDvDjsi6K3nZdFNKellGx4jshZoSsDCyw67xvc4qqKV4Vh3T/ae1hBNtv6YLX+4BIvwgslltgB7jpve2S+HwBZJa6ROOSO3zZHKZGZJUChpgWvBV0wIqoI7NQaLl9SAqLEuaE9qwzzL8+4I3PtKCsuyXFy8J09neyImttQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNk1WElH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNk1WElH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpTKP5tjWz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 08:30:49 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so2109155a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746138646; x=1746743446; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DIhbp2zBCUUrZHkv3NTANy3q1+8YPM4ngw/q64EdRc=;
        b=CNk1WElHYO41QnSiSRxRhOpdXm7ip2+hetCDPPXPtmcMjkZ5xk0MLz6uk2RvkbJRmX
         kpJGsrQY6FsKlDmSoY8TbADtCwiqE2lCV1PncWRzqqEW8SRQvWvBw9kf882UaqcVGHjU
         bt79UEUx/LcR5vo8aI1wJpZTF8L2NLZ7Rewnj34GsU4JYU/fNNIlCxzvNnGs4/vN9AfF
         pMy8KAJmiGkVOuM8KLBRzKAfAB6RECt+bC+E/o0vghOUEBFV/kIMIQ4sOcItz5Zx6S9d
         Kuv0WxdQvAX6pF0uYIrrnfu2MtpuUl7pXEu4W7k2EEBbHE3P/LZ/DJswh+sptwBkZ+6z
         eK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138646; x=1746743446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DIhbp2zBCUUrZHkv3NTANy3q1+8YPM4ngw/q64EdRc=;
        b=uM1fsldKkicszIVD4NxK2AdpqNm/vVO7PPcscHA+dbmx3G/zKsZfLipi3ktnU28ARx
         vqbAGVOnjZJVx/27j+NAI8ceDxZpGi30rhpYEHwNIe13Q3V+LFCY2OAE0obVHFyG06pW
         OSIskAa8Lv4nip3G5mJbe9mApp5J6a7USoDWblycqMVv9P4P4vQHC04ulTqwnIsp41m4
         M6tK0gJsHirGIN8VL/GVDGM+CmtKKCeF5zGrHsibj+GABuvhVkOb9PZGXLfmq7IyUAuF
         6sjJYOZmCrUS06xsISms6E/nuMnTJXIvZP04SQp0SOZc8UH+S4dylZCnX8VNOTgP0L8I
         YPtg==
X-Forwarded-Encrypted: i=1; AJvYcCWa3Yw/qEUXqv+uI6mqLvLWotqNGxGpZRWSb1Kc05I4lHR36ZtWw/VGcB+Vn3rHbEL/fMfFsCF3FJswLLw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfD12A+2pL4ZnFg9qOabJ5JVUaON18yZXFoeqWyMDM+T1OTclG
	wA/nxwFzI39ywU1A1R7dXeDVRFQOqzlwQXztKX+Udt8ciXp/TeE037M3JeJKohEkNwcVu8i3Cfv
	CYE+Y1/yBYhO5e52D6qT9cYa0BnQ=
X-Gm-Gg: ASbGnctWYq80ry12/FIWdup4KYgCD6SrEJSZYsVT2Vd+vNXBR5Q6eh+CwcEgMwjO3il
	ko+9RlABYtOA6NNY/rVFX2jdrMp5vj8rTbhQc97SAx0FxMc2jeEH1TvXaN3wxhWIfNUOIMnw9bK
	fuOs2W3oGlRCDXsIdbkNGcz2s6dqxW8zDKMDxcQqR0UUQ=
X-Google-Smtp-Source: AGHT+IG09f2b7Y4uH3A4LEbmPohoiBZ1TPbF2Kj8BdJpyHWDLhgzXkdGcWvLzUMh9kLAyJv+ATRCPXiPJsNUAWmKXHo=
X-Received: by 2002:a05:6402:5192:b0:5f6:2758:149e with SMTP id
 4fb4d7f45d1cf-5fa78014527mr322827a12.11.1746138646330; Thu, 01 May 2025
 15:30:46 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-8-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-8-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:30:09 +0200
X-Gm-Features: ATxdqUHPJMzTDr7uGCd29q-hTjuCFiE_oOpFxHvXqTdvhmyQK0iMn3qq8We2LrU
Message-ID: <CAP01T75RR_6mC5fvD-tg+pxR8TEUHpUfU4Lqo0p+EBrkY9BVnw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 07/11] bpf: Rename sanitize_stack_spill to nospec_result
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

On Thu, 1 May 2025 at 10:02, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This is made to clarify that this flag will cause a nospec to be added
> after this insn and can therefore be relied upon to reduce speculative
> path analysis.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Cc: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

