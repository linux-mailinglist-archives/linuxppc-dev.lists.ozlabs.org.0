Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7641437066
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 05:13:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb8ZN2KmZz3cBt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 14:13:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cYDUUwCi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=cYDUUwCi; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb8Yb6Pjlz2yPT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 14:13:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=W0LD9iPvxxhEJ3MC2BpmyEY64d7qaINAGgTsXYSy428=; b=cYDUUwCiDlFw5AzyRMN9tlggeH
 9bieqFxqnVXkwZshKFtrCWiWTRj42Do3v3duec5Oh2NeBr/KtY2JFs19YrFYe0pjKgkjitbcJVU74
 3L08/bDkVn1tUvxtnfojRZTI4YQuqf0qGPiYnvURf63sODp5N4b02/KHuPw9GCLRd3M6EmVk8Ojgu
 oBS83rFU7lxFzpRkPtkVGxQiFpQdqzIyU3p0je/yXb3QsaRNe4eexfYRYdsHlsX8Pbp3yHsoQjWpz
 Wurr52oXnhVFBC7Wm/ZyMZRdkLB1Q5ijXqsDPwyM11+aSkVj9GJTqnh7As2hIZpDy+Zf5omesnM5z
 tH6JZAqw==;
Received: from [2602:306:c5a2:a380:b27b:25ff:fe2c:51a8]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkxM-00DffH-LH; Fri, 22 Oct 2021 03:11:19 +0000
Subject: Re: [PATCH 00/13] block: add_disk() error handling stragglers
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
 <YW2duaTqf3qUbTIm@bombadil.infradead.org>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <24bc86d0-9d8d-8c8a-7f74-a87f9089342b@infradead.org>
Date: Thu, 21 Oct 2021 20:10:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW2duaTqf3qUbTIm@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: nvdimm@lists.linux.dev, vigneshr@ti.com, linux-nvme@lists.infradead.org,
 paulus@samba.org, miquel.raynal@bootlin.com, ira.weiny@intel.com, hch@lst.de,
 dave.jiang@intel.com, sagi@grimberg.me, minchan@kernel.org,
 vishal.l.verma@intel.com, ngupta@vflare.org, linux-block@vger.kernel.org,
 kbusch@kernel.org, dan.j.williams@intel.com, axboe@kernel.dk,
 linux-kernel@vger.kernel.org, jim@jtan.com, senozhatsky@chromium.org,
 richard@nod.at, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Luis,

On 10/18/21 9:15 AM, Luis Chamberlain wrote:
> On Sun, Oct 17, 2021 at 08:26:33AM -0700, Geoff Levand wrote:
>> Hi Luis,
>>
>> On 10/15/21 4:52 PM, Luis Chamberlain wrote:
>>> This patch set consists of al the straggler drivers for which we have
>>> have no patch reviews done for yet. I'd like to ask for folks to please
>>> consider chiming in, specially if you're the maintainer for the driver.
>>> Additionally if you can specify if you'll take the patch in yourself or
>>> if you want Jens to take it, that'd be great too.
>>
>> Do you have a git repo with the patch set applied that I can use to test with?
> 
> Sure, although the second to last patch is in a state of flux given
> the ataflop driver currently is broken and so we're seeing how to fix
> that first:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20211011-for-axboe-add-disk-error-handling

That branch has so many changes applied on top of the base v5.15-rc4
that the patches I need to apply to test on PS3 with don't apply.

Do you have something closer to say v5.15-rc5?  Preferred would be
just your add_disk() error handling patches plus what they depend
on.

Thanks.

-Geoff
