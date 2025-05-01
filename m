Return-Path: <linuxppc-dev+bounces-8231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFEAA6657
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 00:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpTZP1yynz2ySc;
	Fri,  2 May 2025 08:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::544"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746137218;
	cv=none; b=UUlnvxwZdC3ky7PhIofiFkhGIMaBFfsCDoEJiy/wzvpUOUbBg0Ukg3YA9b3glbUW3yG00W5l9kokodLZ7oz0A3N41/RBkYJdZn2NIT9uVV69si7uzR6BdwKnZY7B6+ClMvZtondnV6oSmEgl6QYBCQNhXC7QuLMe16hf8Q8evqFchSgWCLrI1umTOABPxSK1MjAwEv9paOcr/taJtckm9NUOIgsOSwhPpBSlkz8AbXVDNxxbzrJyrYRCfXkPeM5a9zKJXLJLozxZk5uEbN1/e8SRuT+hORAIY6AygGXG57n9I/gBN4bZfSDsU1PtLAl00MoM2jXA6v3TqUVut0BiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746137218; c=relaxed/relaxed;
	bh=tOjpypFIC1MFYfuSlXMzhrCrJGqjuZGfc32KsKpKFhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqDFpx+cDeK+ApHfEBQYfjulrWwrEHTAS+GdjNr2yBrotv445dk3GLD0LwE/MnaYA4qooAfw8BAYdg3WRLAlv2tMvyzR08tSiUrMvWPbHa77WtRys9YW//aindKZPnKvauHAPz1z9dzcvm8xPSTSS3J36dAdsHiAQJXplw3r3AD/wmPhQxTBbHhwXk0jvOzuzjTm0ZzgWP1z0VGlcycBOSQibPTXYUFWyYI6L2zzcUiLphl7lVJj645E+INS2tduOHQpTXHWZVA9RBLZzd+8PhRUFJ5Z2rjkc+qfym7oGvaxHDDd6riv6mf+yJjeH+ibA5w1AvOZdEFtYMOFyaAGeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eHGnWlYY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eHGnWlYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpSnm4jVgz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 08:06:52 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so2157727a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137207; x=1746742007; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tOjpypFIC1MFYfuSlXMzhrCrJGqjuZGfc32KsKpKFhQ=;
        b=eHGnWlYYDeltqgKOXn6gnzHWwu8E6EaIYscEI+P2JoQoeEWpjV2nH5TCZO3S+BArVu
         1cdQMvN1yz0zkt/yNyq8QMBhbd0SmGqThxC03n2XVIg7qKcnw6/RmrpJyztJxx7rCM7B
         EnaDZ3Ql2k1nh6KJ/n5Ee9q3uNRrAfM/3luyEvuR62Wz4JdtP8/aHpD2xeM4EyveOsnl
         q9QvdgmwMZeRq504shyGNNhEiX8H+7lPnMAhOc5xkz/uDr1x8zywAOSg+kecIMG1Yfv0
         75fztby5Rh9x6cAY1Op6W1BRDMOirI+mRcu0jSPVp/g87qteg6/osSRTr2mLBoMrPrz7
         yIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137207; x=1746742007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOjpypFIC1MFYfuSlXMzhrCrJGqjuZGfc32KsKpKFhQ=;
        b=CpSDmfbUfyzu6OWkpPoUrkB3KFIIbEvxTWuBf+uOppUV0sXZYZzTDMg94MFX/f/n6L
         cZRq+L7AfyPQhoH2x/HU3H6n0ROrH9hLAuvONtP50HjZMnZGrOpIJAgHaRsuVxwx0u76
         8tK+RUEsuzoT/JIexR4/4lLmXgd19AyIRjX815vD4JFQnaYvcc4YO+mNpHkoC1ntjxYf
         6Za32tKr5UdUkmuE08R7fdF6xqYhlsBvIPlMXT+1eXoNBiYUwu1i+flm0ddDahUWy5fu
         ad0JquSubvMXfSdv3tKFgZTpNm3JX7ZpmRF0xPu+dH5SGMqqyBLBZ0PwAr3ddKHzNaN6
         VgQw==
X-Forwarded-Encrypted: i=1; AJvYcCXtzKPPKwDHovpeh/Gb7zE5YG030W9gWKY0V/r92Z3pFK322JpS4jL17k6wDTFvpNifD5qO7ARV+3wdaj0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5e0erGbZeOF8aJ8Fzdb1RfEdGHJWRprde1BwxfFCAYwgAYrB9
	zcnk0AR3iCjOprHM5pGSAjof4c9/2wnb+IfFkquXK3Zzbng92e/1i2gQU/k+WuYlVkIAlRHvaPw
	gJ+TSF7QvC+DkmOrYVk5GYAIxuXs=
X-Gm-Gg: ASbGncvqW7s3nLYd3BSZLtc3O5J11+oAN0fUywZcPAbwA15NOrCBvAFpUcJbW6e/2tE
	zLAW1pU+5PCpugAMUm6xGXIMkKGwr1LH0pS4tJWJSfb8gaRyH5JwQut/HC8KzbWNhoOFKviE371
	ORb5AqeW1bdDuZUmz7yTG948kDS6Q2d62XWHgnJKatET8g4vWivyZU/g==
X-Google-Smtp-Source: AGHT+IFdlZgpJIIOZwmEjMJEBEmVCQHnSyA+ervJFsjlZ4P4vNdH66g4BiTBr5V5jAKGV/k1Wwx3ddRiGr22IKP7V9w=
X-Received: by 2002:a05:6402:90a:b0:5f4:d572:68a with SMTP id
 4fb4d7f45d1cf-5fa7801465dmr256726a12.12.1746137207142; Thu, 01 May 2025
 15:06:47 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-3-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-3-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:06:10 +0200
X-Gm-Features: ATxdqUE3JDqCne76-GBuIfwNJ48-dE9we8FlVLpDVL25L4gVtlMzRXX74KP1XKg
Message-ID: <CAP01T75pdQCFuMpHq0tB6DLs0xdmS9nqMMp5hfq4z2o3-e1-5Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 02/11] bpf: Move insn if/else into do_check_insn()
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

On Thu, 1 May 2025 at 09:43, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This is required to catch the errors later and fall back to a nospec if
> on a speculative path.
>
> Eliminate the regs variable as it is only used once and insn_idx is not
> modified in-between the definition and usage.
>
> Still pass insn simply to match the other check_*() functions. As Eduard
> points out [1], insn is assumed to correspond to env->insn_idx in many
> places (e.g, __check_reg_arg()).
>
> Move code into do_check_insn(), replace
> * "continue" with "return 0" after modifying insn_idx
> * "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
> * "do_print_state = " with "*do_print_state = "
>
> [1] https://lore.kernel.org/all/293dbe3950a782b8eb3b87b71d7a967e120191fd.camel@gmail.com/
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

