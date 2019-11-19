Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93E1019F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 08:04:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HGzY0YCCzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 18:04:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="OHB+eUp2"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HGtg1KsZzDqdb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 18:00:42 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3930f0000>; Mon, 18 Nov 2019 23:00:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 18 Nov 2019 23:00:34 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 18 Nov 2019 23:00:34 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 07:00:34 +0000
Subject: Re: [PATCH v5 02/24] mm/gup: factor out duplicate code from four
 routines
To: Jan Kara <jack@suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-3-jhubbard@nvidia.com>
 <20191118094604.GC17319@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <152e2ea9-edd9-f868-7731-ff467d692f5f@nvidia.com>
Date: Mon, 18 Nov 2019 23:00:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118094604.GC17319@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574146832; bh=u3YCRE77HsuXbqK9BxFmzDLl8JhQHMG9gXXaYRfagTQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OHB+eUp2jQQmHLrGYBTtAkydhQax1jgPbRIdqXv/zT7mJheOoxm2jC/o00J+31bDd
 psR1uWZTYTlZpkmYbJIlMzoHbpxnwxoe7ZrZ8UMQNDddfR1HU1k+hUj3JCOx3ZRd5b
 XT8Ag7PAkGX6G4pIQ7geJmQblkDOtgu1RTN+An2f8z0fTBevVuF5GINewI0N+iPfcv
 YgagSYh5LQVW6KL8izWZSAMBRDSFlAEl3uHonusWk1CkuRAUgvh73saFcEMPgIKbUo
 7msrJOumHG3EP3Mzt2Z3Dov3XH2Wq2MWpaj0JPNxYk4UIQaUft9LMOT0FAc0/WGi6i
 OtciRBna4adWA==
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

On 11/18/19 1:46 AM, Jan Kara wrote:
> On Thu 14-11-19 21:53:18, John Hubbard wrote:
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
>> Cc: Jan Kara <jack@suse.cz>
>> Cc: Ira Weiny <ira.weiny@intel.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  mm/gup.c | 95 ++++++++++++++++++++++++--------------------------------
>>  1 file changed, 40 insertions(+), 55 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 85caf76b3012..858541ea30ce 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1969,6 +1969,29 @@ static int __gup_device_huge_pud(pud_t pud, pud_t=
 *pudp, unsigned long addr,
>>  }
>>  #endif
>> =20
>> +static int __record_subpages(struct page *page, unsigned long addr,
>> +			     unsigned long end, struct page **pages)
>> +{
>> +	int nr =3D 0;
>> +	int nr_recorded_pages =3D 0;
>> +
>> +	do {
>> +		pages[nr] =3D page;
>> +		nr++;
>> +		page++;
>> +		nr_recorded_pages++;
>> +	} while (addr +=3D PAGE_SIZE, addr !=3D end);
>> +	return nr_recorded_pages;
>=20
> nr =3D=3D nr_recorded_pages so no need for both... BTW, structuring this =
as a
> for loop would be probably more logical and shorter now:
>=20
> 	for (nr =3D 0; addr !=3D end; addr +=3D PAGE_SIZE)
> 		pages[nr++] =3D page++;
> 	return nr;
>=20

Nice touch, I've applied it.

thanks,
--=20
John Hubbard
NVIDIA



> The rest of the patch looks good to me.
>=20
> 								Honza
>=20
