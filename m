Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287111A005
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 01:31:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XdCK44glzDqBL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 11:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="ZsA1gWWz"; 
 dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xd7D132NzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 11:27:51 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df037ed0000>; Tue, 10 Dec 2019 16:27:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 16:27:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 10 Dec 2019 16:27:47 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 00:27:46 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 00:27:45 +0000
Subject: Re: [PATCH v8 23/26] mm/gup: pass flags arg to __gup_device_*
 functions
To: Jan Kara <jack@suse.cz>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-24-jhubbard@nvidia.com>
 <20191210124957.GG1551@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <017cb337-99f0-785c-7fd9-223d3f05e840@nvidia.com>
Date: Tue, 10 Dec 2019 16:27:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210124957.GG1551@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576024046; bh=qun8cg/sHOBwx96E42yhjWjklRPzRNtkdXEjGWJis9k=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ZsA1gWWzEMoxNw4sGMBn0IB6PCN0ayjG1bjHlLTvRKvZNYWfFY6GadphhHH5/oXSG
 JeeIACrDEldkCsiwLSqi7Sb/+s/lrstUEM6ZSkaa3ocFKRVk5BHiT+XSKQ7ZrvWG+N
 y0FLTJm8bSQI8BERNijJq98G8+9Vm3vXUx29fLwfgq+J6rOLjwbNTnpcEijsnqylin
 SaZDw8jS4hgJd1nkfZeanVmYjGG39ms/U3WiHxJYVbPGGDJYFEo916VNZt+5U5P0Or
 fjh47kokYfS4lafjqrrwAa0dWo+eZljJp5xfyflXDQpDbHXAnqoG/R22NwcPm4jWYI
 CAgkYrlfpd8+A==
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
 linux-media@vger.kernel.org, Shuah
 Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike
 Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/10/19 4:49 AM, Jan Kara wrote:
> On Mon 09-12-19 14:53:41, John Hubbard wrote:
>> A subsequent patch requires access to gup flags, so pass the flags
>> argument through to the __gup_device_* functions.
>>
>> Also placate checkpatch.pl by shortening a nearby line.
>>
>> TODO: Christoph Hellwig requested folding this into the patch the uses
>> the gup flags arguments.
> 
> You should probably implement this TODO? :)
> 
> 								Honza

Yes. Done for v9.

thanks,
-- 
John Hubbard
NVIDIA
