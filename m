Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E56AD3AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:03:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxyq3WDwz3fT6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 12:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfwFZEzt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfwFZEzt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfwFZEzt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfwFZEzt;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxtY3q4pz3fR0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:59:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678150785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1butyJsvNx4YJ9aTrzHZe+e8dMXHZLy0RXs3Qcm93D8=;
	b=KfwFZEzt8pZoPVjqpNfh680j3ZCkvsZKgDCFvRu20JYFIxHPXERZ8LqnBJlv0qHC/Y8aZZ
	S1HxhPHcqjyew/3kRHRumUr2GrugrYhOScMFtqwRutTA5e2QyUqNh7gGDruf0FTVPjq+Io
	fxrCqeYQ1PgUV8MP4X9zlp/an8Qiv64=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678150785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1butyJsvNx4YJ9aTrzHZe+e8dMXHZLy0RXs3Qcm93D8=;
	b=KfwFZEzt8pZoPVjqpNfh680j3ZCkvsZKgDCFvRu20JYFIxHPXERZ8LqnBJlv0qHC/Y8aZZ
	S1HxhPHcqjyew/3kRHRumUr2GrugrYhOScMFtqwRutTA5e2QyUqNh7gGDruf0FTVPjq+Io
	fxrCqeYQ1PgUV8MP4X9zlp/an8Qiv64=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-Dn5g1QiTN_mjk8blXs2xmQ-1; Mon, 06 Mar 2023 19:59:44 -0500
X-MC-Unique: Dn5g1QiTN_mjk8blXs2xmQ-1
Received: by mail-io1-f72.google.com with SMTP id d25-20020a0566022bf900b00745469852cfso6184202ioy.19
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 16:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678150783;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1butyJsvNx4YJ9aTrzHZe+e8dMXHZLy0RXs3Qcm93D8=;
        b=f/Lne97b98HJP/RJUcoihny9gx1yCtwa46PQ5MC6fsj5egFekSHlh3BdIF7sZBRJTd
         rIpkBRc8wt+izsF6Vj328+SqCCQXAUpn7Pgz4cjZTaSCUiGafJOdm4fz/5eczClzaCUg
         LtKl5jVvfE9j4iSr476w0U7X4FHx+0i76vDbYxIlXHFXlzEAaKVa2wEOTCKhyyUBNZBN
         ktKd8XDSX7JDOafuV1UBo4Cp52le4W4pA85htRANBHpzXpJ7DKY7bjVjmphgHJtqENn8
         7SiHy5XlYTbQiL6iCE4hL0nbjruMkdTqhoabIM5IwO5JaUOh0QwNgDiN1rZ+yALy8sK8
         Fp9A==
X-Gm-Message-State: AO0yUKW0k5vJQekgsvww8auWQuIfhpZy0lW6cqCWw+4DyBJaSdEqyj/Z
	HIh7whNBLFi2F92IAwRjEjrWzQoQ5bnqBn0Dyiy20eP4wxnR+uKFc4QXTIU6GaGibqYnwz9DazQ
	Vxfq4mfnbp0IJ/OSjjnK0N8LReg==
X-Received: by 2002:a05:6e02:1bab:b0:302:a58f:38ab with SMTP id n11-20020a056e021bab00b00302a58f38abmr9629298ili.0.1678150783457;
        Mon, 06 Mar 2023 16:59:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9E202+BpRrrc/VXxnbDo2DKaUh4BY1R7k7N5AcOmllutHuvV3fBkUhGWPtLN+RPuE41J41aA==
X-Received: by 2002:a05:6e02:1bab:b0:302:a58f:38ab with SMTP id n11-20020a056e021bab00b00302a58f38abmr9629289ili.0.1678150783220;
        Mon, 06 Mar 2023 16:59:43 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id q23-20020a02c8d7000000b003a60da2bf58sm3589389jao.39.2023.03.06.16.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 16:59:42 -0800 (PST)
Date: Mon, 6 Mar 2023 17:59:41 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
Message-ID: <20230306175941.1b69bb14.alex.williamson@redhat.com>
In-Reply-To: <1817332573.17073558.1678149322645.JavaMail.zimbra@raptorengineeringinc.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
	<20230306164607.1455ee81.alex.williamson@redhat.com>
	<1817332573.17073558.1678149322645.JavaMail.zimbra@raptorengineeringinc.com>
Organization: Red Hat
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Mar 2023 18:35:22 -0600 (CST)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> ----- Original Message -----
> > From: "Alex Williamson" <alex.williamson@redhat.com>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> > Sent: Monday, March 6, 2023 5:46:07 PM
> > Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems  
> 
> > On Mon, 6 Mar 2023 11:29:53 -0600 (CST)
> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
> >   
> >> This patch series reenables VFIO support on POWER systems.  It
> >> is based on Alexey Kardashevskiys's patch series, rebased and
> >> successfully tested under QEMU with a Marvell PCIe SATA controller
> >> on a POWER9 Blackbird host.
> >> 
> >> Alexey Kardashevskiy (3):
> >>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
> >>   powerpc/pci_64: Init pcibios subsys a bit later
> >>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
> >>     domains
> >> 
> >> Timothy Pearson (1):
> >>   Add myself to MAINTAINERS for Power VFIO support
> >> 
> >>  MAINTAINERS                               |   5 +
> >>  arch/powerpc/include/asm/iommu.h          |   6 +-
> >>  arch/powerpc/include/asm/pci-bridge.h     |   7 +
> >>  arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
> >>  arch/powerpc/kernel/pci_64.c              |   2 +-
> >>  arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
> >>  arch/powerpc/platforms/pseries/iommu.c    |  27 +++
> >>  arch/powerpc/platforms/pseries/pseries.h  |   4 +
> >>  arch/powerpc/platforms/pseries/setup.c    |   3 +
> >>  drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
> >>  10 files changed, 338 insertions(+), 94 deletions(-)
> >>   
> > 
> > For vfio and MAINTAINERS portions,
> > 
> > Acked-by: Alex Williamson <alex.williamson@redhat.com>
> > 
> > I'll note though that spapr_tce_take_ownership() looks like it copied a
> > bug from the old tce_iommu_take_ownership() where tbl and tbl->it_map
> > are tested before calling iommu_take_ownership() but not in the unwind
> > loop, ie. tables we might have skipped on setup are unconditionally
> > released on unwind.  Thanks,
> > 
> > Alex  
> 
> Thanks for that.  I'll put together a patch to get rid of that
> potential bug that can be applied after this series is merged, unless
> you'd rather I resubmit a v3 with the issue fixed?

Follow-up fix is fine by me.  Thanks,

Alex

