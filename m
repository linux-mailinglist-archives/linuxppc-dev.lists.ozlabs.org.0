Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F57AE19E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 00:17:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xz5Sefdy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvcg26vSDz2ygZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:17:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xz5Sefdy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvcf71xNHz3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 08:16:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD143CE1169
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138E8C433CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695680170;
	bh=ryuTVFj4vTtI4nTc6goek41txhkB/GD5qn2kjIqj4sA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xz5SefdyXNhGS2GjuBWmtBNMTHMxkZ4HkpIfQdM0u8U1cNhbhnCQzIjh4iwxcJ19A
	 IAs1JFaizbW4WPRL293o5SQeLxeKgEIch3MRQ2DRAgBMWIqO1D/+1cTjLzwnjujJUA
	 4xkYc1M5Q6DHiX49AOfagU5dn0pITOJVAVGNBtM4zWQrphYGRoBtsBnz7WTnVW/SZ5
	 jvIi+7AA6EFa9nnYw/qmWtB4eilYDMK2lXYXjxLQigX/edTkYbBbGxH59uYL8eYFHt
	 tjj4mKIGHciVQdgU34IBuntaprg4ZobQFJrMNaJCOc+Je3oWzl/n7JZhCYwfDvNWsp
	 b5i2ThdIfd2Jg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so122944021fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 15:16:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YzdpojGU22S2rfIU6nH3T27ONrKPi3FIvkAxo2yHKfFsb2JaEWO
	zDHpT2GsCL509cwGfod11dFbi3cnxF1io1cXpWg=
X-Google-Smtp-Source: AGHT+IG07bX1hewVqeuIkJ8YDJl9RA+/Pc1SNtg/LytjZgYLyqfLTfJx2FVcJMWOfrpGFUS5CKrBynJkttw9xIZ3uU4=
X-Received: by 2002:a19:c204:0:b0:503:72c:50cb with SMTP id
 l4-20020a19c204000000b00503072c50cbmr6687962lfc.6.1695680168271; Mon, 25 Sep
 2023 15:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230908132740.718103-1-hbathini@linux.ibm.com> <20230908132740.718103-4-hbathini@linux.ibm.com>
In-Reply-To: <20230908132740.718103-4-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Mon, 25 Sep 2023 15:15:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7wDqJZcDezqZOvNvWw5CeCOesgy3SnuxYRzxsB=ZbKXA@mail.gmail.com>
Message-ID: <CAPhsuW7wDqJZcDezqZOvNvWw5CeCOesgy3SnuxYRzxsB=ZbKXA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
To: Hari Bathini <hbathini@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 8, 2023 at 6:28=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.com=
> wrote:
>
> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
> writes the program to the rw buffer. When the jit is done, the program
> is copied to the final location with bpf_jit_binary_pack_finalize.
> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
> if necessary. While here, correct the misnomer powerpc64_jit_data to
> powerpc_jit_data as it is meant for both ppc32 and ppc64.

I would personally prefer to put the rename to a separate patch.

>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit.h        |  12 ++--
>  arch/powerpc/net/bpf_jit_comp.c   | 110 ++++++++++++++++++++++--------
>  arch/powerpc/net/bpf_jit_comp32.c |  13 ++--
>  arch/powerpc/net/bpf_jit_comp64.c |  10 +--
>  4 files changed, 98 insertions(+), 47 deletions(-)

[...]

> @@ -220,17 +237,19 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>
>  #ifdef CONFIG_PPC64_ELF_ABI_V1
>         /* Function descriptor nastiness: Address + TOC */
> -       ((u64 *)image)[0] =3D (u64)code_base;
> +       ((u64 *)image)[0] =3D (u64)fcode_base;
>         ((u64 *)image)[1] =3D local_paca->kernel_toc;
>  #endif
>
> -       fp->bpf_func =3D (void *)image;
> +       fp->bpf_func =3D (void *)fimage;
>         fp->jited =3D 1;
>         fp->jited_len =3D proglen + FUNCTION_DESCR_SIZE;
>
> -       bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + bpf_hdr->size);

I guess we don't need bpf_flush_icache() any more? So can we remove it
from arch/powerpc/net/bpf_jit.h?

Thanks,
Song

>         if (!fp->is_func || extra_pass) {
> -               bpf_jit_binary_lock_ro(bpf_hdr);
> +               if (bpf_jit_binary_pack_finalize(fp, fhdr, hdr)) {
> +                       fp =3D org_fp;
> +                       goto out_addrs;
> +               }
>                 bpf_prog_fill_jited_linfo(fp, addrs);
>  out_addrs:
>                 kfree(addrs);
> @@ -240,8 +259,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>                 jit_data->addrs =3D addrs;
>                 jit_data->ctx =3D cgctx;
>                 jit_data->proglen =3D proglen;
> -               jit_data->image =3D image;
> -               jit_data->header =3D bpf_hdr;
> +               jit_data->fimage =3D fimage;
> +               jit_data->fhdr =3D fhdr;
> +               jit_data->hdr =3D hdr;
>         }
>
>  out:
[...]
