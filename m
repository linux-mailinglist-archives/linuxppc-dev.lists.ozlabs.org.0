Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0767B2725
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:09:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZ6CojTH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxR1L4HW6z3dGD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 07:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZ6CojTH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxR0T4ZDcz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 07:08:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DB9ACE225A
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E001C433C9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 21:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695935302;
	bh=zaCFPlhX4CjApyMsI+ux3FYqYMzLJJDPmSwbblOu9sQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eZ6CojTHHUPJdS9yZ8o9RjW+NozQZ3wKrmgHBC7wLA3sfsSGutzqAteMht5UMP202
	 Q+3AR2/WfnEYRXdVJ9HO7MGcb6fB59Ju19qA9e6voMDlNJO3jOLf/Sxi/YzUEQXlo4
	 mUEINUP+plgIbRqKlbx1ygw5pkwWDJt6NvFeJfM27sPIZVWzfe4s6nLik/NUlxQoIi
	 qHN1hhTnbKLW15Pmuc9HS6hqO5qysUA9cNJteLY6wzBbqSGQXR8yPyqytztVafYYuv
	 pLMbhFjs6808p2euDZgy8atZZ3lIynYRHosV0znZHE98xzeGZ5m5G7Qga2nZW2iIWF
	 kzh24p3Y8wnSw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50433d8385cso20806093e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 14:08:22 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/eDTwKwe6C8pad2eM9zKT0fRLWqQRIS7sV10/p42qLjjFAuuf
	+u3Y0vt3+dABkg7R59Ffe++CFdKU+2HaXtO9XC4=
X-Google-Smtp-Source: AGHT+IFrZt+ZbscgcI3C4pODbXatO/i+YHhKIKYRPg2R1kutDq89+/TEVrcO5097VkQfYJvqKBHf+eCE6BIJxtNVqvg=
X-Received: by 2002:ac2:549a:0:b0:500:75e5:a2f0 with SMTP id
 t26-20020ac2549a000000b0050075e5a2f0mr2202186lfk.51.1695935300695; Thu, 28
 Sep 2023 14:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230928194818.261163-1-hbathini@linux.ibm.com> <20230928194818.261163-2-hbathini@linux.ibm.com>
In-Reply-To: <20230928194818.261163-2-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Thu, 28 Sep 2023 14:08:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6o+4STm0AUviP_M8c-xK9Y7Uzke1zouEsEreggVBofkw@mail.gmail.com>
Message-ID: <CAPhsuW6o+4STm0AUviP_M8c-xK9Y7Uzke1zouEsEreggVBofkw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] powerpc/code-patching: introduce patch_instructions()
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

On Thu, Sep 28, 2023 at 12:48=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
> patch_instruction() entails setting up pte, patching the instruction,
> clearing the pte and flushing the tlb. If multiple instructions need
> to be patched, every instruction would have to go through the above
> drill unnecessarily. Instead, introduce function patch_instructions()
> that sets up the pte, clears the pte and flushes the tlb only once per
> page range of instructions to be patched. This adds a slight overhead
> to patch_instruction() call while improving the patching time for
> scenarios where more than one instruction needs to be patched.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Acked-by: Song Liu <song@kernel.org>

With a nit below.

[...]
> +/*
> + * A page is mapped and instructions that fit the page are patched.
> + * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
> + */
> +static int __do_patch_instructions_mm(u32 *addr, void *code, size_t len,=
 bool repeat_instr)
>  {
>         int err;
>         u32 *patch_addr;
> @@ -307,11 +336,15 @@ static int __do_patch_instruction_mm(u32 *addr, ppc=
_inst_t instr)
>
>         orig_mm =3D start_using_temp_mm(patching_mm);
>
> -       err =3D __patch_instruction(addr, instr, patch_addr);
> +       /* Single instruction case. */
> +       if (len =3D=3D 0) {
> +               err =3D __patch_instruction(addr, *(ppc_inst_t *)code, pa=
tch_addr);

len =3D=3D 0 for single instruction is a little weird to me. How about we j=
ust use
len =3D=3D 4 or 8 depending on the instruction to patch?

Thanks,
Song

[...]
