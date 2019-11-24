Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 047CC10825E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2019 07:16:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LKgV0gKCzDqK1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2019 17:16:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="Lxyt3fX3"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LKdh52nDzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 17:15:04 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dda1fe40000>; Sat, 23 Nov 2019 22:15:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 23 Nov 2019 22:14:59 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 23 Nov 2019 22:14:59 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 24 Nov
 2019 06:14:58 +0000
Subject: Re: [PATCH v7 07/24] IB/umem: use get_user_pages_fast() to pin DMA
 pages
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@infradead.org>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-8-jhubbard@nvidia.com>
 <20191121080746.GC30991@infradead.org> <20191121143643.GC7448@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <17835638-d584-f981-faa3-34d57e0990de@nvidia.com>
Date: Sat, 23 Nov 2019 22:14:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121143643.GC7448@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574576100; bh=+mbCPa34GHo19rkSZ8X28MZHFxfKXj0JDCmoAoUgPhA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Lxyt3fX3SLobwlYOgojx5q/tcPHCRvrfdyk3qwBay6+crwzq9cmBDOL2v1A93d2/F
 znbsTdahsKcfBLC3ExDVRiR4xyNb8wuF+IY4tVg2BRT+CWxuHL+tde5mqs3Sjaqc2H
 pQhchVsKtIHXazVW0nKuBUtZ85yMnPL1fDCuL8YyEbTuF/FrqtWCNE9nir7lTMKyjf
 tlQWOABZBTB1lSxY5uwVrlwTat+xx62yAomSXn+CUgkL0jIrOlvTsDh31691ux/R3U
 ne8BFF7YaXlkXhz8ZhdLSUDwwh/yLz0H7gzsTDkDINVi3pBPVt9mKwVrX7BgK6Om2D
 P0YwnWGSjqBhw==
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/21/19 6:36 AM, Jason Gunthorpe wrote:
> On Thu, Nov 21, 2019 at 12:07:46AM -0800, Christoph Hellwig wrote:
>> On Wed, Nov 20, 2019 at 11:13:37PM -0800, John Hubbard wrote:
>>> And get rid of the mmap_sem calls, as part of that. Note
>>> that get_user_pages_fast() will, if necessary, fall back to
>>> __gup_longterm_unlocked(), which takes the mmap_sem as needed.
>>>
>>> Reviewed-by: Jan Kara <jack@suse.cz>
>>> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
>>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>
>> Looks fine,
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Jason, can you queue this up for 5.5 to reduce this patch stack a bit?
> 
> Yes, I said I'd do this in an earlier revision. Now that it is clear this
> won't go through Andrew's tree, applied to rdma for-next
> 

Great, I'll plan on it going up through that tree. To be clear, is it headed 
for:

    git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next

?


thanks,
-- 
John Hubbard
NVIDIA
