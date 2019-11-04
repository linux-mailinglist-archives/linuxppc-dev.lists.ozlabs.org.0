Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F781EE83C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 20:22:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476N3f5tjhzF0nY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 06:22:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="RSIwXbFs"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476N1T6GqVzF3y2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 06:20:45 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc07a0d0000>; Mon, 04 Nov 2019 11:20:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 11:20:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 Nov 2019 11:20:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 19:20:38 +0000
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
To: Ira Weiny <ira.weiny@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Alex
 Williamson <alex.williamson@redhat.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn.topel@intel.com>, Christoph Hellwig <hch@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Chinner <david@fromorbit.com>, David Airlie
 <airlied@linux.ie>, "David S . Miller" <davem@davemloft.net>, Jan Kara
 <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, 
 Jonathan Corbet <corbet@lwn.net>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, Paul
 Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>, Vlastimil Babka
 <vbabka@suse.cz>, <bpf@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <kvm@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <netdev@vger.kernel.org>, <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-10-jhubbard@nvidia.com>
 <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
 <20191104181055.GP10326@phenom.ffwll.local>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
Date: Mon, 4 Nov 2019 11:20:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104181055.GP10326@phenom.ffwll.local>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572895245; bh=EB1gpI7uMEMtuW6gqSsThU4ex+aDzj2XSFqSPP65uaQ=;
 h=X-PGP-Universal:Subject:To:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RSIwXbFsNa3f/kTT6RqCBQLIY2aWqQWAD7FlV+0bWeNT3hEciNmSZuNvV8pRpiJ60
 e0uuS+69VcqG5oSf1sUWyzF8VcAyrTkMNNj6cdJS8AAil4vorCfa5P65SfRcv9q+8W
 ozPTc/Fbb2bfj8cusatLemt7LHz5SiJ0UgONgHLAjPrqgZGNa3lTKALNJJ+BVOOS2G
 swfgIWoBY2ZTyveZdj73jKp2eTRQ1+8Juf5FFDph3sRYNFXeKwps7p0UPOflB7r3qQ
 0n1vN231W3z0bEfLz8HLukYIiIePPvBbH2GdVFu8NRMpfQ7l8VNrixKxs7UGVoyxrS
 ECmh2kltaw5mA==
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/4/19 10:10 AM, Daniel Vetter wrote:
> On Thu, Oct 31, 2019 at 04:36:28PM -0700, Ira Weiny wrote:
>> On Wed, Oct 30, 2019 at 03:49:20PM -0700, John Hubbard wrote:
>>> Convert drm/via to use the new pin_user_pages_fast() call, which sets
>>> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
>>> tracking of pinned pages, and therefore for any code that calls
>>> put_user_page().
>>>
>>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> 
> No one's touching the via driver anymore, so feel free to merge this
> through whatever tree suits best (aka I'll drop this on the floor and
> forget about it now).
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 

OK, great. Yes, in fact, I'm hoping Andrew can just push the whole series
in through the mm tree, because that would allow it to be done in one 
shot, in 5.5


thanks,

John Hubbard
NVIDIA
