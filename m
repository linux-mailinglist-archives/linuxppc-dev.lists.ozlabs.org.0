Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE77991AD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 23:53:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L+l8bX2U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj8xP6whzz3c9S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 07:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L+l8bX2U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj8wV4NMcz2yVp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 07:52:25 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-49370a7fe6cso1829014e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694209942; x=1694814742; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m43PrEMsLZP2EQdS/bT6AbnWiwNqqhpPB/h3QciEWyw=;
        b=L+l8bX2U1Sgq9ko1g347KmYbWbz49dqC2CDdb95Z2O3caZiMqx9h5nZoigiS+jWU7U
         thvzFMrMXdr1s9rV8gEQJ34qklku1uAyZOZoNc4VnaHSp501IyBKTapUn5HFqGJ1k1XO
         UG1VjYM6/6JNHDMfzTcHTCcyohkmfTrAhWgBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694209942; x=1694814742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m43PrEMsLZP2EQdS/bT6AbnWiwNqqhpPB/h3QciEWyw=;
        b=Cq0VofxrQeTBV9slMY2inGNNeAFsOnMSkSqdqWpECty4z334Qdx1mVjaXck66yCFhV
         iELxO5I58CdwrsUMzJeB6elelcPtpvQLY+QMPDZAeT3j7NXs7/L/eeGdYrYhz8ch9iAX
         fY3BXycDG+q4U/PKmUxIsy0Snayr3YEghVTWnheFMvkc+7c/O5zmsj+oiT2f/HvzOs7V
         TM/1AS5xDzPCZAmtKdGZIMhyNI+qQ30rmScBG/s3IKYIh8wAjL+Uw17o2LCpAA6PqHL6
         8aYjxjrqd501UjZ7pjcno5LVXsSBCkoMyeVPUaUedRP5JZD/zNwTiNernnu/lkc1AXcq
         o0DA==
X-Gm-Message-State: AOJu0Yw7SaHaqDpavcd7oS/uAU8q/tD2LvjyOGZGDtzhSYtguC0jasJs
	2LL53qc0ywa43gXhbZ6TYEQLUeni2VZuJAA1EYw=
X-Google-Smtp-Source: AGHT+IEJyV1igSqSKzX3iL2aXk7tSI1bNuvCcVXYfaMkFIl3kCWB/MXW/tO0E8TvVFgvTpjFqG9dFQ==
X-Received: by 2002:a05:6122:d24:b0:48d:2e54:80c6 with SMTP id az36-20020a0561220d2400b0048d2e5480c6mr4566498vkb.7.1694209942372;
        Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id q25-20020a9f3419000000b0068faf73a2a1sm453289uab.7.2023.09.08.14.52.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7870821d9a1so1482198241.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 14:52:21 -0700 (PDT)
X-Received: by 2002:ad4:5f0d:0:b0:651:6604:bee6 with SMTP id
 fo13-20020ad45f0d000000b006516604bee6mr9638376qvb.30.1694209920738; Fri, 08
 Sep 2023 14:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
 <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com>
 <CANiDSCu2YLaXv2DkfzN0GbTF1b79HnqPG=GWqodDr4X9krGjUA@mail.gmail.com> <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
In-Reply-To: <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Sep 2023 23:51:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
Message-ID: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
To: Song Liu <song@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Song

On Fri, 8 Sept 2023 at 23:48, Song Liu <song@kernel.org> wrote:
>
> Hi Ricardo,
>
> Thanks for your kind reply.
>
> On Fri, Sep 8, 2023 at 2:18=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
> >
> > Hi Song
> >
> > On Fri, 8 Sept 2023 at 01:08, Song Liu <song@kernel.org> wrote:
> > >
> > > Hi Ricardo and folks,
> > >
> > > On Fri, May 19, 2023 at 7:48=E2=80=AFAM Ricardo Ribalda <ribalda@chro=
mium.org> wrote:
> > > >
> > > > When upreving llvm I realised that kexec stopped working on my test
> > > > platform.
> > > >
> > > > The reason seems to be that due to PGO there are multiple .text sec=
tions
> > > > on the purgatory, and kexec does not supports that.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > We are seeing WARNINGs like the following while kexec'ing a PGO and
> > > LTO enabled kernel:
> > >
> > > WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
> > > kexec_load_purgatory+0x37f/0x390
> > >
> > > AFAICT, the warning was added by this set, and it was triggered when
> > > we have many .text sections
> > > in purgatory.ro. The kexec was actually successful. So I wonder
> > > whether we really need the
> > > WARNING here. If we disable LTO (PGO is still enabled), we don't see
> > > the WARNING any more.
> > >
> > > I also tested an older kernel (5.19 based), where we also see many
> > > .text sections with LTO. It
> > > kexec()'ed fine. (It doesn't have the WARN_ON() in
> > > kexec_purgatory_setup_sechdrs).
> >
> > You have been "lucky" that the code has chosen the correct start
> > address, you need to modify the linker script of your kernel to
> > disable PGO.
> > You need to backport a patch like this:
> > https://lore.kernel.org/lkml/CAPhsuW5_qAvV0N3o+hOiAnb1=3DbuJ1pLzqYW9D+B=
wft6hxJvAeQ@mail.gmail.com/T/#md68b7f832216b0c56bbec0c9b07332e180b9ba2b
>
> We already have this commit in our branch. AFAICT, the issue was
> triggered by LTO. So something like the following seems fixes it
> (I haven't finished the end-to-end test yet). Does this change make
> sense to you?

if the end-to-end works, please send it as a patch to the mailing list.

Thanks! :)

>
> Thanks again,
> Song
>
> diff --git i/arch/x86/purgatory/Makefile w/arch/x86/purgatory/Makefile
> index 8f71aaa04cc2..dc306fa7197d 100644
> --- i/arch/x86/purgatory/Makefile
> +++ w/arch/x86/purgatory/Makefile
> @@ -19,6 +19,10 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
>  # optimization flags.
>  KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D%
> -fprofile-use=3D%,$(KBUILD_CFLAGS))
>
> +# When LTO is enabled, llvm emits many text sections, which is not suppo=
rted
> +# by kexec. Remove -flto=3D* flags.
> +KBUILD_CFLAGS :=3D $(filter-out -flto=3D%,$(KBUILD_CFLAGS))
> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
>  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib



--=20
Ricardo Ribalda
