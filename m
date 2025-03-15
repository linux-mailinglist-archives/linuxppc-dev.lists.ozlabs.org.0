Return-Path: <linuxppc-dev+bounces-7080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE18A628AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 09:07:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFDNX4DDXz30Pl;
	Sat, 15 Mar 2025 19:07:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742026028;
	cv=none; b=HXFzJZ1ono6amlbvkCZP0ijfcBtELrdk8QPzd0RmL9704kNM2Vq1DUk1Fz/2ErJBr4F4G8Ks3LV0g3fm/9+lLO5MuuSORErcM1X6ehifIqWgUf7aSEWu0t5nWZiktHQ7N/U3MkkyIvk0k3SpAgKM0TZHu2oO+OM+cHGkHhxe7gsyo8eHm25+26loLRR0VyIBgioMKTXt59z8dja+xq4e/10MOXQoLaq4MhIPPY8iQi/v1L+ZR5G8/LHuWckZmTK59OMnr5KynMQ6W2ePyl39/wHH5gJ1cuAgWB/9dEr7WSHD0As2t9nP//0hSq/7u6pkm0Ko5ae9DjmKqHz8gRttFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742026028; c=relaxed/relaxed;
	bh=C5tWsuLYebqW+3y76WtKrIdRf2XYwkMQtn4K8NAAL+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rz4FZQVp8c4HTsUkELBygPzAPehLyeWmwujfDbZY49VMQpEiwkyAamvduN89buwgXS6s9+UtHVvy6EaBbQTuKDM2h//umbQJSlIhE8Um1gmkCYt7/wWs2jlplQxRWBJwluF2KwFqlHH4X0x/mDy9jlYcFobQuZOdxKE/x//W2EGq+p2E+eRoUnjKa5ULKVimPkHWN3KQTvVXlE3K5f6NOVzZngzlKTlJlX5d0nTsrEIPKXQ0cGqfoXDie8Ywgpa7v7Z+Qn2QSbJV/N+mvD55xuh6ruLVSmULXJezQCGAlluzELHSqvkuQCTpkQ0cjdlNnujke8Hm8O1sGpPE8LefpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=doTz3HnS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=doTz3HnS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFDNW6g62z30BG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 19:07:07 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2232aead377so64091305ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742026026; x=1742630826; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C5tWsuLYebqW+3y76WtKrIdRf2XYwkMQtn4K8NAAL+Q=;
        b=doTz3HnSkU/C0CelMgyCGxXg1UXc+uuMuQ/ByJXatI0xHfWF5I8ysF+Yc6nKJIlIzB
         Lg71nQCEB4ZQYLaDocgqoowRKBMxP7A3Cx1jKuXYm9hURaQ1xywWip5UaUP4ROpO+n2x
         RDUcBHyHTQS8LvtZ39Jec87hdb3UoTvvprJkGopBGwu9ZCyb0DdsRElwT6+FV3S98IsN
         m2RkhQVjSsMaTHIvOJFd2S/p1Jbkt6I980wUzxPSCQvPOZcIKRYAlXdacHa5fQNSjMUZ
         3vXStMdNNDpl9+Rr5edRK7KgYYkEiqTT3zSekzBxzu7Y1gFhBxLubZLxz2LhN0UjX6sI
         lrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742026026; x=1742630826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5tWsuLYebqW+3y76WtKrIdRf2XYwkMQtn4K8NAAL+Q=;
        b=ZyIy91k3IV77F1nmEDJgeqgRVgmZviK7BEmVKOz3jay55PElDzpaxbJah0QALc2v6/
         LfLvLnLUNoxPPO0x+4c6Yr1MbmyaZmkPCv8JISyu+00am/UhkaIqWaz4bmOpIy+cuvAV
         KGCHPhnf4ryqSZ6a1KS00VJKTyhlUOoc+A3X21PlnPnlOOdtS7s3R6A1ytJAy6Eb+KH8
         o2CDrf9eYpKWI6vrpgxX4oaFu85CJqNPhaS6q4yKgLhzkWmDPgl/b0myFlLiRnhO3kGr
         1dEG7dDS5+mYvg62UVsJA+uu/EXHLijE1mAaB07Rzt/QDmYtuQFhE15wy3Z3zVk5l0lg
         D1SA==
X-Forwarded-Encrypted: i=1; AJvYcCUyAAqoMVaGfDFV2oKt/Xzuk03qpvS+gFl/g1epJdSEFNb0TxFtjhXH4YXxUESkhkNPNBnjPUyQW7M6bLA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy5atjM/Oqry9WHHKEHaYfOq8bgoQsB+QLnuM95a/fDFV/ceins
	u/ZQGZRrN9drUet9NmpOipj7/DAfN7KWJ5Hh774P5W+R5BGAHfWT
X-Gm-Gg: ASbGncvGS18hh8mNBo+RO/704NKw4JsVs9uyn/aRo6gM+7XUvfcm6bq4X0A9FBSpSFR
	aPGjFeQ7CQu76kIWJzJhBcTVNaNL+jtguQXKFOxlhvqaSj0+xHifcCZuFiDzwtoJwkzk2k6xAyd
	4U7RaOBZhUSe+SJ9wn4mWgwlweD5yBaPEVpmkErwhfMNCAI0Y62sCOn8vCsQEpmS9ChyxtbmV4Z
	LRyDgQOcA7qKjqWYf+KyfWSO72BgPd/PnSJqEPEPWOByksB3u/zY8hFZRxD4lPce7jAaPn+NOiV
	we4KsdR/5oN7sWTrFUZKiOG891F3mqT1JVTrPQuz
X-Google-Smtp-Source: AGHT+IGkNV2xTO9dQHlWSeyy/i0XrYakerLhhNGAIMLNT4Ti+wVWJjCGhEhKRAxcpm1P6DPPcR4EQQ==
X-Received: by 2002:a17:902:ce0b:b0:223:668d:eba9 with SMTP id d9443c01a7336-225e0a15945mr71542395ad.10.1742026026102;
        Sat, 15 Mar 2025 01:07:06 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a80e3sm40085605ad.83.2025.03.15.01.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:07:05 -0700 (PDT)
Message-ID: <46a0770582be4f8f80701aca4eb17b1706609033.camel@gmail.com>
Subject: Re: [PATCH bpf-next 03/11] bpf: Return -EFAULT on internal errors
From: Eduard Zingerman <eddyz87@gmail.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hari Bathini	 <hbathini@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Mykola
 Lysenko	 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Henriette Herzog	
 <henriette.herzog@rub.de>, Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
 Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, George Guo	
 <guodongtai@kylinos.cn>, WANG Xuerui <git@xen0n.name>, Tiezhu Yang	
 <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Date: Sat, 15 Mar 2025 01:07:01 -0700
In-Reply-To: <20250313172919.1103397-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313172919.1103397-1-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 2025-03-13 at 18:29 +0100, Luis Gerhorst wrote:
> This prevents us from trying to recover from these on speculative paths
> in the future.
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Same as for previous patch.

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


