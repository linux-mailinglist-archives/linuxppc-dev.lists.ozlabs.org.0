Return-Path: <linuxppc-dev+bounces-7079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800BA628A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 09:06:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFDMX29Txz30CB;
	Sat, 15 Mar 2025 19:06:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742025976;
	cv=none; b=TNDTnw5R128OS85KTM5vTWH89TcX3CKlcxRzcfntvv9L78P319fUM048SPsRSjI6UaMpWlyz4nDPmigugKSJ4ylbJS/2A5GPgvcOAxy72Ly8Ft5Z3+o+X8IfGPJ4eMmMgLuxUdZZ3NO8x8Ui/E7+zU/QVhttwTs17lBzf6JOlDprJBg0h++D/7imr4voEyOX/62M5CSXkKsg5eaNL5PkmoPwtWVsCKoJdMYsk38YLSfceAGjGHfMVfr1H1FCAuOd164mT9QIUoLUM4od/G4DMlXKNV+KS4E1UKtXW1lSWP807R+Jg3ABbY9rGARuPmqzdLSgARF0jQR4hsMi/rLncA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742025976; c=relaxed/relaxed;
	bh=KnAUZ9wnADDd/J6Z+y4qbTn/E10Mg7M2sjiLjv1pVXs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hw+NjHkpJhYO/HwPnKpJlxTMp62sAF01iUJblX6sqWq6NPX2iIsIRurA3ejj0YNKFV7Zf81hrEEow1O83c0bt9tbBCninvpguPH3S5sWv2AnO02v7rrBaq+vDfMXbBAwGl+5x6hdVuBulOhX4Z+b1YpDOU40bWMBrtkBtt8N9hBA33KtYKw1PL2gev7AbGfDdELlgX7nZ4BbantkrZQkmOWcD8t+OHqAfDv9dkJl0Z3BIVcJkXyEdf5QjheEdkcxM/RMVKGxcYNqP7+lcIk2JnNBk+P/goPLPdHEBrV9tOgab1sunuKfLhsYIUn7sNBkrNBmLPJ4Y/QBXYt5m+cwuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LOUhTQjU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LOUhTQjU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFDMV5LFyz30BG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 19:06:13 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22438c356c8so51396495ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742025970; x=1742630770; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KnAUZ9wnADDd/J6Z+y4qbTn/E10Mg7M2sjiLjv1pVXs=;
        b=LOUhTQjUFVRI3QIMoz8frEgZRG/iYCR7ky7zBKYgWkX6FpRvHOvqKJy402uflHmNEW
         6y4C7tj5GgJkHm3od+7IkzR9g7lr/p8rGmRFV7bHAOeBv8P722OySEmvjBLGWHOFVr1A
         BciePvgSp21d38Tb3ppEuMYVvw7AvQlfnmnuBoX4JtfNBlv9XoeXmTOE0ufr4U5dPMjZ
         ApxAZvUVMy8YdfZYsOyt3B8bPdGgxReYqM74VKtRad4frBrXDpO04EGOcu02dCHbPThS
         I3CaTUuHG2fCG1l8cZ+OjphQfF206mPv2HsyEl+kC8ulDY8ONTcH9uOpUket5oNHm5Xg
         cHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742025970; x=1742630770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnAUZ9wnADDd/J6Z+y4qbTn/E10Mg7M2sjiLjv1pVXs=;
        b=lwOnYnd2EC8LLOKkWGaH6V7bd+MJRxPbqp2Mar1po8P0rljKFa/H4PZVbbg8yE87pF
         BAqIANF8T2/ZkPWQ3k6LYCqYnHqeOpIhpXw4ce/+B+42YLlqNIZviRygV3kisfsqOglL
         nvdeHDnpNpsYAec1/lowroWtYf37aM2ZK53tJmGq3jrB3zwJoLtqBKcUu14MGiscNy+Y
         /gu7e8H2RxFGmoL/39UZTRoNJPcvnUhpf+riDLYt9oZQ2SyvO39x5+k9fnLYlY2tOqFQ
         BC0wwOO0SDmPMIF/MDuS5bNmkXNnI9NuNLR5IcqZWJA1pJMMJZjHOPIOuQw3wiPwnLbv
         vNCg==
X-Forwarded-Encrypted: i=1; AJvYcCUpbtHvkGT2tRriuLbC/RxDLHo3UdtGqamYW+APffdYGbHI7Tld+lPLu987bvZ6nSfm4GgtGfIlEMV1e/0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWEqzQHV0Ve4ASF6czY6lBO1M09OWJURgmOkM1ix+3FSpDtA9e
	Bee3KQvSkG5pWxgwoFDdI+hRSfdlBvPFCk/TMasbfYHaSyyO5bHU
X-Gm-Gg: ASbGnct8kOVv7Sx7O5mCRIGROxTIEdQ2EdPbRsOX+MRHLGWmypAH4xnfR3rhhjt4uY8
	q6pFh17xaKbT2KJLSXeteARMfhCUtT0mMWnzSKlDjMsjLI/Scd3Sk2m2qMpeGVuKrtMw1ysCn1P
	kxN9Nd0tLn93wEDsgQGVzH8hHsdeCBfY++zCVKzpyNpZh0Ra34w4IexW2szDGW14uzTM+Ce/v7A
	hCnmOvWuwFhwv7UNuKNLpp536GTtL+EawzVqxP7MfpxknQZGRNVwXvQwmeFPhhIAuSGjNkp4gv8
	gPumQjww7Wp454HoCWT2T+AzbRyJui5qR4RKfn8lzlNPIruzctE=
X-Google-Smtp-Source: AGHT+IF5en4QKMgNNQsnpb5bVapdvySxgKqbFwNsEVlqfpqV1XchMWc3wIfTVYjTbMqNNkcnfGZ7tQ==
X-Received: by 2002:a05:6a20:9c8d:b0:1f3:2a83:7548 with SMTP id adf61e73a8af0-1f5c13c9108mr7253771637.38.1742025970286;
        Sat, 15 Mar 2025 01:06:10 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9cd03bsm3832109a12.8.2025.03.15.01.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:06:09 -0700 (PDT)
Message-ID: <785b4531ce3b44a84059a4feb4ba458c68fce719.camel@gmail.com>
Subject: Re: [PATCH bpf-next 02/11] bpf: Return -EFAULT on misconfigurations
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
Date: Sat, 15 Mar 2025 01:06:05 -0700
In-Reply-To: <20250313172127.1098195-3-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313172127.1098195-3-luis.gerhorst@fau.de>
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
> Mark these cases as non-recoverable to later prevent them from being
> cought when they occur during speculative path verification.
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

The only pace I'm aware of that might act upon specific error code
from verifier syscall is libbpf. Looking through libbpf code, it seems
that this change does not interfere with libbpf.

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


