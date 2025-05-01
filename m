Return-Path: <linuxppc-dev+bounces-8225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE4AA62BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 20:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpMqT5BCnz2yNB;
	Fri,  2 May 2025 04:23:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746123781;
	cv=none; b=I16XtQ/3DJEqQSjI2fad08UHn45NGqwCKjhTACWfucWU10wYaw5xeyh4GbVFkIJIUlnoEwrNc+wJ3hQ/Fgda/wn7c+5zcQF5kQukFDIygh+RhKcw+iYLPGDY+j/+b+jRXK7/0iLXQdqdNYDHZQfnMLe6T9aIa3zXyQjhd2XcPUkyhulTVDK2KGM3kbTsLHZNUzMRz42atEWO2SN5L3T3GCm4YFhuOA27De/AXdqzncu8j6HrFSeC1otl/XHuemulB9htdyw0zmZPw5m52vHdnKvuohjBm+Tpgn7oOGgcPDkWL6gDXQ17yI8ZOJS/ysXuEM03Edrzz/MkLbfJpU8B2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746123781; c=relaxed/relaxed;
	bh=Z13IR4R41ZVDKU1pxRT6lsZi2hufZ9axj9XzCLqdM7o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ByNv7+YBLuQOYdxRV2U5mlnR57Dzg2hBklvAprC8bU9qLE3nCTR82D8kWEaTrwsVxHAlbKRe9CsUAZZk21gaK1hSwTlhAy8Ar433+ZAaZvlnIWXTGYijl1/cAB7iXCtyinY9sI24jT2MzV25GqGkdOFpqhqvRjWcLifTKf7MNA5qtgk597u+nXBS++NTbY0rf+Bjs+6NOXniZEOYgM4WFLhAUIiKDS/EdhVfGMepBvjlbJweyf3mFpARMsXWWkOjpPCFWC9r509434uSkKbqebEzyANBcSAJm41kZrKx71heP8ad3U2iRDgN4LA2pXim7U47/FZjkrUox855FgStnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AtK5GD0Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AtK5GD0Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpMqS3DlQz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 04:22:59 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2279915e06eso14897465ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746123778; x=1746728578; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z13IR4R41ZVDKU1pxRT6lsZi2hufZ9axj9XzCLqdM7o=;
        b=AtK5GD0YK/YoMPWzl7yh+YQkOb2PiCFQJ/NslcEAn6tVPSWeqyI9/hBLtFa2d48Xa2
         CQNpEwFb2gQVsK3AbCUL7Aj/KjsQaTAx6GNMNHQtKgjmIDd8xW9HNcDQwz5IK6eJSpO4
         5gy2p0gTEpfxlTndeTus8y7rb2TZmue5tT0/0PPaMx36Cl5uB4xb6ovjlyG6QixJg2Zv
         UELVvk/tjrd8quXlSL9xwWHbGju+vuDj8YWHaBryRO4XbJJHy9DmEZ+27X1SHKeVHCd3
         ocMn8ad5J/vrinNnhuy3TVkxRYaUx97R+azvLkNCwgLoGWRHlniCQWQlDhaGedDHOcF1
         dEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123778; x=1746728578;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z13IR4R41ZVDKU1pxRT6lsZi2hufZ9axj9XzCLqdM7o=;
        b=FKO0t7BeUoL0jVlI9hAjuLijMyHSvwBn8o/5QwkTc8qW5W2mdj6hEZyFmgfqn31WoZ
         QPw1awOROJ9z7Auf8hBEauzFOrByGZfHPf51efDAQ1lmr4kKA3L7mAjDqsED51iqtTqh
         xCC0EcW3yzEk4nuF2Jrq3Wya+Y2xjTaqr7jtQQPcrj1SNfxuxj37XyXacSqAljh7/IEl
         FnittXggtmAvTZiL2Bs+HdyXmJZP7SHk+4p2hAHcIMmjPry1+pOsUoOcvtLkDsz3ZYzG
         SCAGn3L5C66QZrgQ7KwkHIM+9ehLynTdBgLGy9K3P7n6WQ1r8gabETovM17UkonHSmA+
         d6fg==
X-Forwarded-Encrypted: i=1; AJvYcCXCPqvntJTJwJUA8HKgBJjjJAuzq/kpaYKEUa1dUPTmRQfPTiD61tVVIFQp6EUwTpGgrJGS46okGRtZJh0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyoJ0klsRVPQqjCa2cW90EB9eZLWxjd9AFnoUY7YSkG0zx/4Ol0
	4PPyZ9vEbFjnAvEMXgwRCHj+pBeyhY9qUT6mZd1ajbQxn6A87pMH
X-Gm-Gg: ASbGnctaLnESxvP7z9Kh18EOfsZrapv5zhmU83GAhtg4uyM7DwxCClQelEZwhIbENX5
	pkcMB3v9hYjYugtZxMw1iESsVmUBFyAbCsS4iDtQK0JHZr3Mpf0zwtAavje24Jwv612atx8+Rgk
	7CzQYqdFm4Nnk8nGFmg2Qu5TBvvVQhjBcy0pXAC5VlVhEdWbGXRMCA+tuQHRiaRW88tJk52uizV
	DBpetp3jUGHkUp/erkOYFxESyFDzK3sE3jp/rJ917lv2H+Hz5TnrkJHXrZP5GIg9aDWMj4cCNJT
	tSOw6eBnwGYR7GdLtS6BpxRYMUFIGg8Wavu8
X-Google-Smtp-Source: AGHT+IGda6qWln6BFDTM/Gkb68xMR5bi/oz/Rn8j/Adql6uM3+Sv7uKX/O5J0YwlaSlwXSdspZWvYQ==
X-Received: by 2002:a17:902:da90:b0:22c:3294:f038 with SMTP id d9443c01a7336-22e1034037emr552815ad.18.1746123777577;
        Thu, 01 May 2025 11:22:57 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc7b0aasm9869405ad.169.2025.05.01.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:22:56 -0700 (PDT)
Message-ID: <15294d369d94cf005c9aa722967e5ddb1fa8cee3.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 02/11] bpf: Move insn if/else into
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
 <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
 Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen
 <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>,  Dimitar Kanaliev
 <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
 Daniel Xu <dxu@dxuuu.xyz>, 	bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Date: Thu, 01 May 2025 11:22:53 -0700
In-Reply-To: <20250501073603.1402960-3-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	 <20250501073603.1402960-3-luis.gerhorst@fau.de>
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
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-05-01 at 09:35 +0200, Luis Gerhorst wrote:
> This is required to catch the errors later and fall back to a nospec if
> on a speculative path.
>=20
> Eliminate the regs variable as it is only used once and insn_idx is not
> modified in-between the definition and usage.
>=20
> Still pass insn simply to match the other check_*() functions. As Eduard
> points out [1], insn is assumed to correspond to env->insn_idx in many
> places (e.g, __check_reg_arg()).
>=20
> Move code into do_check_insn(), replace
> * "continue" with "return 0" after modifying insn_idx
> * "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
> * "do_print_state =3D " with "*do_print_state =3D "
>=20
> [1] https://lore.kernel.org/all/293dbe3950a782b8eb3b87b71d7a967e120191fd.=
camel@gmail.com/
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

Except two notes below, I think this patch looks good.
Thank you, this is a good refactoring.

[...]

> +static int do_check_insn(struct bpf_verifier_env *env, struct bpf_insn *=
insn,
> +			 bool *do_print_state)
> +{

[...]

> +	} else if (class =3D=3D BPF_ST) {
> +		enum bpf_reg_type dst_reg_type;
> +
> +		if (BPF_MODE(insn->code) !=3D BPF_MEM ||
> +		    insn->src_reg !=3D BPF_REG_0) {
> +			verbose(env, "BPF_ST uses reserved fields\n");
> +			return -EINVAL;
> +		}
> +		/* check src operand */
> +		err =3D check_reg_arg(env, insn->dst_reg, SRC_OP);
> +		if (err)
> +			return err;
> +
> +		dst_reg_type =3D cur_regs(env)[insn->dst_reg].type;

Implicitly relying on `insn =3D=3D &env->prog->insnsi[env->cur_idx]`
is weird. Still think that `insn` parameter should be dropped and
computed inside this function instead.

> +
> +		/* check that memory (dst_reg + off) is writeable */
> +		err =3D check_mem_access(env, env->insn_idx, insn->dst_reg,
> +				       insn->off, BPF_SIZE(insn->code),
> +				       BPF_WRITE, -1, false, false);
> +		if (err)
> +			return err;
> +
> +		err =3D save_aux_ptr_type(env, dst_reg_type, false);
> +		if (err)
> +			return err;
> +	} else if (class =3D=3D BPF_JMP || class =3D=3D BPF_JMP32) {

[...]

> +		} else if (opcode =3D=3D BPF_EXIT) {
> +			if (BPF_SRC(insn->code) !=3D BPF_K ||
> +			    insn->imm !=3D 0 ||
> +			    insn->src_reg !=3D BPF_REG_0 ||
> +			    insn->dst_reg !=3D BPF_REG_0 ||
> +			    class =3D=3D BPF_JMP32) {
> +				verbose(env, "BPF_EXIT uses reserved fields\n");
> +				return -EINVAL;
> +			}
> +process_bpf_exit_full:

Nit: since we are refactoring I'd extract this as a function instead of got=
o.

> +			/* We must do check_reference_leak here before
> +			 * prepare_func_exit to handle the case when
> +			 * state->curframe > 0, it may be a callback function,
> +			 * for which reference_state must match caller reference
> +			 * state when it exits.
> +			 */
> +			err =3D check_resource_leak(env, exception_exit, !env->cur_state->cur=
frame,
> +						  "BPF_EXIT instruction in main prog");
> +			if (err)
> +				return err;
> +
> +			/* The side effect of the prepare_func_exit which is
> +			 * being skipped is that it frees bpf_func_state.
> +			 * Typically, process_bpf_exit will only be hit with
> +			 * outermost exit. copy_verifier_state in pop_stack will
> +			 * handle freeing of any extra bpf_func_state left over
> +			 * from not processing all nested function exits. We
> +			 * also skip return code checks as they are not needed
> +			 * for exceptional exits.
> +			 */
> +			if (exception_exit)
> +				return PROCESS_BPF_EXIT;
> +
> +			if (env->cur_state->curframe) {
> +				/* exit from nested function */
> +				err =3D prepare_func_exit(env, &env->insn_idx);
> +				if (err)
> +					return err;
> +				*do_print_state =3D true;
> +				return 0;
> +			}
> +
> +			err =3D check_return_code(env, BPF_REG_0, "R0");
> +			if (err)
> +				return err;
> +			return PROCESS_BPF_EXIT;

[...]


