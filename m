Return-Path: <linuxppc-dev+bounces-1458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1AF97C663
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 10:58:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ttt5BNtz2y3Z;
	Thu, 19 Sep 2024 18:57:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726736278;
	cv=none; b=A1xhJ63GIhpsRoA0QuM3Wz10ewNhuM4ZLOdeOq4tVNlDAw4zRpNtxhP2jloDM7wHLx7Ix7locALH25h0TaEUvBFuuGPIC/X6IVv9+I7PtGDz2w2jSu59IMA6cRz9sCaJQl2pwOemw54BgWAdo7grg79MbyDknT+f867OC18cExVhS3k83dg3LMVUmKclBdCes7hBMRZ6NAWPHnhIR/Pnv8Ha1Ectg+AMy2xiZ0qQBsoinudy4qG89rt9UMwVTWDN3qD41aI2VnIlRRPeRznQ4jXSE43b2u06ciqFA8RlwrwSl4+aaRuUeCH80Kxh3bwzL6WQmjrA0hqHpyIT/lZbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726736278; c=relaxed/relaxed;
	bh=YDlb9HHKZ7ppggUTFJeczVT++JQqxU+9AUY020deop4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFFp6wF6yXqoOTOtqnILlvjSOzXmLCEO/zijuG0pm1nx0Amz//8Bufqme8DwDwyvedQDBtbMEXVvgbQvxl4nOcoOrdPSzvyJaUdkruLx4c3ezZduoAn+3VD42OaOR0kpkAnDVYK0vJh7pXOgi8VZzMd88+X8poXOhpFJoQ9psxn5dBr0kl2JQMqHSQJSPzicaGGp5BZezzVNMqlNCgBTza6goWnC3cTFh8HA+Lj00uIexQ03IYVoWpg4o3FaltoMUow5MViqgY+2r1rw/zLkCc6kYqbenh4gjFkBXf4V13v/ftID2zWnDWIDzqMVJLYNhDYnnaaC6qYU+4Hh5NgLEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cdn3wr4q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cdn3wr4q; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cdn3wr4q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cdn3wr4q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Tts6rmWz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 18:57:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726736270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDlb9HHKZ7ppggUTFJeczVT++JQqxU+9AUY020deop4=;
	b=cdn3wr4qCX4bt28j0/zSMtDoiyYuHhPhO8T9kNzqlr467cM99l38FeSyNFJzRWf9hzO4sq
	lZLqUPVnawXMibVk56RQvHAPmnozMzaSB2sqjKwReX8ohiH0KlyxYykHVvxx4dLO+9nZqx
	klIGAnqUx2ilpBI4Dj1p5rtJrCF54cg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726736270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDlb9HHKZ7ppggUTFJeczVT++JQqxU+9AUY020deop4=;
	b=cdn3wr4qCX4bt28j0/zSMtDoiyYuHhPhO8T9kNzqlr467cM99l38FeSyNFJzRWf9hzO4sq
	lZLqUPVnawXMibVk56RQvHAPmnozMzaSB2sqjKwReX8ohiH0KlyxYykHVvxx4dLO+9nZqx
	klIGAnqUx2ilpBI4Dj1p5rtJrCF54cg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-PHncvciHNp20_laqddd98Q-1; Thu,
 19 Sep 2024 04:57:48 -0400
X-MC-Unique: PHncvciHNp20_laqddd98Q-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E13C1956083;
	Thu, 19 Sep 2024 08:57:46 +0000 (UTC)
Received: from localhost (unknown [10.45.226.3])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F9C819560AA;
	Thu, 19 Sep 2024 08:57:44 +0000 (UTC)
Date: Thu, 19 Sep 2024 10:57:41 +0200
From: Baoquan He <bhe@redhat.com>
To: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: akpm@linux-foundation.org, glaubitz@physik.fu-berlin.de,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	mpe@ellerman.id.au, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, ebiederm@xmission.com,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH v2] crash, powerpc: Default to CRASH_DUMP=n on
 PPC_BOOK3S_32
Message-ID: <ZuvnhSvVMIGgAVNj@fedora>
References: <20240917163720.1644584-1-dave@vasilevsky.ca>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917163720.1644584-1-dave@vasilevsky.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 09/17/24 at 12:37pm, Dave Vasilevsky wrote:
> Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
> Open Firmware. On these machines, the kernel refuses to boot
> from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.
> 
> Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
> default to off for them. Users booting via some other mechanism
> can still turn it on explicitly.
> 
> Does not change the default on any other architectures for the
> time being.
> 
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Reported-by: Reimar Döffinger <Reimar.Doeffinger@gmx.de>
> Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
> Fixes: 75bc255a7444 ("crash: clean up kdump related config items")
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

Thanks for the effort.

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0ec034933cae..4cc31467298b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1598,6 +1598,9 @@ config ATAGS_PROC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config AUTO_ZRELADDR
>  	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
>  	default !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index ed15b876fa74..8c67b76347d3 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1559,6 +1559,9 @@ config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_RESERVE
>  
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 0e3abf7b0bd3..7ba3baee859e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -600,6 +600,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
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
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config PHYSICAL_START
>  	hex "Physical address where the kernel is loaded"
>  	default "0xffffffff84000000"
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8a4ee57cd4ef..c04f7bb543cc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -682,6 +682,10 @@ config RELOCATABLE_TEST
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	bool
> +	default y if !PPC_BOOK3S_32
> +
>  config ARCH_SELECTS_CRASH_DUMP
>  	def_bool y
>  	depends on CRASH_DUMP
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 86d1f1cea571..341ef759870a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -882,6 +882,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_RESERVE
>  
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index c60e699e99f5..fff371b89e41 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -275,6 +275,9 @@ config ARCH_SUPPORTS_CRASH_DUMP
>  	  This option also enables s390 zfcpdump.
>  	  See also <file:Documentation/arch/s390/zfcpdump.rst>
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  menu "Processor type and features"
>  
>  config HAVE_MARCH_Z10_FEATURES
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index e9103998cca9..04ff5fb9242e 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -550,6 +550,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool BROKEN_ON_SMP
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SUPPORTS_KEXEC_JUMP
>  	def_bool y
>  
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index d1fe732979d4..7f39db779574 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2092,6 +2092,9 @@ config ARCH_SUPPORTS_KEXEC_JUMP
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool X86_64 || (X86_32 && HIGHMEM)
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool y
> +
>  config ARCH_SUPPORTS_CRASH_HOTPLUG
>  	def_bool y
>  
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 6c34e63c88ff..4d111f871951 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -97,7 +97,7 @@ config KEXEC_JUMP
>  
>  config CRASH_DUMP
>  	bool "kernel crash dumps"
> -	default y
> +	default ARCH_DEFAULT_CRASH_DUMP
>  	depends on ARCH_SUPPORTS_CRASH_DUMP
>  	depends on KEXEC_CORE
>  	select VMCORE_INFO
> -- 
> 2.43.0
> 


