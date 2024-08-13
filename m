Return-Path: <linuxppc-dev+bounces-46-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA894FFD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 10:28:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PzvXWjVD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CjQAvitc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjkzT32xNz2xWX;
	Tue, 13 Aug 2024 18:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PzvXWjVD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CjQAvitc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjfTH54LMz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 15:05:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723525501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ6Iuf9HQSPpywwg6TUGGWKJbgP49L0YclpTyCUxyXs=;
	b=PzvXWjVDbJJLxF5MmPcrbFSwrOdRqh5/M/nRyNW6oss4ysZvJEQp3hsiMq2Omu+mf0hzCE
	Np48xAfgI88X8p5mTq2/wsxARWrHanHI2UAOBNo67QfSPLaEZov/7iJJmjZEsFKAEmcuVo
	IH0I+3M6typgV0m9WE6rc0yVZZsS5Ms=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723525502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ6Iuf9HQSPpywwg6TUGGWKJbgP49L0YclpTyCUxyXs=;
	b=CjQAvitcH00iBix8UqFKo3MOxCqd6UKdLGIL+peK+DQnZRxSOwh0uEwUD6ZXoHnOBydrVc
	DQhwSZbbltrwITlMVO3DLwioTPq0d/uoX3Q4AEck+WWmd/I7hmL7IZWwBZ/rL04VX9PQEd
	YnQkM+TpwPcLais42bhByaH+dSLOmoE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-p12-A8AMMAaezDID4m6mJA-1; Tue,
 13 Aug 2024 01:04:59 -0400
X-MC-Unique: p12-A8AMMAaezDID4m6mJA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2263318EB22C;
	Tue, 13 Aug 2024 05:04:57 +0000 (UTC)
Received: from localhost (unknown [10.72.112.25])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09279196BE80;
	Tue, 13 Aug 2024 05:04:54 +0000 (UTC)
Date: Tue, 13 Aug 2024 13:04:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Petr Tesarik <petr@tesarici.cz>, Hari Bathini <hbathini@linux.ibm.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
Message-ID: <Zrrpcn7cnCigNfWd@MiWiFi-R3L-srv>
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 08/12/24 at 09:46am, Sourabh Jain wrote:
......
> ---
> 
> Changelog:
> 
> Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
>   - Update crash_hotplug sysfs document as suggested by Petr T
>   - Update an error message in crash_handle_hotplug_event and
>     crash_check_hotplug_support function.
> 
> ---
......
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..c1048893f4b6 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
>  	crash_hotplug_lock();
>  	/* Obtain lock while reading crash information */
>  	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");

Wondering why this need be updated.

>  		crash_hotplug_unlock();
>  		return 0;
>  	}
> @@ -520,18 +520,25 @@ int crash_check_hotplug_support(void)
>  }
>  
>  /*
> - * To accurately reflect hot un/plug changes of cpu and memory resources
> - * (including onling and offlining of those resources), the elfcorehdr
> - * (which is passed to the crash kernel via the elfcorehdr= parameter)
> - * must be updated with the new list of CPUs and memories.
> + * To accurately reflect hot un/plug changes of CPU and Memory resources
> + * (including onling and offlining of those resources), the relevant
> + * kexec segments must be updated with latest CPU and Memory resources.
>   *
> - * In order to make changes to elfcorehdr, two conditions are needed:
> - * First, the segment containing the elfcorehdr must be large enough
> - * to permit a growing number of resources; the elfcorehdr memory size
> - * is based on NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES.
> - * Second, purgatory must explicitly exclude the elfcorehdr from the
> - * list of segments it checks (since the elfcorehdr changes and thus
> - * would require an update to purgatory itself to update the digest).
> + * Architectures must ensure two things for all segments that need
> + * updating during hotplug events:
> + *
> + * 1. Segments must be large enough to accommodate a growing number of
> + *    resources.
> + * 2. Exclude the segments from SHA verification.
> + *
> + * For example, on most architectures, the elfcorehdr (which is passed
> + * to the crash kernel via the elfcorehdr= parameter) must include the
> + * new list of CPUs and memory. To make changes to the elfcorehdr, it
> + * should be large enough to permit a growing number of CPU and Memory
> + * resources. One can estimate the elfcorehdr memory size based on
> + * NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
> + * excluded from SHA verification by default if the architecture
> + * supports crash hotplug.
>   */
>  static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>  {
> @@ -540,7 +547,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>  	crash_hotplug_lock();
>  	/* Obtain lock while changing crash information */
>  	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>  		crash_hotplug_unlock();
>  		return;
>  	}
> -- 
> 2.45.2
> 


