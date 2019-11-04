Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47AEE752
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 19:24:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476LmF4f7VzF3wt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 05:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="q+cPcxTz"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476LkH47WMzF1LJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 05:22:31 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc06c670000>; Mon, 04 Nov 2019 10:22:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 10:22:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 Nov 2019 10:22:24 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 18:22:23 +0000
Subject: Re: [PATCH v2 09/18] drm/via: set FOLL_PIN via pin_user_pages_fast()
To: Jerome Glisse <jglisse@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-10-jhubbard@nvidia.com>
 <20191104174445.GF5134@redhat.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <880dbf76-ba9d-2555-27e4-a656c7cd3296@nvidia.com>
Date: Mon, 4 Nov 2019 10:22:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104174445.GF5134@redhat.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572891751; bh=6jW45wKOFDFKBEg0lZ7bTretxwwJVIL7ATzyqCLqcEs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=q+cPcxTzijEgiG71VTi3ghLiE7GfTQ4coAPAv62hXRzzfbJrqL72vvQzW31t6ElHl
 a14GEr0QvEJ+EgWUGUZvr/G/dg/DO160GJKTWSZ2RJb00ZyoxmozrYK/r7pBI/oTMl
 Ler5Xg8wJ+ZN2h3kBmHfP9Sw6IyvnOUkYQcpRlRzW+raDfRYi607iZ0w1mGtWLJDUd
 OeC58odM3LRQFDuOqtEG4EL4fTJQzFx4oBwJjsq4w851X4PvmAFvjIH2kPLRjgrU0s
 pJjSO5ccYyyba2k6piwVKSCGegs79Mk1YqTR+mkcxWQJ+CLl9VNfnFD05lp5bT2fCz
 LMXjtLCzRFCYw==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/4/19 9:44 AM, Jerome Glisse wrote:
> On Sun, Nov 03, 2019 at 01:18:04PM -0800, John Hubbard wrote:
>> Convert drm/via to use the new pin_user_pages_fast() call, which sets
>> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
>> tracking of pinned pages, and therefore for any code that calls
>> put_user_page().
>>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>=20
> Please be more explicit that via_dmablit.c is already using put_user_page=
()
> as i am expecting that any conversion to pin_user_pages*() must be pair w=
ith
> a put_user_page(). I find above commit message bit unclear from that POV.
>=20

OK. This one, and the fs/io_uring (patch 9) and net/xdp (patch 10) were all
cases that had put_user_page() pre-existing. I will add something like the=
=20
following to each commit description, for v3:

In partial anticipation of this work, the drm/via driver was already=20
calling put_user_page() instead of put_page(). Therefore, in order to
convert from the get_user_pages()/put_page() model, to the
pin_user_pages()/put_user_page() model, the only change required
is to change get_user_pages() to pin_user_pages().

thanks,

John Hubbard
NVIDIA

> Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>
>=20
>=20
>> ---
>>  drivers/gpu/drm/via/via_dmablit.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/via/via_dmablit.c b/drivers/gpu/drm/via/via=
_dmablit.c
>> index 3db000aacd26..37c5e572993a 100644
>> --- a/drivers/gpu/drm/via/via_dmablit.c
>> +++ b/drivers/gpu/drm/via/via_dmablit.c
>> @@ -239,7 +239,7 @@ via_lock_all_dma_pages(drm_via_sg_info_t *vsg,  drm_=
via_dmablit_t *xfer)
>>  	vsg->pages =3D vzalloc(array_size(sizeof(struct page *), vsg->num_page=
s));
>>  	if (NULL =3D=3D vsg->pages)
>>  		return -ENOMEM;
>> -	ret =3D get_user_pages_fast((unsigned long)xfer->mem_addr,
>> +	ret =3D pin_user_pages_fast((unsigned long)xfer->mem_addr,
>>  			vsg->num_pages,
>>  			vsg->direction =3D=3D DMA_FROM_DEVICE ? FOLL_WRITE : 0,
>>  			vsg->pages);
>> --=20
>> 2.23.0
>>
>=20
>=20
