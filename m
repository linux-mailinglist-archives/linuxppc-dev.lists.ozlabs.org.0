Return-Path: <linuxppc-dev+bounces-15920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE4D379FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 18:27:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt6HJ3S5Sz2xnj;
	Sat, 17 Jan 2026 04:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768584444;
	cv=none; b=HmgK/ODAD8LOXXfloNe1Ly2XyDM8xuXMFapH94FXbiUvEWTM0HQ7EfLSrVbtlaQwwGl2hqpNnAVczYQRkQ31H7/cfpSwn9SyQm9PXhxhSk5xc72FCHhqmG1o6Exrlp/gEXqKlVk3GNbLAA30PYHVci/eAUonUDvrSsfFclJa/4lcDU97Sp6PA8HAPsvPed98lSxhdJnA2qWSalLenhM8E5ZzQBzsCgbJKmIEqNXgqk4I7jQ6vSnEKcj1XLPnO5ZawCHdWurHO3wv2AdXg0tdkse3Aa82yIEooMU904Cke8BUsga5y73vf26ziTLTasnoArcpzBSGjZGtA7hNuWhVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768584444; c=relaxed/relaxed;
	bh=JC36QHZorXv8FcwWEAnaZ+uE61dEQEM7MKy0rl4DIQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ld1IKu1eyUzxa1jCjlumYX4QnhlGqKTp3d9nwDiF2sF8Cu72zjhxGzgGSuFqaMV4G/9gYPBNKAbriR4Vh7vawhXEvbVRRdjTD7PiEv/W8nnyBXiZS+l44rBdBifVFe1wPMEt0A4paIUWFY4IFRUE5XcSmGU0iT9PH49FkEraps1Rh+hBZJsWJzfDPPg5vog/fJCx0NQLrEQRNDKI/HuPZ4EdzLNUBUshV4S3SmQlwuARVxzwQEfx29ZZOMwAMs/R26+8RywCSmxvLd/IJsRMaiuOA7UWBBIx1InvOWme3kaSKFmVN3kKzcCBYvH+mX9c/I/9zjFMvfvV3XJJYexazA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGuJNVUN; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGuJNVUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt6HH22zRz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 04:27:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 199C260178
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 17:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B82C2BC86
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768584439;
	bh=vXVwCg3KjnOR9p1kVLMGAnoWPMTaqhAgSkTPdcaX44w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DGuJNVUNKP7jBIIQIn0hq89ok2Z4FHuZBYXas3nCLYpKoB8qmleIvNeAJkClb1YBY
	 4M9EmTGF4l1Qhmf5Zj0zhSck2rj7AlIhjUM1wfL62OXL2m9kyeU0fqbDzkHyjKSG5E
	 R04DstJmfMjSCuu9T5+MoQCUv8c5Z5AU1ppVFkC8bEjotESOno7HOtp3kLkWX+aHf3
	 kBYrzWBb3qfqwem7NiDklfGfrCKSaiKT/0a9xD/JgHrSmjw2+OsKaE7fiX89zeFEwX
	 nlDolisyCWRt3xKZaCY+W7qU10byXRCwc7KpHITiEOu1PS0oZtIMydThHEPRIlfL8k
	 VSHYmV4rMOONQ==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c363eb612so1159732a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 09:27:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK1bDrS4E+XWYTZQHHBC1eYqpFhQ8ZsWy0QPbrLkqwFPweQSrUSU0TxGQQNOuJGe+REBZhYb76co1DmNE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5T5to58raRcORbg3fuSw1a3tb5Ve1VAGM6RerIFE7hYQmw/ZO
	LUz3OM/Y+dZcE2qtwOxo0+C56Kvf6TR8r/lQPiTU93I6ivrpx/RLIlXw5LRJjDoUKghKPLiVmqr
	bJ/lsI95ifEOu+8Fztuo3zEupWgUffx4=
X-Received: by 2002:a17:90b:3d8d:b0:343:e2ba:e8be with SMTP id
 98e67ed59e1d1-3527316560bmr2913371a91.10.1768584439303; Fri, 16 Jan 2026
 09:27:19 -0800 (PST)
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
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com> <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
In-Reply-To: <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 18:27:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
X-Gm-Features: AZwV_Qi45ik2p_K9-Rag0B961-yA4Y3UeYMV2L3X0YVNxAN3PGD7hZw7XikMDoE
Message-ID: <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
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

On Fri, 16 Jan 2026 at 17:39, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Fri, 2026-01-16 at 14:18 +0100, Ard Biesheuvel wrote:
> > On Fri, 16 Jan 2026 at 14:11, Mimi Zohar <zohar@linux.ibm.com> wrote:
> > >
> > > On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
> > > > On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
> > > > >
> > > > > EVM and other LSMs need the ability to query the secure boot status of
> > > > > the system, without directly calling the IMA arch_ima_get_secureboot
> > > > > function. Refactor the secure boot status check into a general,
> > > > > integrity-wide function named arch_integrity_get_secureboot.
> > > > >
> > > > > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> > > > > automatically configured by the supported architectures. The existing
> > > > > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> > > > > IMA policy based on the refactored secure boot status code.
> > > > >
> > > > > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> > > > > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> > > > > Signed-off-by: Coiby Xu <coxu@redhat.com>
> > > > > ---
> > > > >  arch/arm64/Kconfig                            |  1 +
> > > > >  arch/powerpc/Kconfig                          |  1 +
> > > > >  arch/powerpc/kernel/Makefile                  |  2 +-
> > > > >  arch/powerpc/kernel/ima_arch.c                |  5 --
> > > > >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
> > > > >  arch/s390/Kconfig                             |  1 +
> > > > >  arch/s390/kernel/Makefile                     |  1 +
> > > > >  arch/s390/kernel/ima_arch.c                   |  6 --
> > > > >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
> > > > >  arch/x86/Kconfig                              |  1 +
> > > > >  arch/x86/include/asm/efi.h                    |  4 +-
> > > > >  arch/x86/platform/efi/efi.c                   |  2 +-
> > > > >  include/linux/ima.h                           |  7 +--
> > > > >  include/linux/integrity.h                     |  8 +++
> > > > >  security/integrity/Kconfig                    |  6 ++
> > > > >  security/integrity/Makefile                   |  3 +
> > > > >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
> > > > >  security/integrity/ima/ima_appraise.c         |  2 +-
> > > > >  security/integrity/ima/ima_efi.c              | 47 +---------------
> > > > >  security/integrity/ima/ima_main.c             |  4 +-
> > > > >  security/integrity/platform_certs/load_uefi.c |  2 +-
> > > > >  21 files changed, 111 insertions(+), 70 deletions(-)
> > > > >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
> > > > >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
> > > > >  create mode 100644 security/integrity/efi_secureboot.c
> > > > >
> > > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > > index 93173f0a09c7..4c265b7386bb 100644
> > > > > --- a/arch/arm64/Kconfig
> > > > > +++ b/arch/arm64/Kconfig
> > > > > @@ -2427,6 +2427,7 @@ config EFI
> > > > >         select EFI_STUB
> > > > >         select EFI_GENERIC_STUB
> > > > >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> > > > > +       imply INTEGRITY_SECURE_BOOT
> > > >
> > > > This allows both to be en/disabled individually, which I don't think
> > > > is what we want. It also results in more churn across the
> > > > arch-specific Kconfigs than needed.
> > > >
> > > > Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
> > > > INTEGRITY_SECURE_BOOT in its Kconfig definition?
> > >
> > > As much as possible, EVM (and other LSMs) shouldn't be dependent on another LSM,
> > > in this case IMA, being configured.
> >
> > Sure, but that is not my point.
> >
> > This arrangement allows for IMA_SECURE_AND_OR_TRUSTED_BOOT to be
> > enabled without INTEGRITY_SECURE_BOOT, resulting in the stub
> > implementation of arch_integrity_get_secureboot() being used, which
> > always returns false.
>
> I understand your concern, but instead of "select"ing INTEGRITY_SECURE_BOOT from
> IMA_SECURE_AND_OR_TRUSTED_BOOT, how making IMA_SECURE_AND_OR_TRUSTED_BOOT
> dependent on both IMA_ARCH_POLICY and INTEGRITY_SECURE_BOOT.
>

Given that INTEGRITY_SECURE_BOOT has no dependencies of its own,
afaict, selecting it is the least disruptive option, as otherwise,
existing configs will disable IMA_SECURE_AND_OR_TRUSTED_BOOT as the
kernel is being upgraded. But conceptually, I agree that they are
equivalent.

> Including the "imply INTEGRITY_SECURE_BOOT" here in the arch Kconfig allows EVM
> to query the secure boot state without relying on IMA_SECURE_AND_OR_TRUSTED_BOOT
> being configured.

Yes, I understand that this is the whole point of the exercise. But
'imply' should be used with care, and in this case, implying both from
CONFIG_EFI really makes little sense. INTEGRITY_SECURE_BOOT should be
selected by options that need the functionality, not 'implied' by
options that might provide it.

