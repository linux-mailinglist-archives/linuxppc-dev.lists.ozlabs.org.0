Return-Path: <linuxppc-dev+bounces-402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D3E95C1DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 02:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqgKm6kVtz2yF1;
	Fri, 23 Aug 2024 10:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724371468;
	cv=none; b=O+Bf940mbupDgIGmASLWUgrLleYFbQb5hO4+jLchaxNfmuNTs3IlsyyUptgf7YJfTElE47jM/AE9GR+S7a8OG/lEN63K4qTVF5jCpzvT4ykOShXByAgiKL9gVpRQz6NEa0RlGZqWpKB13AviZevBi44ZzmGOmvJUFxK/tWrAB16uVO1CsuER7NjYx374Y+p5AMpeFncHPTGXhHWAgtPkzo/j0q6QDWfCuqA1s31iQoyJI8ikkAxjHqPrqTOpT01O2/QI4NaeIs+FnHqMS6itVq4+FBtT+bA8hRtTn4i/op+B856QWHx58NA9A/TNf0GjNODh0f4ziwlqQ4ALXl1sFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724371468; c=relaxed/relaxed;
	bh=HHqbq1AQSOY5EcS479bGVBSadv/yHMIWF28e/YV8WdA=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Scanned-By; b=Wpu5jdaBX0CbXCFVZgvygfwtyvfPLrdq/1na3nfF22XdLUGQ/THIUNkQGNoHTEkfV0zLb1EwrlKrYSHEmiBMi1KcNOU50kHBjXmcw58pqsxhz4+uqVZrexCezBdoQHUaSEkZVlXz8ikiN64Uy6N3EC0DrWfUad+qm7qvD/p/+ajjymLDjvujRBsDSe5Wk7jROCESQOk73GoIJP8Qc+3kZMY5ylHMC2/uIbpidByRUR1UYBQhORWx2W3vvk1kBs/uvcRcXQAVtvvL5fz3jNAMHH7oYxFPLJRb20qAwLe6GEIn2UbrsRJ3QgVDU7XRAJIYEgoN744/uOlZKZj5rnANkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ON0z/daj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VeD1PJvg; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ON0z/daj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VeD1PJvg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqgKm1d5qz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 10:04:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724371463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HHqbq1AQSOY5EcS479bGVBSadv/yHMIWF28e/YV8WdA=;
	b=ON0z/dajkrSyPS5QqkOqQfNn8q70Dpr3pIAGQukIfCsgKn9vxlcwBezFraob/MG0BXnKcm
	reC5GvpSUeJ1N0ZfLqtZyvi9pg1JvVSLyWkM1H3S/zDRvwcoP+XLB5xfDCZ+UlA0Wu7yem
	qTBCFaKfR0TQhGJOyQUeGj/Ewjo+z1k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724371464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HHqbq1AQSOY5EcS479bGVBSadv/yHMIWF28e/YV8WdA=;
	b=VeD1PJvgw+93/BbLHZTS74mrbN3xV6Iry0fx+Ox5civjin87YCqrVVEG7k5QMEIYosdEVy
	6OQ2omXpu5kIrabxzgN1+EKaSYnoAuHTK9PPINLyHLt4ZXUKop71pKH0Y3KO1tMCG+QyYe
	VHjZJumdbQn/9ot3vN4ZP4UdsqboSp0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-Q2zfLi0YMr2QKG2BabfBhQ-1; Thu,
 22 Aug 2024 20:04:18 -0400
X-MC-Unique: Q2zfLi0YMr2QKG2BabfBhQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0352B1955BF4;
	Fri, 23 Aug 2024 00:04:14 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACCC819560A3;
	Fri, 23 Aug 2024 00:04:10 +0000 (UTC)
Date: Fri, 23 Aug 2024 08:04:06 +0800
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
Message-ID: <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
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
In-Reply-To: <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 08/22/24 at 11:37am, John Paul Adrian Glaubitz wrote:
> Hi Baoquan,
> 
> On Thu, 2024-08-22 at 17:17 +0800, Baoquan He wrote:
> > > The change to enable CONFIG_CRASH_DUMP by default apparently broke the boot
> > > on 32-bit Power Macintosh systems which fail after GRUB with:
> > > 
> > > 	"Error: You can't boot a kdump kernel from OF!"
> > > 
> > > We may have to turn this off for 32-bit Power Macintosh systems.
> > > 
> > > See this thread on debian-powerpc ML: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
> > 
> > If so, fix need be made.
> > 
> > We may need change in ARCH_SUPPORTS_CRASH_DUMP of ppc, can you or anyone
> > post a patch? I don't know how to identify 32-bit Power Macintosh.
> > 
> > arch/powerpc/Kconfig:
> > ===
> > config ARCH_SUPPORTS_CRASH_DUMP
> >         def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
> >         
> > config ARCH_SELECTS_CRASH_DUMP
> >         def_bool y
> >         depends on CRASH_DUMP
> >         select RELOCATABLE if PPC64 || 44x || PPC_85xx
> > ......
> > config PHYSICAL_START
> >         hex "Physical address where the kernel is loaded" if PHYSICAL_START_BOOL
> >         default "0x02000000" if PPC_BOOK3S && CRASH_DUMP && !NONSTATIC_KERNEL
> >         default "0x00000000"
> 
> I think the architecture does support crash dumps, but I think the kernel has to
> be booted from kexec in this case. Booting a kernel with CRASH_DUMP enabled won't
> work from Open Firmware. So, I think CRASH_DUMP should just be disabled for
> PPC_BOOK3S_32 by default and users who want to use it on these systems, will have to
> enable it explicitly.

If so, below patch possiblly can fix it. Can you help check if it's OK?

From dd5318dc5dcd66521b31214f0e5921f258532ef8 Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Fri, 23 Aug 2024 07:37:38 +0800
Subject: [PATCH] powerpc/crash: do not default to enable CRASH_DUMP for
 PPC_BOOK3S_32 system
Content-type: text/plain

Recently it's reported that PowerPC macMini system failed to boot up.
It's because CONFIG_CRASH_DUMP=y is set by default on the system since
kernel 6.9, and that makes CONFIG_PHYSICAL_START not equaling 0 any
more and causes failure of normal kernel bootup.

The link of error report can be found here:

https://lists.debian.org/debian-powerpc/2024/07/msg00001.html

And copy the code snippet here for reference:
arch/powerpc/Kconfig:
==================
config KERNEL_START
        hex "Virtual address of kernel base" if KERNEL_START_BOOL
        default PAGE_OFFSET if PAGE_OFFSET_BOOL
        default "0xc2000000" if CRASH_DUMP && !NONSTATIC_KERNEL
        default "0xc0000000"

So let's stop enabling CRASH_DUMP by default on PPC_BOOK3S_32.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7b09b064a8a..dc5ca58be1d6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -680,7 +680,7 @@ config RELOCATABLE_TEST
 	  relocation code.
 
 config ARCH_SUPPORTS_CRASH_DUMP
-	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+	def_bool PPC64 || PPC_85xx || (44x && !SMP)
 
 config ARCH_SELECTS_CRASH_DUMP
 	def_bool y
-- 
2.41.0


