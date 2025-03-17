Return-Path: <linuxppc-dev+bounces-7109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC0A646E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 10:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGTtt1zSwz2yfy;
	Mon, 17 Mar 2025 20:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742203158;
	cv=none; b=cEXiJvkHZ8ibF13nYMWOR84nwPtqzXJ0MLBlPOoaL+JdYm99xgtZ8ES0FI3UjLalb8qR/oYicHhh7hp24TmbaFRKwtjIQOJZLuGL/apaUXWpezQdUDarSO2UJTptFpPkLTXYt2yY1O115qW9R0MqM2+wW2Db31PVom4tAMi8/uORKoupTLpP9MptNNC3Uc4hdhZOXr4bf2V9V6HHXxhviH/tBk3WzuIILuQAX3Y/FKuiuyJ0ZULMALtrcTqNCZXR3tB6UgKp+S9vyj18AYy01AJ8M0fBrjzweZTt+41NCUmuoSD/BQ7Iy8owBsuqWSgpK5mTgpVa9Pluquhb2GTwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742203158; c=relaxed/relaxed;
	bh=lMORBukfDNOzWrCEQijjWj2H6MggMJxZRFJuSPvnV3s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tip2BtdfXnYdwm+4HRfDdrOwwUOS+BEc+QxwkmJwabQYHw25p4OXg22byzitv0tyRCHG8H/26AVDdZWTcyLw1/+RZq35Xxh4Ilhzy+Vfz82lSXjN/2h0Dd4RkIHXb3JZuHgO4W/lI22MH/eg5i7Km8TupBqtfKuB9pHcN38OxA7AbguLyO39VrwWmwyyZ+J94OLZ81zglO5V/w2EZIjdOB7SbO13w+8INYiqu6m0G7w1YCR0GXt8XcVIcXdagW5CakFrB+XBkmkns2dqbVP+pFltmKpGIVHvNX9BCr3fFww3SUIkNvm8wMTBQKpTv3ehDZ2NTz3qphF+G6dHPShv8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B4slC08c; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B4slC08c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGTtr5lsTz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 20:19:15 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-225df540edcso46316455ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742203154; x=1742807954; darn=lists.ozlabs.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lMORBukfDNOzWrCEQijjWj2H6MggMJxZRFJuSPvnV3s=;
        b=B4slC08cx5cZpiBhmUrVMNKIEtQVX0rZOzgqB/w85SqciAfy3DBC9u8QYh019zRAL6
         9as+o7GmUtMJIgdHdB1+Keoym3eZ/Mundy1Ajj9NcUjgkjWI/VUtg01LQZZ9SP+V70FX
         Gk8yDHFG04ubge2msQ2k+1Gnyo+deRpt+QTkk98StyNibsRHCH+MGyDhlSOk67RKQqRO
         leXrNoPd/8pprtRdltM+1G/nYfByjKiV/kfiQ5XOtzG33xogXsOKHIIJoB4ULS+aEiH4
         c1Jlbu5wyequr0VkEcfD55tdrS/SNxlrkaPJLVL7oU+dxdw56KPvMrIy6SIEDGFEf7kt
         ObZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203154; x=1742807954;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMORBukfDNOzWrCEQijjWj2H6MggMJxZRFJuSPvnV3s=;
        b=b4q4OmNt6MmvIi4+ugwRgA7p4OtnGSgE410CtyhmTQLsRRqT4+JeVa8FLQCW2vzJRa
         lSqzFofT88Fz/lVWae612mm2HjJKZhJGV8gvSPHd2Zi2o5KQy3C9k+CR83J5VsrGJ2ha
         pfeScJwu7WkGRScQGFjwFG/T8Blp3dK8NTgPuA7pOxdunAQ94MfiVitAi4kDR1uXuCX8
         X9s7DqDjBTWUsWzEtk2cs+fX7Xd0ai0+R3fBKwMUKDo/dGQR8y8/aRlUjQ5Xc3kjqIv2
         a/0hGD9W9cBsdmNXKjMUbZp14Naoslo1IXM6EPM95MBps+yVGGSOF9ups0UbZZkpdDl1
         z1wg==
X-Forwarded-Encrypted: i=1; AJvYcCXPcFKXbL7r9yhvqrTZSd7mhEGgzEc3PLxYWK8IzJcZcyOnAvPTMmjpKhZ0HFFQ1T3RI6uPSCCE7/aIXMk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxgutw7mVJofZrqkcVoZL06F0WB2dE3iwjKXTbWyhdsbtwFZYkQ
	LamUflRNkex0ZPCzIzQ6Piw3QxwWHYNWso3DxygpJVCwiuhkXs8x
X-Gm-Gg: ASbGnct/nIy8X59s/OboBefytIf6a5wsKZFG6xTCcADiRu12lUHnbFXVa6rSda0Vhsy
	Yi9VqMjraHFdDoqRIWPMLWG/fAk4NAeFhczVWiSm5utcPQgXJ0yMTkYK3EUisLheoS2B+WOQe9w
	2OGEQz9AilxMNQVI8F671eLmaITEI+os/IihaiY2GuLdmnjn1sS/g5aPeJkpsCqgQ7M9KeOObaT
	Qm3wLUcziXJYkVlVqp/YCl77mz5nYQjLmW2AGIE5g6Jgv8vtW04yHys11lixbIYME1P7AweeGMA
	egpMkaLB406uuikwsmmAyUKG001Hzagija0PWUJFYnOkItRXHAI=
X-Google-Smtp-Source: AGHT+IFQrLJwhlX7+RiGH3CxZ9FfxID5MIfJ1arkUBWGEnsa5Y9RjhdscgDV1ztpHSFUF5oJv7iB3A==
X-Received: by 2002:a05:6a00:8306:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-737107f9d11mr17429679b3a.8.1742203153453;
        Mon, 17 Mar 2025 02:19:13 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115293f6sm7340451b3a.14.2025.03.17.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:19:12 -0700 (PDT)
Message-ID: <9083b52fd4a2d7a5a0473e858042c277c883f8b0.camel@gmail.com>
Subject: Re: [PATCH bpf-next 09/11] bpf: Return PTR_ERR from push_stack()
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
Date: Mon, 17 Mar 2025 02:19:08 -0700
In-Reply-To: <20250313174149.1113165-4-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313174149.1113165-1-luis.gerhorst@fau.de>
	 <20250313174149.1113165-4-luis.gerhorst@fau.de>
Content-Type: multipart/mixed; boundary="=-pU3IArgK79wjJvjdvEwt"
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--=-pU3IArgK79wjJvjdvEwt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-03-13 at 18:41 +0100, Luis Gerhorst wrote:

[...]

> @@ -2011,8 +2011,10 @@ static struct bpf_verifier_state *push_stack(struc=
t bpf_verifier_env *env,
>  	int err;
> =20
>  	elem =3D kzalloc(sizeof(struct bpf_verifier_stack_elem), GFP_KERNEL);
> -	if (!elem)
> -		goto err;
> +	if (!elem) {
> +		err =3D -ENOMEM;
> +		goto unrecoverable_err;
> +	}

Could you please point me to a location, where exact error code
returned by updated push_stack() matters?
I checked push_stack() callgraph (in the attachment), but can't find
anything.

> =20
>  	elem->insn_idx =3D insn_idx;
>  	elem->prev_insn_idx =3D prev_insn_idx;
> @@ -2022,12 +2024,19 @@ static struct bpf_verifier_state *push_stack(stru=
ct bpf_verifier_env *env,

[...]


--=-pU3IArgK79wjJvjdvEwt
Content-Disposition: attachment; filename="push_stack.dot"
Content-Transfer-Encoding: base64
Content-Type: text/vnd.graphviz; name="push_stack.dot"; charset="UTF-8"

ZGlncmFwaCBHIHsKTm9kZTB4NTVkZDRhOGQ0YjUwIFtsYWJlbD0ie2NoZWNrX2NvbmRfam1wX29w
fSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YWEwNjc5MCBbbGFiZWw9IntzYW5pdGl6ZV9z
cGVjdWxhdGl2ZV9wYXRofSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YThjYTU4MCBbbGFi
ZWw9IntjaGVja19oZWxwZXJfY2FsbH0iLCBzaGFwZT1yZWNvcmRdOwpOb2RlMHg1NWRkNGE4Y2Yy
NjAgW2xhYmVsPSJ7Y2hlY2tfa2Z1bmNfY2FsbH0iLCBzaGFwZT1yZWNvcmRdOwpOb2RlMHg1NWRk
NGE4OGQ3ZDAgW2xhYmVsPSJ7ZG9fY2hlY2t9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4NTVkZDRh
YTNhMzYwIFtsYWJlbD0ie2FkanVzdF9wdHJfbWluX21heF92YWxzfSIsIHNoYXBlPXJlY29yZF07
Ck5vZGUweDU1ZGQ0YTc2YzYyMCBbbGFiZWw9Intkb19jaGVja19jb21tb259Iiwgc2hhcGU9cmVj
b3JkXTsKTm9kZTB4NTVkZDRhOGJhODUwIFtsYWJlbD0ie2FkanVzdF9yZWdfbWluX21heF92YWxz
fSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0OTU5ZmU0MCBbbGFiZWw9Intwcm9jZXNzX2l0
ZXJfbmV4dF9jYWxsfSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YWE1YzFlMCBbbGFiZWw9
IntzYW5pdGl6ZV9wdHJfYWx1fSIsIHNoYXBlPXJlY29yZF07Ck5vZGUweDU1ZGQ0YTlhM2FjMCBb
bGFiZWw9IntwdXNoX2NhbGxiYWNrX2NhbGx9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4NTVkZDRh
OWZiOWQwIFtsYWJlbD0ie3B1c2hfc3RhY2t9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4NTVkZDRh
Nzc4ZGIwIFtsYWJlbD0ie2RvX2NoZWNrX3N1YnByb2dzfSIsIHNoYXBlPXJlY29yZF07Ck5vZGUw
eDU1ZGQ0YTc0MTk5MCBbbGFiZWw9InticGZfY2hlY2t9Iiwgc2hhcGU9cmVjb3JkXTsKTm9kZTB4
NTVkZDRhNzQxOTkwIC0+IE5vZGUweDU1ZGQ0YTc3OGRiMDsKTm9kZTB4NTVkZDRhNzQxOTkwIC0+
IE5vZGUweDU1ZGQ0YTc2YzYyMDsKTm9kZTB4NTVkZDRhNzc4ZGIwIC0+IE5vZGUweDU1ZGQ0YTc2
YzYyMDsKTm9kZTB4NTVkZDRhNzZjNjIwIC0+IE5vZGUweDU1ZGQ0YTg4ZDdkMDsKTm9kZTB4NTVk
ZDRhODhkN2QwIC0+IE5vZGUweDU1ZGQ0YThkNGI1MDsKTm9kZTB4NTVkZDRhODhkN2QwIC0+IE5v
ZGUweDU1ZGQ0YThjYTU4MDsKTm9kZTB4NTVkZDRhODhkN2QwIC0+IE5vZGUweDU1ZGQ0YThjZjI2
MDsKTm9kZTB4NTVkZDRhODhkN2QwIC0+IE5vZGUweDU1ZGQ0YThiYTg1MDsKTm9kZTB4NTVkZDRh
OGNmMjYwIC0+IE5vZGUweDU1ZGQ0OTU5ZmU0MDsKTm9kZTB4NTVkZDRhOGNmMjYwIC0+IE5vZGUw
eDU1ZGQ0YTlhM2FjMDsKTm9kZTB4NTVkZDRhOGNhNTgwIC0+IE5vZGUweDU1ZGQ0YTlhM2FjMDsK
Tm9kZTB4NTVkZDRhOGQ0YjUwIC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKTm9kZTB4NTVkZDRhOGQ0
YjUwIC0+IE5vZGUweDU1ZGQ0YWEwNjc5MDsKTm9kZTB4NTVkZDRhOGJhODUwIC0+IE5vZGUweDU1
ZGQ0YWEzYTM2MDsKTm9kZTB4NTVkZDRhYTNhMzYwIC0+IE5vZGUweDU1ZGQ0YWE1YzFlMDsKTm9k
ZTB4NTVkZDRhYTVjMWUwIC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKTm9kZTB4NTVkZDRhYTA2Nzkw
IC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKTm9kZTB4NTVkZDRhOWEzYWMwIC0+IE5vZGUweDU1ZGQ0
YTlmYjlkMDsKTm9kZTB4NTVkZDQ5NTlmZTQwIC0+IE5vZGUweDU1ZGQ0YTlmYjlkMDsKfQo=


--=-pU3IArgK79wjJvjdvEwt--

