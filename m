Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC0ED47F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2019 20:55:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475mr73w4gzF5T6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 06:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="hz45cfuI"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475mp02n2vzF5St
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 06:53:44 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbf30480000>; Sun, 03 Nov 2019 11:53:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 03 Nov 2019 11:53:38 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 03 Nov 2019 11:53:38 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 3 Nov
 2019 19:53:37 +0000
Subject: Re: [PATCH 19/19] Documentation/vm: add pin_user_pages.rst
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-20-jhubbard@nvidia.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <58d3ef87-85ef-a69d-5cf7-1719ff356048@nvidia.com>
Date: Sun, 3 Nov 2019 11:53:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030224930.3990755-20-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572810825; bh=rTG1L9aHJoAtL42CYzuRVvyOXz7jlR1h5ExQz/00LXg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=hz45cfuI6ZB24IXq0tlVG+4gOOw0rO1aR3a1v+mNE3URSP536c/QI/nw4iVi4Q3Fg
 ZvhfjRg3c8U4Zeed5IN0S8La0/yhKPqXLcaka8zujsYCnTFzskkYWmX6ZMKm85uc53
 903Xo+ojBBu648JazllTkreHad3wmqcM3sQfIPNK3XPWIubatS+4uPpiaSake+maws
 O3mb+7lTk0b/qWmINewSdXIPlnBwUrlkcxoUQTGi1jJWPWnSrL74fzVKeEWjMvAjbH
 5wXYgJG8qyFZYCSM/zx8jBY5FMvGDHZIQbt9J9oHql6kjp+O+lMMcuF1F8/mAcyFV4
 Yo4Vz3wx3lQSQ==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/30/19 3:49 PM, John Hubbard wrote:
...
> +* struct page may not be increased in size for this, and all fields are already
> +  used.
> +
> +* Given the above, we can overload the page->_refcount field by using, sort of,
> +  the upper bits in that field for a dma-pinned count. "Sort of", means that,
> +  rather than dividing page->_refcount into bit fields, we simple add a medium-
> +  large value (GUP_PIN_COUNTING_BIAS, initially chosen to be 1024: 10 bits) to
> +  page->_refcount. This provides fuzzy behavior: if a page has get_page() called
> +  on it 1024 times, then it will appear to have a single dma-pinned count.
> +  And again, that's acceptable.
> +
> +This also leads to limitations: there are only 32-10==22 bits available for a
> +counter that increments 10 bits at a time.
> +

The above claim is just a "bit" too optimistic, by one bit: page->_refcount, being 
an atomic_t which uses a signed int (and we use the sign bit to check for overflow),
only has 31 total bits available for actual counting, not 32.

I'll adjust the documentation in v2, to account for this.

thanks,

John Hubbard
NVIDIA

