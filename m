Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948A13B388
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 21:17:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47y1vl3f9XzDqS3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 07:17:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=bNQcHd+k; dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47y1sb3QSSzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 07:15:14 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1e21390001>; Tue, 14 Jan 2020 12:14:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 14 Jan 2020 12:15:09 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 14 Jan 2020 12:15:09 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 20:15:09 +0000
Subject: Re: [PATCH v12 00/22] mm/gup: prereqs to track dma-pinned pages:
 FOLL_PIN
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
 <2a9145d4-586e-6489-64e4-0c54f47afaa1@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9d7f3c1a-6020-bdec-c513-80c5399e55d7@nvidia.com>
Date: Tue, 14 Jan 2020 12:15:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2a9145d4-586e-6489-64e4-0c54f47afaa1@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579032890; bh=wLxNzNFRStaOZ7jAQIV4tH1wBKaWmBKZBOUdkq/PVGQ=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=bNQcHd+kt2S6qArSD90PMkNX5LSRoo2toPf1fdY/D3ysgVjnnuMPbcBLvU4mGjBbT
 LR4uZiIEi3/mAViybdXB1PH001dny/ndD230xDMGlhs7NAYpQR6mGLaj5Fl0H44uol
 s/WH8SaFGbiYHrC+Jf2F7bChe3A2NqguquLvhseggPHll2epR/FoT6c0YMA6JGSKkp
 eSDWR40pps95gbxdKKvy2DClT3lBSMdUwcemTQnf2Jrxy6nLuQLIDhcegQ+kyGcscI
 uknj/1R1Mw2ETSzcXASW/vo/Q3g+SHupTZUPph9j3ZAnq/QlpAxhi10ckpA46Ke/0I
 HjefW3dJ5Akvg==
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/9/20 2:07 PM, John Hubbard wrote:
> On 1/7/20 2:45 PM, John Hubbard wrote:
>> Hi,
>>
>> The "track FOLL_PIN pages" would have been the very next patch, but it is
>> not included here because I'm still debugging a bug report from Leon.
>> Let's get all of the prerequisite work (it's been reviewed) into the tree
>> so that future reviews are easier. It's clear that any fixes that are
>> required to the tracking patch, won't affect these patches here.
>>
>> This implements an API naming change (put_user_page*() -->
>> unpin_user_page*()), and also adds FOLL_PIN page support, up to
>> *but not including* actually tracking FOLL_PIN pages. It extends
>> the FOLL_PIN support to a few select subsystems. More subsystems will
>> be added in follow up work.
>>
> 
> Hi Andrew and all,
> 
> To clarify: I'm hoping that this series can go into 5.6.
> 
> Meanwhile, I'm working on tracking down and solving the problem that Leon
> reported, in the "track FOLL_PIN pages" patch, and that patch is not part of
> this series.
> 

Hi Andrew and all,

Any thoughts on this?

As for the not-included-yet tracking patch, my local testing still suggests the
need to allow for larger refcounts of huge pages (in other words, I can write a test
to pin huge pages many times, and overflow with the same backtrace that Leon has
reported).

The second struct page (I recall Jan suggested) can hold those, so I'm going to proceed
with that approach, while waiting to see if Leon has any more test data for me.

Again, I think this series is worth getting out of the way, in the meantime.


thanks,
-- 
John Hubbard
NVIDIA
