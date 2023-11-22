Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647197F4D6D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 17:53:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KuF1RaQq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb6kn299cz3vs9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 03:53:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KuF1RaQq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=yilun.xu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb42f5vWwz3cVS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 01:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700664716; x=1732200716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Lp3IDM3ar4jYOzHbknAigUjAPfa74EA/HlhJuCNIfU=;
  b=KuF1RaQq0yhVAJ+1kaMXRzGkiceyETZNhr3f/XCgXuooR4eaf0MWGzOz
   THe84LiBHx3lkpo41lC6LYV0WIRZcgNqYaIoQDtQjYcafXEAf83hPQGQI
   ysCH13+MnzMtr5xPnROZOAFM5gqYwcK9AQ/wxzW1Wlr6AKvdchpb0lWYA
   Si0v2A/mIM6ym1euWLo+/pZK80wIuXzRp/GREZ7DEClQb+aouOcsUI7fB
   pmblIOb3aHRDBuzr589G6APclrVMpOnrV7NvmHg9xXoJhxQtmQvlcJA83
   TbK6hsGi++7RHABpzbGFnaF9lUiJJ923mAloHopQvWn8080Yh7OS3u8xU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10729210"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="10729210"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 06:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="14944713"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2023 06:51:20 -0800
Date: Wed, 22 Nov 2023 22:49:27 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 2/4] eventfd: simplify eventfd_signal()
Message-ID: <ZV4U96z12KSi4GGw@yilunxu-OptiPlex-7050>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
X-Mailman-Approved-At: Thu, 23 Nov 2023 03:46:57 +1100
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
Cc: linux-aio@kvack.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, netdev@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Christoph Hellwig <hch@lst.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Alex Williamson <alex.williamson@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>, x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@z
 iepe.ca>, Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Shakeel Butt <shakeelb@google.com>, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, Zhenyu Wang <zhenyuw@linux.intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Borislav Petkov <bp@alien8.de>, Jani Nikula <jani.nikula@linux.intel.com>, kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux
 .ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Pavel Begunkov <asml.silence@gmail.com>, Eric Auger <eric.auger@redhat.com>, Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, Moritz Fischer <mdf@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 01:48:23PM +0100, Christian Brauner wrote:
> Ever since the evenfd type was introduced back in 2007 in commit
> e1ad7468c77d ("signal/timer/event: eventfd core") the eventfd_signal()
> function only ever passed 1 as a value for @n. There's no point in
> keeping that additional argument.
> 
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
>  arch/x86/kvm/hyperv.c                     |  2 +-
>  arch/x86/kvm/xen.c                        |  2 +-
>  drivers/accel/habanalabs/common/device.c  |  2 +-
>  drivers/fpga/dfl.c                        |  2 +-
>  drivers/gpu/drm/drm_syncobj.c             |  6 +++---
>  drivers/gpu/drm/i915/gvt/interrupt.c      |  2 +-
>  drivers/infiniband/hw/mlx5/devx.c         |  2 +-
>  drivers/misc/ocxl/file.c                  |  2 +-
>  drivers/s390/cio/vfio_ccw_chp.c           |  2 +-
>  drivers/s390/cio/vfio_ccw_drv.c           |  4 ++--
>  drivers/s390/cio/vfio_ccw_ops.c           |  6 +++---
>  drivers/s390/crypto/vfio_ap_ops.c         |  2 +-
>  drivers/usb/gadget/function/f_fs.c        |  4 ++--
>  drivers/vdpa/vdpa_user/vduse_dev.c        |  6 +++---
>  drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c    |  2 +-
>  drivers/vfio/pci/vfio_pci_core.c          |  6 +++---
>  drivers/vfio/pci/vfio_pci_intrs.c         | 12 ++++++------
>  drivers/vfio/platform/vfio_platform_irq.c |  4 ++--
>  drivers/vhost/vdpa.c                      |  4 ++--
>  drivers/vhost/vhost.c                     | 10 +++++-----
>  drivers/vhost/vhost.h                     |  2 +-
>  drivers/virt/acrn/ioeventfd.c             |  2 +-
>  drivers/xen/privcmd.c                     |  2 +-
>  fs/aio.c                                  |  2 +-
>  fs/eventfd.c                              |  9 +++------
>  include/linux/eventfd.h                   |  4 ++--
>  mm/memcontrol.c                           | 10 +++++-----
>  mm/vmpressure.c                           |  2 +-
>  samples/vfio-mdev/mtty.c                  |  4 ++--
>  virt/kvm/eventfd.c                        |  4 ++--
>  30 files changed, 60 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
> index dd7a783d53b5..e73f88050f08 100644
> --- a/drivers/fpga/dfl.c
> +++ b/drivers/fpga/dfl.c
> @@ -1872,7 +1872,7 @@ static irqreturn_t dfl_irq_handler(int irq, void *arg)
>  {
>  	struct eventfd_ctx *trigger = arg;
>  
> -	eventfd_signal(trigger, 1);
> +	eventfd_signal(trigger);

For FPGA part,

Acked-by: Xu Yilun <yilun.xu@intel.com>

>  	return IRQ_HANDLED;
>  }
