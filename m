Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B783275E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 11:10:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=IU5VI2fo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGb335WNvz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=IU5VI2fo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGb2C4vMNz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 21:09:37 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50ec948ad31so653694e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 02:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705658971; x=1706263771; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nujauiSJ02Zrdg5BkB4mk+zSnAXh7vp4Jlf9tWWb5Vs=;
        b=IU5VI2foOPWWcn0zWvwGntkGLyvvnu6sDM99Orygv0/1in3XPZPe5r7dyPsn1J1XNO
         HkmxIq7em7qoqk8xnxVL/HJ3+sjhv/DxwyPuc+J1F6l7nFV5Ty1dEyq08hGcp+ehNwy1
         0qlTI6Fpr4LIOpSL1ZCupOUa8L6wJc0U94AXwPpxgQ7obl0Z5GEbRzmXEHyH4FaIT/3x
         yD0wmC3TsoGSkwbYlJDN53W3rIeC+z48Lc1LWmdv0ai5DtWkcg1gAPOtyPEqgeAFu9Oy
         Ik8j+uueqfPMx4usBTZNhtxLxWaQKmHlbtvZwu1anKG8r+hBG4uIW1KdRV4uSwa1BoAR
         JbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705658971; x=1706263771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nujauiSJ02Zrdg5BkB4mk+zSnAXh7vp4Jlf9tWWb5Vs=;
        b=YE/Op5ZhWYa49xJrM4a4crwTbamvwoRw9hLFkltja4tbpHwsLaRZ/rfxOeL9k0V1Ts
         0zuzVsP6ZOGn5WQJH8jOvs6FRFQvuxtryPWuPS3lfr8WXCkrSlXPGaiF/tV8/PVc/Sha
         igWrlLXslgyJEGYy/pZmVeLmHhA31iEunL3ZTBliaaFMmAAYVnDWviKfQR13sbuMzVSJ
         HwqRBEc52VC2SmbJ8u/+XYlh8VB9S0DSx7FC2MhY8u2/pJBukQ1nIt/GhNWcSZJN1VIe
         jOqf+vdC1f/M6blFVNNKRu4o6b3RaahwbrmjMfXtfb3o3/1+yDz3J5ovcaoH72PDQfRV
         bcbw==
X-Gm-Message-State: AOJu0YyibdtI/sdlU5MRVHbnk+87ZXM/wFWBN1n/g93OcCvkQG/3Rx6k
	eDG5Ijb6KHWQGPNlpN8AwTwDwys/3F3RDWjx+GSyyiBxfDBw0TJwvVGDu7KQUtj09bfViXm0H5Z
	9TnvU1YxeJqxU3ETW9dezIpgZOw3yiyGHCyTshA==
X-Google-Smtp-Source: AGHT+IHa/MIEYQlMLAmgsbbIMQodojNHus//+YiXCwZclJTJDmp0EnnAZVroAF6CDUc971U4uLo9+++Hzxp9zvHBhpo=
X-Received: by 2002:a05:6512:1328:b0:50e:e557:f1c4 with SMTP id
 x40-20020a056512132800b0050ee557f1c4mr675944lfu.0.1705658970552; Fri, 19 Jan
 2024 02:09:30 -0800 (PST)
MIME-Version: 1.0
References: <170498463783.20080.10723421328706946354.git-patchwork-notify@kernel.org>
 <mhng-2a34d0e2-170f-47a5-a688-ab454a70f06b@palmer-ri-x1c9>
In-Reply-To: <mhng-2a34d0e2-170f-47a5-a688-ab454a70f06b@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jan 2024 15:39:18 +0530
Message-ID: <CAK9=C2UV8J52a1pZjsNpFNwpUKn5K3nhS-+bS-3pohDwi3HrfQ@mail.gmail.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, nathan@kernel.org, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 13, 2024 at 12:00=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
>
> On Thu, 11 Jan 2024 06:50:37 PST (-0800), patchwork-bot+linux-riscv@kerne=
l.org wrote:
> > Hello:
> >
> > This series was applied to riscv/linux.git (for-next)
> > by Palmer Dabbelt <palmer@rivosinc.com>:
> >
> > On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
> >> The SBI v2.0 specification is now frozen. The SBI v2.0 specification d=
efines
> >> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> >> functions sbi_console_putchar() and sbi_console_getchar().
> >> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/rele=
ases)
> >>
> >> This series adds support for SBI debug console (DBCN) extension in
> >> Linux RISC-V.
> >>
> >> [...]
> >
> > Here is the summary with links:
> >   - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
> >     https://git.kernel.org/riscv/c/f503b167b660
> >   - [v5,2/5] RISC-V: Add SBI debug console helper routines
> >     https://git.kernel.org/riscv/c/f43fabf444ca
> >   - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
> >     https://git.kernel.org/riscv/c/c77bf3607a0f
> >   - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
> >     https://git.kernel.org/riscv/c/88ead68e764c
> >   - [v5,5/5] RISC-V: Enable SBI based earlycon support
> >     https://git.kernel.org/riscv/c/50942ad6ddb5
> >
> > You are awesome, thank you!
>
> Nathan points out that this has some semantic conflicts with a patch in
> Greg's TTY tree: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/t=
ty.git/commit/?id=3Df32fcbedbe9290565e4eac3fd7c4c451d5478787
>
> So I think the best bet is to wait on Greg's patch to land in Linus'
> tree, and then base a v6 of this patch set on that merged patch.  I'm
> going to drop this one from for-next.

Greg's patch is now available in upstream Linux so I will rebase and
send out v6.

Thanks,
Anup
