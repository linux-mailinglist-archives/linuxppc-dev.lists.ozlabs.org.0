Return-Path: <linuxppc-dev+bounces-791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A31EE9657B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 08:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww7h132n2z303N;
	Fri, 30 Aug 2024 16:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724999745;
	cv=none; b=H2h3YnXt+YSsGgsUd2JDVRIscvs3Ckcp/SCX8aqLX6rjTsoVZEEB8dx+53fzbETlIW5HTkgGRw2tMmToIDO6Eb0vi/JnP5AUWOPf7imo2M4UGfb35BRbfyvgn4SejWmSoHVItPhlqoLn9J9CRKBZUyCzwSX8lMOw5pfkyf15gwWapvgWVgZpAyFuBuSI0A4QW/XPYLuetSlVmwJUow/tgI6GExdluDn+PqbFRJStt/XMj8SjkPvdAg5e9JhCHbJH9Y00JGTqRXUo3F76VaeVs0noVUOz2RMu123TDcZ88JfSvBP4f6Pi+wr10hib7ckfJwHp50s0ZReiuj91YL+/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724999745; c=relaxed/relaxed;
	bh=HrWNOiIuuwv6rUwr8p842oSg3wAC+6BD/WbJwvg4yP0=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Scanned-By; b=Achr7cKMpYtN4wu4xJTnyJmpA40I5QM0PH2EVcHydl9qQnFhIw91qceqik23a3Y7VroRBjS53HhOiWD8Jip/q0+i/fdq3xh7ekp2CO3SKoAQaTbzVv1PICaFm4RyXlQ5v8M6m4/8Wc789FivVg3yJLi0F2M6onpCBsRxWVnuODzlHnF1AM9myBdg9zKqVLjNITEWyR0kC1HnY4jKxJCViTEfk5p0wNyDaFBg3Oo+Iig9JTo0nywBxF5PgIFTREALvXo+zHxAJjzMQUtclvOQiX+V8v4QSvRJU+88lyq760pig+Z85fFmPvo3bFUkCkkB22hI2HE12PGxbE4ucnjHIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cqh9hqzC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+H3bVzc; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cqh9hqzC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+H3bVzc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww7h06bnfz303K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 16:35:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724999741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrWNOiIuuwv6rUwr8p842oSg3wAC+6BD/WbJwvg4yP0=;
	b=cqh9hqzCyIxHtGfGAGpDfbaTU0eJpwFsVB7Ay771xkR7PLs/2SUnGqeI3VwHVPGid/y88x
	WKdK+El9zDhwQ1u04kOGpeiPG29pNuFcmEDUlbrSHPTu2Yuyz2usVIXRV0I+9KAwJGGN7g
	WBtuax5imudo8NvkWZWG+o72BP0OWZY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724999742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrWNOiIuuwv6rUwr8p842oSg3wAC+6BD/WbJwvg4yP0=;
	b=R+H3bVzclt+U46rGttFZuGoVaNtrV7u46lKhm5YTfzFrAAJUEfE2SGy4wJARjkQ0z8ssHB
	riTwYm/J+Lk+OldqdKXLAA6VFIT81A5nULXkU3MIYAsDjv0Wxgc6foDoGx5p5H4pG2GyAe
	s9KmicmfDwFr4N9gu7LGPaL91dF0QJ4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-JmQCpNOLOBqYBCgbQINbGQ-1; Fri,
 30 Aug 2024 02:35:37 -0400
X-MC-Unique: JmQCpNOLOBqYBCgbQINbGQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5487419560B1;
	Fri, 30 Aug 2024 06:35:35 +0000 (UTC)
Received: from localhost (unknown [10.72.112.42])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABB3E19560AD;
	Fri, 30 Aug 2024 06:35:32 +0000 (UTC)
Date: Fri, 30 Aug 2024 14:35:28 +0800
From: Baoquan He <bhe@redhat.com>
To: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: akpm@linux-foundation.org, glaubitz@physik.fu-berlin.de,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	mpe@ellerman.id.au, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
Message-ID: <ZtFoMMsS5PuFw3LF@MiWiFi-R3L-srv>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
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
In-Reply-To: <20240823125156.104775-1-dave@vasilevsky.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 08/23/24 at 08:51am, Dave Vasilevsky wrote:
> Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
> Open Firmware. On these machines, the kernel refuses to boot
> from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.
> 
> Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
> default to off for them. Users booting via some other mechanism
> can still turn it on explicitly.
> 
> Also defaults to CRASH_DUMP=n on sh.

The overrall looks good to me except of the CRASH_DUMP=n on sh, do you
have a comment about the reasoning since you have discussed with John?
Is it because of below config items?

arch/sh/Kconfig:
config ARCH_SUPPORTS_CRASH_DUMP
        def_bool BROKEN_ON_SMP
...
config PHYSICAL_START
        hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
        default MEMORY_START
	...

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
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 54b2bb817a7f..200995052690 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1597,6 +1597,9 @@ config ATAGS_PROC
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
> index a2f8ff354ca6..43e08cc8204f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1558,6 +1558,9 @@ config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
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
> index 70f169210b52..ce232ddcd27d 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -599,6 +599,9 @@ config ARCH_SUPPORTS_KEXEC
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
> index d7b09b064a8a..0f3c1f958eac 100644
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
> index 0f3cd7c3a436..eb247b5ee569 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -880,6 +880,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
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
> index a822f952f64a..05a1fb408471 100644
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
> index 1aa3c4a0c5b2..b04cfa23378c 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -549,6 +549,9 @@ config ARCH_SUPPORTS_KEXEC
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool BROKEN_ON_SMP
>  
> +config ARCH_DEFAULT_CRASH_DUMP
> +	def_bool n
> +
>  config ARCH_SUPPORTS_KEXEC_JUMP
>  	def_bool y
>  
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 007bab9f2a0e..aa4666bb9e9c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2087,6 +2087,9 @@ config ARCH_SUPPORTS_KEXEC_JUMP
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
> 2.34.1
> 


