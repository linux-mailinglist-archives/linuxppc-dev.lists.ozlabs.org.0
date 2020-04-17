Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E159E1AD639
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 08:37:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493RGk52bJzDrWY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 16:37:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GuZQJ9DY; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KXAwtxRl; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493RDw0q4tzDrSF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 16:35:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587105230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Az8P2bwretjjpRZGSp2x6u/s4RX3Di96tR2g9SEE7FE=;
 b=GuZQJ9DYR89BTKWH+UKqmQxdt7pbaWhGG5qpD2xiQlxAijHjqbdMv31f1AMvAF0n55UndS
 Hde8rsBmY4w8EoOCioayfsQKZoVQgEvo9GEhiQ7vMZzIY6wO3Wq8MEbYawHWOTYscOtH54
 M/fAOnYo7oRQCm+ywmAUYx69hW6Oork=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587105357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Az8P2bwretjjpRZGSp2x6u/s4RX3Di96tR2g9SEE7FE=;
 b=KXAwtxRl0V+XqP784yJcnsnCMfDfEolzXnXVTAQ/MWusdvTJsWCxlsStKH5zqAMmyrVU74
 AkWkHi9EzUqTdKrrjfeCJhT9OfKBvl9lQyIzgpiwNn/a4aKUjfCHEfBWLiRA99/zcFwaRP
 bheLuQ29u6vCsLdXqd5zr7NMxXHLEM0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-i9pPeHdNNMeoHjBqsBFoBQ-1; Fri, 17 Apr 2020 02:33:48 -0400
X-MC-Unique: i9pPeHdNNMeoHjBqsBFoBQ-1
Received: by mail-wr1-f70.google.com with SMTP id h14so510685wrr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 23:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aRp3vqzXNggkBlbb5TjXuZYOr8GevPVbWARU6hChYxw=;
 b=ia/8vIRmtqOUG8t61/+a10yv17B+rYfQU2fUOkECyUDZ7YsRUJWMteGWtPqTIbA+Px
 IfV5c8IXvk+MCOO8+CgySZRMftdTiTMwHfjTyDDe/ahWL6+kVqHE0IcMeSVvNMDtpe0b
 GCbGSnimY/GPcOScnB1F+vpeCJ3NwRtoxo0rtWS4YcL74LoZOgF+UjNRnOOdxE03ust2
 Akn+23ezMvBnRDSsRIi7sIBcwYU45NqHuf7MC+p3t9VYp8rZrHh6+5hQJd0qNDUM339E
 VO49ApVPvBKVWaelC8rRHi6/zXRiAJbT/207p7aRGgUCrZweuAbnF+S7B+fa6qiR95ON
 BSRQ==
X-Gm-Message-State: AGi0PuZ+vWM8JmLe0uIV9FEcyHvNrCn4UIjqkig1zGgh9PH7SOO6dUzc
 je0PEowN4xkbPiPElLHrK8wiuv3F5+nj3bK9vDm5V9+h/8jXTrqJbNhy3HYoCk6VR2huZxzmgYa
 IzqJVksp1TraGc5biqZftdOQ+rA==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr1725633wmb.34.1587105227187;
 Thu, 16 Apr 2020 23:33:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypLC+56jzTsL7mtJ8WJVomZZD1bGAAbZ16bTvi8qD3oQHVUMVTlOszcQ+jGs26hCvKjQJ7zNyQ==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr1725618wmb.34.1587105226999;
 Thu, 16 Apr 2020 23:33:46 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id k184sm6461323wmf.9.2020.04.16.23.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 23:33:46 -0700 (PDT)
Date: Fri, 17 Apr 2020 02:33:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417022929-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de, gor@linux.ibm.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
>=20
> On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wrote:
> > On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
> > > We try to keep the defconfig untouched after decoupling CONFIG_VHOST
> > > out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> > > ("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU by
> > > default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
> > > without the caring of CONFIG_VHOST.
> > >=20
> > > But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfigs and e=
ven
> > > for the ones that doesn't want vhost. So it actually shifts the
> > > burdens to the maintainers of all other to add "CONFIG_VHOST_MENU is
> > > not set". So this patch tries to enable CONFIG_VHOST explicitly in
> > > defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.
> > >=20
> > > Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>  (s390)
> > > Acked-by: Michael Ellerman<mpe@ellerman.id.au>  (powerpc)
> > > Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > > Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> > > Cc: Paul Mackerras<paulus@samba.org>
> > > Cc: Michael Ellerman<mpe@ellerman.id.au>
> > > Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> > > Cc: Vasily Gorbik<gor@linux.ibm.com>
> > > Cc: Christian Borntraeger<borntraeger@de.ibm.com>
> > > Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> > > Signed-off-by: Jason Wang<jasowang@redhat.com>
> > I rebased this on top of OABI fix since that
> > seems more orgent to fix.
> > Pushed to my vhost branch pls take a look and
> > if possible test.
> > Thanks!
>=20
>=20
> I test this patch by generating the defconfigs that wants vhost_net or
> vhost_vsock. All looks fine.
>=20
> But having CONFIG_VHOST_DPN=3Dy may end up with the similar situation tha=
t
> this patch want to address.
> Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then add another
> menuconfig for VHOST_RING and do something similar?
>=20
> Thanks

Sorry I don't understand. After this patch CONFIG_VHOST_DPN is just
an internal variable for the OABI fix. I kept it separate
so it's easy to revert for 5.8. Yes we could squash it into
VHOST directly but I don't see how that changes logic at all.

--=20
MST

