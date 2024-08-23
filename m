Return-Path: <linuxppc-dev+bounces-411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0DC95C65E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 09:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqrwM6Wchz2ydG;
	Fri, 23 Aug 2024 17:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724397395;
	cv=none; b=B20pHaoFfGAEnoMjg/+xwEBlkopA27yxJSijyiqcOYlmM6yXrX2L7YK3C2zq/46PlraIhCDCn/NWbLEt8Oza1fJtyrMmV+xqB/fYf/ss4BKQFc9d1zXL4HA6fCZapeCNZyykHfUMTKkFDnbs42Sk4uo6Bdb3+qMg+hUtNSQezc+Zx1t4i7vOhrpOkiPuYx440fUh8Q7tiID6m4ixnKwYfVNoMi1OkfUiw54DZrtEkHGBpDOae+4PB4baO8v97Li0W9Z4DvTPYdYYYKkXxqvEpVBC+Q56LbzNBrtqhRN8dppEHjnFm3P28kf9eo5YDEE04MZKTt7lMKK2qSIdeXNbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724397395; c=relaxed/relaxed;
	bh=l7IPZ3AaL3TYIUYzSS0Hq6JrLJlHTIOmiTWkTNBFYJI=;
	h=DKIM-Signature:Received:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Original-Sender:X-Originating-IP:
	 X-ZEDAT-Hint; b=clf0AHakoLrObusfPL81zKlE/bRYLixIxRK9/aXzWg4HrVVyklmWS6M85hH9r3s1aJvaSLlUoBPbRrYatt7oIO+yViBhV1DIwnGnZ4nmR22irvNARqjWGLCoTIYWi8Ay2NG1++naWasUDmhBgess6BF+JHXtDzOGxjKQWcpEH5Dqkn1kTOWzGbc9m8q7monJIiiU1iWT4dNzt35KprfjsMLBsa5OFdmiqs31ZojfiCRqzZ1eZXJTmYmKP5WgyHVzt/+b9K+QK59s30cXNlhEnL4QrUXhHAW2ovNrGe88ZD/7xtUbMGrmvCW2CjhwgcjOSZCh7Zw7jTEfSbL2sS6h7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=gQr9UKWA; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=gQr9UKWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqrwL71xmz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 17:16:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l7IPZ3AaL3TYIUYzSS0Hq6JrLJlHTIOmiTWkTNBFYJI=; t=1724397395; x=1725002195; 
	b=gQr9UKWAkXISMzIgKQA8PTO3iV3hJ5WEsajwShMHKxnDXdy4FpoJ7Fz7azBuZAukZl5FN6/DGu0
	vw/gcEZgNkYf1wLVFu0phhmOa4jBDFcxp464VpssfjEJZAqjPgItbKctwxrrrT7yw5+dt9EzPyfB0
	wBAwLUtVl1cLEG031d2nDC9w+XcVD1X7kC7Ys2xmrkSEuqffTcBwQiS3utHJmkDMDLk6rNsdDRbOs
	hEaf7e19C1I8TvGkK7AqF4j4gVWAEoDwLzkKTDTnhV2UoEL9dytKtFUczZrwVCYZ7Jt2JEdxpRy8O
	7ATNEf6yojoY9Ixfcf8BTgUoYkRHv3EyrjOw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1shOWy-00000002p5y-3SYy; Fri, 23 Aug 2024 09:16:20 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1shOWy-0000000256e-2Oml; Fri, 23 Aug 2024 09:16:20 +0200
Message-ID: <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related
 config items
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Dave Vasilevsky <dave@vasilevsky.ca>, Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,  akpm@linux-foundation.org,
 ebiederm@xmission.com, hbathini@linux.ibm.com,  piliu@redhat.com,
 viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Date: Fri, 23 Aug 2024 09:16:19 +0200
In-Reply-To: <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
References: <20240124051254.67105-1-bhe@redhat.com>
	 <20240124051254.67105-6-bhe@redhat.com>
	 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
	 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
	 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
	 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
	 <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
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

On Thu, 2024-08-22 at 20:41 -0400, Dave Vasilevsky wrote:
> From d6e5fe3a45f46f1aa01914648c443291d956de9e Mon Sep 17 00:00:00 2001
> From: Dave Vasilevsky <dave@vasilevsky.ca>
> Date: Thu, 22 Aug 2024 20:13:46 -0400
> Subject: [PATCH] powerpc: Default to CRASH_DUMP=3Dn when Open Firmware bo=
ot is
>  likely
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Open Firmware is unable to boot a kernel where PHYSICAL_START is
> non-zero, which occurs when CRASH_DUMP is on.
>=20
> On PPC_BOOK3S_32, the most common way of booting is Open Firmware, so
> most users probably don't want CRASH_DUMP. Users booting via some
> other mechanism can turn it on explicitly.
>=20
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Reported-by: Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
> Fixes: 75bc255a7444
> ---
>  arch/arm/Kconfig       | 3 +++
>  arch/arm64/Kconfig     | 3 +++
>  arch/loongarch/Kconfig | 3 +++
>  arch/mips/Kconfig      | 3 +++
>  arch/powerpc/Kconfig   | 4 ++++
>  arch/riscv/Kconfig     | 3 +++
>  arch/s390/Kconfig      | 3 +++
>  arch/sh/Kconfig        | 3 +++
>  arch/x86/Kconfig       | 3 +++
>  kernel/Kconfig.kexec   | 2 +-
>  10 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 54b2bb817a7f..200995052690 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1597,6 +1597,9 @@ config ATAGS_PROC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config AUTO_ZRELADDR
>  	bool "Auto calculation of the decompressed kernel image address" if !AR=
CH_MULTIPLATFORM
>  	default !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a2f8ff354ca6..43e08cc8204f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1558,6 +1558,9 @@ config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_RESERVE
> =20
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 70f169210b52..ce232ddcd27d 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -599,6 +599,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SELECTS_CRASH_DUMP
>  	def_bool y
>  	depends on CRASH_DUMP
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 60077e576935..b547f4304d0c 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2881,6 +2881,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config PHYSICAL_START
>  	hex "Physical address where the kernel is loaded"
>  	default "0xffffffff84000000"
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d7b09b064a8a..0f3c1f958eac 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -682,6 +682,10 @@ config RELOCATABLE_TEST
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	bool
> +	default y if !PPC_BOOK3S_32
> +
>  config ARCH_SELECTS_CRASH_DUMP
>  	def_bool y
>  	depends on CRASH_DUMP
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..eb247b5ee569 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -880,6 +880,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_RESERVE
> =20
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index a822f952f64a..05a1fb408471 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -275,6 +275,9 @@ config ARCH_SUPPORTS_CRASH_DUMP
>  	  This option also enables s390 zfcpdump.
>  	  See also <file:Documentation/arch/s390/zfcpdump.rst>
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  menu "Processor type and features"
> =20
>  config HAVE_MARCH_Z10_FEATURES
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 1aa3c4a0c5b2..3a6338962636 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -549,6 +549,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool BROKEN_ON_SMP
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SUPPORTS_KEXEC_JUMP
>  	def_bool y
> =20
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 007bab9f2a0e..aa4666bb9e9c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2087,6 +2087,9 @@ config ARCH_SUPPORTS_KEXEC_JUMP
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool X86_64 || (X86_32 && HIGHMEM)
> =20
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SUPPORTS_CRASH_HOTPLUG
>  	def_bool y
> =20
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 6c34e63c88ff..4d111f871951 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -97,7 +97,7 @@ config KEXEC_JUMP
> =20
>  config CRASH_DUMP
>  	bool "kernel crash dumps"
> -	default y
> +	default ARCH_DEFAULT_CRASH_DUMP
>  	depends on ARCH_SUPPORTS_CRASH_DUMP
>  	depends on KEXEC_CORE
>  	select VMCORE_INFO

It should be disabled on m68k and sh by default as well.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

