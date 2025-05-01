Return-Path: <linuxppc-dev+bounces-8232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8FAA6658
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 00:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpTZb0VLBz2ydN;
	Fri,  2 May 2025 08:42:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::542"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746137250;
	cv=none; b=GvCgbGm/csVIfr3SkEseS3ywLFINb/ba63Ok9huLFnDnEiPkmteP4hktYf2RnTf3iUb4Ukv4UMMoQMJPbxFJpCwVArNFyJRzW2vCwEsiXE9e/sn73UdINs72O4wnJAy0lF3ZXCbI0+PETmx2ffj1da809yIiJlz1uBMWKuMoUWGnxo0gXiFZojpamICR0T2GEDE9pQk3BFBFojn+wKOuXjpB71xR+hLrQVyEhrXbnrq8vl9d2vze5kQYJ41hw4wpUa4hAbFevYicTBp/4ZL1FLtE1FE6ZfKKQjjEhfzfffR7g4fNksLic0uL4Z4HgcpmhWL2nRMOzm2t/km1VwNa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746137250; c=relaxed/relaxed;
	bh=HvC11TDh5RWBWPLxa7ORV/+ShfE7ZB4C79Xpi2o9TqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkdduG/U8NKvj1PuDyZxdWTW4Ypbhc9vE6u4ihIrRC4EHa/Ck7XqN1/2M2J/8V6e4G2Hzq2qBBtJVG22M2PMzs6eUsB2A2vDgANDV2hnfLP9msV2HmilltRhh23ga56rthg4thHQfbnj5rm1FDnQ/VSk6+Bu203kIjBldhJm5NJJU2NMBE5NKLA3a1OOsVy6h6dV/cNyxuVlHt3NB04rL1ToSR3tk2/7CcQhd+cS0ETaqoJhC2j6r1PFCKAgJr7D6u8os1pjhb1D3kV4B9w+Y/CKgVkU9JzjN87aQxPYPVcIABgUwiWixZLhNImAnkMeLx9rII3jAS99m/E2XrLgag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UzJ2rPhB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UzJ2rPhB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpSpT4rX0z2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 08:07:29 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso2141377a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137247; x=1746742047; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HvC11TDh5RWBWPLxa7ORV/+ShfE7ZB4C79Xpi2o9TqM=;
        b=UzJ2rPhBsMM9nH2/ZNwpM8AYvzjwi72Q8/gig4LO5eisO9/80NELWtFuwXABd2zvaQ
         mk7TlOd8Y3avSMoWtvEyWBm2O6Agai3/SWFlvKVI2mwp8dc8io1oeuPdX0AUFsPSLk1e
         GPxrWEzojBsNG5Q4xIBzJ8BAl8EbmWKXmiB04C2uJjdxmXpkTn5iOQcSNetq3FqHgwb5
         t/FbPoco9F1d78U2ARMQtrtMeBUn/4fjhRt5ExXnm0p4kWlpeuYa2t4Utnjps7OeTtCr
         im5De4Uur/157+uYtcdznTu8RZpAHSMgjWHac79BZSJSdU71ZbaZEuu6XPWOGvCV1/xM
         ddRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137247; x=1746742047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvC11TDh5RWBWPLxa7ORV/+ShfE7ZB4C79Xpi2o9TqM=;
        b=GXnQO4CVnct+HNu5XvdxGzmh1h4zweVwZhAgtUO9wAERBzp8XjoYRNhrx7LL/95iex
         4FwNzrkhFaj9vCWLs7easQ67MBNpizMPmOa1kvOqN951B9/prNWnAWi9e+Pa3JQ1zk40
         9WEygNVPnc54Sfjh+hmidZcCMRwKrui2Sw7zdZY9pt7wMnpOUIhBgYw0kiE19EN7tn88
         TZdQs57/sxaIfjq1J+bhL9hLJMEJcuotgbNoMovKKbTKQbblkt88FuB3oqw/g7aXLJty
         RPB73K14sh71NBkveM796Ef46JpKq+Ctr/7b6uVz0b+AgEnlwiRr92A91QpgacwkjaLY
         G1lg==
X-Forwarded-Encrypted: i=1; AJvYcCUErbn9AvIrdXWy/z0BS1f/Hi5mWeiRjnRwl1A2YOQC+onAsC1rU2e8U71ducEyDXxPX4g2+3+WnOT8rrM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1WuWuhG+URHwkFUoVFLKg/t1aa/fqSZZ01TT+QZ+kjv53l4UJ
	xDNy/M0R5bEA5TO3JroL/k01XKGXUFWsqu3POPf/zIXeUzGBBoNaqGE58jXgIWQ4hFlbFcCycd0
	5+uCHU/Xn05SIDKmHNzx7LegTIAY=
X-Gm-Gg: ASbGnctBy6Ck+xmfWr5yMwPMRLXUtJU2Od5c+V0ft/s6sbWbSqi2cqXwFCQ9tIHWSFX
	q62u4YHfFYkXSqdIa1+dzwpbUxq/2LNfGQMNfYrTae7dRziwVGJjf9rO/0LoNCO0LE1YqSnnRPr
	UbTS9QQv6h0c2wP2ah5P0LUAD2IQ/LaP7JTox06letByE=
X-Google-Smtp-Source: AGHT+IG1lU56iqWpifKIgMMmYrNdr1ioTH6+OP6AGYVsnjqNRlojuMU0G4Vpeu63oJvn/WKU5CN6RH1ZoN5Nh1W7fAQ=
X-Received: by 2002:a05:6402:3589:b0:5f8:30c2:862d with SMTP id
 4fb4d7f45d1cf-5fa78040187mr334068a12.13.1746137246565; Thu, 01 May 2025
 15:07:26 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-4-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-4-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:06:50 +0200
X-Gm-Features: ATxdqUGg7YCCKDNPYyxZKyCdlBGugnXkLd2V8xrmgc9OhDJov6fHaQiLQWWlX40
Message-ID: <CAP01T76-_PadE-BViz4bQQYQHFCNJS0Txs065w99dEcxrP3kMA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 03/11] bpf: Return -EFAULT on misconfigurations
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

On Thu, 1 May 2025 at 09:48, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Mark these cases as non-recoverable to later prevent them from being
> caught when they occur during speculative path verification.
>
> Eduard writes [1]:
>
>   The only pace I'm aware of that might act upon specific error code
>   from verifier syscall is libbpf. Looking through libbpf code, it seems
>   that this change does not interfere with libbpf.
>
> [1] https://lore.kernel.org/all/785b4531ce3b44a84059a4feb4ba458c68fce719.camel@gmail.com/
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

