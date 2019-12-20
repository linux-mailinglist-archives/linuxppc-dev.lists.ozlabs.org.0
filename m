Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46E1285C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 00:56:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47flyh6YJpzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 10:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="oRvXZWdo"; 
 dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47flwn6lBRzDqsC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 10:55:05 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfd5f350000>; Fri, 20 Dec 2019 15:54:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 15:55:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 20 Dec 2019 15:55:00 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 23:54:55 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
Date: Fri, 20 Dec 2019 15:54:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191220182939.GA10944@unreal>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576886069; bh=/03FljbsYciU5tHAkbKg2NU1vxam4rPGvNuyvBOvTmI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=oRvXZWdofYZmMnKtHbC887r9WWAfrydUr/UibodWJ1qaNTyMPy3+W8R0NcaZhg7dS
 971HGgJD6LwSffJ62pj2tIvxp3eHI8BXVOtdjk7S3sjdZSz9tGHLzm7ujCZVURuC8a
 irEUmm/OhCMXyR+iqtnm6nCO/xQp89VT1WotayqMgxGp4mpoDDX+NNHJX4q0B3UwU3
 +RvXPnLJz1mCrbJfx3TkKb0L+jPAoTDVjeRU4xrKmbuD30tHozBBlUpnyYWoaOHmat
 YDkXozvEZrxOc0h7qKS+l5AK23MRif8N+YKUGoUxe7vXoCKoEk2wdk8r2SNOo6On86
 EItNjAud0AHkw==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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

On 12/20/19 10:29 AM, Leon Romanovsky wrote:
...
>> $ ./build.sh
>> $ build/bin/run_tests.py
>>
>> If you get things that far I think Leon can get a reproduction for you
> 
> I'm not so optimistic about that.
> 

OK, I'm going to proceed for now on the assumption that I've got an overflow
problem that happens when huge pages are pinned. If I can get more information,
great, otherwise it's probably enough.

One thing: for your repro, if you know the huge page size, and the system
page size for that case, that would really help. Also the number of pins per
page, more or less, that you'd expect. Because Jason says that only 2M huge 
pages are used...

Because the other possibility is that the refcount really is going negative, 
likely due to a mismatched pin/unpin somehow.

If there's not an obvious repro case available, but you do have one (is it easy
to repro, though?), then *if* you have the time, I could point you to a github
branch that reduces GUP_PIN_COUNTING_BIAS by, say, 4x, by applying this:

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bb44c4d2ada7..8526fd03b978 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1077,7 +1077,7 @@ static inline void put_page(struct page *page)
  * get_user_pages and page_mkclean and other calls that race to set up page
  * table entries.
  */
-#define GUP_PIN_COUNTING_BIAS (1U << 10)
+#define GUP_PIN_COUNTING_BIAS (1U << 8)
 
 void unpin_user_page(struct page *page);
 void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,

If that fails to repro, then we would be zeroing in on the root cause. 

The branch is here (I just tested it and it seems healthy):

git@github.com:johnhubbard/linux.git  pin_user_pages_tracking_v11_with_diags



thanks,
-- 
John Hubbard
NVIDIA
