Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814AF9CB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 22:59:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CM980Sw9zF4xT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 08:59:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Xi5VpxUR"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CM6w5k2FzF5ZD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 08:57:40 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id 5so1903238otk.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GVsjPqJbGl0vB/+Gk+mdS3wPD6eGzXnfLsFoQJ3IvwY=;
 b=Xi5VpxURlOvKgdnc2CCM8ogRa/H5/0k5sFmSuFB8dP7mdDgr87G2ihgcoAULaWG/WG
 Hj8o+3+ie5rrJujDRUeLRQcOeiNzn8YKMM2VBeVNBKVsnBN0FQns+w7w3PsW4i65s8a5
 N+VULX92Qszd6uoAo9krZIME0J3xIfL4gJiRjCsCskWvVjLpfyuINcuFYSor/+iuZuqF
 2TY8xkdKZQu+VBpockLjH+8q98S3mNVqmKjCD+wTD8kkFuDZ2LtRYTFByjXSsRxruC6f
 SXuVKXEgsV4rmu18ICvQbVomOgOwxUGMXKdLYloN5hq1WNlcDitiNl2/AmVQ4Ykyplh2
 IsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GVsjPqJbGl0vB/+Gk+mdS3wPD6eGzXnfLsFoQJ3IvwY=;
 b=KX7J1gW1/8lwrnDSnzHH5PGzmO+Rn4XpSCehFT1EWTRa3pqF2nDUUIwpBz5K4eDeEi
 3csbSjNAkJXu8CpfpvetK3ZiWQzfVwPpG11ysCKIvo97esljYLdn8UvbdMAaqxUxN9Nc
 aDwDXTZqjtbd5zsEgY+F7ABxjJ/TTWUFC0oZaVP3hasuJbI4DipvcnH09K/KU7kthNfi
 C0+LRo9Gfa7iEEX7HDngAOViXTspWoxon3PEPCQs6iI0HCeoBvgafRX84mlFPFmxUO9a
 k7MYAhXk1VfJbESI7q6h0BT6sZr3ZsFDScV6r+BJc/rGSd82R4jrfuelfLb2IvARGplQ
 9DXw==
X-Gm-Message-State: APjAAAXEqNq6kCIgfzK63IHhspLGdYFWdJo73hiduICmJfrmbEIh+62B
 PbLwmSdAe1NmHloNNGIsZKCq32gWCDYNXmg8MGXzcg==
X-Google-Smtp-Source: APXvYqzkEVRCSmKc+X1f3BY1LRLo7eG1sZvx8YX/MxrMpGOBy0kbPmD/k6U1Bv0DnK/agC4LCbQG5TvJ1BrQq2DF3mo=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr5454287oti.207.1573595857896; 
 Tue, 12 Nov 2019 13:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
In-Reply-To: <20191112000700.3455038-9-jhubbard@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 13:57:27 -0800
Message-ID: <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 4:07 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> As it says in the updated comment in gup.c: current FOLL_LONGTERM
> behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
> FS DAX check requirement on vmas.
>
> However, the corresponding restriction in get_user_pages_remote() was
> slightly stricter than is actually required: it forbade all
> FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
> that do not set the "locked" arg.
>
> Update the code and comments accordingly, and update the VFIO caller
> to take advantage of this, fixing a bug as a result: the VFIO caller
> is logically a FOLL_LONGTERM user.
>
> Thanks to Jason Gunthorpe for pointing out a clean way to fix this.
>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++++-----------------
>  mm/gup.c                        | 13 ++++++++-----
>  2 files changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index d864277ea16f..017689b7c32b 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -348,24 +348,20 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>                 flags |= FOLL_WRITE;
>
>         down_read(&mm->mmap_sem);
> -       if (mm == current->mm) {
> -               ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> -                                    vmas);
> -       } else {
> -               ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> -                                           vmas, NULL);
> -               /*
> -                * The lifetime of a vaddr_get_pfn() page pin is
> -                * userspace-controlled. In the fs-dax case this could
> -                * lead to indefinite stalls in filesystem operations.
> -                * Disallow attempts to pin fs-dax pages via this
> -                * interface.
> -                */
> -               if (ret > 0 && vma_is_fsdax(vmas[0])) {
> -                       ret = -EOPNOTSUPP;
> -                       put_page(page[0]);
> -               }
> +       ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> +                                   page, vmas, NULL);

Hmm, what's the point of passing FOLL_LONGTERM to
get_user_pages_remote() if get_user_pages_remote() is not going to
check the vma? I think we got to this code state because the
get_user_pages() vs get_user_pages_remote() split predated the
introduction of FOLL_LONGTERM.

I think check_vma_flags() should do the ((FOLL_LONGTERM | FOLL_GET) &&
vma_is_fsdax()) check and that would also remove the need for
__gup_longterm_locked.
