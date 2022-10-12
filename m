Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F545FCE28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 00:09:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mnmz33Y9Rz3ds0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 09:09:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSpoTMY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSpoTMY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSpoTMY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=haSpoTMY;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mnmy4355Bz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 09:08:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665612519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1Csc5OKDLMm08qWQhJj0nFioDDfbxhqyYmrCk7iHHE=;
	b=haSpoTMYY896Twk1ShX0OHjKQ6KGljkslMnyxbPLBbOEEVNxhhj8PRE+2tUluv0NBjd+pl
	r0BwgfaZfjd/R653AvNH9zLEMK4mnkwhiaDXG953snG1qx5932sF9Q3Ezrx7xv/Qt2wxoM
	UIISZNxXZUyo/sZ5AlLWQdQQZzKXKwM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665612519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1Csc5OKDLMm08qWQhJj0nFioDDfbxhqyYmrCk7iHHE=;
	b=haSpoTMYY896Twk1ShX0OHjKQ6KGljkslMnyxbPLBbOEEVNxhhj8PRE+2tUluv0NBjd+pl
	r0BwgfaZfjd/R653AvNH9zLEMK4mnkwhiaDXG953snG1qx5932sF9Q3Ezrx7xv/Qt2wxoM
	UIISZNxXZUyo/sZ5AlLWQdQQZzKXKwM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-wmA8nb_JNJS8342jTHxRnQ-1; Wed, 12 Oct 2022 18:08:33 -0400
X-MC-Unique: wmA8nb_JNJS8342jTHxRnQ-1
Received: by mail-wm1-f70.google.com with SMTP id 133-20020a1c028b000000b003c5e6b44ebaso1776526wmc.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 15:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1Csc5OKDLMm08qWQhJj0nFioDDfbxhqyYmrCk7iHHE=;
        b=NHop5cD7daeVu2ZB2xrXBGyjnejQV3Wbn2SxxO/q+51R1wuv/ehQUebfl3dd0Eydvh
         m3p/rds+wEYt1Cceqhkha99RFfhnXD5T3tMeLAqXkiaYfvw2mMexWIdgFaxHKHj2yVjo
         XZ23HIj3LWZ7qwpnMUNGSwyXA1wnJF1AqSl5v88vgFWBeQ5+RJnU3i5PztYRjwHpc9/Z
         OmqgbYfntcTYl4qgfyy43u0C7eAKGd3Tc2J45174Jm631Cu8AruOUxJx4mgEUbKW09NT
         IAjJTeAW2iMsfOTt61aTBTQHd8MUdUhRYq31pE+EEArytW4zm3Ezieq5hgb3KFG5cx2q
         V2GA==
X-Gm-Message-State: ACrzQf2SLFo3KqJjHKXxKDvxvV3C14EDfJNFqxFZcd9sP9bNCCP3ZU4j
	Fh801BznnTRkYN+o2yJUdSNH7Oxn4y7zBNMTpFmGrnx8oF/PMEB08yt7IvAdbZPx0ibFBSHBHZ2
	T+/px9sq49WdYTzmRkl0nAquGfQ==
X-Received: by 2002:adf:d1cc:0:b0:22e:6371:65ad with SMTP id b12-20020adfd1cc000000b0022e637165admr19590809wrd.326.1665612512761;
        Wed, 12 Oct 2022 15:08:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Hfapj638ZSQQKBud2DiNS0QJza/l7oyJMq2zEMTl7MZoMYSzTy3MWiISMgB3bUUa2AIbrEw==
X-Received: by 2002:adf:d1cc:0:b0:22e:6371:65ad with SMTP id b12-20020adfd1cc000000b0022e637165admr19590785wrd.326.1665612512531;
        Wed, 12 Oct 2022 15:08:32 -0700 (PDT)
Received: from redhat.com ([2.54.162.123])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c348100b003a5f4fccd4asm2812081wmq.35.2022.10.12.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 15:08:31 -0700 (PDT)
Date: Wed, 12 Oct 2022 18:08:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] virtio: fixes, features
Message-ID: <20221012180806-mutt-send-email-mst@kernel.org>
References: <20221010132030-mutt-send-email-mst@kernel.org>
 <87r0zdmujf.fsf@mpe.ellerman.id.au>
 <20221012070532-mutt-send-email-mst@kernel.org>
 <87mta1marq.fsf@mpe.ellerman.id.au>
 <87edvdm7qg.fsf@mpe.ellerman.id.au>
 <20221012115023-mutt-send-email-mst@kernel.org>
 <CAHk-=wg2Pkb9kbfbstbB91AJA2SF6cySbsgHG-iQMq56j3VTcA@mail.gmail.com>
 <38893b2e-c7a1-4ad2-b691-7fbcbbeb310f@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <38893b2e-c7a1-4ad2-b691-7fbcbbeb310f@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, alvaro.karsz@solid-run.com, linux-pci@vger.kernel.org, Jason Wang <jasowang@redhat.com>, linuxppc-dev@lists.ozlabs.org, wangdeming@inspur.com, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Netdev <netdev@vger.kernel.org>, angus.chen@jaguarmicro.com, Bjorn Helgaas <bhelgaas@google.com>, lingshan.zhu@intel.com, Linus Torvalds <torvalds@linux-foundation.org>, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 11:06:54PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 12, 2022, at 7:22 PM, Linus Torvalds wrote:
> >
> > The NO_IRQ thing is mainly actually defined by a few drivers that just
> > never got converted to the proper world order, and even then you can
> > see the confusion (ie some drivers use "-1", others use "0", and yet
> > others use "((unsigned int)(-1)".
> 
> The last time I looked at removing it for arch/arm/, one problem was
> that there were a number of platforms using IRQ 0 as a valid number.
> We have converted most of them in the meantime, leaving now only
> mach-rpc and mach-footbridge. For the other platforms, we just
> renumbered all interrupts to add one, but footbridge apparently
> relies on hardcoded ISA interrupts in device drivers. For rpc,
> it looks like IRQ 0 (printer) already wouldn't work, and it
> looks like there was never a driver referencing it either.


Do these two boxes even have pci?

> I see that openrisc and parisc also still define NO_IRQ to -1, but at
> least openrisc already relies on 0 being the invalid IRQ (from
> CONFIG_IRQ_DOMAIN), probably parisc as well.
> 
>      Arnd

