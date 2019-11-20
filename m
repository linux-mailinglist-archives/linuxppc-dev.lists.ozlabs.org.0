Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084B1034CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 08:04:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Htwz1MPkzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 18:04:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="aoAjA12T"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Htv965Z9zDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 18:03:17 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd4e52b0000>; Tue, 19 Nov 2019 23:03:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 23:03:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 23:03:11 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Nov
 2019 07:03:10 +0000
Subject: Re: [PATCH v6 15/24] fs/io_uring: set FOLL_PIN via pin_user_pages()
To: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-16-jhubbard@nvidia.com>
 <2ae65d1b-a3eb-74ed-afce-c493de5bbfd3@kernel.dk>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <42c80c0a-ad2c-fe74-babd-57680882c7e2@nvidia.com>
Date: Tue, 19 Nov 2019 23:03:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2ae65d1b-a3eb-74ed-afce-c493de5bbfd3@kernel.dk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574233387; bh=ccH+u52vDWCSpx4Mj41DBPFk4Bnr7E1/buLUhbEm50I=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=aoAjA12TDjtYHcqzP6KlOL/T+xFannzF2Ut7WBeMCWKWq7l/9YzjhnMxWFHzZfpR5
 Iws/71eVjdglCRCFx0borbQjrcWdlbhRBVNYLCTSxJhf+kal1fvOFNYQqlhw4wL9J6
 MFYFTVnA4OaNermjnVJWu68MlONq0QSjgN/vAiaH7Huv88r7BI/N2hl/4JJ3pl29Td
 suI6xx3hgozM4FOPwAaNkBjGwwYRC1+cHh6/xlUHPqKTdx1Jisq/17DuqUYf/0K2Yd
 KJ8+BKNAyQOQiWBn8l76F+wCEq0it7z2sVeN/sAFeVR43NYKvAY4EyGL+PsQeLhyI4
 eAwjKJTXDphsw==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/19/19 8:10 AM, Jens Axboe wrote:
> On 11/19/19 1:16 AM, John Hubbard wrote:
>> Convert fs/io_uring to use the new pin_user_pages() call, which sets
>> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
>> tracking of pinned pages, and therefore for any code that calls
>> put_user_page().
>>
>> In partial anticipation of this work, the io_uring code was already
>> calling put_user_page() instead of put_page(). Therefore, in order to
>> convert from the get_user_pages()/put_page() model, to the
>> pin_user_pages()/put_user_page() model, the only change required
>> here is to change get_user_pages() to pin_user_pages().
>>
>> Reviewed-by: Jan Kara <jack@suse.cz>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> You dropped my reviewed-by now... Given the file, you'd probably want
> to keep that.

Hi Jens,

Yes, I was being too conservative I guess. I changed the patch somewhat
and dropped the reviewed-by because of those changes...I'm adding it
back for v7 based on this, thanks!

thanks,
-- 
John Hubbard
NVIDIA
 
