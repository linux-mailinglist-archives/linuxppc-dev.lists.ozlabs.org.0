Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8350B8D4BEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 14:47:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z+fZaOsM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqmGw5Hcjz3cYM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 22:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z+fZaOsM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqmG73yBcz3cTm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 22:46:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717073182;
	bh=2PQslrF5DLJnjhxjVmppW6OzIMjxkmaQb7qN4cQE65Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z+fZaOsMOEUTjZCZMamY0ob93TTFoxEs/E/5qjZIhX9yHTy60nzW+0GD3pVHpb8TB
	 b/in31fd2yRpgO82h+XfGopnNAfaSqQGCeWCoNCdHoljCWvGha9lVKgLtFaCWErtOA
	 tMfUdblW1V4uwFpAfL77YS6hy2esknHHvplmM+ypb+OuCnhmvj/R0rS7X4J1kskl5L
	 4Mu7rYzVGMejQ5kFlmjmTcB9Gy8fSejfSLiV7XCuTQGKGIB1y9nFwyp8xvfPNoVA/f
	 zXn4pYXs2+Re1dNMgT/Ogt/J0YzliE+LyYP/POMjAw1I0FrPS62JqUu9+mzfD13BJy
	 VG8NOpgcC8lLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VqmG402Gjz4x1Q;
	Thu, 30 May 2024 22:46:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
In-Reply-To: <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
References: <20240520151536.GA32532@lst.de>
 <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
Date: Thu, 30 May 2024 22:46:18 +1000
Message-ID: <8734pz4gdh.fsf@mail.lhotse>
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

"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 20.05.24 17:15, Christoph Hellwig wrote:
>> Adding ben and the linuxppc list.
>
> Hmm, no reply and no other progress to get this resolved afaics. So lets
> bring Michael into the mix, he might be able to help out.

Sorry I didn't see the original forward for some reason.

I haven't seen this on my G5, but it's hard drive is on SATA. I think
the CDROM is pata_macio, but there isn't a disk in the drive to test
with.

> BTW TWIMC: a PowerMac G5 user user reported similar symptoms here
> recently: https://bugzilla.kernel.org/show_bug.cgi?id=218858

AFAICS that report is from a 4K page size kernel (Page orders: ...
virtual = 12), so there must be something else going on?

I've asked the reporter to confirm the page size.

cheers

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
