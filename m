Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0436DAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 09:46:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KHlV2M3xzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 17:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="h3LHlMdQ"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KHjN24HrzDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 17:44:08 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf8c4430001>; Thu, 06 Jun 2019 00:44:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 00:44:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 00:44:04 -0700
Received: from ngvpn01-171-236.dyn.scz.us.nvidia.com (10.124.1.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 6 Jun 2019 07:44:02 +0000
Subject: Re: [PATCH 12/16] mm: consolidate the get_user_pages* implementations
To: Christoph Hellwig <hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-13-hch@lst.de>
 <b0b73eae-6d79-b621-ce4e-997ccfbf4446@nvidia.com>
 <20190606062018.GA26745@lst.de>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f7ccf08d-b269-c5e9-7a86-0b5c6176a7c3@nvidia.com>
Date: Thu, 6 Jun 2019 00:44:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606062018.GA26745@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1559807044; bh=mMOlfiNeriS8dHk456D4i2uPqqdGUdRNA/UjahArgCQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=h3LHlMdQHamD4aUSwPzeTds3U6FI5EEYLkWJ4CyKjK6e+LboNBSAbcSHpVs2ab/a6
 z9eQd8NbRaW2yWXClwhhhoDwI/Bg8V5MhP9jYxjADW4on9H1UbzwmFXUvBa2QQc0YP
 3BZxHfWSY+4OVCEed52WcnU8jW1oCIuqanuBVjnZxsQlD1tSrzhAGFH+mkQujZW9MV
 3WEIf8zeYJc6hdtRCd3LqEJefWg6Q5t5xgsR/hrqbzz+0tbm21c1EGeCCpOskwezjW
 2zGjfIhkSG9BX9aupNObBuuWNlgR4cVZm3rSLITraOByP9C918Zm94j22vnCvn0l3v
 eA+GgKwaIXi4w==
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
Cc: x86@kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, "David S.
 Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/5/19 11:20 PM, Christoph Hellwig wrote:
> On Wed, Jun 05, 2019 at 11:01:17PM -0700, John Hubbard wrote:
>> I started reviewing this one patch, and it's kind of messy figuring out
>> if the code motion preserves everything because of
>> all the consolidation from other places, plus having to move things in
>> and out of the ifdef blocks.  So I figured I'd check and see if this is
>> going to make it past RFC status soon, and if it's going before or after
>> Ira's recent RFC ("RDMA/FS DAX truncate proposal").
> 
> I don't like the huge moves either, but I can't really think of any
> better way to do it.  Proposals welcome, though.
> 

One way would be to do it in two patches:

1) Move the code into gup.c, maybe at the bottom. Surround each function
or group of functions by whatever ifdefs they need.

2) Move code out of the bottom of gup.c, into the final location.

...but I'm not certain that will be that much better. In the spirit of
not creating gratuitous work for others, I could try it out and send
out something if it looks like it's noticeably easier to verify/review.

thanks,
-- 
John Hubbard
NVIDIA
