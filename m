Return-Path: <linuxppc-dev+bounces-253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAC95941E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 07:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpZp50rNfz2xfP;
	Wed, 21 Aug 2024 15:36:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zz10EpcH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpZp44xlkz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 15:36:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D78160FB3;
	Wed, 21 Aug 2024 05:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2994BC32786;
	Wed, 21 Aug 2024 05:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724218602;
	bh=R23aIBz2yqL9qGSiJVxvnOGYZ7dS2UbIctnrc6vIiEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zz10EpcHidYx6bZwfmixlBpj7nXI/6mVY5uX/wWWR7394hI3us5nLUrXfFEuAze9E
	 rlctTDymoJtcPwPX+RjYIodox0Dd6yezhrF6AuC4Qtws3ieGcPFqQBYtcUBwpnFSGq
	 DFmCc351rsZ6k9cL4ANfvupgGkewEa36ZXUK/wcaw3tNEHYQvaFpTHlTwziYhrbBoP
	 2tkYh34tOVYFi/Z2Db5pVKmvX7ZX5rKrJ0YEFT9GEtiilCdifSivludm7PqCNOXB2e
	 aJlA2zY/W5BjMvheWEfIbAoDQ8RSH64wfMigZAc0UEfjv65mInfI6EcKGcTPx7gH7d
	 dhWkoK2apRPYw==
Message-ID: <f1fffaac-bea2-43d0-a003-f701694f5bb9@kernel.org>
Date: Wed, 21 Aug 2024 14:36:39 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ata: pata_macio: Fix DMA table overflow
To: Michael Ellerman <mpe@ellerman.id.au>, cassel@kernel.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, linux-ppc@kolla.no,
 vidra@ufal.mff.cuni.cz
References: <20240820030358.627711-1-mpe@ellerman.id.au>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240820030358.627711-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/20/24 12:03 PM, Michael Ellerman wrote:
> Kolbjørn and Jonáš reported that their 32-bit PowerMacs were crashing
> in pata-macio since commit 09fe2bfa6b83 ("ata: pata_macio: Fix
> max_segment_size with PAGE_SIZE == 64K").
> 
> For example:
> 
>   kernel BUG at drivers/ata/pata_macio.c:544!
>   Oops: Exception in kernel mode, sig: 5 [#1]
>   BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 DEBUG_PAGEALLOC PowerMac
>   ...
>   NIP pata_macio_qc_prep+0xf4/0x190
>   LR  pata_macio_qc_prep+0xfc/0x190
>   Call Trace:
>     0xc1421660 (unreliable)
>     ata_qc_issue+0x14c/0x2d4
>     __ata_scsi_queuecmd+0x200/0x53c
>     ata_scsi_queuecmd+0x50/0xe0
>     scsi_queue_rq+0x788/0xb1c
>     __blk_mq_issue_directly+0x58/0xf4
>     blk_mq_plug_issue_direct+0x8c/0x1b4
>     blk_mq_flush_plug_list.part.0+0x584/0x5e0
>     __blk_flush_plug+0xf8/0x194
>     __submit_bio+0x1b8/0x2e0
>     submit_bio_noacct_nocheck+0x230/0x304
>     btrfs_work_helper+0x200/0x338
>     process_one_work+0x1a8/0x338
>     worker_thread+0x364/0x4c0
>     kthread+0x100/0x104
>     start_kernel_thread+0x10/0x14
> 
> That commit increased max_segment_size to 64KB, with the justification
> that the SCSI core was already using that size when PAGE_SIZE == 64KB,
> and that there was existing logic to split over-sized requests.
> 
> However with a sufficiently large request, the splitting logic causes
> each sg to be split into two commands in the DMA table, leading to
> overflow of the DMA table, triggering the BUG_ON().
> 
> With default settings the bug doesn't trigger, because the request size
> is limited by max_sectors_kb == 1280, however max_sectors_kb can be
> increased, and apparently some distros do that by default using udev
> rules.
> 
> Fix the bug for 4KB kernels by reverting to the old max_segment_size.
> 
> For 64KB kernels the sg_tablesize needs to be halved, to allow for the
> possibility that each sg will be split into two.
> 
> Fixes: 09fe2bfa6b83 ("ata: pata_macio: Fix max_segment_size with PAGE_SIZE == 64K")
> Cc: stable@vger.kernel.org # v6.10+
> Reported-by: Kolbjørn Barmen <linux-ppc@kolla.no>
> Closes: https://lore.kernel.org/all/62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no/
> Reported-by: Jonáš Vidra <vidra@ufal.mff.cuni.cz>
> Closes: https://lore.kernel.org/all/3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz/
> Tested-by: Kolbjørn Barmen <linux-ppc@kolla.no>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to for-6.11-fixes. Thanks !

-- 
Damien Le Moal
Western Digital Research


