Return-Path: <linuxppc-dev+bounces-779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E58965596
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:16:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3Fm5dBQz2yvk;
	Fri, 30 Aug 2024 13:16:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724987772;
	cv=none; b=CIhVB/Z9RPJ3ZRP76bJhFyeV0UD1G1svhZCttNX5OCA5u09/fkO3HAs0zczrLwpRrZLLIJzZdYyLNeCddLFi4CQGW+4eqNBJ9PnGiku7X8XRgILckNYIPxAU+ZIQ4lgY5Uv+ucNTdR8ydlobiaSDFhzUBe2MERL/sgN3HrD/else4cWm4dMyVp3JrPmY0xrvOmo1Y92boIvqgty063KfTR/TnBSKB/PJWPPc9OFGY3QMkl71RO4Mmyw9E7Behwm/nyMFw28klVgTkt6dqIiChGU4fTnp6hd1ApQq0OykZWPkky/pHxxABPXuEEwUPkeJWxU8QnxgXR4kD1qbSw2HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724987772; c=relaxed/relaxed;
	bh=0Y16gZ5ll9x+ZZRQurc1f4Q2jGpW469PmPcdJZo7k8I=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Scanned-By; b=KC6C3EvHAcUA4GhL14Fua6jwUV2PcfA1ko4+sQdCmn7Pf8TZZDeDicgW6ahO6nwhkoRZlhZWn+9bKIPNRYKSidF07paSIXag631xUtY/jWJmmU62sW581cdwP8LsGvyyQJoejSGsJnfrTJZSyPLa/cv87KDcuQLyU4jXKZILay+kvM6fA5+gnEIusLTnvO8XvAHyagLQZUTE2yD4fJ8J+QaMw8iC05K3vwLpAakz1hvnBkWrlEqXta5AQk6Ure2pOLer54Lrus8cMleEdRNo9uEtyRDmmdTT9KBhOmOozzXx321NqTp0pCazrCJuaXTgamgzraVGN4Cny0jjm75AxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bkm+kCp1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bCX8jJBZ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bkm+kCp1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bCX8jJBZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3Fm24Byz2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:16:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724987765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y16gZ5ll9x+ZZRQurc1f4Q2jGpW469PmPcdJZo7k8I=;
	b=Bkm+kCp1nF/aynI+HfPIbF2tL5QkvM4rpWGtm+MfdPiSarZKfvR/9HBufxLPrCf5tjGqhm
	rcH2xzHbh0gJhA4/PmCMh7V9vHkWtgqmHoGLgqF+z2ARk3MNvdE+MPZxq3yTVn3+Akn/bL
	iXywMoh8yuWcd1udvxo9zBHRY7mNn+c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724987766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y16gZ5ll9x+ZZRQurc1f4Q2jGpW469PmPcdJZo7k8I=;
	b=bCX8jJBZAj0En0JDDi2+IsFUC4B+Zd3mLl65j+ZDA7XK3y6w15drXqNEpjRZoTJKw0/4bv
	TZnSK6dHHVT8KBcwl+7uYGDC7TTDgMvnldBBF5ojWoaiilWVGSYQcjlvailkY3+iAC2U62
	Nu8C2CaqZga+eLK3qhsa4sv/qTvhBMc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-E_cgXM_TMY2lLDSNHnmYZA-1; Thu,
 29 Aug 2024 23:16:01 -0400
X-MC-Unique: E_cgXM_TMY2lLDSNHnmYZA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E21241955D55;
	Fri, 30 Aug 2024 03:15:57 +0000 (UTC)
Received: from localhost (unknown [10.72.112.42])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3149E1955F1B;
	Fri, 30 Aug 2024 03:15:55 +0000 (UTC)
Date: Fri, 30 Aug 2024 11:15:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: glaubitz@physik.fu-berlin.de, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, mpe@ellerman.id.au,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
Message-ID: <ZtE5Z/gDR1WixG9S@MiWiFi-R3L-srv>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823125156.104775-1-dave@vasilevsky.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi Dave,

On 08/23/24 at 08:51am, Dave Vasilevsky wrote:
......snip..
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

If we don't add ARCH_DEFAULT_CRASH_DUMP at all in sh arch, the
CRASH_DUMP will be off by default according to the below new definition
of CRASH_DUMP?

Thanks
Baoquan

> +
>  config ARCH_SUPPORTS_KEXEC_JUMP
>  	def_bool y
>  
......  
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


