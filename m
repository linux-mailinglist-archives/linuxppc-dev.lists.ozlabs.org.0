Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726A10DB5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 22:49:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pp7h3K8PzDr6V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 08:49:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="P515JTdy"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Pp5Z6yq9zDr2l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 08:47:46 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de192010000>; Fri, 29 Nov 2019 13:47:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 29 Nov 2019 13:47:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 29 Nov 2019 13:47:42 -0800
Received: from [10.2.169.205] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Nov
 2019 21:47:41 +0000
Subject: Re: [PATCH v2 17/19] powerpc: book3s64: convert to pin_user_pages()
 and put_user_page()
To: Jan Kara <jack@suse.cz>
References: <20191125231035.1539120-1-jhubbard@nvidia.com>
 <20191125231035.1539120-18-jhubbard@nvidia.com>
 <20191129112315.GB1121@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cb3e2acc-0a83-4053-fbcc-6d75dc47f174@nvidia.com>
Date: Fri, 29 Nov 2019 13:44:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129112315.GB1121@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575064066; bh=tMvn6asqZgJ/8yczcC9lnf1pHEf7TJzCvRVZqLzUEIk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=P515JTdy70KP3oimNK/fSAtObgW4JDQsh/LN+dj31w7qtgH6JUdGJYKS3j5J8enBM
 oN04vymJSqszX58P75QNc1cW3k/Ll0LB9zwNlmlBWaR7zw2qd7/o9t2Cy3EugW3wgY
 XBlQyEsBEMcfywkDPj201lclcvfOCs5gFzs/O+2QmSmHzciD31eTMBkNB0W6VGXEOL
 BbnrGM91l0GAwjLm+XJmL4eoGQAce5JVCz6FfueQA4/sc24hO2mmz2R1mloKHyP2Ej
 3q1StOVbP0t0OEBFEGay8puwUyC8jwyLEftGIYNcVrkaz5szmNasFETh2Ir0Xi5Q1g
 8xDwDUM/1ii9A==
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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

On 11/29/19 3:23 AM, Jan Kara wrote:
> On Mon 25-11-19 15:10:33, John Hubbard wrote:
>> 1. Convert from get_user_pages() to pin_user_pages().
>>
>> 2. As required by pin_user_pages(), release these pages via
>> put_user_page(). In this case, do so via put_user_pages_dirty_lock().
>>
>> That has the side effect of calling set_page_dirty_lock(), instead
>> of set_page_dirty(). This is probably more accurate.
> 
> Maybe more accurate but it doesn't work for mm_iommu_unpin(). As I'm
> checking mm_iommu_unpin() gets called from RCU callback which is executed
> interrupt context and you cannot lock pages from such context. So you need
> to queue work from the RCU callback and then do the real work from the
> workqueue...
> 
> 								Honza

ah yes, fixed locally. (In order to avoid  distracting people during the merge
window, I won't post any more versions of the series until the merge window is
over, unless a maintainer tells me that any of these patches are desired for
5.5.)

With that, we are back to a one-line diff for this part:

@@ -215,7 +214,7 @@ static void mm_iommu_unpin(struct mm_iommu_table_group_mem_t *mem)
                 if (mem->hpas[i] & MM_IOMMU_TABLE_GROUP_PAGE_DIRTY)
                         SetPageDirty(page);
  
-               put_page(page);
+               put_user_page(page);
                 mem->hpas[i] = 0;
         }
  }

btw, I'm also working on your feedback for patch 17 (mm/gup: track FOLL_PIN pages [1]),
from a few days earlier, it's not being ignored, I'm just trying to avoid distracting
people during the merge window.

[1] https://lore.kernel.org/r/20191121093941.GA18190@quack2.suse.cz

thanks,
-- 
John Hubbard
NVIDIA
