Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1476EEB42
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 22:36:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476R2Q6tf3zDrj0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 08:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="qKL2SABn"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476QzR1Vq8zF4Kd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 08:34:10 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc099520001>; Mon, 04 Nov 2019 13:34:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 13:34:05 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 Nov 2019 13:34:05 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 21:34:05 +0000
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
 <20191104203153.GB7731@redhat.com> <20191104203702.GG30938@ziepe.ca>
 <d0890a8b-c349-0515-2570-10e83979836b@nvidia.com>
 <20191104211525.GJ30938@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <caaaaf52-490b-6ce1-81d8-675013354c73@nvidia.com>
Date: Mon, 4 Nov 2019 13:34:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104211525.GJ30938@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572903250; bh=vbo/OzrYq7woOdeOQXzDRocZ8qkmDZ2GrWck8Ge0GIw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qKL2SABndBuE0IlTwGECBEmaXKNt9+NUVq+WFlqtOQFVTiU7nDI02BQTOx0obKarz
 gpxOM5Y6JautiKfOu0FtwOKOgDIpCUi5YMn9VF5RbTl9cVhlQsO6c44+kqa1Gmkh8J
 VEKyKNOG6Vqk5nkQbEsBguPgBI2Ja3iUp52oe4dwNevVkVV3ApvpTePgu21U23nzfu
 yfLLAmDkD5PCoZMaxqbgr1s6DM7hOxhvmTI1aiChbyJF4tpKtWS0fJG0BnHlBMS2gJ
 uFSIwTdydwTYYvW23EYrvHjEOYVqNSM3f00rEJ3//HPrJcaJAle1+bmyry6JSVv/h0
 e3DYAyiBVB40w==
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
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

On 11/4/19 1:15 PM, Jason Gunthorpe wrote:
...
>> Right, and I thought about this when converting, and realized that the above 
>> code is working around the current gup.c limitations, which are "cannot support
>> gup remote with FOLL_LONGTERM".
> 
> But AFAICT it doesn't have a problem, the protection test is just too
> strict, and I guess the control flow needs a bit of fixing..
> 
> The issue is this:
> 
> static __always_inline long __get_user_pages_locked():
> {
>         if (locked) {
>                 /* if VM_FAULT_RETRY can be returned, vmas become invalid */
>                 BUG_ON(vmas);
>                 /* check caller initialized locked */
>                 BUG_ON(*locked != 1);
>         }
> 
> 
> so remote could be written as:
> 
> if (gup_flags & FOLL_LONGTERM) {
>    if (WARN_ON_ONCE(locked))
>         return -EINVAL;
>    return __gup_longterm_locked(...)
> }
> 
> return __get_user_pages_locked(...)
> 
> ??

Yes, that loosens it up just enough for the vfio case (which doesn't set 
"locked") to get through, great! OK, I'll put that (the above plus 
corresponding vfio fix) in a separate patch first. 

This should clear things up nicely.


thanks,
-- 
John Hubbard
NVIDIA
