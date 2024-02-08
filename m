Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9484EBE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 23:49:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cNzZe7oH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWBxX28gbz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cNzZe7oH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVrc65DQJz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 20:03:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73DF261BCD;
	Thu,  8 Feb 2024 09:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CE2C433F1;
	Thu,  8 Feb 2024 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707382979;
	bh=zLpZpsLNQEvYaAF+kQ5AZa9kkVgTiY2crC+gZ8/1q9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNzZe7oHDWzkcGidOFjY7sae2sK44ms00jR2FldQtLWYcHwcmhLyax8ehHm34HRer
	 q6B3t8PBMtIqP3pNJqvS0gtvmcRnmWZrr1LP1/XPUyNCMf7RtX+Z9hdXBG3sSIXmnn
	 x1A2BoRVGgnFdpKYJ43/YFruNjt8N23sRWaBuedIOMvnDjKLJmgh/mQhKgVZgpCZvv
	 EZvnM+1KVgnHS/xnNJEtLUJ20dfUR6d7k+cgOgMXG8QsjdqDetkvP2HkyJ5DRjYRLi
	 YYR5+Ma3bCv7vrHGN2uoGsssmGVFbEIlfVBzDo3gzeOXxk38X6ho+mf3gSVwF37UGF
	 wCuzWKK4T+TEQ==
Date: Thu, 8 Feb 2024 10:02:39 +0100
From: Christian Brauner <brauner@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] eventfd: simplify eventfd_signal()
Message-ID: <20240208-stemmen-wohlauf-ed1b4571e9a8@brauner>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
 <CABgObfaSVv=TFmwh+bxjaw3fpWAnemnf1Z5Us5kJtNN=oeGrag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfaSVv=TFmwh+bxjaw3fpWAnemnf1Z5Us5kJtNN=oeGrag@mail.gmail.com>
X-Mailman-Approved-At: Fri, 09 Feb 2024 09:47:57 +1100
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, netdev@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Christoph Hellwig <hch@lst.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>, Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>, x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@r
 edhat.com>, intel-gfx@lists.freedesktop.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, Zhenyu Wang <zhenyuw@linux.intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ur
 sulin@linux.intel.com>, Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>, Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 07, 2024 at 03:34:59PM +0100, Paolo Bonzini wrote:
> On Wed, Nov 22, 2023 at 1:49 PM Christian Brauner <brauner@kernel.org> wrote:
> >
> > Ever since the evenfd type was introduced back in 2007 in commit
> > e1ad7468c77d ("signal/timer/event: eventfd core") the eventfd_signal()
> > function only ever passed 1 as a value for @n. There's no point in
> > keeping that additional argument.
> >
> > Signed-off-by: Christian Brauner <brauner@kernel.org>
> > ---
> >  arch/x86/kvm/hyperv.c                     |  2 +-
> >  arch/x86/kvm/xen.c                        |  2 +-
> >  virt/kvm/eventfd.c                        |  4 ++--
> >  30 files changed, 60 insertions(+), 63 deletions(-)
> 
> For KVM:
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

I really appreciate all of the ACKs but just fyi that this was merged
for v6.8-rc1. Just so that there's no confusion!
