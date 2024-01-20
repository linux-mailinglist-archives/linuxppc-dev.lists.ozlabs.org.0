Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B28332B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 05:01:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=abaqgU/D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TH2pb0qdxz3cWr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 15:01:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=abaqgU/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TH2nj3zgxz3bYQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 15:00:25 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7beefdfe71eso65710639f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 20:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705723222; x=1706328022; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm77cdy8sjLxejMosTN9VvQDmoUNl7t40h/yggndkso=;
        b=abaqgU/Dj7udDBnZ3tHRpgSpJtSaxHCHtW1Dt9Vf8SX3J4pQi8jJPmSyR2gtDbQbK3
         eBaowOALN/Iwok2vRoN5jT8tXSAiTNJ5PBRlXJ95s86eIQBq35ybrc7g6JL0Zc4lJTn2
         a7APg77VbhERaNfpckOmFsxYJoRDHW1jgG7diVvGMS5cZ9TSJHjn8HYdri+mAXa9ZGIc
         TY3nk+OkE/SfUn317UPzMMVqKu/Wg4AHQnLEWpYnhq9YzmEheqMjweCYnKaH7DSSTK6P
         hW7Uz5c6Ur4bH2XXcLjEBz/Th/2BZhr+Kyn9Btu9+4HQfCIG4SfhilIsqXZ9kSJPKDdN
         vd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705723222; x=1706328022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm77cdy8sjLxejMosTN9VvQDmoUNl7t40h/yggndkso=;
        b=W2dkGK1mSRL+vt47fNQ83e6Dy7Lvg4RcBi0Br4BabiBZZn35CuhVITUdIoJQdF5YUx
         xwKCGA9wJpKyQnxr4w4YnRxnXZmUzE721Ja6QFiiYFhceh2Coq2NASbyZ1eXflP0tvdw
         VJtUr6p423AQ5ylACJaAhsuRlLl7oTPofts7nqfufyusWqHwaFpN5rZNpHLwje+Hr2al
         oEpNthakDcvpZ0VVVzgIW5xHP1sdtlWpO7iUKaMIp4N5W/JhmwFF+xttcmhSdasZva3f
         itrlidZhXtSmacFGAJtoW1FaNo3CW0ZPvXmdyWjqUmiK9ichwt6I045zqrYAAgl3VJ+N
         B7+w==
X-Gm-Message-State: AOJu0YwAJX4uiajt7eXHOTJS5QAg1tmYz02jep9/enecdJYeEGbDhn5T
	4FZE9KaGP4H63byERFPO0N4kQCfSjDUIDk14yJko9DVxxH1p40AtDnYo6EPUu7aqKsY3BxssRVS
	k3rfYLzRxFumDBP6zjjWt/Hi4dk8Gpd2xYqklUg==
X-Google-Smtp-Source: AGHT+IGg4ZcMYreFV9xlYVnib9lYgAyXv1Hi5hQ3Ji6o35ET/PG3DLNpo8igmEKscRALY1LTjwXa2naZ6EqS+RMFBqM=
X-Received: by 2002:a05:6602:4f49:b0:7bf:4f95:c10f with SMTP id
 gm9-20020a0566024f4900b007bf4f95c10fmr758470iob.33.1705723221837; Fri, 19 Jan
 2024 20:00:21 -0800 (PST)
MIME-Version: 1.0
References: <CAK9=C2UV8J52a1pZjsNpFNwpUKn5K3nhS-+bS-3pohDwi3HrfQ@mail.gmail.com>
 <mhng-f5f3ec82-ce6a-4e20-8799-f36fd82d74b6@palmer-ri-x1c9>
In-Reply-To: <mhng-f5f3ec82-ce6a-4e20-8799-f36fd82d74b6@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Jan 2024 09:30:10 +0530
Message-ID: <CAAhSdy1irrxUXTZKVvYB6UmXC6brb4U7xB_k5z2T82qOS=jdug@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
To: Palmer Dabbelt <palmer@dabbelt.com>
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
Cc: apatel@ventanamicro.com, Greg KH <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, nathan@kernel.org, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 20, 2024 at 3:29=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Fri, 19 Jan 2024 02:09:18 PST (-0800), apatel@ventanamicro.com wrote:
> > On Sat, Jan 13, 2024 at 12:00=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt=
.com> wrote:
> >>
> >> On Thu, 11 Jan 2024 06:50:37 PST (-0800), patchwork-bot+linux-riscv@ke=
rnel.org wrote:
> >> > Hello:
> >> >
> >> > This series was applied to riscv/linux.git (for-next)
> >> > by Palmer Dabbelt <palmer@rivosinc.com>:
> >> >
> >> > On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
> >> >> The SBI v2.0 specification is now frozen. The SBI v2.0 specificatio=
n defines
> >> >> SBI debug console (DBCN) extension which replaces the legacy SBI v0=
.1
> >> >> functions sbi_console_putchar() and sbi_console_getchar().
> >> >> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/r=
eleases)
> >> >>
> >> >> This series adds support for SBI debug console (DBCN) extension in
> >> >> Linux RISC-V.
> >> >>
> >> >> [...]
> >> >
> >> > Here is the summary with links:
> >> >   - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
> >> >     https://git.kernel.org/riscv/c/f503b167b660
> >> >   - [v5,2/5] RISC-V: Add SBI debug console helper routines
> >> >     https://git.kernel.org/riscv/c/f43fabf444ca
> >> >   - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
> >> >     https://git.kernel.org/riscv/c/c77bf3607a0f
> >> >   - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
> >> >     https://git.kernel.org/riscv/c/88ead68e764c
> >> >   - [v5,5/5] RISC-V: Enable SBI based earlycon support
> >> >     https://git.kernel.org/riscv/c/50942ad6ddb5
> >> >
> >> > You are awesome, thank you!
> >>
> >> Nathan points out that this has some semantic conflicts with a patch i=
n
> >> Greg's TTY tree: https://git.kernel.org/pub/scm/linux/kernel/git/gregk=
h/tty.git/commit/?id=3Df32fcbedbe9290565e4eac3fd7c4c451d5478787
> >>
> >> So I think the best bet is to wait on Greg's patch to land in Linus'
> >> tree, and then base a v6 of this patch set on that merged patch.  I'm
> >> going to drop this one from for-next.
> >
> > Greg's patch is now available in upstream Linux so I will rebase and
> > send out v6.
>
> Sorry, I forgot about this one and merged it.  I just sent up a fixup:
> https://lore.kernel.org/all/20240119215612.20529-2-palmer@rivosinc.com/

No issues. Apart from a minor comment, your fixup looks good to me.

Thanks,
Anup

> .
>
> >
> > Thanks,
> > Anup
>
