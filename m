Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9197A7531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 10:02:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Enq7Xo4H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Enq7Xo4H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr9xF3zl5z3cRX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 18:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Enq7Xo4H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Enq7Xo4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr9wL5R4lz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 18:01:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695196892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rnpCpoK1Qphye/H0at9y+THlkxPvcEo2r5PdFTxqnHY=;
	b=Enq7Xo4HhGpe5iVtcLwhqsfbQk3hy57xfNCR1cLI769wtXvHjvXqjEcuvxbYX8od9bnrtL
	vB8AKfb3sXVs7vc+/KwRykI+5CIyNVDuAndi3TKf5Le7scpLAvjntZ1MHxLM8jILKwVm0B
	jHApu7Eoyz6puxVomRfdh/CvjA5WGO8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695196892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rnpCpoK1Qphye/H0at9y+THlkxPvcEo2r5PdFTxqnHY=;
	b=Enq7Xo4HhGpe5iVtcLwhqsfbQk3hy57xfNCR1cLI769wtXvHjvXqjEcuvxbYX8od9bnrtL
	vB8AKfb3sXVs7vc+/KwRykI+5CIyNVDuAndi3TKf5Le7scpLAvjntZ1MHxLM8jILKwVm0B
	jHApu7Eoyz6puxVomRfdh/CvjA5WGO8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-DYtYybmZPvGMuPx6Cjw-rQ-1; Wed, 20 Sep 2023 04:01:30 -0400
X-MC-Unique: DYtYybmZPvGMuPx6Cjw-rQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-32001e60fb3so231192f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 01:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196889; x=1695801689;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnpCpoK1Qphye/H0at9y+THlkxPvcEo2r5PdFTxqnHY=;
        b=jVg6JGq8g7/L9aeKKJnKYDJC1UCJTiIyPOaSkd3/Q9F2X3MeY74x0m+clWSP7r8bbe
         jmH4ZABjQ0ToacLsNjJFFsnm80yLft3wwfOgImbrVzLnHhuZooqzp4kivkc/qhAWraB1
         HEOPfNqlmSfG+tALn9ofh+s909H5Dd8/xpWxgipFezSem782NOQEvJ7hX7yVAhG023QL
         mB4XYkKZQky5nU+B93d/IzNwxK9BlLNEtpxk4v1o8OE6l2yjrFryDQ+rqZLvY/a6Z/GM
         bqlRmFwkTKJIuBHmrFzsJ2fgLT9SHDEgMlLRzQMb66HClhAcu6aRWAfXI0BbRg5flKMF
         KzMg==
X-Gm-Message-State: AOJu0YxJAvurIuL9uqhy5WQOqKPQLkik+AZm/IkF4x16lWlSWbxlDhJj
	KISS4GK9xcdKYS8Bm4B6J4G36HFYjPPs87zOQrJRTzDhidnr02e45FehkXuosM68A1tMCSp+soB
	/w7Ig+SnWAtXvdqdAsVKGVHRzCg==
X-Received: by 2002:a5d:4691:0:b0:317:6579:2b9f with SMTP id u17-20020a5d4691000000b0031765792b9fmr1441925wrq.30.1695196888974;
        Wed, 20 Sep 2023 01:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjMaHCrb95S6OjzxI7LM9YzqMZD+FHo9V0ilc7E6hmphf8oly7XaHzjchfvY6rdHHetD1Jw==
X-Received: by 2002:a5d:4691:0:b0:317:6579:2b9f with SMTP id u17-20020a5d4691000000b0031765792b9fmr1441876wrq.30.1695196888277;
        Wed, 20 Sep 2023 01:01:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b0031c5e9c2ed7sm17627845wrr.92.2023.09.20.01.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:01:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
 deller@gmx.de
Subject: Re: [PATCH v4 1/5] fbdev: Avoid file argument in fb_pgprotect()
In-Reply-To: <20230912135050.17155-2-tzimmermann@suse.de>
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-2-tzimmermann@suse.de>
Date: Wed, 20 Sep 2023 10:01:27 +0200
Message-ID: <87il85l1d4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Only PowerPC's fb_pgprotect() needs the file argument, although
> the implementation does not use it. Pass NULL to the internal

Can you please mention the function that's the implementation for
PowerPC ? If I'm looking at the code correctly, that function is
phys_mem_access_prot() defined in the arch/powerpc/mm/mem.c file:

pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
			      unsigned long size, pgprot_t vma_prot)
{
	if (ppc_md.phys_mem_access_prot)
		return ppc_md.phys_mem_access_prot(file, pfn, size, vma_prot);

	if (!page_is_ram(pfn))
		vma_prot = pgprot_noncached(vma_prot);

	return vma_prot;
}

and if set, ppc_md.phys_mem_access_prot is pci_phys_mem_access_prot()
that is defined in the arch/powerpc/kernel/pci-common.c source file:

https://elixir.bootlin.com/linux/v6.6-rc2/source/arch/powerpc/kernel/pci-common.c#L524

That function indeed doesn't use the file argument. So your patch looks
correct to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

