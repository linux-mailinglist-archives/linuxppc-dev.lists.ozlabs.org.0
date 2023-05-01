Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D3C6F34F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 19:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q991f65vJz3bhx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 03:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oDAyKLSd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oDAyKLSd;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q990q4FFdz306Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 03:18:49 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55a00da4e53so33120757b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682961525; x=1685553525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDAy0yw2Hl6Xad3kepfPR0FriSjDMaQH5Y0jnLgi2V4=;
        b=oDAyKLSdxWeDf2Rr539YuGPN8WIpEGf8MZUyaYq5jr+2u5r+cTYAw2jASoneiiCznU
         2SvyyFMMDnvtDUHjWd0FR1VXwxNkJF1Db2fr3bNgMpEqVPMJ7oTUtw4hQgx3+k8EZndj
         FscTv8obyqztv1iAv4Pz/neD2LiCUt46YSdAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682961525; x=1685553525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDAy0yw2Hl6Xad3kepfPR0FriSjDMaQH5Y0jnLgi2V4=;
        b=LRBk3lbth8jgIDUe01uTjjAGQRQCaCrw3RdmEe7c+irsU3QXOXX0HpDD8snEOuLOM3
         WGvfGSbmbOedWozjReOSwLfLhdrQGRFdOBrLjzvNkngUDCu9IVinB32VGPESjFCgsJft
         3hNUbxymO1AfuZPI/87PPBJl9pp6JqZPk9uMVy2Bo9MQVxzDzgf08qD6LYSmFH3HA+qs
         bcGQMx2fS0QBauVtFudIS+G7RFRZybOvMXbrqYGrIE/J9XQ7GSftQofllJUzVX0/MMkR
         oLvSTQIhbzqn5gAs40n/fnyaqX7NlcX4Ua/Vio/lysxN9Yt1Ez8GqdYuG6Cvm1I6x1uo
         FIbQ==
X-Gm-Message-State: AC+VfDyE4xRQsxaYZRwBXxAm76IUalm1r9W2D8CCId+pw8l3kKidKygo
	X/scqL3+4jLdfpa7JxLfjUn4ejzHYh9IZGJxnZWJig==
X-Google-Smtp-Source: ACHHUZ77Oj394N8iX/lOf3VxO2cQjDmfzr+7a32GAUP8mtbjbqRQB4PecA0n2bYSen4hD1PoelEa9A==
X-Received: by 2002:a81:4654:0:b0:556:c776:96a2 with SMTP id t81-20020a814654000000b00556c77696a2mr12488042ywa.44.1682961525763;
        Mon, 01 May 2023 10:18:45 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h7-20020a0dde07000000b0054662f7b42dsm7320974ywe.63.2023.05.01.10.18.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 10:18:45 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9e2b65d006so1353128276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 10:18:45 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:1a8:1c9a:f68 with SMTP id
 h15-20020a170902f70f00b001a81c9a0f68mr17818554plo.36.1682961504069; Mon, 01
 May 2023 10:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org> <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
In-Reply-To: <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 May 2023 19:18:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
Message-ID: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Nick Desaulniers <ndesaulniers@google.com>
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

Hi Nick

Thanks for catching this. It should have said

risc/purgatory: Remove profile optimization flags

Will fix it on my local branch in case there is a next version of the
series. Otherwise, please the maintainer fix the subject.

Thanks!

On Mon, 1 May 2023 at 18:19, Nick Desaulniers <ndesaulniers@google.com> wro=
te:
>
> On Mon, May 1, 2023 at 5:39=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
> >
> > If PGO is enabled, the purgatory ends up with multiple .text sections.
> > This is not supported by kexec and crashes the system.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_purago=
ry")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Hi Ricardo,
> Thanks for the series.  Does this patch 4/4 need a new online commit
> description? It's not adding a linker script (maybe an earlier version
> was).
>
> > ---
> >  arch/riscv/purgatory/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makef=
ile
> > index 5730797a6b40..cf3a44121a90 100644
> > --- a/arch/riscv/purgatory/Makefile
> > +++ b/arch/riscv/purgatory/Makefile
> > @@ -35,6 +35,11 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
> >  CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
> >  CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> >
> > +# When profile optimization is enabled, llvm emits two different overl=
apping
> > +# text sections, which is not supported by kexec. Remove profile optim=
ization
> > +# flags.
> > +KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=
=3D%,$(KBUILD_CFLAGS))
> > +
> >  # When linking purgatory.ro with -r unresolved symbols are not checked=
,
> >  # also link a purgatory.chk binary without -r to check for unresolved =
symbols.
> >  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
> >
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Ricardo Ribalda
