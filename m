Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625BF9DE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 00:13:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNp56x2TzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:13:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="JvY3zmeT"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CNhQ65bLzF1P8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:08:22 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb3b5e0001>; Tue, 12 Nov 2019 15:08:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 15:08:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 15:08:15 -0800
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 23:08:14 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
 <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
Date: Tue, 12 Nov 2019 15:08:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573600094; bh=ZOGE9U96RXAj3ATG1sqbSZZ5kwKlu8c/XBmXyMkeZ/I=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JvY3zmeTvnqgCyD2eBvVojVMLoe0aW2k69Nce6daGQNuZS4OsQi4vkVZmA+1GnELv
 9AW/hBWdwsnm9M2X9ccJ1Q1EuL87OWE6ERhYkDbGlO9dGbrg5s9odv3o6SDYGWmMVY
 GNUfTamy0raCrCHfMqKxT3RFwaKftzmGLH4kXtE5Nu/om60pfZAwk5XUuEq4+pDXr9
 TOA3eiznp+/2/rv+84vF++CRsbBzx7ZRqbdYYs2TfJtMqwkIwZn6qPEjYpAQ+i4CU4
 MYXtb4n7BN0I9m2qMiQj4POMqt1O9QnTa/T3NAcLAnwom6J6Dq4eXTwoMi4Hyuf3+0
 zpRS7T71BD4vw==
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/12/19 2:43 PM, Dan Williams wrote:
... 
> Ah, sorry. This was the first time I had looked at this series and
> jumped in without reading the background.
> 
> Your patch as is looks ok, I assume you've removed the FOLL_LONGTERM
> warning in get_user_pages_remote in another patch?
> 

Actually, I haven't gone quite that far. Actually this patch is the last
change to that function. Therefore, at the end of this patchset, 
get_user_pages_remote() ends up with this check in it which
is a less-restrictive version of the warning:

	/*
	 * Current FOLL_LONGTERM behavior is incompatible with
	 * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
	 * vmas. However, this only comes up if locked is set, and there are
	 * callers that do request FOLL_LONGTERM, but do not set locked. So,
	 * allow what we can.
	 */
	if (gup_flags & FOLL_LONGTERM) {
		if (WARN_ON_ONCE(locked))
			return -EINVAL;
	}

Is that OK, or did you want to go further (possibly in a follow-up
patchset, as I'm hoping to get this one in soon)?  

...
>>> I think check_vma_flags() should do the ((FOLL_LONGTERM | FOLL_GET) &&
>>> vma_is_fsdax()) check and that would also remove the need for
>>> __gup_longterm_locked.
>>>
>>
>> Good idea, but there is still the call to check_and_migrate_cma_pages(),
>> inside __gup_longterm_locked().  So it's a little more involved and
>> we can't trivially delete __gup_longterm_locked() yet, right?
> 
> [ add Aneesh ]
> 
> Yes, you're right. I had overlooked that had snuck in there. That to
> me similarly needs to be pushed down into the core with its own FOLL
> flag, or it needs to be an explicit fixup that each caller does after
> get_user_pages. The fact that migration silently happens as a side
> effect of gup is too magical for my taste.
> 

Yes. It's an intrusive side effect that is surprising, and not in a 
"happy surprise" way. :) .   Fixing up the CMA pages by splitting that
functionality into separate function calls sounds like an improvement
worth exploring.


thanks,
-- 
John Hubbard
NVIDIA
