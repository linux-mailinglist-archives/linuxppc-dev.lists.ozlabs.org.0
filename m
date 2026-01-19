Return-Path: <linuxppc-dev+bounces-15945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF3D39D57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 05:06:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvcMN0T6wz2xqL;
	Mon, 19 Jan 2026 15:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768795567;
	cv=none; b=iAczsc+rz9cSgDu3FQfwGNQSkiVpgFoZz7qtTOLpYJeNTr6IB1aerXw28Y4ykH78p5gzG8Fy6Ex7IdHQ1srHuEzKl5E6w7ntVkXKjwN7MZK7Nms7oz2oaWvMYVqCUFU/1yNvWoUM6y4mnLA1/t5O3qAHIKn0uvPNW6UXmqZrrTnIqqznL1trtrEBrRNQUXcD+Q4sh27RNDPI3W0X9CvRN0qFdNWeiEcTWuuD3N9zgkiOhl5p7slRuCyrW69DJZqYQReZRdeRvYfOiIipaUCZbNP6awa67vjoqL4wZ4mhou2anHdtbW5D91DyLkQrJCGXGkMZSKn2d2ENc4xnj3rkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768795567; c=relaxed/relaxed;
	bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=APZVzqLzbV21dmjLm0QN5ujpYmC7potoy7KbZE0+4DRWphddpfIlVNZM6st1RR9RQul3qpWyFzph2o/WmCTPiNY7VuImoBy7TRAHeyCTk/VKQV/ENPzpyukYp2bWg9Nglr0jxNiAD7WFNz/yIGEq3V0icggAqFNXC8LvaZwl84iWIczNbAtRv+jVAeosrk7l3wCSQAQn9PSxPkPB1b+Z01WD8yU0A/aUAUwuG7cvlcrtZK0XQ3t9lzcb4qYxN8kKV870QjEpY4ZmmOnFQKY/6PVzov0QbkysvqWZAmuZwkzL2MwY3Q543SNpdCdVNWfYebT5Zk5GqTFbvBCjR4KN6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQYZ+/M7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQYZ+/M7; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQYZ+/M7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQYZ+/M7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvcML4lgyz2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 15:06:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768795559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=;
	b=OQYZ+/M7g5n3Y1TTim3LE4V+cYUN47AIZzzJlweKJNdoH+HvVlkjwfA+PPaQj+nT9bbm7G
	gAaXjfMGMWl//H8XrzprKdBdsmbBeFk7l7jlMwK6cHfq2S+XgCi8npX804mdCvGbmsmsre
	o3BKnTRdRVhjzPizvWn8LgZuPZLVzLc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768795559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=;
	b=OQYZ+/M7g5n3Y1TTim3LE4V+cYUN47AIZzzJlweKJNdoH+HvVlkjwfA+PPaQj+nT9bbm7G
	gAaXjfMGMWl//H8XrzprKdBdsmbBeFk7l7jlMwK6cHfq2S+XgCi8npX804mdCvGbmsmsre
	o3BKnTRdRVhjzPizvWn8LgZuPZLVzLc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-0ht9CepEO0GepJa3Mtk6Xw-1; Sun, 18 Jan 2026 23:05:56 -0500
X-MC-Unique: 0ht9CepEO0GepJa3Mtk6Xw-1
X-Mimecast-MFC-AGG-ID: 0ht9CepEO0GepJa3Mtk6Xw_1768795555
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-804c73088daso2575629b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jan 2026 20:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768795555; x=1769400355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=;
        b=to9sTJISO93EEqjZUyJW6ZFeLZMwOa+lnHXc8Q1Fy4AY+3m3GpXtQi9fvC7/33rmNM
         8CVFCC/9MFadSe2pv4a7k6BpvUfAGKHyCOlzW1o9tmn1HIgbLVxU1wFinqfdB6FNMhue
         JAfQsfTep6x3tGPzqHBxbK7ZiEp//fZr8xPtuAdZWNA+59RRdS8IL2SJ9aMAGdhRgxz5
         4ge9kD+TuP0IZNsuTW77mib3uHT6+4DDMKkmaH12/Mva0SaoiHcGcO55BjFPD8Z0Hg7U
         LrgUTTEggb2okyQEumLdijbOXsxLHNKuPfLLspOLG/9e1e/CYlx4T+QPZY/j+a6W7M/c
         H3hA==
X-Forwarded-Encrypted: i=1; AJvYcCUT/ds3wogPWRtJiBmHwXYFBcmQbn/6BkHyRH1RtX7Ft/E3JvPDagbFMp5dNHWzU+SeaO0t7sKDHjzb9Jg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBSTBn+Rx/4NkA6upbcdkqXjNpZvcYIGE0mbHl8qLqiWhakoUU
	vC1vIFAggru+yIvsG9qqNVbti+WqqR1PZEWmghpVlMyCseIwx3q1WT2aJowtkXnl3ht9ZPyftlA
	oofLaZRjs8YINqC+KjXqIXFraYt9QJkStzyypOxyemjqD8KThbCUrRdc9/ipOKBAvkxo=
X-Gm-Gg: AY/fxX4DlIFr2LT8ZBumELOscMuc3RksZALxYwKGSZZqiZS4rJYi+u587VZCxa7YnLz
	YY+DuOD/CiYHLC6KoK2dgMg+JEhVnqeidwU+wE/xSc82eCeRrbtPuvHISH/BEf8Fv+67jV7Be1q
	MfTeXm8B/tnmY2fdYUo4SN+ScDppYBRqWfGZbkuIfFSuYMP8wR0/eCF07gjiUYcPBO0RJMDTOkO
	/4cFH16eQdLeGPUzXtfDTOC2t/y1wizgeznYpNrKlgBJK6Z2m1zwfu4tqVss9/JtoSbcEj+nen+
	64Xq/g3zX0p6UE6lD0n+UJkryXGASGVL8d5AniEMbem0NjGNdYMZ793SYb1kZtiOQz8py0o9KzW
	a
X-Received: by 2002:aa7:888b:0:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-81f8efbbe1amr10668399b3a.1.1768795554638;
        Sun, 18 Jan 2026 20:05:54 -0800 (PST)
X-Received: by 2002:aa7:888b:0:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-81f8efbbe1amr10668347b3a.1.1768795553931;
        Sun, 18 Jan 2026 20:05:53 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bdc65sm7831738b3a.21.2026.01.18.20.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 20:05:53 -0800 (PST)
Date: Mon, 19 Jan 2026 12:04:04 +0800
From: Coiby Xu <coxu@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <aW2i3yacr5TvWU-m@Rk>
References: <20260115004328.194142-1-coxu@redhat.com>
 <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
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
In-Reply-To: <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KAEgrx7ap68zOwhwHi9DF9S4TbUIamSur5vH2EWJKYk_1768795555
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 18, 2026 at 01:25:52PM -0500, Mimi Zohar wrote:
>On Fri, 2026-01-16 at 18:27 +0100, Ard Biesheuvel wrote:

Hi Ard and Mimi,

Thanks for your discussion on improving the patch!

>> On Fri, 16 Jan 2026 at 17:39, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> >
>> > On Fri, 2026-01-16 at 14:18 +0100, Ard Biesheuvel wrote:
>> > > On Fri, 16 Jan 2026 at 14:11, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> > > >
>> > > > On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
>> > > > > On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
>> > > > > >
>> > > > > > EVM and other LSMs need the ability to query the secure boot status of
>> > > > > > the system, without directly calling the IMA arch_ima_get_secureboot
>> > > > > > function. Refactor the secure boot status check into a general,
>> > > > > > integrity-wide function named arch_integrity_get_secureboot.
>> > > > > >
>> > > > > > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
>> > > > > > automatically configured by the supported architectures. The existing
>> > > > > > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
>> > > > > > IMA policy based on the refactored secure boot status code.
>> > > > > >
>> > > > > > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
>> > > > > > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
>> > > > > > Signed-off-by: Coiby Xu <coxu@redhat.com>
>> > > > > > ---
>> > > > > >  arch/arm64/Kconfig                            |  1 +
>> > > > > >  arch/powerpc/Kconfig                          |  1 +
>> > > > > >  arch/powerpc/kernel/Makefile                  |  2 +-
>> > > > > >  arch/powerpc/kernel/ima_arch.c                |  5 --
>> > > > > >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
>> > > > > >  arch/s390/Kconfig                             |  1 +
>> > > > > >  arch/s390/kernel/Makefile                     |  1 +
>> > > > > >  arch/s390/kernel/ima_arch.c                   |  6 --
>> > > > > >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
>> > > > > >  arch/x86/Kconfig                              |  1 +
>> > > > > >  arch/x86/include/asm/efi.h                    |  4 +-
>> > > > > >  arch/x86/platform/efi/efi.c                   |  2 +-
>> > > > > >  include/linux/ima.h                           |  7 +--
>> > > > > >  include/linux/integrity.h                     |  8 +++
>> > > > > >  security/integrity/Kconfig                    |  6 ++
>> > > > > >  security/integrity/Makefile                   |  3 +
>> > > > > >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
>> > > > > >  security/integrity/ima/ima_appraise.c         |  2 +-
>> > > > > >  security/integrity/ima/ima_efi.c              | 47 +---------------
>> > > > > >  security/integrity/ima/ima_main.c             |  4 +-
>> > > > > >  security/integrity/platform_certs/load_uefi.c |  2 +-
>> > > > > >  21 files changed, 111 insertions(+), 70 deletions(-)
>> > > > > >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
>> > > > > >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
>> > > > > >  create mode 100644 security/integrity/efi_secureboot.c
>> > > > > >
>> > > > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> > > > > > index 93173f0a09c7..4c265b7386bb 100644
>> > > > > > --- a/arch/arm64/Kconfig
>> > > > > > +++ b/arch/arm64/Kconfig
>> > > > > > @@ -2427,6 +2427,7 @@ config EFI
>> > > > > >         select EFI_STUB
>> > > > > >         select EFI_GENERIC_STUB
>> > > > > >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > > > > > +       imply INTEGRITY_SECURE_BOOT
>> > > > >
>> > > > > This allows both to be en/disabled individually, which I don't think
>> > > > > is what we want. It also results in more churn across the
>> > > > > arch-specific Kconfigs than needed.
>> > > > >
>> > > > > Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
>> > > > > INTEGRITY_SECURE_BOOT in its Kconfig definition?
>> > > >
>> > > > As much as possible, EVM (and other LSMs) shouldn't be dependent on another LSM,
>> > > > in this case IMA, being configured.
>> > >
>> > > Sure, but that is not my point.
>> > >
>> > > This arrangement allows for IMA_SECURE_AND_OR_TRUSTED_BOOT to be
>> > > enabled without INTEGRITY_SECURE_BOOT, resulting in the stub
>> > > implementation of arch_integrity_get_secureboot() being used, which
>> > > always returns false.

Since both INTEGRITY_SECURE_BOOT and IMA_SECURE_AND_OR_TRUSTED_BOOT
don't define a prompt, they are not user-configurable and will always be
enable/disabled together with arch-specific secure boot feature. So
despite the "imply" key word, the case where
IMA_SECURE_AND_OR_TRUSTED_BOOT is enabled whereas INTEGRITY_SECURE_BOOT
is disabled won't happen.

But I agree an arch may not care much about INTEGRITY_SECURE_BOOT so it
may be a churn. So limiting it to the scope of the integrity subsystem
can be a better idea.

>> >
>> > I understand your concern, but instead of "select"ing INTEGRITY_SECURE_BOOT from
>> > IMA_SECURE_AND_OR_TRUSTED_BOOT, how making IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > dependent on both IMA_ARCH_POLICY and INTEGRITY_SECURE_BOOT.
>> >
>>
>> Given that INTEGRITY_SECURE_BOOT has no dependencies of its own,
>> afaict, selecting it is the least disruptive option, as otherwise,
>> existing configs will disable IMA_SECURE_AND_OR_TRUSTED_BOOT as the
>> kernel is being upgraded. But conceptually, I agree that they are
>> equivalent.

As already pointed out on by Mimi, INTEGRITY_SECURE_BOOT depend on
arch-specific secure boot feature. So we can't say INTEGRITY_SECURE_BOOT
has no dependencies. 

>>
>> > Including the "imply INTEGRITY_SECURE_BOOT" here in the arch Kconfig allows EVM
>> > to query the secure boot state without relying on IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > being configured.
>>
>> Yes, I understand that this is the whole point of the exercise. But
>> 'imply' should be used with care, and in this case, implying both from
>> CONFIG_EFI really makes little sense. INTEGRITY_SECURE_BOOT should be
>> selected by options that need the functionality, not 'implied' by
>> options that might provide it.

But again I agree INTEGRITY_SECURE_BOOT should "not 'implied' by options
that might provide it".

>
>As not all arch's implement arch_integrity_get_secureboot, the definition in
>include/linux/integrity.h would need to be updated.  Something like:
>
>-#ifdef CONFIG_INTEGRITY_SECURE_BOOT
>+#if (defined(CONFIG_INTEGRITY_SECURE_BOOT) && \
>+       (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
>+        || defined(CONFIG_PPC_SECURE_BOOT))
>
>Then IMA_SECURE_AND_OR_TRUSTED_BOOT and EVM could select INTEGRITY_SECURE_BOOT,
>as suggested.

Since INTEGRITY_SECURE_BOOT has a dependency, select doesn't seem to be
a good choice. If EVM does select INTEGRITY_SECURE_BOOT,
INTEGRITY_SECURE_BOOT will be enabled even if arch-specific secure boot
feature is disabled and this can lead to a building failure. How about
always enabling INTEGRITY_SECURE_BOOT when secure boot feature is
enabled and also making IMA_SECURE_AND_OR_TRUSTED_BOOT depend on
INTEGRITY_SECURE_BOOT?

diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 916d4f2bfc44..cd44b46d0325 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -97,6 +97,13 @@ config INTEGRITY_CA_MACHINE_KEYRING_MAX
           will not be loaded. The remaining MOK keys are loaded into the
           .platform keyring.
  
+config INTEGRITY_SECURE_BOOT
+       def_bool y
+       depends on EFI || PPC_SECURE_BOOT || S390
+       help
+         Provide secure boot related helper functions like querying the
+         secure boot status.
+

diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 976e75f9b9ba..5dce572192d6 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
  config IMA_SECURE_AND_OR_TRUSTED_BOOT
         bool
         depends on IMA_ARCH_POLICY
+       depends on INTEGRITY_SECURE_BOOT


Another idea is make a tree-wide arch_get_secureboot i.e. to move
current arch_ima_get_secureboot code to arch-specific secure boot
implementation. By this way, there will no need for a new Kconfig option
INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
concern.

-- 
Best regards,
Coiby


