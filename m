Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF77D67B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 11:59:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gpbc8vga;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gpbc8vga;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFksl1ybJz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 20:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gpbc8vga;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gpbc8vga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFkrs5l8Mz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 20:58:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698227896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hY1uTHtPvGX6qPxYPyCytvqtD0NKbkwvoAm0a0RsVuk=;
	b=Gpbc8vgahVbhL3Si2W6Ytukt5ZjWSRSUHIoPokEZRfHxgBWc5XASSzywrdZEa7rb055eHI
	XNrJ7XB7NxKFyUDT0XsxJGXP4xfImd55ZYE1osFXx3u6Rjf/qG6IyLyhnIMayEFszQuYLT
	jXHFnFoMvA8dHwmc/d9K+iIowksHBnI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698227896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hY1uTHtPvGX6qPxYPyCytvqtD0NKbkwvoAm0a0RsVuk=;
	b=Gpbc8vgahVbhL3Si2W6Ytukt5ZjWSRSUHIoPokEZRfHxgBWc5XASSzywrdZEa7rb055eHI
	XNrJ7XB7NxKFyUDT0XsxJGXP4xfImd55ZYE1osFXx3u6Rjf/qG6IyLyhnIMayEFszQuYLT
	jXHFnFoMvA8dHwmc/d9K+iIowksHBnI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-4ArESoOsO4WzaKRFgFR3qQ-1; Wed,
 25 Oct 2023 05:58:14 -0400
X-MC-Unique: 4ArESoOsO4WzaKRFgFR3qQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F3B73C0E237;
	Wed, 25 Oct 2023 09:58:14 +0000 (UTC)
Received: from localhost (unknown [10.72.112.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ADFA40C6F79;
	Wed, 25 Oct 2023 09:58:12 +0000 (UTC)
Date: Wed, 25 Oct 2023 17:58:10 +0800
From: Baoquan He <bhe@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, eric_devolder@yahoo.com
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Message-ID: <ZTjmsku919U6u6wt@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <ZTe8NOgAjvKDA6z0@MiWiFi-R3L-srv>
 <b71034f4-5cdc-44e0-b72f-1a8ffae0593e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b71034f4-5cdc-44e0-b72f-1a8ffae0593e@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/24/23 at 03:17pm, Arnd Bergmann wrote:
> On Tue, Oct 24, 2023, at 14:44, Baoquan He wrote:
> > Just add people and mailing list to CC since I didn't find this mail in
> > my box, just drag it via 'b4 am'.
> >
> > On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
> > ......
> 
> >> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> >> index 7aff28ded2f48..bfc636d64ff2b 100644
> >> --- a/kernel/Kconfig.kexec
> >> +++ b/kernel/Kconfig.kexec
> >> @@ -36,6 +36,7 @@ config KEXEC
> >>  config KEXEC_FILE
> >>  	bool "Enable kexec file based system call"
> >>  	depends on ARCH_SUPPORTS_KEXEC_FILE
> >> +	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
> >
> > I am not sure if the logic is correct. In theory, kexec_file code
> > utilizes purgatory to verify the checksum digested during kernel loading
> > when try to jump to the kernel. That means kexec_file depends on
> > purgatory, but not contrary?
> 
> The expression I wrote is a bit confusing, but I think this just
> keeps the existing behavior:
> 
> - on architectures that select ARCH_SUPPORTS_KEXEC_PURGATORY
>   (powerpc, riscv, s390 and x86), we also require CRYPTO_SHA256
>   to be built-in.
> - on architectures that do not have ARCH_SUPPORTS_KEXEC_PURGATORY
>   (arm64 and parisc), CRYPTO_SHA256 is not used and can be disabled
>   or =m.
> 
> Since ARCH_SUPPORTS_KEXEC_PURGATORY is a 'bool' symbol, it could
> be written as
> 
> depends on (ARCH_SUPPORTS_KEXEC_PURGATORY && CRYPTO_SHA256=y) \
>            || !ARCH_SUPPORTS_KEXEC_PURGATORY

Yes, this seems to be clearer to me. Thanks.

> 
> if you find that clearer. I see that the second patch
> actually gets this wrong, it should actually do
> 
> select CRYPTO if ARCH_SUPPORTS_KEXEC_PURGATORY
> select CRYPTO_SHA256 if ARCH_SUPPORTS_KEXEC_PURGATORY

Yeah, makes sense to me.

Hi Eric,

Do you have comment about these?

> 
> > With these changes, we can achieve the goal to avoid building issue,
> > whereas the code logic becomes confusing. E.g people could disable
> > CONFIG_KEXEC_FILE, but still get purgatory code built in which is
> > totally useless.
> >
> > Not sure if I think too much over this.
> 
> I see your point here, and I would suggest changing the
> CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY symbol to just indicate
> the availability of the purgatory code for the arch, rather
> than actually controlling the code itself. I already mentioned
> this for s390, but riscv would need the same thing on top.
> 
> I think the change below should address your concern.
> 
>      Arnd
> 
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index e60fbd8660c4..3ac341d296db 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -266,7 +266,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>                 cmdline = modified_cmdline;
>         }
>  
> -#ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY
> +#ifdef CONFIG_KEXEC_FILE
>         /* Add purgatory to the image */
>         kbuf.top_down = true;
>         kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> @@ -280,7 +280,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>                                              sizeof(kernel_start), 0);
>         if (ret)
>                 pr_err("Error update purgatory ret=%d\n", ret);
> -#endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
> +#endif /* CONFIG_KEXEC_FILE */

If so, we don't need the CONFIG_KEXEC_FILE ifdeffery because the
file elf_kexec.c relied on CONFIG_KEXEC_FILE enabling to build in.
We can just remove the "#ifdef CONFIG_KEXEC_FILE..#endif" as x86 does.

>  
>         /* Add the initrd to the image */
>         if (initrd != NULL) {
> diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> index d25ad1c19f88..ab181d187c23 100644
> --- a/arch/riscv/Kbuild
> +++ b/arch/riscv/Kbuild
> @@ -5,7 +5,7 @@ obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
>  obj-y += errata/
>  obj-$(CONFIG_KVM) += kvm/
>  
> -obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
> +obj-$(CONFIG_KEXEC_FILE) += purgatory/
>  
>  # for cleaning
>  subdir- += boot
> diff --git a/arch/s390/Kbuild b/arch/s390/Kbuild
> index a5d3503b353c..361aa01dbd49 100644
> --- a/arch/s390/Kbuild
> +++ b/arch/s390/Kbuild
> @@ -7,7 +7,7 @@ obj-$(CONFIG_S390_HYPFS)        += hypfs/
>  obj-$(CONFIG_APPLDATA_BASE)    += appldata/
>  obj-y                          += net/
>  obj-$(CONFIG_PCI)              += pci/
> -obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
> +obj-$(CONFIG_KEXEC_FILE)       += purgatory/
>  
>  # for cleaning
>  subdir- += boot tools
> 

