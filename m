Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657F66F337C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 18:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q97jB1pHHz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 02:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Nyhxg6Ko;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Nyhxg6Ko;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q97hH48XPz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 02:19:26 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so2055670b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682957962; x=1685549962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FGuwB8DZaGL5fmexOM8fuvxUhs14V0EADfy1lJEIKY=;
        b=Nyhxg6KoMv5DCAGM6mCPXn6ItenAW7c9QV20p31a0qYhzUuuPPWSPWIEunfg7MZGBX
         hvbJsvBo3U58pWAw2c/kzLOQD9kLiPrO9QMsDd8VQrqPikgs1wq+zpmPFHQoHQQ569Cy
         oTOiyB6hPuBk4CiO6pz8Fe2zoWRqemoOGGEzUT+dk/zKc6lKhWSQ7lhp4GHBG4Kyt+eU
         OH3MEzklYYBX4u7sk6s8IPDnNBCU1hsEL08Nv2qA8Hvoi+GhrZ2f+H+kkWkLB8XpVuRY
         CBn0WlzlKP0alqt8rt8XACki8K5zYFOz2BaMXAdhGnP35ait50bb1lKSXSTzcVMgF/gW
         gP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682957962; x=1685549962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FGuwB8DZaGL5fmexOM8fuvxUhs14V0EADfy1lJEIKY=;
        b=kxdNF0FozP4bf4Bzh08+udYRgAaOvYkDGnKetMT8aq849HbtDtYMyqkg/sOEillt6d
         I89NzZ1Ksy0oJycdtGtWXyu6bq/jaj0B2kgWAahIG/2/Eko5XgGGDNCklq5fbQuBfy8L
         S45fl+FZGerzepCa/S5gGubCLnn97aS4IAg867YZeWSDkN2lBvNEJarBKnmJsV5sAPnC
         lS45AsiWOZwL/kzdELKsuvyg6M3myvWJe8i367fCt5JcjQDKX0el/cV0ur0oszGH++n2
         NzQeDjh5Tqfan4XaYML/qzi86ncj3OxExTJWAE4EucDT3K4t0WBcQacc/P10sqMdwriy
         Q6hA==
X-Gm-Message-State: AC+VfDz84SBruX/QsxiAe+0GoutMSiNZ78v4gcy7Jp1B4s5NTBGSts/L
	T8mXOy332DlFCvuGN5Owqbkku6U1J9y4FBqEDbGH1g==
X-Google-Smtp-Source: ACHHUZ6RwItANJ/R5G0kwGBHYfYxEFLhUkM0VFd5rJeaVtkIhzWcYIQu18UznRkT5L5a5Vr226WpFX8ruirZ7cWLUO8=
X-Received: by 2002:a05:6a20:1588:b0:f9:1f3e:cccb with SMTP id
 h8-20020a056a20158800b000f91f3ecccbmr17087658pzj.10.1682957961585; Mon, 01
 May 2023 09:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org> <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 May 2023 09:19:10 -0700
Message-ID: <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Ricardo Ribalda <ribalda@chromium.org>
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 1, 2023 at 5:39=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> If PGO is enabled, the purgatory ends up with multiple .text sections.
> This is not supported by kexec and crashes the system.
>
> Cc: stable@vger.kernel.org
> Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory=
")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Hi Ricardo,
Thanks for the series.  Does this patch 4/4 need a new online commit
description? It's not adding a linker script (maybe an earlier version
was).

> ---
>  arch/riscv/purgatory/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefil=
e
> index 5730797a6b40..cf3a44121a90 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -35,6 +35,11 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
>  CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
>  CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
>
> +# When profile optimization is enabled, llvm emits two different overlap=
ping
> +# text sections, which is not supported by kexec. Remove profile optimiz=
ation
> +# flags.
> +KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=
=3D%,$(KBUILD_CFLAGS))
> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
>  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
>
> --
> 2.40.1.495.gc816e09b53d-goog
>


--=20
Thanks,
~Nick Desaulniers
