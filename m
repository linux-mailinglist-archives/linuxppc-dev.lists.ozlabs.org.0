Return-Path: <linuxppc-dev+bounces-7077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79233A6233D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 01:38:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZF2R0609Lz30TM;
	Sat, 15 Mar 2025 11:38:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741995618;
	cv=none; b=V9Uhc18z6+YJC4clY44db/zO1Jb+Nn8z/ucP8rHjoaG4wbSfZ2mdOXhGYpRjWE4bSpJzeBN1pL+lbUccRJgiZhWSZ14U8TzOV6qWtVvmLJ3GEuZpkoNoK5KNEiOWbuw7yQt1LoQJN4I8+LwsnGfBGMUe3atyQKhE4THvOi2TG2GtZJtZQehlMX3b6YWL8rp3fkb95sFSsIXC7u9KURJigXWKcwu6tH/NRxoPPC+0E0FmiKeWZxgs9/eL9tDTDxi09k1yCEwUAIOCgAIucqzk1FQA4/DMGbXIB4CLLrfqJluA7jHg7itxKadNa7ZRlBj+ot5mrYk+0y3li93z7MlnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741995618; c=relaxed/relaxed;
	bh=nVsn+tfKHHydjyMGFQzYaSfWZr4r8NiOObk/ROots50=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QaHXksYuleQBH3Uxo7Zh6dhTDFfPjVKkLvjKwTdDpyf5y2fy8vNHpZnSSe1nMdnf2oZzonYsletBpuBKIPackkalIlnzdByDpiQrcQe4AAtbyyFQoq3eWFyFKzdTT5CZGprlPo/CQnNnHgxhlmy+kGbsc1mIZQ+dDzT73CUw8oQZm0Q+Y4jALqdtPCTPmZ7G0B1SQbewsOklvpMPnmNgAsuI66Rh+XJ/4/XSdxPjTBEAOoigtIH7Utv7eufBY/ihBk/Wks6JeMfLZ3KmUzaoY+n6wE19eyR1piC9umYPRwDb7bTQEbtE4l+blulh6EDdkAs9SoKbSpIlVIikqqmscw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KJfoFWgZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KJfoFWgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZF17j0X5mz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 10:40:15 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223fd89d036so55049275ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 16:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741995614; x=1742600414; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVsn+tfKHHydjyMGFQzYaSfWZr4r8NiOObk/ROots50=;
        b=KJfoFWgZFh0ANQ6ctrGeITd3E4EchClPbTUHUEorTgWr1dL5S+n5iGjA+TUckFY0mj
         R+1G8W/akLJycD7+QfPzQoj7iUJGzjXItUg+RXSDNWVQS72DNkGJcn/kpz5wElBIc9z1
         hMz13iQhk+CGni2Irgep+AKd2Orz2PM7h+W5nL1jLnkb2UHpxmuYUkVVcLmFyZZPW5kG
         9q7k65ZCriwmgJTHYPiUl+CxNK46ddJiVmcfqRjJITf0QUJ0U5JPKerRvB2uRmGfUVPC
         TASKvvQNMTRm8/sQtQRpO42DttUv64swa5SWnWdcSf9yIV6IxQLS1HxbmnLGVnmcUwlE
         JZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995614; x=1742600414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVsn+tfKHHydjyMGFQzYaSfWZr4r8NiOObk/ROots50=;
        b=xUt6GrR8JGd3XwqQr+dfioqgn/ETbOzDoRqYuXGkWaPjsqKN1gbidShpumr1DNvJiw
         mNgL/e8XOVpfg4BiGc5pM1skyNYu1Ccz4m6002/prI7it4/K69ch+hVIAyNVwHICGwO9
         xT6hls8Lp3MsDxOXBDarPga6HKqTeNywbFxSdPI5Ih2CkNjBsF5DdoLFfIgC9tfwA+eU
         tqR4WfX8UbauJtM1anHQq8ebUcrdVMqa7KI0CwosmWAiKRzH1IenZ5k0i2eOp36EC0yf
         8sw505F+gEhqdpSC4w+DMbBAcSaQto6M5eH8puRH5KfOjBSSaKXX1HYxUdFNhwTX9W2J
         3IEg==
X-Forwarded-Encrypted: i=1; AJvYcCW40c4qHNMhGyREeL1Dtn3WDody56mq7yJfAAmRRHEifLLDUhqaWs50PXVZeDl07KpNLiXKDwQNjFuvaP4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx525SK9w444QHVsevYCwZ5N9G6DVIPotdYOWq1Nue1rTxxqcFw
	+SGD005BOdsqfJXr6pWypi7XyowpGRkv/kUQV2GeSPX7si2mBt+P
X-Gm-Gg: ASbGnctKx7yrbq7tNdCq6Qoic/1/58W+iEZ86gkVgNtXVArW9wAL9/5l/XhXwc9MBcd
	P+Mv/10g5wb+o2CFdhr18TW6U3Tb6uutZOah26UFM5wmZ9mfuAF18u8Yarv3O4OKqKtdI6jtRfO
	rpTBH8AoKotiQkPn7Wo8dXt5bGcv9l//5N9j+DeLIR2/Y+vKL8+ErnLQctPOjaszcfwV3u/0yzw
	e9jgGnmnzsBKVlpczwIBJgoXnX4iiBEfqfYe4jUxpc8Bychkam8JvRJeLUOL1nK3RshEPdiFd/8
	/fnQdZQT6qJzwEeGPIk1455k6wfmGYei/ff2al2y
X-Google-Smtp-Source: AGHT+IGjOrXc4ow/tKqJ4tqaPFLLb7WlMrAJtuGww00AJ+3W8ap1jSuRZuNSWgniLxNwNri94jxBaw==
X-Received: by 2002:a17:902:f70b:b0:224:d72:920d with SMTP id d9443c01a7336-225e0afa009mr57678505ad.37.1741995613632;
        Fri, 14 Mar 2025 16:40:13 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm33890155ad.249.2025.03.14.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:40:13 -0700 (PDT)
Message-ID: <f6f08d64c777a6022771ab0adf96cefb6b631d75.camel@gmail.com>
Subject: Re: [PATCH bpf-next 00/11] bpf: Mitigate Spectre v1 using barriers
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
Date: Fri, 14 Mar 2025 16:40:08 -0700
In-Reply-To: <20250313172127.1098195-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
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

On Thu, 2025-03-13 at 18:21 +0100, Luis Gerhorst wrote:
> This improves the expressiveness of unprivileged BPF by inserting
> speculation barriers instead of rejecting the programs.
>=20
> The approach was previously presented at LPC'24 [1] and RAID'24 [2].
>=20
> To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> potentially-dangerous unprivileged BPF programs as of
> commit=C2=A09183671af6db ("bpf: Fix leakage under speculation on mispredi=
cted
> branches"). In [2], we have analyzed 364 object files from open source
> projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> programs.
>=20
> To resolve this in the majority of cases this patchset adds a fall-back
> for mitigating Spectre v1 using speculation barriers. The kernel still
> optimistically attempts to verify all speculative paths but uses
> speculation barriers against v1 when unsafe behavior is detected. This
> allows for more programs to be accepted without disabling the BPF
> Spectre mitigations (e.g., by setting cpu_mitigations_off()).
>=20
> In [1] we have measured the overhead of this approach relative to having
> mitigations off and including the upstream Spectre v4 mitigations. For
> event tracing and stack-sampling profilers, we found that mitigations
> increase BPF program execution time by 0% to 62%. For the Loxilb network
> load balancer, we have measured a 14% slowdown in SCTP performance but
> no significant slowdown for TCP. This overhead only applies to programs
> that were previously rejected.
>=20
> I reran the expressiveness-evaluation with v6.14 and made sure the main
> results still match those from [1] and [2] (which used v6.5).
>=20
> Main design decisions are:
>=20
> * Do not use separate bytecode insns for v1 and v4 barriers. This
>   simplifies the verifier significantly and has the only downside that
>   performance on PowerPC is not as high as it could be.
>=20
> * Allow archs to still disable v1/v4 mitigations separately by setting
>   bpf_jit_bypass_spec_v1/v4(). This has the benefit that archs can
>   benefit from improved BPF expressiveness / performance if they are not
>   vulnerable (e.g., ARM64 for v4 in the kernel).
>=20
> * Do not remove the empty BPF_NOSPEC implementation for backends for
>   which it is unknown whether they are vulnerable to Spectre v1.

[...]

I think it would be good to have some tests checking that nospec
instructions are inserted in expected locations.
Could you please take look at use of __xlated tag in e.g.
tools/testing/selftests/bpf/progs/verifier_sdiv.c ?

[...]


