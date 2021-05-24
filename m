Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993438E248
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 10:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpVhN5fsWz305w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 18:27:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hWbnJCzr;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/Ey/RBTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hWbnJCzr; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/Ey/RBTr; 
 dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpVgt5V6vz2yXB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 18:27:22 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621844838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1F35rBDncf+ODcVO5jTKQ+c6J+Bpaijj4tb+WLiO1U=;
 b=hWbnJCzrn8D8sq7QiamSboM/nv6TN+2iWleusnloao35oVE4OyeDX0eKAMzya8OGGThQFh
 zl1nxRchNuFxstuajSgFtmryku8O1hRGBIRcM0SbrM2Dt3hLAz/KodIIf9vgrdWDs21AJk
 09tFtAADDGOyfSpK1oh2IZudvgHfbuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621844838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1F35rBDncf+ODcVO5jTKQ+c6J+Bpaijj4tb+WLiO1U=;
 b=/Ey/RBTrd/apAViE3Xd9DP0Lfre1LBpPPlJZl5IzG70TmMypTfoLUolyItvUQoIO9R6YkJ
 B6psOuCyZCUW50Cw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBD6EAB6D;
 Mon, 24 May 2021 08:27:17 +0000 (UTC)
Subject: Re: [PATCH 14/26] md: convert to blk_alloc_disk/blk_cleanup_disk
To: Christoph Hellwig <hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-15-hch@lst.de>
 <e65de9e6-337c-3e41-b5c2-d033ff236582@suse.de>
 <20210524072642.GF23890@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1360c598-44a9-e0c5-dd81-695cb1ec8ccf@suse.de>
Date: Mon, 24 May 2021 10:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210524072642.GF23890@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-bcache@vger.kernel.org,
 Joshua Morris <josh.h.morris@us.ibm.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matias Bjorling <mb@lightnvm.io>,
 Nitin Gupta <ngupta@vflare.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Alex Dubov <oakad@yahoo.com>,
 Heiko Carstens <hca@linux.ibm.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, linux-raid@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-mmc@vger.kernel.org,
 Philipp Reisner <philipp.reisner@linbit.com>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/24/21 9:26 AM, Christoph Hellwig wrote:
> On Sun, May 23, 2021 at 10:12:49AM +0200, Hannes Reinecke wrote:
>>> +	blk_set_stacking_limits(&mddev->queue->limits);
>>>    	blk_queue_write_cache(mddev->queue, true, true);
>>>    	/* Allow extended partitions.  This makes the
>>>    	 * 'mdp' device redundant, but we can't really
>>>
>> Wouldn't it make sense to introduce a helper 'blk_queue_from_disk()' or
>> somesuch to avoid having to keep an explicit 'queue' pointer?
> 
> My rought plan is that a few series from now bio based drivers will
> never directly deal with the request_queue at all.
> 
Go for it.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
