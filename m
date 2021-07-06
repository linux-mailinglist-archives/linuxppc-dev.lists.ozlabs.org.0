Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3763BDDE4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 21:14:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKC1750RQz3bWD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 05:14:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TU5TtD5U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TU5TtD5U; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKC0c5XjJz304G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 05:14:24 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B79260FEE;
 Tue,  6 Jul 2021 19:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625598861;
 bh=QlBKfCu996qP5JenUg1J68Cu2xyoSjshlo1u0WQ5l4Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TU5TtD5UIfY0r+aXmb18IJawcVy9481TeWFSQOFYJdeGslFF5REp8bH73BojUcAOS
 WlHc4LPuYi7chvxRgoEbHiUmVBJCPC7C5tF6pdGMxY91712ZIHIFWEljUXECaizwR+
 koaeta5RgZiHx0Sss+0r3QJAYmQBlDDtVdoZp0FeXJcOVflgaIqK1qCkplXl/uW0BS
 LCRRvULfQJWTmzcODhL8YcjXYnyWkDWBHwYJN74M0CyF9fd7kjSS4G13Z+1zJxm7S+
 SxqHpxzj/Vqq6tNxTCJBSiyuyZK+lbgOtwblLLeGRCpsIt4FpxqITodwMfqKGzStS2
 aVPLPXphc2cDw==
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
References: <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck> <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
 <20210706170657.GD20750@willie-the-truck>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <e1c026c6-22c7-8979-4941-de9cfab3863a@kernel.org>
Date: Tue, 6 Jul 2021 12:14:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706170657.GD20750@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Will and Robin,

On 7/6/2021 10:06 AM, Will Deacon wrote:
> On Tue, Jul 06, 2021 at 04:39:11PM +0100, Robin Murphy wrote:
>> On 2021-07-06 15:05, Christoph Hellwig wrote:
>>> On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
>>>> FWIW I was pondering the question of whether to do something along those
>>>> lines or just scrap the default assignment entirely, so since I hadn't got
>>>> round to saying that I've gone ahead and hacked up the alternative
>>>> (similarly untested) for comparison :)
>>>>
>>>> TBH I'm still not sure which one I prefer...
>>>
>>> Claire did implement something like your suggestion originally, but
>>> I don't really like it as it doesn't scale for adding multiple global
>>> pools, e.g. for the 64-bit addressable one for the various encrypted
>>> secure guest schemes.
>>
>> Ah yes, that had slipped my mind, and it's a fair point indeed. Since we're
>> not concerned with a minimal fix for backports anyway I'm more than happy to
>> focus on Will's approach. Another thing is that that looks to take us a
>> quiet step closer to the possibility of dynamically resizing a SWIOTLB pool,
>> which is something that some of the hypervisor protection schemes looking to
>> build on top of this series may want to explore at some point.
> 
> Ok, I'll split that nasty diff I posted up into a reviewable series and we
> can take it from there.

For what it's worth, I attempted to boot Will's diff on top of Konrad's 
devel/for-linus-5.14 and it did not work; in fact, I got no output on my 
monitor period, even with earlyprintk=, and I do not think this machine 
has a serial console.

Robin's fix does work, it survived ten reboots with no issues getting to 
X and I do not see the KASAN and slub debug messages anymore but I 
understand that this is not the preferred solution it seems (although 
Konrad did want to know if it works).

I am happy to test any further patches or follow ups as needed, just 
keep me on CC.

Cheers,
Nathan
