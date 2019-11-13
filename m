Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72857FBC5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 00:17:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D0qz1jXqzF6xM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:17:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="A51eKIWP"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D0nV2h2yzF6sG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 10:14:53 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc8e6b0000>; Wed, 13 Nov 2019 15:14:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 15:14:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 15:14:48 -0800
Received: from [10.2.160.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 23:14:47 +0000
Subject: Re: [PATCH v4 02/23] mm/gup: factor out duplicate code from four
 routines
To: Jan Kara <jack@suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-3-jhubbard@nvidia.com>
 <20191113111521.GI6367@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <56a575ac-c090-4063-67fc-c6cb24109442@nvidia.com>
Date: Wed, 13 Nov 2019 15:12:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113111521.GI6367@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573686891; bh=9LRqaiCXGyssScdgi2q8tAszCMUWmamss75JnSCD7Rw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=A51eKIWPld+4B5s2mm0c+AftPX6dpBjqpWkYujEzQW8kVLlFqmGjocd27BfsONHAP
 mmPJsbiq51gzeODte2X2C/uPkzYNTjtPJH03F4HVdvsPm9WWyPO3mCuFy2qZ+53ojk
 w6MdkTLmNoJEsvjJ1mHPlZG7UOzdlPWuN7wE/1LLT4AJNdQe+bbFVcAcD30SjuESOC
 HMOwl+XnOLJvxdKZ8WjJigzroAhsM6sSwkk0PcI+BOHfFZzPS0NsqTuAU0nk8z5SAy
 WgcifEMQlIH1QeCvlXON5hCNNd97lHyEHTXJRg5VuAfoyXIGForJZxdZ7GM5/XPnDu
 zIFH0GBGYNRaQ==
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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

On 11/13/19 3:15 AM, Jan Kara wrote:
> On Tue 12-11-19 20:26:49, John Hubbard wrote:
>> There are four locations in gup.c that have a fair amount of code
>> duplication. This means that changing one requires making the same
>> changes in four places, not to mention reading the same code four
>> times, and wondering if there are subtle differences.
>>
>> Factor out the common code into static functions, thus reducing the
>> overall line count and the code's complexity.
>>
>> Also, take the opportunity to slightly improve the efficiency of the
>> error cases, by doing a mass subtraction of the refcount, surrounded
>> by get_page()/put_page().
>>
>> Also, further simplify (slightly), by waiting until the the successful
>> end of each routine, to increment *nr.
>>
>> Reviewed-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
>> Cc: Ira Weiny <ira.weiny@intel.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>=20
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 85caf76b3012..199da99e8ffc 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1969,6 +1969,34 @@ static int __gup_device_huge_pud(pud_t pud, pud_t=
 *pudp, unsigned long addr,
>>   }
>>   #endif
>>  =20
>> +static int __record_subpages(struct page *page, unsigned long addr,
>> +			     unsigned long end, struct page **pages, int nr)
>> +{
>> +	int nr_recorded_pages =3D 0;
>> +
>> +	do {
>> +		pages[nr] =3D page;
>> +		nr++;
>> +		page++;
>> +		nr_recorded_pages++;
>> +	} while (addr +=3D PAGE_SIZE, addr !=3D end);
>> +	return nr_recorded_pages;
>> +}
>=20
> Why don't you pass in already pages + nr?

Aha, that does save a function argument. Will do.

...
>> +static void __huge_pt_done(struct page *head, int nr_recorded_pages, in=
t *nr)
>> +{
>> +	*nr +=3D nr_recorded_pages;
>> +	SetPageReferenced(head);
>> +}
>=20
> I don't find this last helper very useful. It seems to muddy water more
> than necessary...

Yes, I suspect it's rather unloved, and the fact that it was hard to accura=
tely
name should have been a big hint to not do it. I'll remove the helper and
put the lines back in directly.


thanks,
--=20
John Hubbard
NVIDIA

>=20
> Other than that the cleanup looks nice to me.
>=20
> 								Honza
>=20
