Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA18FE68F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 14:34:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r1ZoiLYv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw3g02MNMz3dTR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 22:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r1ZoiLYv;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw3fH1fyfz3dKV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 22:33:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717677222;
	bh=KK2aEsGryauZUlCd5y9kuRvTiVpdgQOV3Jda2VqMpvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r1ZoiLYvCjQatKeubwNDC8sbnUXe2n7Tx17Cfx2R7IfXaDM7du4yNb/bCPasy7dys
	 BsrsW8jSntGwqOTuBqvgwRgsQjrCqD72PT8Bi0omXbnzcKFwQY0oBPnMoBb5cehDTI
	 E1w6BT2NxiL95bDzY/aSPDAicVdcKZa20X3zyaNF2cuQueg83ZSKVDYiIlC2ZGneAo
	 Bpyb3CSNjyZrW4dyjYsx57VPOgmTcJV5x/lBQh+TQk1ZRtBq9GAmj129TQ956nM+D9
	 +Fh3zi2aFekNoQ8/PSUX/G4Ipd5mU8huV4HSRcy/fadXg5PRYOYpo+h4BaiDfRApbK
	 lvP6xWkF1gDog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vw3fD4Y5fz4wc3;
	Thu,  6 Jun 2024 22:33:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Garry <john.g.garry@oracle.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
In-Reply-To: <0512b259-f803-4feb-a5bf-0feb7f7b44da@oracle.com>
References: <20240520151536.GA32532@lst.de>
 <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
 <8734pz4gdh.fsf@mail.lhotse> <87wmnb2x2y.fsf@mail.lhotse>
 <20240531060827.GA17723@lst.de> <87sexy2yny.fsf@mail.lhotse>
 <87wmn3pntq.fsf@mail.lhotse>
 <0512b259-f803-4feb-a5bf-0feb7f7b44da@oracle.com>
Date: Thu, 06 Jun 2024 22:33:40 +1000
Message-ID: <87o78ep7x7.fsf@mail.lhotse>
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
Cc: Jens Axboe <axboe@kernel.dk>, doru.iorgulescu1@gmail.com, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, linux-ide@vger.kernel.org, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, bvanassche@acm.org, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Garry <john.g.garry@oracle.com> writes:
>> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
>> index 817838e2f70e..3cb455a32d92 100644
>> --- a/drivers/ata/pata_macio.c
>> +++ b/drivers/ata/pata_macio.c
>> @@ -915,10 +915,13 @@ static const struct scsi_host_template pata_macio_sht = {
>>   	.sg_tablesize		= MAX_DCMDS,
>>   	/* We may not need that strict one */
>>   	.dma_boundary		= ATA_DMA_BOUNDARY,
>> -	/* Not sure what the real max is but we know it's less than 64K, let's
>> -	 * use 64K minus 256
>> +	/*
>> +	 * The SCSI core requires the segment size to cover at least a page, so
>> +	 * for 64K page size kernels this must be at least 64K. However the
>> +	 * hardware can't handle 64K, so pata_macio_qc_prep() will split large
>> +	 * requests.
>>   	 */
>> -	.max_segment_size	= MAX_DBDMA_SEG,
>> +	.max_segment_size	= SZ_64K,
>>   	.device_configure	= pata_macio_device_configure,
>>   	.sdev_groups		= ata_common_sdev_groups,
>>   	.can_queue		= ATA_DEF_QUEUE,
>
> Feel free to add:
> Reviewed-by: John Garry <john.g.garry@oracle.com>

Thanks.

Sorry I missed adding this when sending the proper patch, maybe whoever
applies it can add it then.

cheers
