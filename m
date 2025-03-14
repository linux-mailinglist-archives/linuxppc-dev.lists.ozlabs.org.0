Return-Path: <linuxppc-dev+bounces-7076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C152BA62337
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 01:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZF2MJ0lV2z30CF;
	Sat, 15 Mar 2025 11:35:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741992433;
	cv=none; b=EVt5ETRu/atufH9akCzUnXcDCJcEWQPLLKmnt8o9UMowBah+dJS8HFQLhHFLtG4L9jmvZy0frGQC6ti+y1bgPcQIvItNv3Vsu1NEckCCB1h9+9o2d8c5qpxlTd2PgrH3lzTBpQJ9Dsj0j+V52U1uVRISxYe3FPzLR/fU18HJuF2M2okrDF+FuU3u/h3lTLB/MmAHjQy+21qJHVn/yx5cKpV+axENwcYbYobdMw3Lxz3zi+isBLv3dkWWNL1NI399YdHC/VHcqF0WATRbfxLehFng9hy9e/K9TqH3yR4mCYqyIos3ay/O6vOtNLdD5PvUbYS7o1G2cJX5e6/w7gTEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741992433; c=relaxed/relaxed;
	bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BpS6TAChrszfQdGPbKf3O9AUrtl6/oQ+TP2/+HIsre7geWf96Js/mJbqHJbbMgtHVNT1Mm9yVj7k5+mDLpF/TooewvQoUhTU2/xaeJ03Th53U1G5uMSEV5cdk5Q4K8D4bcQihikH25Z0XyKlepOrUNEsCnIAuX9lGflYLB7CAPkv0WkJQzNaOGShHkYF14AVuFCVuZC5NoJ73T36eMZ3Fyk6qYDtD4zy/LtPtPa9uHQSE60qAeM8ZAkstxFKG9zpPiruzte2QoHz+3NbDjTNuy8iBAvgk4WOHORY3u9XGFNz/UrkwNFJr1pSBfM+1F7il/Ufmc8bYVHihWh+tf31Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ehO0ftbB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ehO0ftbB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDzyS0600z307V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 09:47:10 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22403cbb47fso48805335ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741992426; x=1742597226; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=;
        b=ehO0ftbBHSxtFD0g2QcvgqnOttrz41loEhS3nv1CJ8uI9YsVtkVDgYGon2oYQUcofr
         2yc6NTaZjmqqcLKf1iQLKLzNpuhPlDKTIWUse3bbKM1xKjpsHPZmAqvCitRpUSgWHNLu
         vz/AIeshNK4pdN6K6JjJ6e4DOyWxAlFdvt5y9MeNH2zS7DOQ9sJTG7sqcm8q6K2P8FOZ
         KO14Xnu52nigPnm7UruWecgHQGA1mGuWTnK628/oZ0o8Bb0CMuZWOS16ojAqViMEXmKb
         xHyAjC7/THx5gFbN1v1rR96FLcUoBD8WE5AJrfrl68u+Z/xSzQ5whVrHqQbCIR6xLG23
         +e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741992426; x=1742597226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zZoEhi64Kn/eQi3WO9JY1pGevNfO0NZbYey6p1uGuc=;
        b=e48aQt1bo7vjZjVA5sslG99E36++uPm7sAg7MYLyqlc3duU2BWUA6B6AxXW/GY21c1
         EPyOki5E17RHfNumemAMRGTAz08WywY58AMymEIvbiXoLsUbzlkdWYDdLyHvXvsHszRN
         RJvpIsPETQI5B6FrVDiwIJcuLxpxLkuXRYEONx5KvK3tv36kYwddyvTa5PR2Hc959USE
         qalrgIs6Kv8521+wT7qOEH/SvRG+aLZt3HHM+kPRpIamejUvxGDLZwnPjPTy0pcmasq8
         Mq5OZGGaOESW/ZPw7Dm3YTatYsrF9ForAo2hvU7maFleOqmBFfa63/1xQMLBpZ1lJ21t
         j/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUs8EWjT33w9e4/UjSKzr/Xchd3HMU+UjLd4mmP+KzS5UCBnuGxpk0BgAflgUuWzMwB/CC9uED3s/8E9RY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypNex7TUin9OkVHmjfrLCoYjCbXu38lldvnclorp8RPQbRsnUc
	uUab0+KxRlCu6BWmL4dLwrn7nLlZcSLJBEmw4TjNzQfPYUEUrW/4
X-Gm-Gg: ASbGnctJyjDDHTm79/kcoxJGFA8MDcR9ntBubpw6cHyvXV4b/mX00gwPRId6XnzePNE
	zY56u7G7Tz9932QFbx3RAH6K4i3F367T7uzMau7WGeNSeNdyxZTK4ACJfmLrV91b/wR14pTALet
	aLFAj5HJ5d4jjY3sw9jZFkSpJTvQWTiPyI8qVl0VmRpiZCnOVtEKc3dCmbUt1swLQA1B5DlJkoF
	C6VHpwAZkqIcwrTw8tcUzfJ400bj5LtjFv3NK/kFxC8Drl0M8jB1AaTwrCYYZHR/zkzEuCpx3nA
	uv3CPWPBSLbNACk/OKYNDk91Hd6lfpMNrCX61tsK
X-Google-Smtp-Source: AGHT+IE5BsFikv0Zy/M5K5/YooQ0IZXHiKgPfdHvD36gcvkA4VKCXVrThbSUpc5Gp513eGAfeESaMA==
X-Received: by 2002:a05:6a00:92a3:b0:736:4abf:2961 with SMTP id d2e1a72fcca58-737223e8ef3mr4206808b3a.17.1741992426214;
        Fri, 14 Mar 2025 15:47:06 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115511cfsm3390784b3a.45.2025.03.14.15.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 15:47:05 -0700 (PDT)
Message-ID: <293dbe3950a782b8eb3b87b71d7a967e120191fd.camel@gmail.com>
Subject: Re: [PATCH bpf-next 01/11] bpf: Move insn if/else into
 do_check_insn()
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
Date: Fri, 14 Mar 2025 15:47:00 -0700
In-Reply-To: <20250313172127.1098195-2-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	 <20250313172127.1098195-2-luis.gerhorst@fau.de>
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
> This is required to catch the errors later and fall back to a nospec if
> on a speculative path.
>=20
> Move code into do_check_insn(), replace
> * "continue" with "return INSN_IDX_MODIFIED"
> * "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
> * "do_print_state =3D " with "*do_print_state =3D "
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

This refactoring is a long overdue, thank you!
A few nits below.

[...]

> +		err =3D do_check_insn(env, insn, pop_log, &do_print_state, regs, state=
,
> +				    &prev_insn_idx);

- `regs` remains declared in do_check(), while nothing prevents
  pushing its declaration to do_check_insn().
- `state` is `env->cur_state`, so I'd avoid passing it as a parameter
  (just to reduce count);
- `prev_insn_idx` is unused by `do_check_insn`;
- `pop_log` is not used by `do_check_insn`;
- given that `insn` is presumed to correspond to `env->insn_idx` in
  many places down the stack not sure about this parameter.

> +		if (err < 0) {
> +			return err;
> +		} else if (err =3D=3D INSN_IDX_MODIFIED) {

Also, I'd get rid of `INSN_IDX_MODIFIED` and move `env->insn_idx++`
into `do_check_insn()`. This would save a few mental cycles when
looking at the code with full patch-set applied:

		} else if (err =3D=3D INSN_IDX_MODIFIED) {
			continue;
		} else if (err =3D=3D PROCESS_BPF_EXIT) {
			goto process_bpf_exit;
		}
		WARN_ON_ONCE(err);

		if (state->speculative && cur_aux(env)->nospec_result) {
			... bunch of actions ...
		}

		env->insn_idx++;

One needs to stop for a moment and think why "bunch of actions" is
performed for regular index increment, but not for INSN_IDX_MODIFIED.

> +			continue;
> +		} else if (err =3D=3D PROCESS_BPF_EXIT) {

[...]


