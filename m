Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C27F68F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 23:23:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nSfg5H2P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbt1h33mdz3vXg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 09:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nSfg5H2P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbdnT4HCMz3dSM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 00:12:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EF5AECE28FE;
	Thu, 23 Nov 2023 13:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B246C433C7;
	Thu, 23 Nov 2023 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700745135;
	bh=VBAn7FZcvw1drif9KzTmaabLPVAYO4zX2eeQPqBTwFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSfg5H2PW95uhmCyWswaCk18HBzNnUr8lrZC9/jswVOaVEk9Necoc/3PSsg/eWI+c
	 nUSNVQiBVNuTkdJG4ZroseK0fKTuKodiCnTfp5VBFncFM3thhaeXbqdq7/1OyUlFkh
	 hvhoTdxdxKP2qiIgsXRrtgQ8aW/glFRtrG5pk0o8niH7Far3mtrppzle/A5KWCQFN1
	 0J9D7XnhqZQWKtQ8+7lAsz1DeizPazr+k6Se4xCbJkyOxPi+pXbCyvcnpPCySfoTu/
	 nxY4zeQuXLH9O0FYHNYyhAuFpYV+0VZCYLV3awl8R2o5zjol3Qy1blkTCXoR/k3lKT
	 V10Lsp2N5sNOQ==
Date: Thu, 23 Nov 2023 14:11:56 +0100
From: Christian Brauner <brauner@kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v2 1/4] i915: make inject_virtual_interrupt() void
Message-ID: <20231123-randlage-instinkt-e458628d2d7c@brauner>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-1-bd549b14ce0c@kernel.org>
 <ZV6buHrQy2+CJ7xX@debian-scheme>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZV6buHrQy2+CJ7xX@debian-scheme>
X-Mailman-Approved-At: Fri, 24 Nov 2023 09:22:20 +1100
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, netdev@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Christoph Hellwig <hch@lst.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>, Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>, x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@zi
 epe.ca>, Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, Jani Nikula <jani.nikula@linux.intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursul
 in@linux.intel.com>, Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>, Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, Moritz Fischer <mdf@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > +	if (!vgpu->msi_trigger)
> > +		return;
> > +	eventfd_signal(vgpu->msi_trigger, 1);
> >  }
> 
> I think it's a little simpler to write as
>     if (vgpu->msi_trigger)
>             eventfd_signal(vgpu->msi_trigger, 1);

Good point. I folded that suggestion into the patch.
