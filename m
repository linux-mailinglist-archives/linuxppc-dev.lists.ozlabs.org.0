Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225F12863D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 01:55:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fnGk6wDszDqvW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 11:55:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="gT92UnAP"; 
 dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fnDn13bSzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 11:54:00 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfd6d050000>; Fri, 20 Dec 2019 16:53:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 20 Dec 2019 16:53:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 20 Dec 2019 16:53:56 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 21 Dec
 2019 00:53:51 +0000
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Dan Williams <dan.j.williams@intel.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191220092154.GA10068@quack2.suse.cz>
 <CAPcyv4gYnXE-y_aGehazzF-Kej5ibSfqvE2hTnjKJD68bm8ANg@mail.gmail.com>
 <437f2bff-13ba-0ae9-2f3c-bc8eb82d20f0@nvidia.com>
 <CAPcyv4hMvTmb5X8gNtXnapJFR1qej1bKto2fvv9zUtebHMhvVw@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <12a28917-f8c9-5092-2f01-92bb74714cae@nvidia.com>
Date: Fri, 20 Dec 2019 16:53:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hMvTmb5X8gNtXnapJFR1qej1bKto2fvv9zUtebHMhvVw@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576889605; bh=tpI8g3cGtI3RbtQKzNDwLh+jY1UnQFhrLmQoaZFESA8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=gT92UnAPvjWo9Dyarc3BsQj2Nl0ZSZOB5xO5S1hvSTkAn6HQKFYCbmGMns41Asul4
 eMkGBYUVekYb1GDqzt3tUGEwYX/qiLyAv9PBah19Qnk9kLrPhGqoza8LPYP20EKh8A
 rpksQuLIxtU3WgPWODyJ4Q9+O1Y8CfsR7+NeFhDEz5kdhRtxtRV/c4gCIoz4Xh2tr4
 dqYIG3iAXmQiFA+EerZ5Kzd0MzHGZsUPeYIr/zdgX84A5MWU+lGn2mDX6OuVhtBYkB
 sM9JvXEn3c8apvXt6FAkZHRg4c2qB8/6lfd0asa7z5htLXf1pi4lQc9aIPZeePVDOP
 YXljCFL0SkWSA==
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Shuah
 Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>, Mike
 Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/20/19 4:51 PM, Dan Williams wrote:
> On Fri, Dec 20, 2019 at 4:41 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 12/20/19 4:33 PM, Dan Williams wrote:
>> ...
>>>> I believe there might be also a different solution for this: For
>>>> transparent huge pages, we could find a space in 'struct page' of the
>>>> second page in the huge page for proper pin counter and just account pins
>>>> there so we'd have full width of 32-bits for it.
>>>
>>> That would require THP accounting for dax pages. It is something that
>>> was probably going to be needed, but this would seem to force the
>>> issue.
>>>
>>
>> Thanks for mentioning that, it wasn't obvious to me yet.
>>
>> How easy is it for mere mortals outside of Intel, to set up a DAX (nvdimm?)
>> test setup? I'd hate to go into this without having that coverage up
>> and running. It's been sketchy enough as it is. :)
> 
> You too can have the power of the gods for the low low price of a
> kernel command line parameter, or a qemu setup.
> 
> Details here:
> 
> https://nvdimm.wiki.kernel.org/how_to_choose_the_correct_memmap_kernel_parameter_for_pmem_on_your_system
> https://nvdimm.wiki.kernel.org/pmem_in_qemu
> 

Sweeeet! Now I can really cause some damage. :)

thanks,
-- 
John Hubbard
NVIDIA
