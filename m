Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE71A339A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 13:54:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yfhN2M22zDr1x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 21:54:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=gerhard_pircher@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=ige5/26o; 
 dkim-atps=neutral
X-Greylist: delayed 349 seconds by postgrey-1.36 at bilbo;
 Thu, 09 Apr 2020 21:53:13 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yffd2KcYzDqxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 21:53:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586433181;
 bh=YwvQtuxsbR6y98B1sZKqlpMCtNJicqz5rAzgfjwA858=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ige5/26otdkj9K9Oz5zaazi4r4b9UhHqcKPB5hI58UMZ1v/OGLNt73VzXRRLD4CEs
 HN8t/iyLkWv26NSWv26cbwoucrPojWId1/PtDkSNSTBqxmyCzZ/t6EBfzRuMN1AvgH
 2jfcJws6HLougfcIZ6buv8sT6xSFccERZHEQvqFA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.10.46] ([88.151.74.233]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1inRw81Wvw-00ZMlH; Thu, 09
 Apr 2020 13:46:32 +0200
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
 <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
From: Gerhard Pircher <gerhard_pircher@gmx.net>
Openpgp: preference=signencrypt
Autocrypt: addr=gerhard_pircher@gmx.net; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d4a82787-5dd2-ccde-79b4-ff44848ba04e@gmx.net>
Date: Thu, 9 Apr 2020 13:46:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-AT
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o+8/nGO7SOvNhc10lyIj+DkVb/dgMNqZpIt89ODEsaP3R7B372X
 CFPKuGNuA413MUsQR7p9FFMdVf2IGA0u9bDZzYzGrskLoPKL+wG3y7FqWmsmvBINib9zAPL
 3+lKCFTcgREGV5zEJOsGaHNHNnIcRaOpWMIoYXGs9KxywGC6t08XQ4CP1jARTv/jpZPK/Xs
 zfGB7nB7x/W8Ea7CqI8kA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PGvDBf0mF10=:ztmzkgVR6RPUnFo4i9rAEW
 E+ZN1nUgVxmxndeaP6f2jVJhVQ6Sb5juyVeW8JOhUemT0rdbwrEYjyiliedkTw8HL4wzgiS38
 7pjkoNWW5gLQ4nK25qWlSRy1iSe7ZJw3K9PtnwtpWEykJikJ96wWbAULfP7kjaN46g+KOBsS7
 kbydhGyXM9vlyItNwvjWl/ULjKvrDwnbQZPeUYx3lFqd5ts2sC+2gGeztrYmLxklWiJOGdvo0
 aZVc4qQVErLl0Ru6BEuRMusp1+ZXzIIeQ8YiNp67PoP1Dm7lSjh5fDq1uYd4P25AVhk39JRh3
 c2+HbM1I+sDeNm76ProT1UzgqFajwceSF7Mk0RE+gEanebZZI6FzzBHtE/wU/pQnn3c+31ftg
 9LDVkxHTqklQqPIGOUJOzd9kMhb08nCWmPkpb7I3leg2FmBq3sBxvRXbizfn/+7lWnU2ZwtBY
 JjL+oTzYBwNOpLX3tGRyLD18aHJT8Sv+IhUeLisDlttG/XUdMns3jKDysvQ3qE4+y7GMdUp+s
 j4rcrO4MR0gECGCFF0yeW8VY4IY9HGPsRr0WB+6w0C5Ibgas/9KEkM5rZZZXWv4y7qwFqsRBN
 EMUQ3nI8W/u+i6CqQ8HycL5KN++O+ikghqCWUaNEyclH16MU7+udx0B+Xg0Is7N7qGfNwLqXe
 zN0EZmIUuzyNHCb0hOb3W/cpI/vPGPLVCb1bjaPHIZ+U45EB6hJkJMXCUFS5aiXJ+mLU0HYwc
 9PTvPGlxbyy19LbX9ViwPpbORyY2gV7TfQdfIdY5+dewf64aoSYAWlvwu8+VDxULlpNoQIl+2
 kRPqHrq7R3fyPByA220xtUc0aq+LFv7i1l3AW+awdyPvPNxFoKiQxa4RxYT5xPWVsDpaUN/wq
 3z4re5UzWy+r7DwSd2WIZbc8HdDKnbIblmnDwK3ins+7xl4710+pXs5ZNlcMDsx01rpYGctuB
 +iL6appfC2s3GaTj+JlxPjkq3f/iujFcd8JYNn7rAerouV4IL4Q1h5wiRaknxpfhW3iu3K0fd
 RlKGPjvpr7Yc4enbTWLwO+YJIghSk5qFWyL6WedyMHkTT2TF4yaPxLs/j5coh6Xf+YIfQ5t1L
 zezijN56xKFRUaalGfQUtzRND2xXLHSwnJskOF+HiAWlGG4+DrH3YpDXJNe2Jxb3TlT6tSFSN
 3ymXEiXA1frIHzNUx5Q4nSSQf0lmxB4QaucHkOWcEqggsKZgRBi8U2DK/kGZwHLP8+Xvppwoa
 4G7ssOtgMaiLpXx5/
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 bpf@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 09.04.20 um 10:54 schrieb Benjamin Herrenschmidt:
> On Wed, 2020-04-08 at 14:25 +0200, Daniel Vetter wrote:
>> On Wed, Apr 08, 2020 at 01:59:17PM +0200, Christoph Hellwig wrote:
>>> If this code was broken for non-coherent caches a crude powerpc hack
>>> isn't going to help anyone else.  Remove the hack as it is the last
>>> user of __vmalloc passing a page protection flag other than PAGE_KERNE=
L.
>>
>> Well Ben added this to make stuff work on ppc, ofc the home grown dma
>> layer in drm from back then isn't going to work in other places. I gues=
s
>> should have at least an ack from him, in case anyone still cares about
>> this on ppc. Adding Ben to cc.
>
> This was due to some drivers (radeon ?) trying to use vmalloc pages for
> coherent DMA, which means on those 4xx powerpc's need to be non-cached.
>
> There were machines using that (440 based iirc), though I honestly
> can't tell if anybody still uses any of it.
The first-gen amigaone platform (6xx/book32s) uses the radeon driver
together with non-coherent DMA. However this only ever worked reliably
for DRI1.

br,
Gerhard

> Cheers,
> Ben.
>
>> -Daniel
>>
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> ---
>>>  drivers/gpu/drm/drm_scatter.c | 11 +----------
>>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatt=
er.c
>>> index ca520028b2cb..f4e6184d1877 100644
>>> --- a/drivers/gpu/drm/drm_scatter.c
>>> +++ b/drivers/gpu/drm/drm_scatter.c
>>> @@ -43,15 +43,6 @@
>>>
>>>  #define DEBUG_SCATTER 0
>>>
>>> -static inline void *drm_vmalloc_dma(unsigned long size)
>>> -{
>>> -#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
>>> -	return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL))=
;
>>> -#else
>>> -	return vmalloc_32(size);
>>> -#endif
>>> -}
>>> -
>>>  static void drm_sg_cleanup(struct drm_sg_mem * entry)
>>>  {
>>>  	struct page *page;
>>> @@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, vo=
id *data,
>>>  		return -ENOMEM;
>>>  	}
>>>
>>> -	entry->virtual =3D drm_vmalloc_dma(pages << PAGE_SHIFT);
>>> +	entry->virtual =3D vmalloc_32(pages << PAGE_SHIFT);
>>>  	if (!entry->virtual) {
>>>  		kfree(entry->busaddr);
>>>  		kfree(entry->pagelist);
>>> --
>>> 2.25.1
>>>
>>
>>
>

