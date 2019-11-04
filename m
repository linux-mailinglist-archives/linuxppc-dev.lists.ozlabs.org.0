Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9148AEEA03
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:42:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Pqm1P3gzF3sc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="NHQ1Q0ia"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Pnz00fMzF47n
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:40:54 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc08cd80000>; Mon, 04 Nov 2019 12:40:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 12:40:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 Nov 2019 12:40:49 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 20:40:48 +0000
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
 <20191104203117.GE30938@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1c428985-6ede-ef75-62bd-26ccf99f6d38@nvidia.com>
Date: Mon, 4 Nov 2019 12:40:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104203117.GE30938@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572900056; bh=DgUGakiDqU+H/jvLHI+F9dgZlEqXtDj8YZcQ5jdUUnc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=NHQ1Q0iautz1x5eS1rpVt2XzAK+GdsKg4fHxuWzyx4M7tJpV+1UB6d5ZpY+LJM8ME
 TR31xYhwAxi1K+5UUf+wF2rdwAdcBiJd7g9PZ9zQdxs0smNT0eXx/EK23GNTVWWsim
 vmxoebMT8yRD8emjw4hl+mywMz6dGLzA9qU4y5rdocqaRh8e0dGYAC8/oxGzxQkYvT
 MWkQm/cvgwbgyxMEdYQt09KoKCaZDdAw2q8ktAtZsrow9mFYWcec570DR/POlaG1aB
 FjnA7v+FO5AVWFmkxPStSbC6bck0U4AV8Oy7tJVJh18dLUfTlW6x2kgIg6rLYkBdDJ
 g//zR0Vfe3smA==
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
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/4/19 12:31 PM, Jason Gunthorpe wrote:
> On Mon, Nov 04, 2019 at 12:09:05PM -0800, John Hubbard wrote:
> 
>> Note for Jason: the (a) or (b) items are talking about the vfio case, which is
>> one of the two call sites that now use pin_longterm_pages_remote(), and the
>> other one is infiniband:
>>
>> drivers/infiniband/core/umem_odp.c:646:         npages = pin_longterm_pages_remote(owning_process, owning_mm,
> 
> This is a mistake, it is not a longterm pin and does not need FOLL_PIN
> semantics

OK! So it really just wants to be get_user_pages_remote() / put_page()? I'll
change it back to that.

> 
>> Jason should weigh in on how he wants this to go, with respect to branching
>> and merging, since it sounds like that will conflict with the hmm branch 
> 
> I think since you don't need to change this site things should be
> fine?
> 

Right. 


thanks,

John Hubbard
NVIDIA
