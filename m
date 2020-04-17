Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5591AD951
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:00:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493VRX3mJGzDrdm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 19:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=V9lNYPYC; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=V9lNYPYC; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493VNb5dbNzDrdW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 18:57:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jc0iygL4g4seZkV+uNiJ+8o6O2vqQrNFluUjtz+4fWg=;
 b=V9lNYPYCZEaksbojUqhAYfjLYq2tVKidy5ZaQIBOEleLx8NbMsW0J4H7X1hXvxMKyY9hLE
 zmXhrAtFR/w8A/scW7F6jVAqLfvJBNmPaqIPd0XkhAtD9m4xKMr7TBwzgbEtH3VPE1JHEn
 AeGwBjNj8xg10jG52xGnYxDIGi2rHD4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jc0iygL4g4seZkV+uNiJ+8o6O2vqQrNFluUjtz+4fWg=;
 b=V9lNYPYCZEaksbojUqhAYfjLYq2tVKidy5ZaQIBOEleLx8NbMsW0J4H7X1hXvxMKyY9hLE
 zmXhrAtFR/w8A/scW7F6jVAqLfvJBNmPaqIPd0XkhAtD9m4xKMr7TBwzgbEtH3VPE1JHEn
 AeGwBjNj8xg10jG52xGnYxDIGi2rHD4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-9bYUxR4DMGqS0GEsQaHCfA-1; Fri, 17 Apr 2020 04:57:47 -0400
X-MC-Unique: 9bYUxR4DMGqS0GEsQaHCfA-1
Received: by mail-wr1-f70.google.com with SMTP id p16so660331wro.16
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 01:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=57oFuPD/q+SMkeSS1ok5ufPqZbzHPN868lU8tZLRaro=;
 b=dSRmTOsI9pDk3S7p7+TrVlqkheZ1uh3Nv3LZPn4My0zKMQE1dSlSxb6NfrZwngNnrm
 hgh/XuYiEw+RzLEGdr07K+m6svdYt8vWb7xQrl3JqIjhtclGZgzw3Ukq2T6akD+t41HU
 PHftHTKO963qgF1Ks5QndciqpJ3g1kxMR4r4eLIN7PI3/2FVuyAcKjYA9pn7G0h0G+BX
 C126mai3J1nK+Gxth4+Kq1aKuyqva7mA2XUQNB+gchXabBLKVCcgBYbkeTOysDS9LLHq
 Sj4UaKokcS3Bzyelh3tlVeF47b/4mDihGZ+YCqQEkqZdFldaSUvYdeh6/TLfF2bztZ8E
 ddqg==
X-Gm-Message-State: AGi0PubukgDZrjunOT2KOfPEN+SAl8SpILH0yh9kNNodXIxBqIzsEetU
 edX4R48naUh4J0smfk0D9QvKcELNeqL9jkA0oTnwuv6qU/wVnYavtMAR50NqZAZn/QyPathXcQz
 f56rDSmDgJeJz6wvX9Lhu1RG1Iw==
X-Received: by 2002:a05:600c:4096:: with SMTP id
 k22mr2101841wmh.99.1587113865720; 
 Fri, 17 Apr 2020 01:57:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzNTX8c8fQ/vBkdSzMi35lJDuNvId/TTHeWg1TQWoHgILbrk1iRbqaecBOrIQnqlWsFeqPPQ==
X-Received: by 2002:a05:600c:4096:: with SMTP id
 k22mr2101824wmh.99.1587113865518; 
 Fri, 17 Apr 2020 01:57:45 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id n6sm31931548wrs.81.2020.04.17.01.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:57:44 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:57:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417045454-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
MIME-Version: 1.0
In-Reply-To: <73843240-3040-655d-baa9-683341ed4786@redhat.com>
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

On Fri, Apr 17, 2020 at 04:51:19PM +0800, Jason Wang wrote:
>=20
> On 2020/4/17 =E4=B8=8B=E5=8D=884:46, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 04:39:49PM +0800, Jason Wang wrote:
> > > On 2020/4/17 =E4=B8=8B=E5=8D=884:29, Michael S. Tsirkin wrote:
> > > > On Fri, Apr 17, 2020 at 03:36:52PM +0800, Jason Wang wrote:
> > > > > On 2020/4/17 =E4=B8=8B=E5=8D=882:33, Michael S. Tsirkin wrote:
> > > > > > On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
> > > > > > > On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wrote=
:
> > > > > > > > On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
> > > > > > > > > We try to keep the defconfig untouched after decoupling C=
ONFIG_VHOST
> > > > > > > > > out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> > > > > > > > > ("vhost: refine vhost and vringh kconfig") by enabling VH=
OST_MENU by
> > > > > > > > > default. Then the defconfigs can keep enabling CONFIG_VHO=
ST_NET
> > > > > > > > > without the caring of CONFIG_VHOST.
> > > > > > > > >=20
> > > > > > > > > But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defc=
onfigs and even
> > > > > > > > > for the ones that doesn't want vhost. So it actually shif=
ts the
> > > > > > > > > burdens to the maintainers of all other to add "CONFIG_VH=
OST_MENU is
> > > > > > > > > not set". So this patch tries to enable CONFIG_VHOST expl=
icitly in
> > > > > > > > > defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST=
_VSOCK.
> > > > > > > > >=20
> > > > > > > > > Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>  =
 (s390)
> > > > > > > > > Acked-by: Michael Ellerman<mpe@ellerman.id.au>   (powerpc=
)
> > > > > > > > > Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > > > > > > > > Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> > > > > > > > > Cc: Paul Mackerras<paulus@samba.org>
> > > > > > > > > Cc: Michael Ellerman<mpe@ellerman.id.au>
> > > > > > > > > Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> > > > > > > > > Cc: Vasily Gorbik<gor@linux.ibm.com>
> > > > > > > > > Cc: Christian Borntraeger<borntraeger@de.ibm.com>
> > > > > > > > > Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> > > > > > > > > Signed-off-by: Jason Wang<jasowang@redhat.com>
> > > > > > > > I rebased this on top of OABI fix since that
> > > > > > > > seems more orgent to fix.
> > > > > > > > Pushed to my vhost branch pls take a look and
> > > > > > > > if possible test.
> > > > > > > > Thanks!
> > > > > > > I test this patch by generating the defconfigs that wants vho=
st_net or
> > > > > > > vhost_vsock. All looks fine.
> > > > > > >=20
> > > > > > > But having CONFIG_VHOST_DPN=3Dy may end up with the similar s=
ituation that
> > > > > > > this patch want to address.
> > > > > > > Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then a=
dd another
> > > > > > > menuconfig for VHOST_RING and do something similar?
> > > > > > >=20
> > > > > > > Thanks
> > > > > > Sorry I don't understand. After this patch CONFIG_VHOST_DPN is =
just
> > > > > > an internal variable for the OABI fix. I kept it separate
> > > > > > so it's easy to revert for 5.8. Yes we could squash it into
> > > > > > VHOST directly but I don't see how that changes logic at all.
> > > > > Sorry for being unclear.
> > > > >=20
> > > > > I meant since it was enabled by default, "CONFIG_VHOST_DPN=3Dy" w=
ill be left
> > > > > in the defconfigs.
> > > > But who cares?
> > > FYI, please seehttps://www.spinics.net/lists/kvm/msg212685.html
> > The complaint was not about the symbol IIUC.  It was that we caused
> > everyone to build vhost unless they manually disabled it.
>=20
>=20
> There could be some misunderstanding here. I thought it's somehow similar=
: a
> CONFIG_VHOST_MENU=3Dy will be left in the defconfigs even if CONFIG_VHOST=
 is
> not set.
>=20
> Thanks

Hmm. So looking at Documentation/kbuild/kconfig-language.rst :

        Things that merit "default y/m" include:

        a) A new Kconfig option for something that used to always be built
           should be "default y".


        b) A new gatekeeping Kconfig option that hides/shows other Kconfig
           options (but does not generate any code of its own), should be
           "default y" so people will see those other options.

        c) Sub-driver behavior or similar options for a driver that is
           "default n". This allows you to provide sane defaults.


So it looks like VHOST_MENU is actually matching rule b).
So what's the problem we are trying to solve with this patch, exactly?

Geert could you clarify pls?


>=20
> >=20

