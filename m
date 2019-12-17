Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA52122DF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 15:05:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cfzy3cZ2zDqRD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 01:05:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="GbGZzaEh"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cfsX429xzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 00:59:59 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8df4b0000>; Tue, 17 Dec 2019 05:59:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 17 Dec 2019 05:59:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 17 Dec 2019 05:59:49 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 13:59:48 +0000
Subject: Re: [RFC PATCH] mm/gup: try_pin_compound_head() can be static
To: kbuild test robot <lkp@intel.com>
References: <20191211025318.457113-24-jhubbard@nvidia.com>
 <20191217080358.q3k57ta62txvip5h@4978f4969bb8>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7828a101-e422-8e2a-ef9b-9c0285065ed5@nvidia.com>
Date: Tue, 17 Dec 2019 05:56:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217080358.q3k57ta62txvip5h@4978f4969bb8>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576591180; bh=+kY6WrbKA7lSfaR6JiJsMhpW0kY3DW4edAlAk5Ve1Ws=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GbGZzaEh7giluV7bpN/IIAOj3Mc18AXcjLeuEGsTgM8/schRNFGUqCq00YAc4ARRK
 0PVe1s7+qdvFmh1Ttru614AJtLodM6wJzZ2UNnA1jIm2+JCvQssDVh7rwrwji91hSp
 Dmomrx8a2mkRdKDi+zuehTjS+cK+ceZUGuV2qS+Q00TgS6unnj2J/spZ+jPwNEGl3X
 xJTAKof+O0alRzDH3cC7VTlXjNJwIWhcBZya8mbb62MvfcrAHYE78VekfobHefcZXx
 ueLyg5p/jxUNWHBbbcLlFxuQBAi3TiHxhM/GsO23RipjSLUTZwruxA+61/WfeUhUby
 xcvllM2I0K27A==
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
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 kbuild-all@lists.01.org, netdev@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/17/19 12:03 AM, kbuild test robot wrote:
> 
> Fixes: 8086d1c61970 ("mm/gup: track FOLL_PIN pages")
> Signed-off-by: kbuild test robot <lkp@intel.com>
> ---
>   gup.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 038b71165a761..849a6f55938e6 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -75,7 +75,7 @@ static inline struct page *try_get_compound_head(struct page *page, int refs)
>    * @Return:	the compound head page, with ref appropriately incremented,
>    * or NULL upon failure.
>    */
> -__must_check struct page *try_pin_compound_head(struct page *page, int refs)
> +static __must_check struct page *try_pin_compound_head(struct page *page, int refs)
>   {
>   	struct page *head = try_get_compound_head(page,
>   						  GUP_PIN_COUNTING_BIAS * refs);
> 

Yes, it should have been declared static. And this also applies to the latest version
(v11). The preferred fix would stay within 80 columns, like this:

diff --git a/mm/gup.c b/mm/gup.c
index c2793a86450e..39b2f683bd2e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -75,7 +75,8 @@ static inline struct page *try_get_compound_head(struct page *page, int refs)
   * @Return:    the compound head page, with ref appropriately incremented,
   * or NULL upon failure.
   */
-__must_check struct page *try_pin_compound_head(struct page *page, int refs)
+static __must_check struct page *try_pin_compound_head(struct page *page,
+                                                      int refs)
  {
         struct page *head = try_get_compound_head(page,
                                                   GUP_PIN_COUNTING_BIAS * refs);


thanks,
-- 
John Hubbard
NVIDIA
