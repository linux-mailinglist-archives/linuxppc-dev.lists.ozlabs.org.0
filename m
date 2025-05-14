Return-Path: <linuxppc-dev+bounces-8562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7150AB62FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 08:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy3H91jJhz2yrV;
	Wed, 14 May 2025 16:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::641"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747203909;
	cv=none; b=Dwd+F8TPGM4LG7B98jw9WChJZEudTb9L4MOR7CxckxaTlwNKbXS6vnKg5wuJ0Bzz9NgIM8Ud9WVINqrhdgmsHPTUfffhMnmFlWZbOFEL8jNAXBc1Kq4LQ4LJ0d6R3CY4ZprWMlHdIbj8SNrYiaIIf8xQgKo6YAG3/ABGjxwZrjc4KUfM0Cdd+kHuK7xhS05k2eiCieviH4t07tk6jYaSzJsXHfU219Z70RUWhdV5BpU+991MoZ6CUggZNyy7y4hKYgEnRplihFUbF8Wz3EWeUZW00fSSLpcaoUhfY3JGueWdFT/QR30CPZsos1PbJ2VXONpFxqzUv2POSsOS5gvTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747203909; c=relaxed/relaxed;
	bh=vEjRrrhKGba3tAjU8EN/hoGC1slSv2vkn6NtFzJIEiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmBLtR73xRmgDUAZYl4dmK5IQ2TYfspl4+gYimwkqi9tyMcqDFHUIVHTJflF1LYVKBUAnvtCf9/x1slKYS38M/ZlyplS8AQLhCB71YsrYyC4GupLs1pL/XI2KWmNqgzMgIoGsAs4Rb0IPQjqwcRFDilQd1Td1ccQRdPA5XMIMt6F+cJNQp2xkKsHQnQQ3vtyq0pqAq76X+gp6ecZjRQd8lPXfkt8YN8l4cHmYYeOscD4jnl0NyUJCKaS3Ia0qYECfbsnv0CZXwwFAKgmrFXygGCDchtQNzndDSHBaHpeEpcy7SIJg0+TJ0j3d/vHrZRy9xguHi8QWlwIFroEJThvhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iNPG03FM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iNPG03FM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy3H70VZzz2yrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 16:25:06 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-acb39c45b4eso1049184566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747203903; x=1747808703; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEjRrrhKGba3tAjU8EN/hoGC1slSv2vkn6NtFzJIEiI=;
        b=iNPG03FM+qFKsTCPbZ/gHL8lWAhVRmYOj1AJeHnzYgP4bWOMEpqjNpgUQbSPOyXiq8
         IGKHHqjKmdKm/GcKT+dvmTcZZs0oRlHNWgd97LmiAgvD2b4b//85qqGuxHqCZhXpVgCN
         67zxttn5fLWVifx5bOCvFggPkxFvIj/UXKZGWSOU+w2+Zh0AePap1MkUWtUpZ7/PPXU+
         NdiACkkiMImll2yZtBZzXzXsn5enuTynYFzhAa7PuqOVEVqM56VHN3J9e9poyNg7qP0x
         bEE/q31Wz1oC+T5eNjINDT9vK+a9OD3NF8aAo2Mm0CkM77HjAtJogNbnzux2n3Lb1gDw
         IKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203903; x=1747808703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEjRrrhKGba3tAjU8EN/hoGC1slSv2vkn6NtFzJIEiI=;
        b=QGRZkVOZVzjghIxkcT5mFy0gombfLqRGCqvc2jAXdirjOLdm8I8r3GxSsU8w9n8dtC
         jljcMP4ItSHRR+VtxFUhvng1nWlpNnfxQf5KKzDaA4jatCNgycy3SkYfAp2Ook7E/aOr
         kIY3/qWQgVuFFYQorKMg2JwMdGOPgdPMtwUc3CjSF6HEPxcK5gxto+h5Gks9qmnr/Gdn
         PLxbgmOPs5c6QLELhTiOQhTv3H1T/m0WTWfv59btzScP8yzgde7r/z5jqKjhQqjWIA3K
         gXQ9tvVx/XvRqnf7KKDXSICnnaNaf8kmrP7Z1aRKZXLcyzCN/b1zvd69mfTen7C4jv6/
         7QMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Tbogl7671RbnxdkFCBfXod1wBDSAccjEV6hzj4D//96UOzs1uti4kw9sjHdas9ENKTZXiU2OrWuEra0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQzhwH2G7K4TkluWhkpcWqgnT2e7QSHNJ+aOQh1bM4NPKLWe1n
	/D5fULrG4opo8WZCrArb4WY/VYc9BZQqKdI5kCebC29FIUNLumrfhJx0LR9pH4X8Bjn9aoGQ9K7
	uuFHvGAgbWAL7hcngU9LXP/aIBp8=
X-Gm-Gg: ASbGncuhfP9WEUn9lXRWKBZaMaHqoLccWYWZ720WoSbZe4V1Fzo5xfj1vG2937pxAI0
	7Rnn801OMFr44TJ4VebhcRz4SaQBvxBQ+NDx4TTGX82nva1Ey34/evv6SJWITSEUFU2PewAyUme
	8MVzlVO9GUwvEVf8iFmx19YY1kZ30yQfo=
X-Google-Smtp-Source: AGHT+IGp26N/Qy84kSU01eK/5Do0fYdJsM4es4PrHHge+o69giKbvBU1ENd/2FnoaAbJwMTNlGTDVz9olNhPboIJDFk=
X-Received: by 2002:a17:907:60cf:b0:ad2:39f2:3a9a with SMTP id
 a640c23a62f3a-ad4f7292c9amr203602266b.42.1747203903305; Tue, 13 May 2025
 23:25:03 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-10-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-10-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 02:24:27 -0400
X-Gm-Features: AX0GCFtu2D5_c8Hbz8VwjEw3nJ68h3pprbAnRl5y5vgEzz8EGiuxhoCH3nu-9uw
Message-ID: <CAP01T74DY4+n28oWZMS0Sh2FwYYxyMbTLxp8cf+OZ62AS7nOPg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 09/11] selftests/bpf: Add test for Spectre v1 mitigation
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
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 1 May 2025 at 04:03, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This is based on the gadget from the description of commit 9183671af6db
> ("bpf: Fix leakage under speculation on mispredicted branches").
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

