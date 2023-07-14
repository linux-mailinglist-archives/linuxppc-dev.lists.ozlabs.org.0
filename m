Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8FE754592
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 02:05:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ukDx1eRh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2pWs74b6z3cBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 10:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ukDx1eRh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2MvF0f3qz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 17:05:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA2B261BD1;
	Fri, 14 Jul 2023 07:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72352C433C8;
	Fri, 14 Jul 2023 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689318339;
	bh=jyWvUrZcUvjNBBSZOzXCNGPPxcxV/q9OYHwe4H3B3Lw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ukDx1eRh8ZivXqHNYBn5Q0ezu7jPxA8DBkgLn6Yr4ieEasOnILafdrjyXNGEm446B
	 vdoY8r4oSZIdNajc3UECepRL8sXl8WF1aY3nsBTYeT1jETstZ0f8AhW7bTRQc/52Qq
	 P+stCjuut9rZUb/FtZq2RC8GkYNcmH18gWUjcC/YVZwiCNSkJoOeVjb4/L8KcmM6xP
	 IeKh3hfbNuWYqjO1NcV70XYwdDRmrE9otI0QO8uXvZ2x+z2rjsCQR5r+pIi8kHOFqH
	 yUig3DyDnWCSEK1kxr9YLeu9ZSrBGXd6ZPFhVoSKNhVLjgUv6X+4bGRfk/gzLXxZ3w
	 K4WbhoY8kPy2A==
Date: Fri, 14 Jul 2023 09:05:21 +0200
From: Christian Brauner <brauner@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630155936.3015595-1-jaz@semihalf.com>
X-Mailman-Approved-At: Sat, 15 Jul 2023 10:04:45 +1000
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>, Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>, jaz@semihalf.com, linux-rdma@vger.kernel.org, x86@kernel.org, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Moritz Fischer <mdf@kernel.org>, Frederic Barrat <fbarrat
 @linux.ibm.com>, Xu Yilun <yilun.xu@intel.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Harald Freudenberger <freude@linux.ibm.com>, kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, netdev@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org, Peter Ob
 erparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org, Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 13, 2023 at 11:10:54AM -0600, Alex Williamson wrote:
> On Thu, 13 Jul 2023 12:05:36 +0200
> Christian Brauner <brauner@kernel.org> wrote:
> 
> > Hey everyone,
> > 
> > This simplifies the eventfd_signal() and eventfd_signal_mask() helpers
> > by removing the count argument which is effectively unused.
> 
> We have a patch under review which does in fact make use of the
> signaling value:
> 
> https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.com/

Huh, thanks for the link.

Quoting from
https://patchwork.kernel.org/project/kvm/patch/20230307220553.631069-1-jaz@semihalf.com/#25266856

> Reading an eventfd returns an 8-byte value, we generally only use it
> as a counter, but it's been discussed previously and IIRC, it's possible
> to use that value as a notification value.

So the goal is to pipe a specific value through eventfd? But it is
explicitly a counter. The whole thing is written around a counter and
each write and signal adds to the counter.

The consequences are pretty well described in the cover letter of
v6 https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.com/

> Since the eventfd counter is used as ACPI notification value
> placeholder, the eventfd signaling needs to be serialized in order to
> not end up with notification values being coalesced. Therefore ACPI
> notification values are buffered and signalized one by one, when the
> previous notification value has been consumed.

But isn't this a good indication that you really don't want an eventfd
but something that's explicitly designed to associate specific data with
a notification? Using eventfd in that manner requires serialization,
buffering, and enforces ordering.

I have no skin in the game aside from having to drop this conversion
which I'm fine to do if there are actually users for this btu really,
that looks a lot like abusing an api that really wasn't designed for
this.
