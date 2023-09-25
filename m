Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCFE7AE1EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 00:51:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UaUxEUuv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvdQr4jLLz3cN8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:51:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UaUxEUuv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvdQ06FlMz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 08:50:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DA7E1B80E88
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFB1C433CA
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695682245;
	bh=F/OGTAcc/1HkdLFjixsWrd+pFJELaQPtXaIgtxGmHw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UaUxEUuv6vMaAYJViaA778OMlKAn/mHqRedcNDSFAliM+u9AmlaJ5zvNeqFVH+TJt
	 gjfeyRReOjIwOF4zbKSwYkiRb7voy2+LllKk6kKQpY4vG5edlIlEcWkZG2mHBBd1JY
	 QO2XYzynkD/mOuamEemImPZWnY9A8LmKt8T6nBz/2w0AN2qTYd7+DkjgrCORF1T36W
	 bwv0M8xQNqlmPUyv+PiDvrcLD5A1269iJaeGEwPNP/ewvmY0d0P/wgSoaevlLJjWH0
	 S6FVuBRuoAVoKO9RsgefCY2kX2o85zJRnS544UsmqoXcalRxRLC4A52/xk7+ggXuGf
	 hcdVcL/zYBivQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5043120ffbcso11276058e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 15:50:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YzH8wkJmbOxqvziVvSW8CL68hp1IHx+nLZTG+bTcr4OVDzhOktz
	bxdOvoAzoaBT6SKOWznGHsYvVg5Pe1zmVRU8NFw=
X-Google-Smtp-Source: AGHT+IGDsdoah2MqZB6XhwZSWquY7e0vwfXUxSH0WQ2aaNmqIRLlZn6QJkEMhc8yeZWwnTagNzcs+kbYjK2Vcs4c5d4=
X-Received: by 2002:a05:6512:2815:b0:503:343a:829f with SMTP id
 cf21-20020a056512281500b00503343a829fmr8621570lfb.23.1695682243384; Mon, 25
 Sep 2023 15:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230908132740.718103-1-hbathini@linux.ibm.com> <20230908132740.718103-5-hbathini@linux.ibm.com>
In-Reply-To: <20230908132740.718103-5-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Mon, 25 Sep 2023 15:50:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6p1+mqG_soSS8q_FFio7iHGtUyyDfH5cyXs_Py8f-Pmg@mail.gmail.com>
Message-ID: <CAPhsuW6p1+mqG_soSS8q_FFio7iHGtUyyDfH5cyXs_Py8f-Pmg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] powerpc/code-patching: introduce patch_instructions()
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

I didn't see this one when I reviewed 1/5. Please ignore that comment.

[...]

> @@ -307,11 +312,22 @@ static int __do_patch_instruction_mm(u32 *addr, ppc=
_inst_t instr)
>
>         orig_mm =3D start_using_temp_mm(patching_mm);
>
> -       err =3D __patch_instruction(addr, instr, patch_addr);
> +       while (len > 0) {
> +               instr =3D ppc_inst_read(code);
> +               ilen =3D ppc_inst_len(instr);
> +               err =3D __patch_instruction(addr, instr, patch_addr);

It appears we are still repeating a lot of work here. For example, with
fill_insn =3D=3D true, we don't need to repeat ppc_inst_read().

Can we do this with a memcpy or memset like functions?

> +               /* hwsync performed by __patch_instruction (sync) if succ=
essful */
> +               if (err) {
> +                       mb();  /* sync */
> +                       break;
> +               }
>
> -       /* hwsync performed by __patch_instruction (sync) if successful *=
/
> -       if (err)
> -               mb();  /* sync */
> +               len -=3D ilen;
> +               patch_addr =3D patch_addr + ilen;
> +               addr =3D (void *)addr + ilen;
> +               if (!fill_insn)
> +                       code =3D code + ilen;

It took me a while to figure out what "fill_insn" means. Maybe call it
"repeat_input" or something?

Thanks,
Song

> +       }
>
>         /* context synchronisation performed by __patch_instruction (isyn=
c or exception) */
>         stop_using_temp_mm(patching_mm, orig_mm);
> @@ -328,16 +344,21 @@ static int __do_patch_instruction_mm(u32 *addr, ppc=
_inst_t instr)
>         return err;
>  }
>
