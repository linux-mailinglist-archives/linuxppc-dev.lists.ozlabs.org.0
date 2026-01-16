Return-Path: <linuxppc-dev+bounces-15882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C53D2EE83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 10:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsvyN214Lz2xm3;
	Fri, 16 Jan 2026 20:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768556524;
	cv=none; b=AI5DR7FHLbGIP5++nZ1+IXOcoTUTD2VF7jtmgEGj6u2vzl3QRVohiXNQtHpquRw0Kepd7u1vNbnCDBRYENwCydm2gsX10eCSVkzxJrAf3Eyvgv/rjPn+YEabl6d53M5ctUuOvkrJDbzX4M4QgrnaJcR5soGMJhrQpspXLlQZ3Uscq26kKuQI4ArG+T4lcpLC6uar/7G9oHUTwQEf1ETns1qI6o5owzZuGP4g97YdRa5LY5+YBlVQZmtxxDlVL5KLQzBfaEf4xg7hbjJpn1EdwPy863o1ZQ5TyYcieNbPMlFj2RmeBYcjdePXvsN2kUZEDbyWA6cuxvBDBDG/gb1Qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768556524; c=relaxed/relaxed;
	bh=hVybfYbe8i3MrpO08VfiZkufpjg080yyEME6uzv1ZzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNTzvPnQxtBwez4Q5AEev1XT6wmOz9v2wlwUudR5dnh15icySOG27qjddIV3X2m1lIoD7EB/Xtza31Ofg02bxlyt1mrRdoI0i33kgqV/p1Kf9TTc/OihIeW4AlF870ArNHYvixkpWblQAshZCVcHtgvEHvMt9Hhd5fh8hX1Mda6i6w6fbbTFRBnM8MX5o47EkNBz+teJ2uD4mXPT46xCY/g1pg9xnOxKuL6LvHjb3PmRLUwR2gKVTzTmFKqz3FcPqdsltovOlNsPBXQED/cV13lXbZfxonlsDMfh127ia5g+tdlqS2+LdojYyeN0Fdh8VXrPh0AcntB7nvGz/Vm64g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPASkmLv; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPASkmLv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsvyM2YGcz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 20:42:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6F14601B2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 09:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DE8C4AF0C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768556520;
	bh=/E8pjL1Rg4kjh10yWKXAfqGFi3+btd20CKL87Qc6xYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VPASkmLvCW/t4XmsQcmEBMDBN6Np6o9rMBqRv0awasGACRhWea5bRnd9A+VLI+NCs
	 dIOhMy0sajBtbGyDu9uVrXkjyIivOBJELkA5/q/4uW2MVZdwif+Sp2+i0XqCrTiY5V
	 1KA83r7fBXyaU5DDLzRKsGpWG3+5hmKtEVtCmxu1hgjn3vYeSFlJpj5eVFe/Ievqfl
	 KZgXntrkuNOXkkx9bZH1SNmuZHxxpA2fODGUvnAxdX2bcG0uDEaKicAUoeBrHNqpUs
	 FNslAZOVGw7n8A5D4kGOULTX8nF3IzRI4xn4R3dZbn8JeuL3MTbn5K967B+ogy3rK7
	 zdKB3gNFNNE6A==
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so1273746a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 01:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu1Uztno0xFMnF+jptu68IQD87U8RTfurLy0PkcUWrDAd+vWznpCQL53Xw4yWxoYPo9gUZpzHc4G+qxYg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuTLAyCrHg6pgR5lYCm3Fp16x0cPCg56VCgEO1Kwmv10YFD1WI
	CPGORtnt64BT9RFCXuPIJaeXZNpBZV1S1w6+02OlVHzUsLZPPDMH2r8toCP8VIF3E77Q/lyXTb7
	L7wD8IvEbpnBRHPIdGxzBuNxcC1uK57k=
X-Received: by 2002:a17:90b:3dcc:b0:340:c4dc:4b70 with SMTP id
 98e67ed59e1d1-3527315e60dmr2091280a91.6.1768556519441; Fri, 16 Jan 2026
 01:41:59 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260115004328.194142-1-coxu@redhat.com> <20260115004328.194142-2-coxu@redhat.com>
In-Reply-To: <20260115004328.194142-2-coxu@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 10:41:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
X-Gm-Features: AZwV_QjmUt_PmrwfWvkU01-td52KzVOAwQnoeyg_Oar6lj-mB--Ez-fk2UXAfCg
Message-ID: <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Coiby Xu <coxu@redhat.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	"open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
>
> EVM and other LSMs need the ability to query the secure boot status of
> the system, without directly calling the IMA arch_ima_get_secureboot
> function. Refactor the secure boot status check into a general,
> integrity-wide function named arch_integrity_get_secureboot.
>
> Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> automatically configured by the supported architectures. The existing
> IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> IMA policy based on the refactored secure boot status code.
>
> Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  arch/arm64/Kconfig                            |  1 +
>  arch/powerpc/Kconfig                          |  1 +
>  arch/powerpc/kernel/Makefile                  |  2 +-
>  arch/powerpc/kernel/ima_arch.c                |  5 --
>  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
>  arch/s390/Kconfig                             |  1 +
>  arch/s390/kernel/Makefile                     |  1 +
>  arch/s390/kernel/ima_arch.c                   |  6 --
>  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
>  arch/x86/Kconfig                              |  1 +
>  arch/x86/include/asm/efi.h                    |  4 +-
>  arch/x86/platform/efi/efi.c                   |  2 +-
>  include/linux/ima.h                           |  7 +--
>  include/linux/integrity.h                     |  8 +++
>  security/integrity/Kconfig                    |  6 ++
>  security/integrity/Makefile                   |  3 +
>  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
>  security/integrity/ima/ima_appraise.c         |  2 +-
>  security/integrity/ima/ima_efi.c              | 47 +---------------
>  security/integrity/ima/ima_main.c             |  4 +-
>  security/integrity/platform_certs/load_uefi.c |  2 +-
>  21 files changed, 111 insertions(+), 70 deletions(-)
>  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
>  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
>  create mode 100644 security/integrity/efi_secureboot.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..4c265b7386bb 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2427,6 +2427,7 @@ config EFI
>         select EFI_STUB
>         select EFI_GENERIC_STUB
>         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> +       imply INTEGRITY_SECURE_BOOT

This allows both to be en/disabled individually, which I don't think
is what we want. It also results in more churn across the
arch-specific Kconfigs than needed.

Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
INTEGRITY_SECURE_BOOT in its Kconfig definition?

