Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEFF1D44
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 19:14:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477ZSY2Md8zF5Qj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 05:14:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=mst@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="JSCa0DCE"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477ZHP19pLzF5MW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 05:06:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573063608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc0CfKFNSumdX6DJ613pFznuf2fCrMDQvvSKwwkRmvo=;
 b=JSCa0DCE4upjNYqfZl7x4n/mZqSjDMWXB3L2I2HuvcWv1qr1Y29Y1Xy3JXUJSkBgrOQFJr
 ZvnwtqZN85Q7BrMuUsjh4xFpi3KVtv5BR07oN/OscjgvJHjA8WOZwHQdwfze/eagOwM+bz
 U2iPjMAjr4oZInqR2uJ6A3dawddbuX4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-dVcGWq4ZMmayMrLQZ277cQ-1; Wed, 06 Nov 2019 13:06:46 -0500
Received: by mail-qk1-f199.google.com with SMTP id m189so25591445qkc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 10:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NqfzdUNcXeLkdXp8DQ/xxrnz7TDp3lCj6CeS25u8znQ=;
 b=pwSNAg1ogAD1Y6UBvfemL3DVobYeNhQEXCGNVpoW9xGlPxTEv35zGQdrArKVWyXP8b
 hRveTQbMHQtw80v6hD5JoSAMyIpozUKOSWpNVsA8+FJs4yBhbqBzFiUL4xV+d5VM5NLq
 By1MD2nkJmKpNtEbbGnbR8OcPHpikXCJa9PPlH3BH4rf1YOjr+X52NmRlZHiJq7PoXNj
 LXrHKAmZxkrIh/aSjhoQYOszWYW3AUfip66IIj/2EbLmQ0FfrwrNhO/Y1s2l2PMjaAA+
 7M4V47vGjyKyDjq8B8ZvaWtCPyYUoNZq2APGy3npVjRxZ+e01Odp4r19njhFQUX1F2hs
 BTzA==
X-Gm-Message-State: APjAAAWzxTB+an+qPgnH5MmLdSjKoKVFYIUDMnQADVxyp1dmsk8OX8+W
 yI64YUse/vACH7DtoIoo34N4NUrLwO/KLvP+QGWFL4HHV9MjATLQhKsRoOEYgAdC3N8ZAOgKtHW
 sS8GTRhdHZ8980SSRMfrRpaFrqw==
X-Received: by 2002:aed:35f4:: with SMTP id d49mr3723080qte.20.1573063606282; 
 Wed, 06 Nov 2019 10:06:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOhMFoH+z07w8YBa359Wh6c2mb8FRixZPOonwYmlAbW0henI/EGic2ZkzRnEfuMVA+wm2czg==
X-Received: by 2002:aed:35f4:: with SMTP id d49mr3723053qte.20.1573063605969; 
 Wed, 06 Nov 2019 10:06:45 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id k3sm15336883qtf.68.2019.11.06.10.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 10:06:45 -0800 (PST)
Date: Wed, 6 Nov 2019 13:06:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC v1 0/2] Enable IOMMU support for pseries Secure VMs
Message-ID: <20191106130558-mutt-send-email-mst@kernel.org>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <265679db-9cb3-1660-0cf6-97f740b1b48b@ozlabs.ru>
MIME-Version: 1.0
In-Reply-To: <265679db-9cb3-1660-0cf6-97f740b1b48b@ozlabs.ru>
X-MC-Unique: dVcGWq4ZMmayMrLQZ277cQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: andmike@us.ibm.com, Ram Pai <linuxram@us.ibm.com>,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 06, 2019 at 12:59:50PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 05/11/2019 08:28, Ram Pai wrote:
> > This patch series enables IOMMU support for pseries Secure VMs.
> >=20
> >=20
> > Tested using QEMU command line option:
> >=20
> >  "-device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x4,
> >  =09iommu_platform=3Don,disable-modern=3Doff,disable-legacy=3Don"
> >  and=20
> >=20
> >  "-device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,
> >  =09addr=3D0x5,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,
> >  =09iommu_platform=3Don,disable-modern=3Doff,disable-legacy=3Don"
>=20
>=20
> Worth mentioning that SLOF won't boot with such devices as SLOF does not =
know about iommu_platform=3Don.

Shouldn't be hard to support: set up the iommu to allow everything
and ack the feature. Right?

> >=20
> > Ram Pai (2):
> >   powerpc/pseries/iommu: Share the per-cpu TCE page with the hypervisor=
.
> >   powerpc/pseries/iommu: Use dma_iommu_ops for Secure VMs aswell.
> >=20
> >  arch/powerpc/platforms/pseries/iommu.c | 30 ++++++++++++++++++--------=
----
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> >=20
>=20
> --=20
> Alexey

