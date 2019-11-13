Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFA0FB9D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:29:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cx6L4SJxzF4dR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 07:29:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="blBmwo40"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cx4C4C2czF7CP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 07:27:23 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc66ef0001>; Wed, 13 Nov 2019 12:26:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 12:27:19 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 13 Nov 2019 12:27:19 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 20:27:18 +0000
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Ira Weiny <ira.weiny@intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113185902.GB12915@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <d5b14492-45a9-914e-92db-29592c3634e5@nvidia.com>
Date: Wed, 13 Nov 2019 12:24:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113185902.GB12915@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573676784; bh=ZP9QEqV97zzS7vyaMLJBGQGSKGW2tyNWtWpkiSoCJc4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=blBmwo40hUXWDReswYBJ9TKWl7H2L/k0XDDTqLc9LkITedj/TfVhMrycxbdicryg9
 h3wCNANbDFiVSj6oyHjfFnRbLVuCRi3pWpRJRe/jbCLOFnYnWP5+VYQpU1VxmX02Oe
 x63ynn9Lg49xuQZl/cSCofyxC/5cUmsD/0Qztzy4aTmtjHXl5koB/p/oGnI3O50jC6
 JimPfnxSS5Hd9PocW7OekFWFS3ot4vxXyyvMqqBzeRQ9mC6jlTWwR4/WgqeBc/ncw1
 PM3rgjSIKR9vLy74nuxe2z7dV2iTNewdvjl7FyfEINYcs/7W4YGwW/FeVW7CmMMCVV
 2lZpQK+CR/Twg==
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/13/19 10:59 AM, Ira Weiny wrote:
> On Tue, Nov 12, 2019 at 08:26:56PM -0800, John Hubbard wrote:
>> Introduce pin_user_pages*() variations of get_user_pages*() calls,
>> and also pin_longterm_pages*() variations.
>>
>> These variants all set FOLL_PIN, which is also introduced, and
>> thoroughly documented.
>>
>> The pin_longterm*() variants also set FOLL_LONGTERM, in addition
>> to FOLL_PIN:
>>
>>      pin_user_pages()
>>      pin_user_pages_remote()
>>      pin_user_pages_fast()
>>
>>      pin_longterm_pages()
>>      pin_longterm_pages_remote()
>>      pin_longterm_pages_fast()
> 
> At some point in this conversation I thought we were going to put in "unpin_*"
> versions of these.
> 
> Is that still in the plans?
> 

Why yes it is! :)  Daniel Vetter and Jan Kara both already weighed in [1],
in favor of "unpin_user_page*()", rather than "put_user_page*()".

I'll change those names.

[1] https://lore.kernel.org/r/20191113101210.GD6367@quack2.suse.cz


thanks,
-- 
John Hubbard
NVIDIA
