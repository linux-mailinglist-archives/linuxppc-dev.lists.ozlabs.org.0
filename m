Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61B65F5F3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 22:41:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Np0K244qvz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 08:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAIF+O/O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAIF+O/O;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnhFC1kwWz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 20:36:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1C5CB8198D;
	Thu,  5 Jan 2023 09:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0252BC433EF;
	Thu,  5 Jan 2023 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672911401;
	bh=m5deoU/iNE9s4Vf89FWDMooWeaxz9CcPD3sBSp186Jc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XAIF+O/OJ8hBrx0XzmPtDLuBUKq1L7we5ffh4nU0DiEwdYjDuZac51Wso30jJIXI7
	 7UdB+1Up/st73efB6kDy9jSKt8fsIjDDVW1luXjxGQ3tXjnpAZYc4ZwwQqwIW05Q4M
	 HhyiOXwyM4MouTVuSouy27QZk/drd+8Mt+sLauqQJLv5veN4qc2oGN/T/hG/UPoesC
	 qc4lK6AhHapx5A6VflLx01e6ATIAF1fvVZDoRGsHyPZv4lse8uVPpDZsPQPzfIgfaQ
	 qkr/QlxpgTMERkK/4vkOLDFNz0Gs03AYb1ySIb5XUJFd0DpUe7gUpK6NFfw+JSZaoB
	 idO9R04j1Pugw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: tong@infragraf.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.or, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
In-Reply-To: <20230105030614.26842-1-tong@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
Date: Thu, 05 Jan 2023 10:36:38 +0100
Message-ID: <87zgaxqq55.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 06 Jan 2023 08:40:23 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Tonghao Zhang <tong@infragraf.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tong@infragraf.org writes:

> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index 737baf8715da..ff168c50d46a 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -151,9 +151,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>  	}
>  	bpf_jit_build_epilogue(ctx);
>=20=20
> -	if (bpf_jit_enable > 1)
> -		bpf_jit_dump(prog->len, prog_size, pass, ctx->insns);
> -
>  	prog->bpf_func =3D (void *)ctx->insns;
>  	prog->jited =3D 1;
>  	prog->jited_len =3D prog_size;

Acked-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> # RISC-V
