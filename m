Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A36B53E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 23:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYKxq3Ltvz3fR4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 09:10:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RCCxkqU8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RCCxkqU8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYKrq2rKNz3ftB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 09:06:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42D5561D78
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 22:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CC0C433A0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678485992;
	bh=N9aHt9sxD+NNlh7IW6KfQ3IxapaUbKGJbqaYoa8yrcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RCCxkqU8YZ6hS/jMFoVCDR4Zn2NDpsXhdyJ4ilFe8r/gEacLYvpkfvLVyiy1NIoZD
	 uQQ0kXbhobIUWP8WXRmX4Gu8sPOE1twIqu8xQ2LzCaGA7GINkeI3WKxb7jYNmlED9Y
	 6OwDOUiHsAqh0ccFVaa5UwK5iOHNA21CNoQLsf09PKiEvaeIvoeMIcOVB95RdT99/T
	 wdfmqzYQzV8pi05qa9/PEobvJJcTKh3PIYu/mdPWeFdZdMsZU4nDBpsyhM1QSWO4/d
	 v8eBtt4tDtACFjmgP9ZAQn9qBQRsy6HW6ruWeNs8XA+Grnyxw6YM7vc6Em2nW3eaSg
	 0VtQTVjahzARw==
Received: by mail-lj1-f170.google.com with SMTP id y14so6841636ljq.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 14:06:31 -0800 (PST)
X-Gm-Message-State: AO0yUKUzX2jBIykdMO8SzNUYeXeJet72NCkoA4CNA/RcRZ/0W657SJg5
	T1Vb9o8nh+poJJ11plPcr5Tu2W/RJ1bOhN1YJ7g=
X-Google-Smtp-Source: AK7set8CSSl6Jn60lqJ3BwRCi1XAuwD9uNxFpvCfRGoNCsAfjI4WNjPTLPj8UV4+BLLitZF/4q2nQ1s1uHeqdl3lfrU=
X-Received: by 2002:a05:651c:124e:b0:295:c458:da98 with SMTP id
 h14-20020a05651c124e00b00295c458da98mr8444428ljh.5.1678485990139; Fri, 10 Mar
 2023 14:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20230309180213.180263-1-hbathini@linux.ibm.com> <20230309180213.180263-4-hbathini@linux.ibm.com>
In-Reply-To: <20230309180213.180263-4-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 10 Mar 2023 14:06:17 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7ChFn8Q38-Y76NBDVAoP=WnWOmZEyBN76ifnriTbF1tQ@mail.gmail.com>
Message-ID: <CAPhsuW7ChFn8Q38-Y76NBDVAoP=WnWOmZEyBN76ifnriTbF1tQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
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
> Implement bpf_arch_text_invalidate and use it to fill unused part of
> the bpf_prog_pack with trap instructions when a BPF program is freed.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit_comp.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index 0a70319116d1..d1794d9f0154 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -293,3 +293,18 @@ void *bpf_arch_text_copy(void *dst, void *src, size_=
t len)
>
>         return ret;
>  }
> +
> +int bpf_arch_text_invalidate(void *dst, size_t len)
> +{
> +       u32 inst =3D BREAKPOINT_INSTRUCTION;
> +       int ret =3D -EINVAL;

No need to set to -EINVAL here.

> +
> +       if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
> +               return ret;

Just return -EINVAL instead.

> +
> +       mutex_lock(&text_mutex);
> +       ret =3D patch_instructions(dst, &inst, true, len);
> +       mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
> --
> 2.39.2
>
