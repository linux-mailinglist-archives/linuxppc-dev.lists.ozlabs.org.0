Return-Path: <linuxppc-dev+bounces-15893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C18D31B2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 14:19:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt0mm18kPz2xnj;
	Sat, 17 Jan 2026 00:19:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768569544;
	cv=none; b=Yz9/J20vsyK0IWzqO4jcKa/oiY7moj4Zs5aqr+Jaa3uoCAeIhHGmib8809BAWtJ8aRV05B6OffDvPcpby2HeAikLRZwY7kACQVot3AoOvlS60Gw100SEyPz96yrfe0AE18MnZugzBVwbAwst1eXCdmK8T4VS/LfYROy+Fs0stvxAu/pkkgo6Gj3vQOC5Z2EUuUJShN+JsiyojGnHTzbuWsZSgdpvIV3qiuU5iVQQ7pm8ytHaJ1mgJagpfCJ7VwwJ79CJVkm5A1pnOM+m/jxk+x9YWgV3mYoKwJao3R0mybQdk0U4xYjGCVLTKha8efeW1AOG4S1ZZBFt8+VCJ6/t4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768569544; c=relaxed/relaxed;
	bh=WIN2mxq/KhACMDMrF+Rs48U5i+CaZOdJF/Gqqy8Yo4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3oXCeRYcWIIfIG30qSYRdftAte+H+9s0Z6WuwvxeYZPhdT2Df8RB63WgyXR+tihPXHm6vspFLdcAf3RPvMz2giWOxD4dRW6uS0m4lvCUohaoq9Jt/H/vkyFjBHRMwQ4Gwq8Q4gpyyycrbqJtlaIftlhvPOviJ8VyPcsLOH2KdsZoFcvcVjoxiU8byaWo0RfP5KH+odMYwghGz5WSeD1/JjA6USEisXu/UxIJoiBFH+rQNrPn+8aXj/mYc7GJZedIKszE/vnxFpDMJjOP7lRSMvq5P097QARNWvn9feuxlVjDPNqRM3aoHOLdGxqhz4ZYH6OlEsWoyPEqnqtWqtC6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mx42etJy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mx42etJy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt0ml19q6z2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 00:19:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF23B601B4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 13:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B37C2BCB2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569540;
	bh=paGgdC+WfYWTfp4FQwhsSNV0x9rGHQk4MpKoJN/J6kM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mx42etJyXvyHu40zb7VhJEa9gBdwKBz3SffMZZHgs6aEMZvLo5cTz87NmUspqu1ui
	 D1Q6Mbpwltz5DWYX1zlMkmGAiZ1/z1DE+wghCaxqJFZDMQH0lGpifb8n+Jg6cEAu9l
	 p7hIaT+50EFL0m6XdcLIQmrkTiOnaFi8KGfVlzR0wnqyesrdVL6QKcVW8GDE6AlC/b
	 k0aV8/X9eC0Y7EnyGGPYqA/hOtlxwZ5kkhrSXTi5ApGh+q+Xac9pqeAzBw4Buu6jQ3
	 70hzYGASgEtiqoiKD6U1NEXpTtTgZzm4qijvIgK1DQrKIs0+ZTLSwg0qazyxHExIXE
	 mVoZfopZUabog==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so1324844a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 05:19:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXStCs5Eob7I/xmCt0BDLXONKEUjB+1l9loWDHIEnwPUBp5A083RvYG+leNb/SRCIcZdXSwtXK3qSGev8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHFrdp/x0lWO1HImQTNB+ESKcqW4HuJkxFSGJx7RmEiuEuwfpO
	FcWdA+/f2+zbHww5WC1pnXQwKnoKiWEJeVnja5Glud/u9mdvTNmIhfBrJKKFIZx9q/QntthL+Ot
	Q1LWjtgU9wvJiZNasBlz+fm2+39cH0ic=
X-Received: by 2002:a17:90b:3c49:b0:341:88c1:6a7d with SMTP id
 98e67ed59e1d1-35272f87eb9mr2433924a91.18.1768569539305; Fri, 16 Jan 2026
 05:18:59 -0800 (PST)
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
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com> <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
In-Reply-To: <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 14:18:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
X-Gm-Features: AZwV_QiR8f22XUrZO7Ho9HKYBQjvJoHCgOD5leRDTv3x2USeTKmIDvLwsh7DTh4
Message-ID: <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
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

On Fri, 16 Jan 2026 at 14:11, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
> > On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
> > >
> > > EVM and other LSMs need the ability to query the secure boot status of
> > > the system, without directly calling the IMA arch_ima_get_secureboot
> > > function. Refactor the secure boot status check into a general,
> > > integrity-wide function named arch_integrity_get_secureboot.
> > >
> > > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> > > automatically configured by the supported architectures. The existing
> > > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> > > IMA policy based on the refactored secure boot status code.
> > >
> > > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> > > Signed-off-by: Coiby Xu <coxu@redhat.com>
> > > ---
> > >  arch/arm64/Kconfig                            |  1 +
> > >  arch/powerpc/Kconfig                          |  1 +
> > >  arch/powerpc/kernel/Makefile                  |  2 +-
> > >  arch/powerpc/kernel/ima_arch.c                |  5 --
> > >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
> > >  arch/s390/Kconfig                             |  1 +
> > >  arch/s390/kernel/Makefile                     |  1 +
> > >  arch/s390/kernel/ima_arch.c                   |  6 --
> > >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
> > >  arch/x86/Kconfig                              |  1 +
> > >  arch/x86/include/asm/efi.h                    |  4 +-
> > >  arch/x86/platform/efi/efi.c                   |  2 +-
> > >  include/linux/ima.h                           |  7 +--
> > >  include/linux/integrity.h                     |  8 +++
> > >  security/integrity/Kconfig                    |  6 ++
> > >  security/integrity/Makefile                   |  3 +
> > >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
> > >  security/integrity/ima/ima_appraise.c         |  2 +-
> > >  security/integrity/ima/ima_efi.c              | 47 +---------------
> > >  security/integrity/ima/ima_main.c             |  4 +-
> > >  security/integrity/platform_certs/load_uefi.c |  2 +-
> > >  21 files changed, 111 insertions(+), 70 deletions(-)
> > >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
> > >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
> > >  create mode 100644 security/integrity/efi_secureboot.c
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 93173f0a09c7..4c265b7386bb 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -2427,6 +2427,7 @@ config EFI
> > >         select EFI_STUB
> > >         select EFI_GENERIC_STUB
> > >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> > > +       imply INTEGRITY_SECURE_BOOT
> >
> > This allows both to be en/disabled individually, which I don't think
> > is what we want. It also results in more churn across the
> > arch-specific Kconfigs than needed.
> >
> > Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
> > INTEGRITY_SECURE_BOOT in its Kconfig definition?
>
> As much as possible, EVM (and other LSMs) shouldn't be dependent on another LSM,
> in this case IMA, being configured.

Sure, but that is not my point.

This arrangement allows for IMA_SECURE_AND_OR_TRUSTED_BOOT to be
enabled without INTEGRITY_SECURE_BOOT, resulting in the stub
implementation of arch_integrity_get_secureboot() being used, which
always returns false.

