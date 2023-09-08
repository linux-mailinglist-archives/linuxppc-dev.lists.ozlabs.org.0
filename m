Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAB799281
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 00:54:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xr8N7KaH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RjBJ345MLz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 08:54:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xr8N7KaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RjBH92x0Zz2ytK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 08:53:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D522661595
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 22:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4985EC433CB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 22:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694213618;
	bh=KwM170Ct57lq4vNZ7xSkyIS4SWaJogcjmhutnsYYUvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xr8N7KaHg8PxFzNVkovgTC47CVN2F4nnoYDBWM5ZItjK9kQGLA+1UmxUHLFf9O9NE
	 rYvOq2Q8PgNhIxUbxUUGrC51wF+FZBNTI2Fw5SSaOvkdcFbJY4l/jpPxdPDjBUaPEl
	 4oq5OIWxMiOw4Z69toZX2g06XfvxJoxc8wOGvlF2/EHjcOwvxTLUvZjzuSuIERNC0z
	 Ngm9ArqeWhIGVSklcyxpxM5GpstdVwFGSV8ajWiYPL/YdMTRy9vJtMzrVjVjxhclMu
	 QTDPtMken1rtoLnTFHGJ6k0iuer0L5Ea6Q0iNgCBe28x4Yzp1rEIEFIwVgXBwILVjY
	 bGOkLwhPjDXbg==
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31c73c21113so2319502f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 15:53:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YzndB1nmFQb5SikHXwQPYJE0wPum0vhAB5y7dKR2M1YKBIT8gQR
	s6/U65RAlLZbIYmrHzXRdmq2RcQVRhzuoWJGdtI=
X-Google-Smtp-Source: AGHT+IFxzWHrgwn9Er+VZvUvTkc7+KPn5VFwMJdiU1jtuP4KYojqei7vjyha6oz515UbclFjbQ87OxJGnp5Vhfvbj6U=
X-Received: by 2002:ac2:4bc5:0:b0:4fe:7e1f:766a with SMTP id
 o5-20020ac24bc5000000b004fe7e1f766amr3386244lfq.24.1694213595847; Fri, 08 Sep
 2023 15:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
 <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com>
 <CANiDSCu2YLaXv2DkfzN0GbTF1b79HnqPG=GWqodDr4X9krGjUA@mail.gmail.com>
 <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com> <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
In-Reply-To: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 8 Sep 2023 15:53:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7N2ZxO5KubvK4O7EganpGeFFMtx4JGE9sGO5OnzWscgg@mail.gmail.com>
Message-ID: <CAPhsuW7N2ZxO5KubvK4O7EganpGeFFMtx4JGE9sGO5OnzWscgg@mail.gmail.com>
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

On Fri, Sep 8, 2023 at 2:52=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> Hi Song
>
> On Fri, 8 Sept 2023 at 23:48, Song Liu <song@kernel.org> wrote:
> >
> > Hi Ricardo,
> >
> > Thanks for your kind reply.
> >
> > On Fri, Sep 8, 2023 at 2:18=E2=80=AFPM Ricardo Ribalda <ribalda@chromiu=
m.org> wrote:
> > >
> > > Hi Song
> > >
> > > On Fri, 8 Sept 2023 at 01:08, Song Liu <song@kernel.org> wrote:
> > > >
> > > > Hi Ricardo and folks,
> > > >
> > > > On Fri, May 19, 2023 at 7:48=E2=80=AFAM Ricardo Ribalda <ribalda@ch=
romium.org> wrote:
> > > > >
> > > > > When upreving llvm I realised that kexec stopped working on my te=
st
> > > > > platform.
> > > > >
> > > > > The reason seems to be that due to PGO there are multiple .text s=
ections
> > > > > on the purgatory, and kexec does not supports that.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >
> > > > We are seeing WARNINGs like the following while kexec'ing a PGO and
> > > > LTO enabled kernel:
> > > >
> > > > WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
> > > > kexec_load_purgatory+0x37f/0x390
> > > >
> > > > AFAICT, the warning was added by this set, and it was triggered whe=
n
> > > > we have many .text sections
> > > > in purgatory.ro. The kexec was actually successful. So I wonder
> > > > whether we really need the
> > > > WARNING here. If we disable LTO (PGO is still enabled), we don't se=
e
> > > > the WARNING any more.
> > > >
> > > > I also tested an older kernel (5.19 based), where we also see many
> > > > .text sections with LTO. It
> > > > kexec()'ed fine. (It doesn't have the WARN_ON() in
> > > > kexec_purgatory_setup_sechdrs).
> > >
> > > You have been "lucky" that the code has chosen the correct start
> > > address, you need to modify the linker script of your kernel to
> > > disable PGO.
> > > You need to backport a patch like this:
> > > https://lore.kernel.org/lkml/CAPhsuW5_qAvV0N3o+hOiAnb1=3DbuJ1pLzqYW9D=
+Bwft6hxJvAeQ@mail.gmail.com/T/#md68b7f832216b0c56bbec0c9b07332e180b9ba2b
> >
> > We already have this commit in our branch. AFAICT, the issue was
> > triggered by LTO. So something like the following seems fixes it
> > (I haven't finished the end-to-end test yet). Does this change make
> > sense to you?
>
> if the end-to-end works, please send it as a patch to the mailing list.
>
> Thanks! :)

OK, it works (AFAICT). Sending the patch.

Thanks,
Song
