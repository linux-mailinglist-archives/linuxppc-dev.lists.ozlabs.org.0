Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652218D4DFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 16:29:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gq9AAZ2u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqpXd4yQnz3cb8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gq9AAZ2u;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqpWt4B6mz3cX5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 00:28:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717079303;
	bh=TepJdMu5Kgqt4hFWQ/knF8KsMyDM2pCe5l3NAhbAlr0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gq9AAZ2u93VW1D0x6Na4RcZUHk90fmGkZEWk8KeWCfGT4bL493v8+w0tcTJ9hsRkM
	 4XDO0HcsykkcEpCJdlsHn8IcqCapHKhg3S8aluPMzfsmu2wtre70g04ccbHxsqlKfx
	 C4cqvFpr/umZfy9AnM6SmI/NdUQ+q8oLGNvbALKhHqY83jJI6xkA2LwnPuh21keJ22
	 LlU1LoJ0GcAzcYfDUhR1TB49I6xrk3V6xFU+rqyCAF4HK6bTrCm3nUrys+1upui+ze
	 mXbO3gkQecvwBuSOjmSecncOMEgipu1oC1HgQkrjIy0dSNoyFcs2Z4Z6PLRsNJOq6u
	 x12ptIkbo4bhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VqpWp35Nwz4wcC;
	Fri, 31 May 2024 00:28:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
In-Reply-To: <8734pz4gdh.fsf@mail.lhotse>
References: <20240520151536.GA32532@lst.de>
 <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
 <8734pz4gdh.fsf@mail.lhotse>
Date: Fri, 31 May 2024 00:28:21 +1000
Message-ID: <87wmnb2x2y.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
>> [CCing the regression list, as it should be in the loop for regressions:
>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>
>> On 20.05.24 17:15, Christoph Hellwig wrote:
>>> Adding ben and the linuxppc list.
>>
>> Hmm, no reply and no other progress to get this resolved afaics. So lets
>> bring Michael into the mix, he might be able to help out.
>
> Sorry I didn't see the original forward for some reason.
>
> I haven't seen this on my G5, but it's hard drive is on SATA. I think
> the CDROM is pata_macio, but there isn't a disk in the drive to test
> with.
>
>> BTW TWIMC: a PowerMac G5 user user reported similar symptoms here
>> recently: https://bugzilla.kernel.org/show_bug.cgi?id=218858
>
> AFAICS that report is from a 4K page size kernel (Page orders: ...
> virtual = 12), so there must be something else going on?

No that's wrong. The actual hardware page size is 4K, but
CONFIG_PAGE_SIZE and PAGE_SHIFT etc. is 64K.

So at least for this user the driver used to work with 64K pages, and
now doesn't.

cheers
