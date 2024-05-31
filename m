Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA78D5C3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 10:07:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D4JcyVTt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrG1V2TBNz30W1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D4JcyVTt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrG0k2GKNz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 18:06:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717142790;
	bh=FYUiRJCdcnCVjMOkEnGgfbId1LsBcdzYwyyPQhPx3DE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D4JcyVTtiYxOq8Zi6clWE/K+RQvgcOoOcksTd+TGoBTn6QqgfD0G3Y+8vnqGe53w5
	 ihbPLxd2u8e1mibwi3NIqIbhPqqH+5s43bD7wz3LReLwcgZxdGl/JUlV44vrqwc9us
	 tadf7bLnJyxZusxHqjaS9V5h87dZB0ysq5dThakJ0dbh6+HVn2fQJg6etSDzwhlT19
	 kbdE60JlKyhWoSRR/ebuxz6/JcIrH8Tt2llmKTeQg6LjxV1ssegJgz5/OMkPDFIms/
	 haKV7w1yx+taUZDjOve+jaQn7guhicMOMaffYrEgPZNWXL1+dS/z3ykXnLWmpJfKSY
	 B3Qa5khAO1AvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrG0h2Df2z4wqM;
	Fri, 31 May 2024 18:06:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
In-Reply-To: <20240531060827.GA17723@lst.de>
References: <20240520151536.GA32532@lst.de>
 <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
 <8734pz4gdh.fsf@mail.lhotse> <87wmnb2x2y.fsf@mail.lhotse>
 <20240531060827.GA17723@lst.de>
Date: Fri, 31 May 2024 18:06:25 +1000
Message-ID: <87sexy2yny.fsf@mail.lhotse>
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
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> On Fri, May 31, 2024 at 12:28:21AM +1000, Michael Ellerman wrote:
>> No that's wrong. The actual hardware page size is 4K, but
>> CONFIG_PAGE_SIZE and PAGE_SHIFT etc. is 64K.
>> 
>> So at least for this user the driver used to work with 64K pages, and
>> now doesn't.
>
> Which suggested that the communicated max_hw_sectors is wrong, and
> previously we were saved by the block layer increasing it to
> PAGE_SIZE after a warning.  Should we just increment it to 64k?

It looks like that user actually only has the CDROM hanging off
pata_macio, so it's possible it has been broken previously and they
didn't notice. I'll see if they can confirm the CDROM has been working
up until now.

I can test the CDROM on my G5 next week.

cheers
