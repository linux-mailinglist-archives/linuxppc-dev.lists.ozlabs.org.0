Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795A12569E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 23:24:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dV0y4mXQzDqlc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 09:24:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="ScM+7x8q"; 
 dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dTtd0gDqzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 09:18:48 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfaa5ba0000>; Wed, 18 Dec 2019 14:18:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 18 Dec 2019 14:18:44 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 18 Dec 2019 14:18:44 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 22:18:43 +0000
Subject: Re: [PATCH v11 01/25] mm/gup: factor out duplicate code from four
 routines
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-2-jhubbard@nvidia.com>
 <20191218155211.emcegdp5uqgorfwe@box>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <5719efc4-e560-b3d9-8d1f-3ae289bed289@nvidia.com>
Date: Wed, 18 Dec 2019 14:15:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218155211.emcegdp5uqgorfwe@box>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576707514; bh=A0thRHEqnXg6dZZRQ3XItHq709pByy7GtW01Hq1OCoc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ScM+7x8q8mWlcIQciYsHkNMCacR+c0EXHDYwd9LQIuUPf7aoJ2FVBW026iU1SWAnl
 ltogqGk6aIee+Km4SQR7f32cksncAyW4lNLn2TYKFrtJdbIHsrOldxBh5IaPhHdDqE
 sdIpDxyyx+Jf8CyjrZWs/sYEpgdFVpjkjtWEpt4nJp1e7SjqwB5Cu2GqZfKBuKVEar
 BRhkAV/MDLjwytEs34akliPwG7VvslpNx0c0XwWMRq9z3Nwumj3m+z4SVir8YPvZEf
 vV7cvsqLQ3VGt46WIl4RoFGnV1Qa4B1dL2lodfVBrgXk2TIEVopJfv3Sggeyd8NtB5
 Kn8oXib8wW5/w==
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
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
 Daniel Vetter <daniel@ffwll.ch>, "Aneesh Kumar
 K . V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/18/19 7:52 AM, Kirill A. Shutemov wrote:
> On Mon, Dec 16, 2019 at 02:25:13PM -0800, John Hubbard wrote:
>> +static void put_compound_head(struct page *page, int refs)
>> +{
>> +	/* Do a get_page() first, in case refs == page->_refcount */
>> +	get_page(page);
>> +	page_ref_sub(page, refs);
>> +	put_page(page);
>> +}
> 
> It's not terribly efficient. Maybe something like:
> 
> 	VM_BUG_ON_PAGE(page_ref_count(page) < ref, page);
> 	if (refs > 2)
> 		page_ref_sub(page, refs - 1);
> 	put_page(page);
> 
> ?

OK, but how about this instead? I don't see the need for a "2", as that
is a magic number that requires explanation. Whereas "1" is not a magic
number--here it means: either there are "many" (>1) refs, or not.

And the routine won't be called with refs less than about 32 (2MB huge
page, 64KB base page == 32 subpages) anyway.

	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
	/*
	 * Calling put_page() for each ref is unnecessarily slow. Only the last
	 * ref needs a put_page().
	 */
	if (refs > 1)
		page_ref_sub(page, refs - 1);
	put_page(page);


thanks,
-- 
John Hubbard
NVIDIA
  
