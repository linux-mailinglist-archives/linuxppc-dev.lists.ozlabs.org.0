Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24F86B04D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 14:28:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdY2I4LT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdY2I4LT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlFXz5xsHz3vb4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 00:28:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdY2I4LT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdY2I4LT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlFXB558bz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 00:27:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709126855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEfwbgk+HJXxJPFthOIkO9PMTrZebAOuLRXMpclJ/tY=;
	b=CdY2I4LTe6ySvhKUd5OXvK28CMprZtY2PBLDW4XFHiESApTPt/4BiAluWOvJF+zzEyMqqC
	nJAa6ultmka3u5QI6BYTXaIFOkI7ZDS8oZVEr1p1dFzIcU6dH+nveaXJejk2dEE9pXbUBE
	FuWuv8ygOZdLewAxrLeQv8n8nvLOyys=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709126855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEfwbgk+HJXxJPFthOIkO9PMTrZebAOuLRXMpclJ/tY=;
	b=CdY2I4LTe6ySvhKUd5OXvK28CMprZtY2PBLDW4XFHiESApTPt/4BiAluWOvJF+zzEyMqqC
	nJAa6ultmka3u5QI6BYTXaIFOkI7ZDS8oZVEr1p1dFzIcU6dH+nveaXJejk2dEE9pXbUBE
	FuWuv8ygOZdLewAxrLeQv8n8nvLOyys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-klg8Z8ybN-SVy6j-IZi_eg-1; Wed, 28 Feb 2024 08:27:32 -0500
X-MC-Unique: klg8Z8ybN-SVy6j-IZi_eg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6817C8871C2;
	Wed, 28 Feb 2024 13:27:31 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E66E9492BE2;
	Wed, 28 Feb 2024 13:27:29 +0000 (UTC)
Date: Wed, 28 Feb 2024 21:27:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH linux-next v2 0/3] powerpc/kexec: split CONFIG_CRASH_DUMP
 out from CONFIG_KEXEC_CORE
Message-ID: <Zd80vHHS2Jrobvtq@MiWiFi-R3L-srv>
References: <20240226103010.589537-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226103010.589537-1-hbathini@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: Dave Young <dyoung@redhat.com>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/26/24 at 04:00pm, Hari Bathini wrote:
> This patch series is a follow-up to [1] based on discussions at [2]
> about additional work needed to get it working on powerpc.
> 
> The first patch in the series makes struct crash_mem available with or
> without CONFIG_CRASH_DUMP enabled. The next patch moves kdump specific
> code for kexec_file_load syscall under CONFIG_CRASH_DUMP and the last
> patch splits other kdump specific code under CONFIG_CRASH_DUMP and
> removes dependency with CONFIG_CRASH_DUMP for CONFIG_KEXEC_CORE.
> 
> [1] https://lore.kernel.org/all/20240124051254.67105-1-bhe@redhat.com/
> [2] https://lore.kernel.org/all/9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com/
> 
> Changes in v2:
> * Fixed a compile error for POWERNV build reported by Sourabh.
> 
> Hari Bathini (3):
>   kexec/kdump: make struct crash_mem available without CONFIG_CRASH_DUMP
>   powerpc/kexec: split CONFIG_KEXEC_FILE and CONFIG_CRASH_DUMP
>   powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency

I have acked patch 1. And patch 2 and 3 looks good to me, leave these
two to powerpc experts to have a careful reviewing. Thanks for these
great work.


> 
>  arch/powerpc/Kconfig                 |   9 +-
>  arch/powerpc/include/asm/kexec.h     |  98 +++++-----
>  arch/powerpc/kernel/prom.c           |   2 +-
>  arch/powerpc/kernel/setup-common.c   |   2 +-
>  arch/powerpc/kernel/smp.c            |   4 +-
>  arch/powerpc/kexec/Makefile          |   3 +-
>  arch/powerpc/kexec/core.c            |   4 +
>  arch/powerpc/kexec/elf_64.c          |   4 +-
>  arch/powerpc/kexec/file_load_64.c    | 269 ++++++++++++++-------------
>  arch/powerpc/platforms/powernv/smp.c |   2 +-
>  include/linux/crash_core.h           |  12 +-
>  11 files changed, 209 insertions(+), 200 deletions(-)
> 
> -- 
> 2.43.2
> 

