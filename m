Return-Path: <linuxppc-dev+bounces-16109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDJfJhn+cGmgbAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 17:26:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788259DD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 17:26:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx8h53Rz6z2xrC;
	Thu, 22 Jan 2026 03:25:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769012757;
	cv=none; b=ccMRsrBBEZRStWf1+CKCH0fP+WWRwfuVwySUPYtXwwrwYxAToFUSX7x8DJlyfwNv+waPoA8HlzFonV1ffY5SbwjYGHeIkH9x/ElCgOHk6L7v3oCZq4jG95DKG+WpAk57LnV5SDwaOnXmiylqqrmyHDNNwxhZfa8aNJ0BlFQOLX/w01BOa1YpcVTkv5FliZ7xOR1vCx2x8jS6CPTd+ldjwW4CSVFxGs8b6ES3rW5Fc+bgtwelP4GOnhjx7AGVeWIl9vJtizOIrmGvP7A3twLM0eq6Yh/3HNGta2HlVI5SHRO5WfcD8XK3EubxkrlmlHriQBaaSnvysKwaYTI6+dnL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769012757; c=relaxed/relaxed;
	bh=TI7qGk8SazbxQIUc8/Muvjcn5BnkyjQqw+DTzn+43is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORmn47rEGTTSRu/rsrKxj455IM1hIL2DdI1LoCaF+NMj2L0F295v14azXSfSppGx6ICrjGjQaWAsV4bfchHR2efURHndrEudbEhjg8hQOBBOY+EQ+gCzCKdr1AQTs/KCSTv77XbaORp3YmAm+EmiLv7owPUqVr0mfeKiXRLtn4wKq4lgQ/6OCEYIZcV9z66UqI/Qc2pw+ruShklQDVnK8YkAhK2P0slHh/sFbe9rwiigUYTUjzZaUEXMmPK9fdqdFgFyartotJz+nXEDbEB06zphs7bWe1hK9TD5/G4JHvHjoR930lAp5RarKNFRqKXDnq06xLbGD1rSF1s2zdSG5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NlpFZjd6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NlpFZjd6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx8h41xBVz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 03:25:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 672EE44448
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 16:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDF4C2BC86
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012753;
	bh=sDXZ43cuHWu7fDJemSHBPXvLB0TztHzhjoU8+z2DpEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NlpFZjd6TpgXF01/VordrzlllHPM/gPrPEksnciVTDQuVgDAmAkxxDWX8wqAavSXp
	 9OHsSfg6KBzHc2nEQ/Tmshv0HgNOByUug3SnVYVM3M/yj37IcUSiBCM9Vc/Pb3ETTA
	 3kk9uFaPORF6ZrfhphA2zG+1miXIKiNshuKktOfe06PK5I99+kF8KYmbAtMyswaSVe
	 oOnpg9Mom7Zr7TyPrppBGXMjFRQwfAC+HI+QIoKl+GyiEajQKmiR7qQko+3o0AhLtH
	 2Ghq/HyOqTD6X0U+VhUqm5YGqnT7/mekg+pRhX50NQkr946rgOozo4CVsh3MMzNHjW
	 7iX1i2EIawUjQ==
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a07fac8aa1so13675ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 08:25:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcADqDsWvcS9AZyKqxLDboH7+R31qcXKDtve7tMAC6OxvLkJ707d/BfLP1l1R5I2nLbfHC32t0bBXBQQY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpYMcLtIruCoMJYrDOWIUfnTFFHSIaL5yCnrP+xwrzSvNyDXUT
	fIiDu72jN1k/nssjYzNeiKsMm6s2VcK5PHMvpEvgs9VyLpOt4IWMmR+86yry7ZNdk0MAzyTtL1q
	wKk+10q+cxHPrqPtyLEUH0UU0xeMGUMo=
X-Received: by 2002:a17:902:ecc6:b0:2a0:afeb:fbbb with SMTP id
 d9443c01a7336-2a768b7a743mr46677125ad.1.1769012752394; Wed, 21 Jan 2026
 08:25:52 -0800 (PST)
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
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk> <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
In-Reply-To: <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 21 Jan 2026 17:25:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
X-Gm-Features: AZwV_QinD8JFxZrBNY-rXjMhWA_acQR-WgojG7fUerVuX5e99sfTa2O6odTmxSw
Message-ID: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Coiby Xu <coxu@redhat.com>, Dave Hansen <dave.hansen@intel.com>, 
	linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16109-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zohar@linux.ibm.com,m:coxu@redhat.com,m:dave.hansen@intel.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:roberto.sassu@huaweicloud.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ardb@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,intel.com,vger.kernel.org,linux.ibm.com,huaweicloud.com,arm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,alien8.de,linux.intel.com,zytor.com,huawei.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.infradead.org,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_TWELVE(0.00)[36];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2788259DD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>
> > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
> > index 976e75f9b9ba..5dce572192d6 100644
> > --- a/security/integrity/ima/Kconfig
> > +++ b/security/integrity/ima/Kconfig
> > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
> >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
> >          bool
> >          depends on IMA_ARCH_POLICY
> > +       depends on INTEGRITY_SECURE_BOOT
> >
> >
> > Another idea is make a tree-wide arch_get_secureboot i.e. to move
> > current arch_ima_get_secureboot code to arch-specific secure boot
> > implementation. By this way, there will no need for a new Kconfig option
> > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
> > concern.
>
> Originally basing IMA policy on the secure boot mode was an exception.  As long
> as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
> you have any issues with replacing arch_ima_get_secureboot() with
> arch_get_secureboot()?

I don't see an issue with that. If there is a legitimate need to
determine this even if IMA is not enabled, then this makes sense.

