Return-Path: <linuxppc-dev+bounces-194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C6957B69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 04:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wntgg0Wm3z2xKQ;
	Tue, 20 Aug 2024 12:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gwj4wl/0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wntgf07Xxz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 12:28:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724120922;
	bh=NPiOhm8IKIaayb+OQ2mU0VwOhYGdB0lFQCCi2+TtTDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gwj4wl/0Bl/hBHPv0AaRenGTc2wAJ0PB2CWQTbbuRiAG6ydYttXtHs6zpWfnP2yt5
	 KxztHLxRMaADnlMjFNT9evJ6SzPHI/pxBuk30e9m56MDIP3ZcoWjMW1dLT3QhkoUZu
	 yMHAhbj/lrAx0oN/dZNtG7RRN10vYZ/THx8ELK8rSuHtDqXtu5C/47tid3OiTdARyN
	 ySoYRo+oyjlU2G6B1NoRt3R/bFWEYf+IcqJHEg8w7benhsA0xNoQxnDKI75h1hNUY6
	 c7dXfcq1YofE33pC9IIfIDoC644BcGfmY3JPPERzZX5fMQtdUdVEejMuiYoviWlyxO
	 ijcQBEjBm17Mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WntgW4MYRz4wcl;
	Tue, 20 Aug 2024 12:28:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Damien Le Moal <dlemoal@kernel.org>, cassel@kernel.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, linux-ppc@kolla.no,
 vidra@ufal.mff.cuni.cz
Subject: Re: [PATCH] ata: pata_macio: Fix DMA table overflow
In-Reply-To: <b651ae17-0d60-46b5-9571-cf82769ab07c@kernel.org>
References: <20240819101755.489078-1-mpe@ellerman.id.au>
 <b651ae17-0d60-46b5-9571-cf82769ab07c@kernel.org>
Date: Tue, 20 Aug 2024 12:28:38 +1000
Message-ID: <87ed6kszah.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Damien Le Moal <dlemoal@kernel.org> writes:
> On 8/19/24 19:17, Michael Ellerman wrote:
>> Kolbj=C3=B8rn and Jon=C3=A1=C5=A1 reported that their 32-bit PowerMacs w=
ere crashing
>> in pata-macio since commit 09fe2bfa6b83 ("ata: pata_macio: Fix
>> max_segment_size with PAGE_SIZE =3D=3D 64K").
>>=20
>> For example:
>>=20
>>   kernel BUG at drivers/ata/pata_macio.c:544!
>>   Oops: Exception in kernel mode, sig: 5 [#1]
>>   BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 DEBUG_PAGEALLOC PowerMac
>>   ...
>>   NIP pata_macio_qc_prep+0xf4/0x190
>>   LR  pata_macio_qc_prep+0xfc/0x190
>>   Call Trace:
>>     0xc1421660 (unreliable)
>>     ata_qc_issue+0x14c/0x2d4
>>     __ata_scsi_queuecmd+0x200/0x53c
>>     ata_scsi_queuecmd+0x50/0xe0
>>     scsi_queue_rq+0x788/0xb1c
>>     __blk_mq_issue_directly+0x58/0xf4
>>     blk_mq_plug_issue_direct+0x8c/0x1b4
>>     blk_mq_flush_plug_list.part.0+0x584/0x5e0
>>     __blk_flush_plug+0xf8/0x194
>>     __submit_bio+0x1b8/0x2e0
>>     submit_bio_noacct_nocheck+0x230/0x304
>>     btrfs_work_helper+0x200/0x338
>>     process_one_work+0x1a8/0x338
>>     worker_thread+0x364/0x4c0
>>     kthread+0x100/0x104
>>     start_kernel_thread+0x10/0x14
>>=20
>> That commit increased max_segment_size to 64KB, with the justification
>> that the SCSI core was already using that size when PAGE_SIZE =3D=3D 64K=
B,
>> and that there was existing logic to split over-sized requests.
>>=20
>> However with a sufficiently large request, the splitting logic causes
>> each sg to be split into two commands in the DMA table, leading to
>> overflow of the DMA table, triggering the BUG_ON().
>>=20
>> With default settings the bug doesn't trigger, because the request size
>> is limited by max_sectors_kb =3D=3D 1280, however max_sectors_kb can be
>> increased, and apparently some distros do that by default using udev
>> rules.
>>=20
>> Fix the bug for 4KB kernels by reverting to the old max_segment_size.
>>=20
>> For 64KB kernels the sg_tablesize needs to be halved, to allow for the
>> possibility that each sg will be split into two.
>>=20
>> Fixes: 09fe2bfa6b83 ("ata: pata_macio: Fix max_segment_size with PAGE_SI=
ZE =3D=3D 64K")
>> Cc: stable@vger.kernel.org # v6.10+
>> Reported-by: Kolbj=C3=B8rn Barmen <linux-ppc@kolla.no>
>> Closes: https://lore.kernel.org/all/62d248bb-e97a-25d2-bcf2-9160c518cae5=
@kolla.no/
>> Reported-by: Jon=C3=A1=C5=A1 Vidra <vidra@ufal.mff.cuni.cz>
>> Closes: https://lore.kernel.org/all/3b6441b8-06e6-45da-9e55-f92f2c86933e=
@ufal.mff.cuni.cz/
>> Tested-by: Kolbj=C3=B8rn Barmen <linux-ppc@kolla.no>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  drivers/ata/pata_macio.c | 23 +++++++++++++++--------
>>  1 file changed, 15 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
>> index 1b85e8bf4ef9..eaffa510de49 100644
>> --- a/drivers/ata/pata_macio.c
>> +++ b/drivers/ata/pata_macio.c
>> @@ -208,6 +208,19 @@ static const char* macio_ata_names[] =3D {
>>  /* Don't let a DMA segment go all the way to 64K */
>>  #define MAX_DBDMA_SEG		0xff00
>>=20=20
>> +#ifdef CONFIG_PAGE_SIZE_64KB
>> +/*
>> + * The SCSI core requires the segment size to cover at least a page, so
>> + * for 64K page size kernels it must be at least 64K. However the
>> + * hardware can't handle 64K, so pata_macio_qc_prep() will split large
>> + * requests. To handle the split requests the tablesize must be halved.
>> + */
>> +#define MAX_SEGMENT_SIZE SZ_64K
>> +#define SG_TABLESIZE (MAX_DCMDS / 2)
>> +#else
>> +#define MAX_SEGMENT_SIZE MAX_DBDMA_SEG
>> +#define SG_TABLESIZE MAX_DCMDS
>> +#endif
>
> These names are rather generic and could clash with some core layer ditio=
ns. So
> maybe prefix the macro names with PATA_MACIO_ ?
> Also please tab-align the values to make this a little easier to read.
=20
OK.

> Other than this, looks good to me.

OK thanks, will send a v2.

cheers

