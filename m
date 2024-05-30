Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F68D4577
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:26:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=MRRzk7j2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqbqL1qBRz3cYy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 16:26:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=MRRzk7j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqbpZ021pz3cWd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 16:25:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=yQt4cMQXQ51kt8CWUHvAJmRopwcLuvZdstpsxz59W6I=;
	t=1717050326; x=1717482326; b=MRRzk7j2TlSeJVLCsh4reSjM1RNcn9KJ4A2+s1vc+z0leL5
	xbi8e9dSaEal1mUeom9To0e+hQbQLPCDLenH4N/Tsen+LZ/iJEEqwntbZbvS9ZCn9OqsaCqpqKSbz
	kDl8diPfIfT4IEi2O0TBbFvBK+RRxaMIUBK3Cl/vQlFaRg2RhSd6kK/3k2wtAOXLWk9n2Gs6D2+3s
	FLpCNoZU+rcnvdGSizx87noRAQ2vHT3ep3nc0L9BVgEAeTY+gsbeHGJ2PkPRJHC++2rs7RHkGidlw
	tE1iHoeUKfcP9Z1ysdfp4u28yzx2MLWci4VmpPCRKm4KGguTqP/khPglfiwuHW8g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCZDs-00064g-Tr; Thu, 30 May 2024 08:25:12 +0200
Message-ID: <f96bd990-20d4-4c41-99f4-401b3ab46652@leemhuis.info>
Date: Thu, 30 May 2024 08:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@lst.de>
References: <20240520151536.GA32532@lst.de>
 <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717050326;10ba9e81;
X-HE-SMSGID: 1sCZDs-00064g-Tr
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.05.24 16:36, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> On 20.05.24 17:15, Christoph Hellwig wrote:
>> Adding ben and the linuxppc list.
> 
> Hmm, no reply and no other progress to get this resolved afaics. So lets
> bring Michael into the mix, he might be able to help out.
> 
> BTW TWIMC: a PowerMac G5 user user reported similar symptoms here
> recently: https://bugzilla.kernel.org/show_bug.cgi?id=218858

And yet another report with similar symptoms, this time with a
"PowerMac7,2 PPC970 0x390202 PowerMac":
https://bugzilla.kernel.org/show_bug.cgi?id=218905

Ciao, Thorsten

>> Context: pata_macio initialization now fails as we enforce that the
>> segment size is set properly.
>>
>> On Wed, May 15, 2024 at 04:52:29PM -0700, Guenter Roeck wrote:
>>> pata_macio_common_init() Calling ata_host_activate() with limit 65280
>>> ...
>>> max_segment_size is 65280; PAGE_SIZE is 65536; BLK_MAX_SEGMENT_SIZE is 65536
>>> WARNING: CPU: 0 PID: 12 at block/blk-settings.c:202 blk_validate_limits+0x2d4/0x364
>>> ...
>>>
>>> This is with PPC_BOOK3S_64 which selects a default page size of 64k.
>>
>> Yeah.  Did you actually manage to use pata macio previously?  Or is
>> it just used because it's part of the pmac default config?
>>
>>> Looking at the old code, I think it did what you suggested above,
>>
>>> but assuming that the driver requested a lower limit on purpose that
>>> may not be the best solution.
>>
>>> Never mind, though - I updated my test configuration to explicitly
>>> configure the page size to 4k to work around the problem. With that,
>>> please consider this report a note in case someone hits the problem
>>> on a real system (and sorry for the noise).
>>
>> Yes, the idea behind this change was to catch such errors.  So far
>> most errors have been drivers setting lower limits than what the
>> hardware can actually handle, but I'd love to track this down.
>>
>> If the hardware can't actually handle the lower limit we should
>> probably just fail the probe gracefully with a well comment if
>> statement instead.
