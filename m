Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A000090A3A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 08:04:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZHL4hpDI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2fTz3HLhz3cPX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 16:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZHL4hpDI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fTG0dMZz30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 16:03:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2D34ACE0E51;
	Mon, 17 Jun 2024 06:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A36C2BD10;
	Mon, 17 Jun 2024 06:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718604219;
	bh=m0CKH+FHwbkUOr+sSrcVkW5ESZFXp5kIa1//vjrk4yE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZHL4hpDIzus9MORWkAbgDJINc4LVHx93lSfKixSkm6WuLxyXO8kkYM44k+wcOnr5y
	 tkFWuqAKw955Q/rvEo4d1MS5n/NwL4TdN4ssl8cV7ZAZLbnGhDKwhC73QRhgwv+NZq
	 4MHo4ahMA2gZVzsFtyj1OAL5yJiTS0PIsFOfjpr6Q4Iz0vizRFUgFcQcYzSr+vYOlU
	 9makxthgJ0C1BEmV0I9GbD23VHSGMav9AQ29gAEuujqqpGZAlwMM1nxM2wawtGe3Za
	 Rfe2pF85RFEJcZaeOU4UkFt4BeHCBkbgQEQvS0KKa82U3uwq4hheAWgp20LXEFXakj
	 o5wuVRw+MEylQ==
Message-ID: <bf52121f-38f2-4789-b545-7c6ed0fe55b2@kernel.org>
Date: Mon, 17 Jun 2024 15:03:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-3-hch@lst.de>
 <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
 <20240613093918.GA27629@lst.de>
 <5a697233-0611-459d-b889-2e0133bbb541@kernel.org>
 <20240617045356.GA16277@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617045356.GA16277@lst.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/24 13:53, Christoph Hellwig wrote:
> On Mon, Jun 17, 2024 at 08:01:04AM +0900, Damien Le Moal wrote:
>> On 6/13/24 18:39, Christoph Hellwig wrote:
>>> On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
>>>>> +	if (sdkp->device->type == TYPE_ZBC)
>>>>
>>>> Nit: use sd_is_zoned() here ?
>>>
>>> Actually - is there much in even keeping sd_is_zoned now that the
>>> host aware support is removed?  Just open coding the type check isn't
>>> any more code, and probably easier to follow.
>>
>> Removing this helper is fine by me.
> 
> FYI, I've removed it yesterday, but not done much of the cleanups suggest
> here.  We should probably do those in a follow up up, uncluding removing
> the !ZBC check in sd_zbc_check_zoned_characteristics.

OK. I will send that once your series in queued.

-- 
Damien Le Moal
Western Digital Research

