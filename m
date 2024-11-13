Return-Path: <linuxppc-dev+bounces-3129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D09C6673
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 02:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp4n73G5Yz2yN8;
	Wed, 13 Nov 2024 12:04:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731459867;
	cv=none; b=oa4h0WrnCFl8jjKrLO+6gD4nYTz7HNoU/m2uPdYXq9Aquf4Xj09p9ZYKWyVVm8N8vZDhhGiWj3npYxWeQ56XT9DdUxDMeAGQPBORxvYFKibcPRnQHVlmI7miw6mecJrP9LQVC0mARfuUQDlcM0FBeOc7gfvGRncqekKZKVk04tCdMM5eLX+Ly+nnLUOiaA6/4z1lXn9ubdhdU5ac44XZYlWSNRvxKsImT1ewx0Um3IjVWmnVgcg32WIR+dZ+UENMUEo616iCK5Yc9Tls80y0V9LHy2A/N8EBJ2HXBA5nw3SOjflTXnq8WmyooyJpf+v9bJHvL33eimHwmc/gQzBxow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731459867; c=relaxed/relaxed;
	bh=71kRV9QsWZSXh3DeItT/ZQQntIgYvFwGt1Icivu2FQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpWEK3FZLtdbp+WTD+d9Yu9imfmc7cITGeZ/EW5cKxCc+s08MLZd0ttim+9l0D2/73zwKtwHnuK2wFI2L0m3o/syby6y44wk3ugtseL/c9OR9N+mwYqo6+a52iYawXTUV5Ab9MXhCKHKPr6e12/KtYBes5DsQQBjWiFrqgigKxW+cxG8X1SwwvOCXwK6ss6TJVjQo6T8DvwKDn3CQB8QAx9lv6ZNqB7OIf6hIGuVg/nL1zI23zHiFi+tX2hzTeP+qHXULvLXAhlGhP9SibAK2tnEBvnUky+ijuaDmaftLSSJwPC6S7I73XSk/BFuqgYYqHFSBwKIfr0KMvt5er2V9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKDHsX4w; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKDHsX4w; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKDHsX4w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKDHsX4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xp4n618mCz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 12:04:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731459858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71kRV9QsWZSXh3DeItT/ZQQntIgYvFwGt1Icivu2FQU=;
	b=OKDHsX4whplmQk5tUizkzSTx3cvOgKgAD9p+Tnw4qhk0duTzxbjZOlLu/zXItp4cqQQOZR
	MkWYox/es59P8Khw1xx0u/9b3D+hHyzymiHFMke6HQIa5JPN/QkYvORWjs5O7GUtoWq1Mw
	JhoziB/0cbZIleNxvwAkceVCj9n31RA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731459858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71kRV9QsWZSXh3DeItT/ZQQntIgYvFwGt1Icivu2FQU=;
	b=OKDHsX4whplmQk5tUizkzSTx3cvOgKgAD9p+Tnw4qhk0duTzxbjZOlLu/zXItp4cqQQOZR
	MkWYox/es59P8Khw1xx0u/9b3D+hHyzymiHFMke6HQIa5JPN/QkYvORWjs5O7GUtoWq1Mw
	JhoziB/0cbZIleNxvwAkceVCj9n31RA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-11EtgfivOCK3-BmbgwnKPQ-1; Tue,
 12 Nov 2024 20:04:12 -0500
X-MC-Unique: 11EtgfivOCK3-BmbgwnKPQ-1
X-Mimecast-MFC-AGG-ID: 11EtgfivOCK3-BmbgwnKPQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2220919541A1;
	Wed, 13 Nov 2024 01:04:10 +0000 (UTC)
Received: from localhost (unknown [10.72.112.83])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61B4830000DF;
	Wed, 13 Nov 2024 01:04:07 +0000 (UTC)
Date: Wed, 13 Nov 2024 09:04:03 +0800
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org, Dave Vasilevsky <dave@vasilevsky.ca>
Cc: glaubitz@physik.fu-berlin.de, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, mpe@ellerman.id.au,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	ebiederm@xmission.com,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH v2] crash, powerpc: Default to CRASH_DUMP=n on
 PPC_BOOK3S_32
Message-ID: <ZzP7AzziB8a2jJGP@MiWiFi-R3L-srv>
References: <20240917163720.1644584-1-dave@vasilevsky.ca>
 <ZuvnhSvVMIGgAVNj@fedora>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuvnhSvVMIGgAVNj@fedora>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Andrew,

On 09/19/24 at 10:57am, Baoquan He wrote:
> On 09/17/24 at 12:37pm, Dave Vasilevsky wrote:
> > Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
> > Open Firmware. On these machines, the kernel refuses to boot
> > from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.
> > 
> > Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
> > default to off for them. Users booting via some other mechanism
> > can still turn it on explicitly.
> > 
> > Does not change the default on any other architectures for the
> > time being.
> > 
> > Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> > Reported-by: Reimar Döffinger <Reimar.Doeffinger@gmx.de>
> > Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
> > Fixes: 75bc255a7444 ("crash: clean up kdump related config items")
> > ---
> >  arch/arm/Kconfig       | 3 +++
> >  arch/arm64/Kconfig     | 3 +++
> >  arch/loongarch/Kconfig | 3 +++
> >  arch/mips/Kconfig      | 3 +++
> >  arch/powerpc/Kconfig   | 4 ++++
> >  arch/riscv/Kconfig     | 3 +++
> >  arch/s390/Kconfig      | 3 +++
> >  arch/sh/Kconfig        | 3 +++
> >  arch/x86/Kconfig       | 3 +++
> >  kernel/Kconfig.kexec   | 2 +-
> >  10 files changed, 29 insertions(+), 1 deletion(-)
> 
> Thanks for the effort.
> 
> Acked-by: Baoquan He <bhe@redhat.com>

Could you help pick this one?

Thanks
Baoquan


