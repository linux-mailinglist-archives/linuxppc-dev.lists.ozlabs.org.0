Return-Path: <linuxppc-dev+bounces-339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392B95B14D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 11:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqHfz0TDTz2yNR;
	Thu, 22 Aug 2024 19:18:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0hGY2b4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0hGY2b4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqHfy3qDBz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:18:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724318275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQYE68vcEgjS0sSHwEvda+5305YgNqXrXPbN5IkBuaU=;
	b=g0hGY2b4TQCMhnKAYsjNWAPZcewc3OwOGLyV5f0tHw8zViUY8ek364zjiPaHNZy6QSrcpg
	vHTsr1Ty4RtVU64Lyrap6sUOoqHpt0HMJW30ULi6gITicbWesZICciH0gzJkeJZXqKCTjp
	fYleKCJZE5hhlHHNrvs44ax579xgUA4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724318275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQYE68vcEgjS0sSHwEvda+5305YgNqXrXPbN5IkBuaU=;
	b=g0hGY2b4TQCMhnKAYsjNWAPZcewc3OwOGLyV5f0tHw8zViUY8ek364zjiPaHNZy6QSrcpg
	vHTsr1Ty4RtVU64Lyrap6sUOoqHpt0HMJW30ULi6gITicbWesZICciH0gzJkeJZXqKCTjp
	fYleKCJZE5hhlHHNrvs44ax579xgUA4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-L0turdIFM4OQX6QvsCLAsw-1; Thu,
 22 Aug 2024 05:17:49 -0400
X-MC-Unique: L0turdIFM4OQX6QvsCLAsw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3C3B1955EB3;
	Thu, 22 Aug 2024 09:17:44 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A174E1956053;
	Thu, 22 Aug 2024 09:17:41 +0000 (UTC)
Date: Thu, 22 Aug 2024 17:17:36 +0800
From: Baoquan He <bhe@redhat.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org, Dave Vasilevsky <dave@vasilevsky.ca>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	debian-powerpc@lists.debian.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, akpm@linux-foundation.org,
	ebiederm@xmission.com, hbathini@linux.ibm.com, piliu@redhat.com,
	viro@zeniv.linux.org.uk, Sam James <sam@gentoo.org>
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
Message-ID: <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 08/22/24 at 09:33am, John Paul Adrian Glaubitz wrote:
> Hi Baoquan,
> 
> On Wed, 2024-01-24 at 13:12 +0800, Baoquan He wrote:
> > By splitting CRASH_RESERVE and VMCORE_INFO out from CRASH_CORE, cleaning
> > up the dependency of FA_DMUMP on CRASH_DUMP, and moving crash codes from
> > kexec_core.c to crash_core.c, now we can rearrange CRASH_DUMP to
> > depend on KEXEC_CORE, and make CRASH_DUMP select CRASH_RESERVE and
> > VMCORE_INFO.
> > 
> > KEXEC_CORE won't select CRASH_RESERVE and VMCORE_INFO any more because
> > KEXEC_CORE enables codes which allocate control pages, copy
> > kexec/kdump segments, and prepare for switching. These codes are shared
> > by both kexec reboot and crash dumping.
> > 
> > Doing this makes codes and the corresponding config items more
> > logical (the right item depends on or is selected by the left item).
> > 
> > PROC_KCORE -----------> VMCORE_INFO
> > 
> >            |----------> VMCORE_INFO
> > FA_DUMP----|
> >            |----------> CRASH_RESERVE
> > 
> >                                                 ---->VMCORE_INFO
> >                                                /
> >                                                |---->CRASH_RESERVE
> > KEXEC      --|                                /|
> >              |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
> > KEXEC_FILE --|                               \ |
> >                                                \---->CRASH_HOTPLUG
> > 
> > KEXEC      --|
> >              |--> KEXEC_CORE--> kexec reboot
> > KEXEC_FILE --|
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  kernel/Kconfig.kexec | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > index 8faf27043432..6c34e63c88ff 100644
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -9,8 +9,6 @@ config VMCORE_INFO
> >  	bool
> >  
> >  config KEXEC_CORE
> > -	select VMCORE_INFO
> > -	select CRASH_RESERVE
> >  	bool
> >  
> >  config KEXEC_ELF
> > @@ -99,8 +97,11 @@ config KEXEC_JUMP
> >  
> >  config CRASH_DUMP
> >  	bool "kernel crash dumps"
> > +	default y
> >  	depends on ARCH_SUPPORTS_CRASH_DUMP
> > -	select KEXEC_CORE
> > +	depends on KEXEC_CORE
> > +	select VMCORE_INFO
> > +	select CRASH_RESERVE
> >  	help
> >  	  Generate crash dump after being started by kexec.
> >  	  This should be normally only set in special crash dump kernels
> 
> The change to enable CONFIG_CRASH_DUMP by default apparently broke the boot
> on 32-bit Power Macintosh systems which fail after GRUB with:
> 
> 	"Error: You can't boot a kdump kernel from OF!"
> 
> We may have to turn this off for 32-bit Power Macintosh systems.
> 
> See this thread on debian-powerpc ML: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html

If so, fix need be made.

We may need change in ARCH_SUPPORTS_CRASH_DUMP of ppc, can you or anyone
post a patch? I don't know how to identify 32-bit Power Macintosh.

arch/powerpc/Kconfig:
===
config ARCH_SUPPORTS_CRASH_DUMP
        def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
        
config ARCH_SELECTS_CRASH_DUMP
        def_bool y
        depends on CRASH_DUMP
        select RELOCATABLE if PPC64 || 44x || PPC_85xx
......
config PHYSICAL_START
        hex "Physical address where the kernel is loaded" if PHYSICAL_START_BOOL
        default "0x02000000" if PPC_BOOK3S && CRASH_DUMP && !NONSTATIC_KERNEL
        default "0x00000000"


