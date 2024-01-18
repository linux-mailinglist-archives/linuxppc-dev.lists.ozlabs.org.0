Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F68319D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 14:00:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jIq5DEk+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG2sX34CPz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 00:00:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jIq5DEk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG2rg0klkz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 23:59:29 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3608cfa5ce6so56403095ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 04:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705582767; x=1706187567; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWADTwPjX+2jaYXFvN/zsXEQ2ZmoOpg5k/PCeUcdjSk=;
        b=jIq5DEk+yJtytVQ4lfnqMspeQcxobUTGAnZ9RVMJx2bpyvEi9L/L1NQbNzV3UFJxsP
         MwNPA47/syyaULYreP9B6RQ0hWKLDNYgRzYKB2uaWJFtCiYMiVIfMz2e1pRPro3Ifd0K
         eFAJcgD28Lp6MOvhkNOTQsq/jAjoLV/i9iVA0AlvEo3uN/xUcdSdcw1ZBCRNpaHhin7e
         h008KY30BZDkBaX9732lM0cF6qez+jsJk3kbmChmG4GNthRbtTqw7MMf+lKLPAirZyrO
         HYxxrdM+zYS0Heset+zOzdf74KZ0yWPzu/tdiD/NJinBmnWm4554lpFBNF7M34/1yBOz
         X6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705582767; x=1706187567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWADTwPjX+2jaYXFvN/zsXEQ2ZmoOpg5k/PCeUcdjSk=;
        b=ox2gfUzjqX8Ci+jwLLIiEaoSe+0COUpSmwXCsw5H8u5AvMblLk2fxNT3LWT3rC3GQw
         6jldNwikz82WI0dkfREpkEsr6xwDOp3+ooaZlrSB44AlAOih65knBg7WJVEFg9rJ8k09
         86sO28tQwW8hKxOn09JfpdoN38UxXU3wH9EvpwIUiRRXadgWHyu9vyOW92bRM2UvE/PW
         Y33ywhF1R/rrnVojp1hWt2JftGtijRTcpZb69aWOBgJkp2wFcIizikFEtw0ANidi9YKm
         lrIr5V0K5S7k04zH49QocOKZ5EdGkVElCGdcaTM2XqGUif1xiyECod/7KIGLf7NV+nT+
         +6rA==
X-Gm-Message-State: AOJu0YxhUYzm4G0OmPuUE0rdg98NoBbbTN7AVhEGvmD46RvQOiAfD038
	/mXwmbc+hmK456SEOHplXaRYdy5D+hRzyZm9apA4WwMtfX78TtzJOErMK79ugF2D3Pl12mNasFZ
	snfRO7w06YykTwYIuEcCvl2fbF8a1YFQX2lWSGw==
X-Google-Smtp-Source: AGHT+IEULXICvafspeHkLMkr6soWFzV0SUySB8GzLHkUsKVp+V05biZlODsydI6eC8onv1WinflroTNSid+Lah/ulTM=
X-Received: by 2002:a05:6e02:5ac:b0:361:98a3:a7ac with SMTP id
 k12-20020a056e0205ac00b0036198a3a7acmr879075ils.58.1705582767073; Thu, 18 Jan
 2024 04:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com>
In-Reply-To: <20240104123727.76987-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Jan 2024 18:29:16 +0530
Message-ID: <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
To: Andrew Jones <ajones@ventanamicro.com>
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, atishp@atishpatra.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-next@vger.kernel.org, palmer@dabbelt.com, rdunlap@infradead.org, kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, pbonzini@redhat.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 4, 2024 at 6:07=E2=80=AFPM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> supporting architectures select HAVE_KVM and then their KVM
> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> consistent with that approach which fixes configs which have KVM
> but not EVENTFD, as was discovered with a randconfig test.
>
> Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@=
infradead.org/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Queued this patch for Linux-6.8

Regards,
Anup

> ---
>
> v2:
>  - Added Fixes tag and -fixes prefix [Alexandre/Anup]
>
>  arch/riscv/Kconfig     | 1 +
>  arch/riscv/kvm/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a935a5f736b9..daba06a3b76f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>         select HAVE_KPROBES if !XIP_KERNEL
>         select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>         select HAVE_KRETPROBES if !XIP_KERNEL
> +       select HAVE_KVM
>         # https://github.com/ClangBuiltLinux/linux/issues/1881
>         select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>         select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 1fd76aee3b71..36fa8ec9e5ba 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>
>  config KVM
>         tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTA=
L)"
> -       depends on RISCV_SBI && MMU
> +       depends on HAVE_KVM && RISCV_SBI && MMU
>         select HAVE_KVM_IRQCHIP
>         select HAVE_KVM_IRQ_ROUTING
>         select HAVE_KVM_MSI
> --
> 2.43.0
>
