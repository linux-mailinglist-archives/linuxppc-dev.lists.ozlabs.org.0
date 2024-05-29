Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B98D3ACC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 17:26:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=Huo3D8tg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqChx4sQxz79tf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 01:19:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=Huo3D8tg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 2478 seconds by postgrey-1.37 at boromir; Thu, 30 May 2024 01:18:33 AEST
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqCh91Mqnz3vYn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 01:18:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=B7XB8qUIcTmB1ehnipB+Kf3z1BPRYE36ZBSUE8NS1go=;
	t=1716995913; x=1717427913; b=Huo3D8tgGWjPMzfVu++Q6YTyHYoNIE6Ok6o8tCKUaWHx2lP
	Q8/tdP1JT9NT5RcjceTLYh8AZXqzAiJcsu63jCgQvdKA68cXv7LJvTXxNcu22tqrkEIJnKsGJPnXe
	pY+ii8IgN8UGWq6QDCNmsQIYuzLdYhDrrVlcO0V50/o/YYl84TYM7GYKzyD5qxNFaO4sQBMwCuHU5
	5/CeV+HOoJLRRne6O9epC0gfAvFYMM7iFHEM9DzJOfaWjX0YmKGZRgODm+l5pobb4mJdE8M1lrEEn
	0udwsDy/HftxkuLNWoE2pHVPbp+GmLQTpF0Kb7Bgespp4OzF//BIDKau1d+Mm3MQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCKQF-0003Dv-Nj; Wed, 29 May 2024 16:36:59 +0200
Message-ID: <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
Date: Wed, 29 May 2024 16:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20240520151536.GA32532@lst.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <20240520151536.GA32532@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716995913;bcdaae5d;
X-HE-SMSGID: 1sCKQF-0003Dv-Nj
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 20.05.24 17:15, Christoph Hellwig wrote:
> Adding ben and the linuxppc list.

Hmm, no reply and no other progress to get this resolved afaics. So lets
bring Michael into the mix, he might be able to help out.

BTW TWIMC: a PowerMac G5 user user reported similar symptoms here
recently: https://bugzilla.kernel.org/show_bug.cgi?id=218858

Ciao, Thorsten

> Context: pata_macio initialization now fails as we enforce that the
> segment size is set properly.
> 
> On Wed, May 15, 2024 at 04:52:29PM -0700, Guenter Roeck wrote:
>> pata_macio_common_init() Calling ata_host_activate() with limit 65280
>> ...
>> max_segment_size is 65280; PAGE_SIZE is 65536; BLK_MAX_SEGMENT_SIZE is 65536
>> WARNING: CPU: 0 PID: 12 at block/blk-settings.c:202 blk_validate_limits+0x2d4/0x364
>> ...
>>
>> This is with PPC_BOOK3S_64 which selects a default page size of 64k.
> 
> Yeah.  Did you actually manage to use pata macio previously?  Or is
> it just used because it's part of the pmac default config?
> 
>> Looking at the old code, I think it did what you suggested above,
> 
>> but assuming that the driver requested a lower limit on purpose that
>> may not be the best solution.
> 
>> Never mind, though - I updated my test configuration to explicitly
>> configure the page size to 4k to work around the problem. With that,
>> please consider this report a note in case someone hits the problem
>> on a real system (and sorry for the noise).
> 
> Yes, the idea behind this change was to catch such errors.  So far
> most errors have been drivers setting lower limits than what the
> hardware can actually handle, but I'd love to track this down.
> 
> If the hardware can't actually handle the lower limit we should
> probably just fail the probe gracefully with a well comment if
> statement instead.
