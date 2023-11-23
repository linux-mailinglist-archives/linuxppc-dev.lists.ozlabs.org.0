Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D87F68F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 23:24:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r42g7gVE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbt2b5nWkz3dKq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 09:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r42g7gVE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbdx000p6z3dBy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 00:18:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11DDCCE2912;
	Thu, 23 Nov 2023 13:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFAAC433C9;
	Thu, 23 Nov 2023 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700745532;
	bh=BJOuctG/jOXVT0hO6qxyVXBeYyH4TG/ylT0dyLa92yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r42g7gVEtjBJ5WfLPAfCypJTdeIZa9tza+98XErRLkZuJq42IHSNqt9TjDoS1u/dO
	 mqRTO6hyOgRcqG5Vqi98sspSbfx6Ne64w0KZSaAUUdSmCRm0SeW9B8r2AffO7bhDq0
	 voQrIzDl2Rys7kYNdpWCPkldE19sNixdWiKMUoa9j34EYG62L/DgZtbbaspmEPmu14
	 PuPzBMdYXfPSBprGxxIV2rleVHq+xRFaQ7/X8REU4C8BYG2H4sP4+OADV7Tg2Ri8NY
	 w8CXZUWWNJUaMlJH5PPc15vZ4ox/kvWZIeet2zBszz9qi15zBW/WlVu+mFthIg8ovM
	 qoF7yc2VytIMg==
Date: Thu, 23 Nov 2023 14:18:33 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 2/4] eventfd: simplify eventfd_signal()
Message-ID: <20231123-portwein-geeignet-787b940c7d2d@brauner>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
 <877cm9n7dh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877cm9n7dh.fsf@intel.com>
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
 epe.ca>, Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, Zhenyu Wang <zhenyuw@linux.intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@l
 inux.intel.com>, Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>, Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, Moritz Fischer <mdf@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >   * eventfd_signal - Adds @n to the eventfd counter.
> 
> This still refers to @n here, and in patch 4.

Fixed and folded. Thanks!
