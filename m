Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCE6B53DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 23:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYKwr0Q1Gz3g0V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 09:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xry2bQDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xry2bQDF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYKpD44F9z3fht
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 09:04:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1EFB61CC9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 22:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1653C4339E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678485856;
	bh=X+V1obY9k9q5Lqak9f20lCniJONGHDWm3UfEXRBKy3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xry2bQDF2Psv9UQ0fSHPIBZPx8PoKZBCW+8jbuJgRjT3/ik8sScblqYBFlF62y4Jb
	 QdBz6BNFoU7ifw7ITmCexI3C8KCQSm3SLcz4d/E5bvNmsftHWk7LzlMhZWB0D4jOqV
	 sWAjVEpLj+7aKlENZ2JeixUf0BJXaOfCrrWfWSR4bv/PRIhED6KyJboZhBCF3Fb3UQ
	 qawYBvlvi0wj8hXBEP3MkKMWjIZ+/rnfhNsj5xh3h+41oFV9FipZv44Lfw7ijEGB32
	 JauFl49F+snrXGThS3mWKpmVhrDgqzvLwtgtbgTdz/bbbq1ISBWnOFUPkNQmYTnIqs
	 aE7SB+wBkrNrQ==
Received: by mail-lf1-f41.google.com with SMTP id k14so8485206lfj.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 14:04:16 -0800 (PST)
X-Gm-Message-State: AO0yUKXuiP5sI8LEDepvBwkcNEDETnxQD4FHO5q4cq0YsZFvrZ5o2vot
	wDATPCUh7BgCUAgdSVqE+SGOGYHW46VwlDakJzs=
X-Google-Smtp-Source: AK7set/Gf3Y2SAywkERyf8wbQ7IxYD4QzZr7tNhfTElRC0kHLCpAZvrxVel8DA5dL1b7PM0RIIKWkR63fXwXAelyw9Q=
X-Received: by 2002:a19:e019:0:b0:4d8:86c2:75ea with SMTP id
 x25-20020a19e019000000b004d886c275eamr1664591lfg.3.1678485854943; Fri, 10 Mar
 2023 14:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20230309180213.180263-1-hbathini@linux.ibm.com> <20230309180213.180263-3-hbathini@linux.ibm.com>
In-Reply-To: <20230309180213.180263-3-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 10 Mar 2023 14:04:01 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4pNHJ428Qf19Le=uuBFMRRmhF7r71ncsURvcpKvLZN_w@mail.gmail.com>
Message-ID: <CAPhsuW4pNHJ428Qf19Le=uuBFMRRmhF7r71ncsURvcpKvLZN_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] powerpc/bpf: implement bpf_arch_text_copy
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

On Thu, Mar 9, 2023 at 10:02=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
> bpf_arch_text_copy is used to dump JITed binary to RX page, allowing
> multiple BPF programs to share the same page. Use the newly introduced
> patch_instructions() to implement it. Around 5X improvement in speed
> of execution observed, using the new patch_instructions() function
> over patch_instruction(), while running the tests from test_bpf.ko.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit_comp.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index e93aefcfb83f..0a70319116d1 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -13,9 +13,12 @@
>  #include <linux/netdevice.h>
>  #include <linux/filter.h>
>  #include <linux/if_vlan.h>
> -#include <asm/kprobes.h>
> +#include <linux/memory.h>
>  #include <linux/bpf.h>
>
> +#include <asm/kprobes.h>
> +#include <asm/code-patching.h>
> +
>  #include "bpf_jit.h"
>
>  static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
> @@ -272,3 +275,21 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *=
image, int pass, struct code
>         ctx->exentry_idx++;
>         return 0;
>  }
> +
> +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> +{
> +       void *ret =3D ERR_PTR(-EINVAL);
> +       int err;
> +
> +       if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
> +               return ret;
> +
> +       ret =3D dst;
> +       mutex_lock(&text_mutex);
> +       err =3D patch_instructions(dst, src, false, len);
> +       if (err)
> +               ret =3D ERR_PTR(err);
> +       mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}

It seems we don't really need "ret". How about something like:

+void *bpf_arch_text_copy(void *dst, void *src, size_t len)
+{
+       int err;
+
+       if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
+               return ERR_PTR(-EINVAL);
+
+       mutex_lock(&text_mutex);
+       err =3D patch_instructions(dst, src, false, len);
+       mutex_unlock(&text_mutex);
+
+       return err ? ERR_PTR(err) : dst;
+}

Song
