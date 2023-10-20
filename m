Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1A7D0E40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 13:14:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WZmk4hyl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBhnR10x6z3cb8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 22:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WZmk4hyl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBhmZ4493z3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 22:14:04 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-351437112c1so2536295ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1697800441; x=1698405241; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ui4lAScxS4avp7oCJ7ZH8jd7TnRHOi5lmcUoRRDmRE=;
        b=WZmk4hylrr2NqGAqW8LCaZ9k1IsCXDRKPZC/vdsite+4k29tmi1hCWgGw8QElYnVg3
         PIoh5D+mAi62WzphCVchRz4PVmap2wFhiQNsLZtFFuJ69Szk3I6KCDt8MAEJm3/K8uXO
         OSPFlzEkXycWXS7Na1T885X7HqD4dlZWVRaOVQKwB+4ZryNBw3Lu4Z9OApBV7MDeMSRs
         rdDMj9+6ZhMt7oclkHrg/0yV/qu4E8Ha+tHx6kHkJv8oOYSHJ6gWf6MOWx+MloCvb9nt
         nuJN7sjOm5W+gqAlrkAhvoewJQe07FpS9Z/FCSpI4DUj1PKqbbnIHyfBdSAFCNS0DxXK
         HwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697800441; x=1698405241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ui4lAScxS4avp7oCJ7ZH8jd7TnRHOi5lmcUoRRDmRE=;
        b=km0UknfK+X6ErnLiBjy1hat3QhKkQVx/ZuJM/SAt/CHRhze44Jg7C6KnJaqUxrTD2j
         HfUD+UhMjBXYkuMsHLYRLrwQHz7Hz6yQReros9MwmfmdYg8R709sRV7kJ3kVTJxzqziR
         8KMKldkr0+hFAed0K4YMaBLRgA88igC6Pq65F5M30jnMyxfE/1f2AN9CMxErCCp2dfpl
         BdbQhqtnGx2XZZzPrktoa4laNj0JpuUHOi+ecwsZbdPtHFLLYJJI9/oTOLjyXbxXpRlD
         YKOi75PnM8RZ2IogDJiYekS2tddFXdE99Z4x4XTbNSxyromacnaFOnUWa7aSA49bMD5q
         VeHg==
X-Gm-Message-State: AOJu0YyLiwtzOz8+xTlzE/AdSmemSfJ5mtvLJ5r6p6epmIo5I8dGl04d
	qGjkJF4L9yM5lnnuW5XW5NTcaLX8WY19A9OLeFq3DA==
X-Google-Smtp-Source: AGHT+IEitVBts/lHHu15Qiuy69Q0OAhUE5hrFg148JtL4A9RHhcapJhDM1ssRdMIbsrFJ9GgKO6swmiB+E5FvbTcRNA=
X-Received: by 2002:a05:6e02:147:b0:357:5234:802d with SMTP id
 j7-20020a056e02014700b003575234802dmr1903255ilr.10.1697800441567; Fri, 20 Oct
 2023 04:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Oct 2023 16:43:49 +0530
Message-ID: <CAAhSdy2Ncc4+fvjrWHGZuHKB8jFtd1WkRhPifiTEfftpyEY7+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] RISC-V SBI debug console extension support
To: Anup Patel <apatel@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 20, 2023 at 12:51=E2=80=AFPM Anup Patel <apatel@ventanamicro.co=
m> wrote:
>
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defi=
nes
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/release=
s)
>
> This series adds support for SBI debug console (DBCN) extension in KVM RI=
SC-V
> and Linux RISC-V.
>
> To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
> branch at: https://github.com/avpatel/kvmtool.git
>
> These patches can also be found in the riscv_sbi_dbcn_v3 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v2:
>  - Rebased on Linux-6.6-rc5
>  - Handled page-crossing in PATCH7 of v2 series
>  - Addressed Drew's comment in PATCH3 of v2 series
>  - Added new PATCH5 to make get-reg-list test aware of SBI DBCN extension
>
> Changes since v1:
>  - Remove use of #ifdef from PATCH4 and PATCH5 of the v1 series
>  - Improved commit description of PATCH3 in v1 series
>  - Introduced new PATCH3 in this series to allow some SBI extensions
>    (such as SBI DBCN) do to disabled by default so that older KVM user sp=
ace
>    work fine and newer KVM user space have to explicitly opt-in for emula=
ting
>    SBI DBCN.
>  - Introduced new PATCH5 in this series which adds inline version of
>    sbi_console_getchar() and sbi_console_putchar() for the case where
>    CONFIG_RISCV_SBI_V01 is disabled.
>
> Anup Patel (8):
>   RISC-V: Add defines for SBI debug console extension
>   RISC-V: KVM: Change the SBI specification version to v2.0
>   RISC-V: KVM: Allow some SBI extensions to be disabled by default
>   RISC-V: KVM: Forward SBI DBCN extension to user-space
>   KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
>   RISC-V: Add stubs for sbi_console_putchar/getchar()
>   tty/serial: Add RISC-V SBI debug console based earlycon
>   RISC-V: Enable SBI based earlycon support
>
> Atish Patra (1):
>   tty: Add SBI debug console support to HVC SBI driver

Queued PATCH1 to PATCH5 for Linux-6.7

Remaining PATCH6 to PATCH9 are still under review.

Thanks,
Anup

>
>  arch/riscv/configs/defconfig                  |  1 +
>  arch/riscv/configs/rv32_defconfig             |  1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h         |  7 +-
>  arch/riscv/include/asm/sbi.h                  | 12 +++
>  arch/riscv/include/uapi/asm/kvm.h             |  1 +
>  arch/riscv/kvm/vcpu.c                         |  6 ++
>  arch/riscv/kvm/vcpu_sbi.c                     | 61 +++++++-------
>  arch/riscv/kvm/vcpu_sbi_replace.c             | 32 ++++++++
>  drivers/tty/hvc/Kconfig                       |  2 +-
>  drivers/tty/hvc/hvc_riscv_sbi.c               | 82 +++++++++++++++++--
>  drivers/tty/serial/Kconfig                    |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c       | 32 +++++++-
>  .../selftests/kvm/riscv/get-reg-list.c        |  2 +
>  13 files changed, 198 insertions(+), 43 deletions(-)
>
> --
> 2.34.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv
