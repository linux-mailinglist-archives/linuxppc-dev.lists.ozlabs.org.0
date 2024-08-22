Return-Path: <linuxppc-dev+bounces-334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA395AFB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqFqP5TWpz2yR1;
	Thu, 22 Aug 2024 17:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=JU2D6tn/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqFMD6y1rz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:34:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nsNs6OoEVbcw2LLEgSbDKi7BEPoPfsioIF+I1dRzjSQ=; t=1724312057; x=1724916857; 
	b=JU2D6tn/raqUU41g7ckcqpfs0mD+a2MhcKvqgXS5QRUsOVEF9QCvgcuwvukc4Iuiio1vBdiJdjq
	7wbn8JbtbFnDpC5++oxbkz4IcgbMpN39LsYkA2tE5tTyI2Nsk5EMUHtpfZwi9jPow+j0TGJBF31f7
	sinQaSLN9Ruqf220fhfoPYWtttVcX1HVQH0jiN/EmKlI6WrWtn7H7/2F8o/NqFppoxz9zPQJxRmzZ
	aGFGVT2iK6MyjQKFzn5DUSr0S1xNSG8athJbYmNMtcs/SJITlBbJri/lXVIw9la4rWpjgGU4IZwof
	rlnWJlJWfDuP8OaEEWXuqsXG5WPQpfoUUFig==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sh2KT-000000008j9-3CbJ; Thu, 22 Aug 2024 09:33:57 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sh2KT-00000002vTy-29Tp; Thu, 22 Aug 2024 09:33:57 +0200
Message-ID: <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related
 config items
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: Dave Vasilevsky <dave@vasilevsky.ca>, Michael Ellerman
 <mpe@ellerman.id.au>,  kexec@lists.infradead.org,
 debian-powerpc@lists.debian.org, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,  akpm@linux-foundation.org,
 ebiederm@xmission.com, hbathini@linux.ibm.com,  piliu@redhat.com,
 viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Date: Thu, 22 Aug 2024 09:33:56 +0200
In-Reply-To: <20240124051254.67105-6-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
	 <20240124051254.67105-6-bhe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
X-ZEDAT-Hint: PO

Hi Baoquan,

On Wed, 2024-01-24 at 13:12 +0800, Baoquan He wrote:
> By splitting CRASH_RESERVE and VMCORE_INFO out from CRASH_CORE, cleaning
> up the dependency of FA_DMUMP on CRASH_DUMP, and moving crash codes from
> kexec_core.c to crash_core.c, now we can rearrange CRASH_DUMP to
> depend on KEXEC_CORE, and make CRASH_DUMP select CRASH_RESERVE and
> VMCORE_INFO.
>=20
> KEXEC_CORE won't select CRASH_RESERVE and VMCORE_INFO any more because
> KEXEC_CORE enables codes which allocate control pages, copy
> kexec/kdump segments, and prepare for switching. These codes are shared
> by both kexec reboot and crash dumping.
>=20
> Doing this makes codes and the corresponding config items more
> logical (the right item depends on or is selected by the left item).
>=20
> PROC_KCORE -----------> VMCORE_INFO
>=20
>            |----------> VMCORE_INFO
> FA_DUMP----|
>            |----------> CRASH_RESERVE
>=20
>                                                 ---->VMCORE_INFO
>                                                /
>                                                |---->CRASH_RESERVE
> KEXEC      --|                                /|
>              |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
> KEXEC_FILE --|                               \ |
>                                                \---->CRASH_HOTPLUG
>=20
> KEXEC      --|
>              |--> KEXEC_CORE--> kexec reboot
> KEXEC_FILE --|
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  kernel/Kconfig.kexec | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 8faf27043432..6c34e63c88ff 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -9,8 +9,6 @@ config VMCORE_INFO
>  	bool
> =20
>  config KEXEC_CORE
> -	select VMCORE_INFO
> -	select CRASH_RESERVE
>  	bool
> =20
>  config KEXEC_ELF
> @@ -99,8 +97,11 @@ config KEXEC_JUMP
> =20
>  config CRASH_DUMP
>  	bool "kernel crash dumps"
> +	default y
>  	depends on ARCH_SUPPORTS_CRASH_DUMP
> -	select KEXEC_CORE
> +	depends on KEXEC_CORE
> +	select VMCORE_INFO
> +	select CRASH_RESERVE
>  	help
>  	  Generate crash dump after being started by kexec.
>  	  This should be normally only set in special crash dump kernels

The change to enable CONFIG_CRASH_DUMP by default apparently broke the boot
on 32-bit Power Macintosh systems which fail after GRUB with:

	"Error: You can't boot a kdump kernel from OF!"

We may have to turn this off for 32-bit Power Macintosh systems.

See this thread on debian-powerpc ML: https://lists.debian.org/debian-power=
pc/2024/07/msg00001.html

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

