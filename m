Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB47D502C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 14:45:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F02pSPDz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F02pSPDz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFBcT5b18z3cVM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 23:45:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F02pSPDz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F02pSPDz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFBbZ0KPjz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 23:44:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698151492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CODKCtH5hmSRh9bBGyaKTVCZDnlLHU54pzgVooF1R0k=;
	b=F02pSPDzD8zYJhjZJlNK60xAxei/U3U6vHHCfH1cRTb5VqgrFK1jnUWNKdG0rxYDO8l5pY
	agiIDWWqWLNCutEU4JgN49rls0AkTBWeBgNAoCwUFBx9ZRvvWglgeCg96r33aEfxH3szv7
	GCIf94UrSewDDd9SAE8R7yCXDgXtyu4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698151492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CODKCtH5hmSRh9bBGyaKTVCZDnlLHU54pzgVooF1R0k=;
	b=F02pSPDzD8zYJhjZJlNK60xAxei/U3U6vHHCfH1cRTb5VqgrFK1jnUWNKdG0rxYDO8l5pY
	agiIDWWqWLNCutEU4JgN49rls0AkTBWeBgNAoCwUFBx9ZRvvWglgeCg96r33aEfxH3szv7
	GCIf94UrSewDDd9SAE8R7yCXDgXtyu4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-tcJAmO1PPUKcVk6oYnFHmw-1; Tue, 24 Oct 2023 08:44:41 -0400
X-MC-Unique: tcJAmO1PPUKcVk6oYnFHmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74E253C0F435;
	Tue, 24 Oct 2023 12:44:40 +0000 (UTC)
Received: from localhost (unknown [10.72.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C6822026D4C;
	Tue, 24 Oct 2023 12:44:39 +0000 (UTC)
Date: Tue, 24 Oct 2023 20:44:36 +0800
From: Baoquan He <bhe@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Message-ID: <ZTe8NOgAjvKDA6z0@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023110308.1202042-1-arnd@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, eric_devolder@yahoo.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just add people and mailing list to CC since I didn't find this mail in
my box, just drag it via 'b4 am'.

On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
......
> ---
>  arch/powerpc/Kconfig | 4 ++--
>  arch/riscv/Kconfig   | 4 +---
>  arch/s390/Kconfig    | 4 ++--
>  arch/x86/Kconfig     | 4 ++--
>  kernel/Kconfig.kexec | 1 +
>  5 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d5d5388973ac7..4640cee33f123 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -607,10 +607,10 @@ config ARCH_SUPPORTS_KEXEC
>  	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
>  
>  config ARCH_SUPPORTS_KEXEC_FILE
> -	def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y
> +	def_bool PPC64
>  
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> -	def_bool KEXEC_FILE
> +	def_bool y
>  
>  config ARCH_SELECTS_KEXEC_FILE
>  	def_bool y
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 25474f8c12b79..f571bad2d22d0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -687,9 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
>  	select KEXEC_ELF
>  
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> -	def_bool KEXEC_FILE
> -	depends on CRYPTO=y
> -	depends on CRYPTO_SHA256=y
> +	def_bool y
>  
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index b0d67ac8695f9..ec77106af4137 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -253,13 +253,13 @@ config ARCH_SUPPORTS_KEXEC
>  	def_bool y
>  
>  config ARCH_SUPPORTS_KEXEC_FILE
> -	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
> +	def_bool y
>  
>  config ARCH_SUPPORTS_KEXEC_SIG
>  	def_bool MODULE_SIG_FORMAT
>  
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> -	def_bool KEXEC_FILE
> +	def_bool y
>  
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 94efde80ebf35..f9975b15ccd57 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2073,7 +2073,7 @@ config ARCH_SUPPORTS_KEXEC
>  	def_bool y
>  
>  config ARCH_SUPPORTS_KEXEC_FILE
> -	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
> +	def_bool X86_64
>  
>  config ARCH_SELECTS_KEXEC_FILE
>  	def_bool y
> @@ -2081,7 +2081,7 @@ config ARCH_SELECTS_KEXEC_FILE
>  	select HAVE_IMA_KEXEC if IMA
>  
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> -	def_bool KEXEC_FILE
> +	def_bool y
>  
>  config ARCH_SUPPORTS_KEXEC_SIG
>  	def_bool y
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 7aff28ded2f48..bfc636d64ff2b 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -36,6 +36,7 @@ config KEXEC
>  config KEXEC_FILE
>  	bool "Enable kexec file based system call"
>  	depends on ARCH_SUPPORTS_KEXEC_FILE
> +	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY

I am not sure if the logic is correct. In theory, kexec_file code
utilizes purgatory to verify the checksum digested during kernel loading
when try to jump to the kernel. That means kexec_file depends on
purgatory, but not contrary?

With these changes, we can achieve the goal to avoid building issue,
whereas the code logic becomes confusing. E.g people could disable
CONFIG_KEXEC_FILE, but still get purgatory code built in which is
totally useless.

Not sure if I think too much over this.

>  	select KEXEC_CORE
>  	help
>  	  This is new version of kexec system call. This system call is
> -- 
> 2.39.2

