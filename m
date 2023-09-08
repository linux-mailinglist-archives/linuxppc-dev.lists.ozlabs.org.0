Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B967991A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 23:50:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b+FKEU+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj8sd05J0z3cGq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 07:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b+FKEU+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj8rk6bwVz3bwJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 07:49:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F8B5614F5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 21:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42A2C433CB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 21:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694209744;
	bh=qBwdoqG1zVNvc3aShF3LCnCCMv6kyB9Wvl1DSPjBmKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b+FKEU+g3RoTsJUevp6033Y4qIcN/ll6hmMmE86DeGmIEi/PUnrq7r2DFXsxvKKHF
	 C1K0NY38P6m+zyHHIulDkdfqnpUoMt8DnIKy8QvZmr8T7oEu4EtulpiRB7u3pgZGVK
	 nfHXeL5EsghiygGRZOtO5ketg3VY4/R0Y/SS9F8Sq4KFYswemGoGe5H8okHFzUtJLQ
	 y93zjDsWymgpod7Sqqf3qM3OQH9E32zF1pPQS5uYI4qxi3MgXqjWsOw9a8kyrUdw/f
	 avjJ0WmDBAAOszroHaSrY/vLHaCgFB9xH70AcgavT1Y/CtozgqtninGOh8x4og9Jge
	 j71QXgD0wP9Ig==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a21b6d105cso314556966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 14:49:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YwCWY4M/Aya/DLtlZ4S1/yos/FlMxjAeA09jVxAeiZKdtbA/IyO
	O42sXDKlKEupGhY4y4NAhPwZLWIsOoRXQxCZtUo=
X-Google-Smtp-Source: AGHT+IHdt83V5zkWEI/zYp4eQdKOInBkQ/fcJo2LzCdTQtPBOg8u/Zxe/xPeFmYww3NGkOx3GITH5AX6OshJOu4NSCM=
X-Received: by 2002:a05:6512:3a87:b0:4fb:8bab:48b6 with SMTP id
 q7-20020a0565123a8700b004fb8bab48b6mr3731344lfu.52.1694209722018; Fri, 08 Sep
 2023 14:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
 <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com> <CANiDSCu2YLaXv2DkfzN0GbTF1b79HnqPG=GWqodDr4X9krGjUA@mail.gmail.com>
In-Reply-To: <CANiDSCu2YLaXv2DkfzN0GbTF1b79HnqPG=GWqodDr4X9krGjUA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 8 Sep 2023 14:48:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
Message-ID: <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ricardo,

Thanks for your kind reply.

On Fri, Sep 8, 2023 at 2:18=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> Hi Song
>
> On Fri, 8 Sept 2023 at 01:08, Song Liu <song@kernel.org> wrote:
> >
> > Hi Ricardo and folks,
> >
> > On Fri, May 19, 2023 at 7:48=E2=80=AFAM Ricardo Ribalda <ribalda@chromi=
um.org> wrote:
> > >
> > > When upreving llvm I realised that kexec stopped working on my test
> > > platform.
> > >
> > > The reason seems to be that due to PGO there are multiple .text secti=
ons
> > > on the purgatory, and kexec does not supports that.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > We are seeing WARNINGs like the following while kexec'ing a PGO and
> > LTO enabled kernel:
> >
> > WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
> > kexec_load_purgatory+0x37f/0x390
> >
> > AFAICT, the warning was added by this set, and it was triggered when
> > we have many .text sections
> > in purgatory.ro. The kexec was actually successful. So I wonder
> > whether we really need the
> > WARNING here. If we disable LTO (PGO is still enabled), we don't see
> > the WARNING any more.
> >
> > I also tested an older kernel (5.19 based), where we also see many
> > .text sections with LTO. It
> > kexec()'ed fine. (It doesn't have the WARN_ON() in
> > kexec_purgatory_setup_sechdrs).
>
> You have been "lucky" that the code has chosen the correct start
> address, you need to modify the linker script of your kernel to
> disable PGO.
> You need to backport a patch like this:
> https://lore.kernel.org/lkml/CAPhsuW5_qAvV0N3o+hOiAnb1=3DbuJ1pLzqYW9D+Bwf=
t6hxJvAeQ@mail.gmail.com/T/#md68b7f832216b0c56bbec0c9b07332e180b9ba2b

We already have this commit in our branch. AFAICT, the issue was
triggered by LTO. So something like the following seems fixes it
(I haven't finished the end-to-end test yet). Does this change make
sense to you?

Thanks again,
Song

diff --git i/arch/x86/purgatory/Makefile w/arch/x86/purgatory/Makefile
index 8f71aaa04cc2..dc306fa7197d 100644
--- i/arch/x86/purgatory/Makefile
+++ w/arch/x86/purgatory/Makefile
@@ -19,6 +19,10 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
 # optimization flags.
 KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D%
-fprofile-use=3D%,$(KBUILD_CFLAGS))

+# When LTO is enabled, llvm emits many text sections, which is not support=
ed
+# by kexec. Remove -flto=3D* flags.
+KBUILD_CFLAGS :=3D $(filter-out -flto=3D%,$(KBUILD_CFLAGS))
+
 # When linking purgatory.ro with -r unresolved symbols are not checked,
 # also link a purgatory.chk binary without -r to check for unresolved symb=
ols.
 PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
