Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E326AD2FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 00:47:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVwGp6tnXz3cgq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 10:47:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBlUwcsr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBlUwcsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBlUwcsr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBlUwcsr;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVwFq6PhCz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 10:46:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678146379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJJ/SPwRxfJctF2aTdUZ7XudcJ8pB5qw99SDvRIMbf8=;
	b=hBlUwcsr7JCxr3Kn+mk20rdURVm/kzIkvRDPXMfHjWZMUnw/ywe0ZreKUP7g0BfAZZSOHF
	r8SNE4ReWM/4f0H1098VrFUGkbldAT4okvCo5pMHdAGqaKdG69upe1fVNMbnrI7BbFeYTi
	NNuaS0S3icV7k7Cxjrrh9F/2jC68RFM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678146379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJJ/SPwRxfJctF2aTdUZ7XudcJ8pB5qw99SDvRIMbf8=;
	b=hBlUwcsr7JCxr3Kn+mk20rdURVm/kzIkvRDPXMfHjWZMUnw/ywe0ZreKUP7g0BfAZZSOHF
	r8SNE4ReWM/4f0H1098VrFUGkbldAT4okvCo5pMHdAGqaKdG69upe1fVNMbnrI7BbFeYTi
	NNuaS0S3icV7k7Cxjrrh9F/2jC68RFM=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-ZLNK0dsENsCmyn01_HFyZQ-1; Mon, 06 Mar 2023 18:46:10 -0500
X-MC-Unique: ZLNK0dsENsCmyn01_HFyZQ-1
Received: by mail-io1-f69.google.com with SMTP id 9-20020a5ea509000000b0074ca36737d2so6081644iog.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 15:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678146369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJJ/SPwRxfJctF2aTdUZ7XudcJ8pB5qw99SDvRIMbf8=;
        b=Y0zLsD7V/HYbZWC2kK1hFNuDxbWTl8z4p7Z0CbYUq4vWaLJzch7xHsIYkue8B4LqbE
         CnibY16QZkd0VzxnvvJ9L4Wn3Caa3vYKkxBM4kRaKwV+lVfQuhYu8IOWjwID9KXYilmN
         TayPkcHzmzybyhMiferusv51xC2E9odsP4DnHIL+I2tVJ4dX/9/EE04+OmF6AXdsv3nz
         m2x/v8vUXEAEIna9CexpcKwtQcTIMWQMuxawZk7k5HR2odhtsZOCgf0DuyI8VNIJtNbz
         N87v7QkkQeCUA7uA8iO+0NxcT83OZIZz9eAMMN0U44BJbCOCb0EWJp5o9pQovEpXhIfo
         /qwg==
X-Gm-Message-State: AO0yUKV7o+P2epcykscm3deX+UIoTemotdtr+aP5fyuUXW1cNkye3AkQ
	ipXi/Tx6OWV/saVY7Y6rAZVuC5TnhgR2oU24cfmyjIHpsTi+J5dZIc8L9HwD2gs/97pmW5CLdTw
	HMr/Ztj/UViRWdXOZiolRhd6cwA==
X-Received: by 2002:a05:6e02:1d05:b0:317:97ab:e5d1 with SMTP id i5-20020a056e021d0500b0031797abe5d1mr11906021ila.12.1678146369676;
        Mon, 06 Mar 2023 15:46:09 -0800 (PST)
X-Google-Smtp-Source: AK7set94N5VJMPCYD2NcAdIOMsENYGwUy/huUKdq/gUq6blF75kCFaPgAlIPt5CkJ0wV+aRjWL2gbA==
X-Received: by 2002:a05:6e02:1d05:b0:317:97ab:e5d1 with SMTP id i5-20020a056e021d0500b0031797abe5d1mr11906013ila.12.1678146369475;
        Mon, 06 Mar 2023 15:46:09 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id k20-20020a5d91d4000000b0074c80aa17f0sm3700936ior.0.2023.03.06.15.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 15:46:09 -0800 (PST)
Date: Mon, 6 Mar 2023 16:46:07 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
Message-ID: <20230306164607.1455ee81.alex.williamson@redhat.com>
In-Reply-To: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Mar 2023 11:29:53 -0600 (CST)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> This patch series reenables VFIO support on POWER systems.  It
> is based on Alexey Kardashevskiys's patch series, rebased and
> successfully tested under QEMU with a Marvell PCIe SATA controller
> on a POWER9 Blackbird host.
> 
> Alexey Kardashevskiy (3):
>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>   powerpc/pci_64: Init pcibios subsys a bit later
>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>     domains
> 
> Timothy Pearson (1):
>   Add myself to MAINTAINERS for Power VFIO support
> 
>  MAINTAINERS                               |   5 +
>  arch/powerpc/include/asm/iommu.h          |   6 +-
>  arch/powerpc/include/asm/pci-bridge.h     |   7 +
>  arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
>  arch/powerpc/kernel/pci_64.c              |   2 +-
>  arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
>  arch/powerpc/platforms/pseries/iommu.c    |  27 +++
>  arch/powerpc/platforms/pseries/pseries.h  |   4 +
>  arch/powerpc/platforms/pseries/setup.c    |   3 +
>  drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
>  10 files changed, 338 insertions(+), 94 deletions(-)
> 

For vfio and MAINTAINERS portions,

Acked-by: Alex Williamson <alex.williamson@redhat.com>

I'll note though that spapr_tce_take_ownership() looks like it copied a
bug from the old tce_iommu_take_ownership() where tbl and tbl->it_map
are tested before calling iommu_take_ownership() but not in the unwind
loop, ie. tables we might have skipped on setup are unconditionally
released on unwind.  Thanks,

Alex

