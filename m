Return-Path: <linuxppc-dev+bounces-47-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57A950112
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 11:17:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z2a9SD5E;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwU6MChK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjm4J04Hcz2xJT;
	Tue, 13 Aug 2024 19:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z2a9SD5E;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwU6MChK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjm4H3FYqz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 19:17:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723540634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3dzzkihmU0oWgDbdzaqrXfn8l2l+YCCSlKhwcKDVXU=;
	b=Z2a9SD5EUDDUKNRm7dmJx9M4lRZTUqOi+V++hAC4HLgOBJkLFxh3q+6R6MyhX7bo07uOQi
	AFuWestdyB7PSJ4ftYSYvxZPVdibjf8wjZEST4qrxFqJYe+ivYhSpfnKCQdin7B8uu2v/3
	aWfebxKX+vi0ASG6EPKUZIaQ5NsbONY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723540635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3dzzkihmU0oWgDbdzaqrXfn8l2l+YCCSlKhwcKDVXU=;
	b=VwU6MChK4pZlqC05/CNgI04PVL0kcZFUOWo3fIjv4mmA0/qEdEbkbHzgrj0U7Xuw8YzbJg
	hQ5VJLqk3I1LsKXIgmt8irEovaPQZTUna6wuDoImj1lTqbeQdTKiFvEm0+JgokG8r+/x0g
	G7H2NaB+bboecu/oXpZ55hImG02XeUo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-tGbMoIq-NCG48YYwgfgsAA-1; Tue,
 13 Aug 2024 05:17:13 -0400
X-MC-Unique: tGbMoIq-NCG48YYwgfgsAA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0EB11954B0E;
	Tue, 13 Aug 2024 09:17:10 +0000 (UTC)
Received: from localhost (unknown [10.72.112.25])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84BB43001FC3;
	Tue, 13 Aug 2024 09:17:08 +0000 (UTC)
Date: Tue, 13 Aug 2024 17:17:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Petr Tesarik <petr@tesarici.cz>, Hari Bathini <hbathini@linux.ibm.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
Message-ID: <ZrskkDuMlQu+uBN4@MiWiFi-R3L-srv>
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
 <Zrrpcn7cnCigNfWd@MiWiFi-R3L-srv>
 <4cbbf314-5134-4a1a-8a4d-f6f8c09104d3@linux.ibm.com>
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
In-Reply-To: <4cbbf314-5134-4a1a-8a4d-f6f8c09104d3@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 08/13/24 at 10:58am, Sourabh Jain wrote:
> Hello Baoquan,
> 
> On 13/08/24 10:34, Baoquan He wrote:
> > On 08/12/24 at 09:46am, Sourabh Jain wrote:
> > ......
> > > ---
> > > 
> > > Changelog:
> > > 
> > > Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
> > >    - Update crash_hotplug sysfs document as suggested by Petr T
> > >    - Update an error message in crash_handle_hotplug_event and
> > >      crash_check_hotplug_support function.
> > > 
> > > ---
> > ......
> > > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > > index 63cf89393c6e..c1048893f4b6 100644
> > > --- a/kernel/crash_core.c
> > > +++ b/kernel/crash_core.c
> > > @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
> > >   	crash_hotplug_lock();
> > >   	/* Obtain lock while reading crash information */
> > >   	if (!kexec_trylock()) {
> > > -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> > > +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
> > Wondering why this need be updated.
> 
> In some architectures, additional kexec segments become obsolete during a
> hotplug event,
> so simply calling out the `elfcorehdr may be inaccurate` may not be
> sufficient.
> Therefore, it has been generalized with the kdump image.

OK, I forgot the case in ppc, makes sense to me, thx.

Acked-by: Baoquan He <bhe@redhat.com>


