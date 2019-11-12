Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75CF9E1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 00:20:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNyB0wy7zF5Y5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="p3qYKNzV"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CNtw1zvZzF5sY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:17:27 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb3d4b0000>; Tue, 12 Nov 2019 15:16:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 15:17:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 15:17:23 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 23:17:22 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <85987617-9f6b-6bd3-fea2-9f2910d942bd@nvidia.com>
Date: Tue, 12 Nov 2019 15:17:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573600587; bh=MjC1bPxvrMSKZyR0vfIkph3DH21vc9F8lPoYeam7DCg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=p3qYKNzVf+yoWXVxXvdWjvLLch3+eBgZBZPzM5iL19+w8RiUo7ZDiZ6gW1HFxWncA
 +kkprqimeUO8SSqHdah/r3BwJo4tDay3qaFNXlfKQCKgL2mn5vpeQtNa9DXVDSKAs9
 R4vcNKCywQ8SHP3DUh8n5njcCPN6pw3P07lAmh8mqH74Fvgl1XHO+C/rjd/05WqSfr
 CbI8v19uMzgduDq6l5KCW1YAmvvVqDA87KUBJVym8vf0Kv0kKAaenl3Op2+6yladeP
 PH6kHbkLvI9QcVfTqnjU+9eG71rPYcWHuFxhGzrL4Y4JAkS0eHU4rmGDiCKR0r+10R
 ZzG6cdcgSU6Ww==
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/12/19 2:45 PM, Dan Williams wrote:
> On Tue, Nov 12, 2019 at 2:43 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 11/12/19 12:43 PM, Jason Gunthorpe wrote:
>> ...
>>>> -            }
>>>> +    ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
>>>> +                                page, vmas, NULL);
>>>> +    /*
>>>> +     * The lifetime of a vaddr_get_pfn() page pin is
>>>> +     * userspace-controlled. In the fs-dax case this could
>>>> +     * lead to indefinite stalls in filesystem operations.
>>>> +     * Disallow attempts to pin fs-dax pages via this
>>>> +     * interface.
>>>> +     */
>>>> +    if (ret > 0 && vma_is_fsdax(vmas[0])) {
>>>> +            ret = -EOPNOTSUPP;
>>>> +            put_page(page[0]);
>>>>      }
>>>
>>> AFAIK this chunk is redundant now as it is some hack to emulate
>>> FOLL_LONGTERM? So vmas can be deleted too.
>>
>> Let me first make sure I understand what Dan has in mind for the vma
>> checking, in the other thread...
> 
> It's not redundant relative to upstream which does not do anything the
> FOLL_LONGTERM in the gup-slow path... but I have not looked at patches
> 1-7 to see if something there made it redundant.
> 

There is nothing in patches 1-7 that would make it redundant. 

About the only thing that you might find interesting in that subset is
patch 4 ("mm: devmap: refactor 1-based refcounting for ZONE_DEVICE pages"),
for devmap and ZONE_DEVICE interest. But it doesn't affect this
discussion directly.


thanks,
-- 
John Hubbard
NVIDIA
