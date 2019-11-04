Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA2EEAEE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 22:17:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476QcL1RbkzF3L0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 08:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="cdIurt3F"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476QYs6BSxzF441
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 08:15:29 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id x21so26104248qto.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 13:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pyXNiCRfNtBczIIqZ12Au+Ud6Z68623cr8kr//yYcys=;
 b=cdIurt3FoLPTZlK0pRWkw6/vK5VskqT2SbrzmEIJH+tJ6Ws9V4Lsgf9USo2+e2ozUc
 YRC+b39mpReZt55//saai5UbNMBA3eXwOqYLQtfunIkTwkfTlIfn1eXp2VeIe1/orkPr
 PDVNDgKxGvEW8/cTzBHwWhOs6aaLwvdAp8wwJznhpYiyIH9szefozZKp8Gp400JqPNGU
 fTr/7Xjau32owsZ9g3acr0XI1ZTN6RVvcZ58S7ZMFunV92cxFdu7JBWTybRQM5KPfcgD
 VnxEWZzKOSsxfKO36w3EM6M1OhrZPi8fZFAK54K+pX7TtJSCqY3tKZTOVsHNgsvdV+dl
 4NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pyXNiCRfNtBczIIqZ12Au+Ud6Z68623cr8kr//yYcys=;
 b=Ara1U6M/bfRX2s10E6Gl4fQ54swYhZj2NmV+VOeeK3soTBKbNE3LFdW9zNkORsR0zx
 CA7apBHc0tlJDeDI7kuIEFHZKULaAUVuW9NCafaUiGVtlN4E17P+iQKddGqbTZBoHOug
 KGcAVyJBnRhkAdi/LnRL6smfFtc6mixTHNm454DBGRq0DVKA6wIr+cxFT5YbIvfBLPBX
 ASArNxZf03eUELeYRV54qTu0fJChs9rBKl5Z1n4db/96oNWfDirdu8BNpJbdEj4ckMvW
 krwrAgg7ZDq96tjzVVmV2Ank//SX55JmPsyzl/WHWLjI+SUEwFgHfcGxs8DzJJ9b4Did
 4jxg==
X-Gm-Message-State: APjAAAUCcfhlWuAmIt1TbINlQhDlFjzx9abFTcZWTSjHJQGEu/KwDcT4
 JKlR6/5ag47LrDn8vCFBrhmmAg==
X-Google-Smtp-Source: APXvYqzMR4jCE1PYixsxB/Gjs6m+eeNvSRexU+WyF4DsIRWaOdmeothP674vqn/aB1paP5wRwlCCGw==
X-Received: by 2002:ac8:3a21:: with SMTP id w30mr14733201qte.299.1572902126035; 
 Mon, 04 Nov 2019 13:15:26 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id q1sm6459892qti.46.2019.11.04.13.15.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Nov 2019 13:15:25 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iRjh7-0000mG-3H; Mon, 04 Nov 2019 17:15:25 -0400
Date: Mon, 4 Nov 2019 17:15:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191104211525.GJ30938@ziepe.ca>
References: <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
 <20191104203153.GB7731@redhat.com>
 <20191104203702.GG30938@ziepe.ca>
 <d0890a8b-c349-0515-2570-10e83979836b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0890a8b-c349-0515-2570-10e83979836b@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 12:57:59PM -0800, John Hubbard wrote:
> On 11/4/19 12:37 PM, Jason Gunthorpe wrote:
> > On Mon, Nov 04, 2019 at 03:31:53PM -0500, Jerome Glisse wrote:
> >>> Note for Jason: the (a) or (b) items are talking about the vfio case, which is
> >>> one of the two call sites that now use pin_longterm_pages_remote(), and the
> >>> other one is infiniband:
> >>>
> >>> drivers/infiniband/core/umem_odp.c:646:         npages = pin_longterm_pages_remote(owning_process, owning_mm,
> >>> drivers/vfio/vfio_iommu_type1.c:353:            ret = pin_longterm_pages_remote(NULL, mm, vaddr, 1,
> >>
> >> vfio should be reverted until it can be properly implemented.
> >> The issue is that when you fix the implementation you might
> >> break vfio existing user and thus regress the kernel from user
> >> point of view. So i rather have the change to vfio reverted,
> >> i believe it was not well understood when it got upstream,
> >> between in my 5.4 tree it is still gup_remote not longterm.
> > 
> > It is clearly a bug, vfio must use LONGTERM, and does right above this
> > remote call:
> > 
> >         if (mm == current->mm) {
> >                 ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> >                                      vmas);
> >         } else {
> >                 ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> >                                             vmas, NULL);
> > 
> > 
> > I'm not even sure that it really makes any sense to build a 'if' like
> > that, surely just always call remote??
> > 
> 
> 
> Right, and I thought about this when converting, and realized that the above 
> code is working around the current gup.c limitations, which are "cannot support
> gup remote with FOLL_LONGTERM".

But AFAICT it doesn't have a problem, the protection test is just too
strict, and I guess the control flow needs a bit of fixing..

The issue is this:

static __always_inline long __get_user_pages_locked():
{
        if (locked) {
                /* if VM_FAULT_RETRY can be returned, vmas become invalid */
                BUG_ON(vmas);
                /* check caller initialized locked */
                BUG_ON(*locked != 1);
        }


so remote could be written as:

if (gup_flags & FOLL_LONGTERM) {
   if (WARN_ON_ONCE(locked))
        return -EINVAL;
   return __gup_longterm_locked(...)
}

return __get_user_pages_locked(...)

??

Jason
