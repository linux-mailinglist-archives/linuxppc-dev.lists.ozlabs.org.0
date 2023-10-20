Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8597D0C64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 11:56:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUJJlKph;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBg3N4fVxz3vXy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 20:56:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUJJlKph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBg2T39hqz3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 20:56:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25992CE35E5;
	Fri, 20 Oct 2023 09:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03568C433C8;
	Fri, 20 Oct 2023 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697795756;
	bh=Z8ZuvLU9qD1wAS9sgFRuBmjbVEM7Pn+nD5WWqHJs10M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AUJJlKphrqw/o7lmtSQ+IkqWYh8FwAzZh4+CvrE6unyvvs3EQGCT5g/YTWZTTcKpS
	 3tscwUlRHcVkD5AvTyY5/rX5LfoJ4dSlRuNzNO3PGkbwl6jQ4oCCI4BMm3kQftVhvH
	 VRPKVmf5M4QDnnJy06buHR/ZKq3ZUNAgwoIYH9TChGSW/5l9TW3xXkHO11u0EzEANG
	 whJs0N6uL5udv7BZ0zh3XaiaOAZdxqEhjlMtC3crlOzXstm4C74Nvh8ZHFR+MFI3RF
	 3aDRCXQCRFea8KycE+r5iHmcYlc1/TXKhp8QT+8YrKpLpIjoqIxrGcnmj1oGc6L3DW
	 lAnCrZgHvoqZQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI
 driver
In-Reply-To: <20231020072140.900967-9-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 11:55:53 +0200
Message-ID: <87mswdbot2.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anup Patel <apatel@ventanamicro.com> writes:

> From: Atish Patra <atishp@rivosinc.com>
>
> RISC-V SBI specification supports advanced debug console
> support via SBI DBCN extension.
>
> Extend the HVC SBI driver to support it.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/tty/hvc/Kconfig         |  2 +-
>  drivers/tty/hvc/hvc_riscv_sbi.c | 82 ++++++++++++++++++++++++++++++---
>  2 files changed, 76 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> index 4f9264d005c0..6e05c5c7bca1 100644
> --- a/drivers/tty/hvc/Kconfig
> +++ b/drivers/tty/hvc/Kconfig
> @@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
>=20=20
>  config HVC_RISCV_SBI
>  	bool "RISC-V SBI console support"
> -	depends on RISCV_SBI_V01
> +	depends on RISCV_SBI
>  	select HVC_DRIVER
>  	help
>  	  This enables support for console output via RISC-V SBI calls, which
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_=
sbi.c
> index 31f53fa77e4a..56da1a4b5aca 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -39,21 +39,89 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *bu=
f, int count)
>  	return i;
>  }
>=20=20
> -static const struct hv_ops hvc_sbi_ops =3D {
> +static const struct hv_ops hvc_sbi_v01_ops =3D {
>  	.get_chars =3D hvc_sbi_tty_get,
>  	.put_chars =3D hvc_sbi_tty_put,
>  };
>=20=20
> -static int __init hvc_sbi_init(void)
> +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int c=
ount)
>  {
> -	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> +	phys_addr_t pa;
> +	struct sbiret ret;
> +
> +	if (is_vmalloc_addr(buf)) {
> +		pa =3D page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> +		if (PAGE_SIZE < (offset_in_page(buf) + count))
> +			count =3D PAGE_SIZE - offset_in_page(buf);

Thanks for fixing the cross-page issue. Now you're cutting the buffer
off. What about doing two SBI calls instead? (Dito on the get side)


Bj=C3=B6rn
