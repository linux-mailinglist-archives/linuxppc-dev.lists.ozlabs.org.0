Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFC8FE657
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 14:17:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHQ+51MA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw3Hq5LdVz3dWk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 22:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHQ+51MA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw3H661y1z3dJV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 22:17:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F2046173B;
	Thu,  6 Jun 2024 12:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592ACC3277B;
	Thu,  6 Jun 2024 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717676193;
	bh=X7IRKLYQKUcL4/AyrQBAFh74hOuWJ1e48IxTurIYDX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHQ+51MAXahcjeROL/4TbzyUkWLVBN242M2ewTZR1Vjfxz8YMHlaQ/FMUd3Gp6Znn
	 Wel4nfem/j67CcKf9XWhiFDNf2VyHbN00HiEFbbXcCihhYv7b2JjhTZj6wT8padP/X
	 hZP8HKPy5dj9zogb5QIYg1wB86qyhOKqmrTYkMw6SjJKAOw/hAP6L8HWFyRddHUuEs
	 Kool4/WK7ZdL+BraCwoSaQ3/cRPE9sSRGk7hCsB5OYzKNvBt73mENDh9po4i2qift1
	 giJeNV7HF/cLC0+HMSKfucbkC8tfLq6roMmqUX8HgWrMWxipeQZC0oos2QC6TlxpI2
	 EBLdCsgmhRQNw==
Message-ID: <0d32c921-39d4-4c64-be4a-87c4d67e8e36@kernel.org>
Date: Thu, 6 Jun 2024 21:16:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ata: pata_macio: Fix max_segment_size with PAGE_SIZE ==
 64K
To: Michael Ellerman <mpe@ellerman.id.au>, martin.petersen@oracle.com,
 cassel@kernel.org
References: <20240606111445.400001-1-mpe@ellerman.id.au>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240606111445.400001-1-mpe@ellerman.id.au>
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
Cc: doru.iorgulescu1@gmail.com, regressions@lists.linux.dev, linux-scsi@vger.kernel.org, john.g.garry@oracle.com, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/6/24 20:14, Michael Ellerman wrote:
> The pata_macio driver advertises a max_segment_size of 0xff00, because
> the hardware doesn't cope with requests >= 64K.
> 
> However the SCSI core requires max_segment_size to be at least
> PAGE_SIZE, which is a problem for pata_macio when the kernel is built
> with 64K pages.
> 
> In older kernels the SCSI core would just increase the segment size to
> be equal to PAGE_SIZE, however since the commit tagged below it causes a
> warning and the device fails to probe:
> 
>   WARNING: CPU: 0 PID: 26 at block/blk-settings.c:202 .blk_validate_limits+0x2f8/0x35c
>   CPU: 0 PID: 26 Comm: kworker/u4:1 Not tainted 6.10.0-rc1 #1
>   Hardware name: PowerMac7,2 PPC970 0x390202 PowerMac
>   ...
>   NIP .blk_validate_limits+0x2f8/0x35c
>   LR  .blk_alloc_queue+0xc0/0x2f8
>   Call Trace:
>     .blk_alloc_queue+0xc0/0x2f8
>     .blk_mq_alloc_queue+0x60/0xf8
>     .scsi_alloc_sdev+0x208/0x3c0
>     .scsi_probe_and_add_lun+0x314/0x52c
>     .__scsi_add_device+0x170/0x1a4
>     .ata_scsi_scan_host+0x2bc/0x3e4
>     .async_port_probe+0x6c/0xa0
>     .async_run_entry_fn+0x60/0x1bc
>     .process_one_work+0x228/0x510
>     .worker_thread+0x360/0x530
>     .kthread+0x134/0x13c
>     .start_kernel_thread+0x10/0x14
>   ...
>   scsi_alloc_sdev: Allocation failure during SCSI scanning, some SCSI devices might not be configured
> 
> Although the hardware can't cope with a 64K segment, the driver
> already deals with that internally by splitting large requests in
> pata_macio_qc_prep(). That is how the driver has managed to function
> until now on 64K kernels.
> 
> So fix the driver to advertise a max_segment_size of 64K, which avoids
> the warning and keeps the SCSI core happy.
> 
> Fixes: afd53a3d8528 ("scsi: core: Initialize scsi midlayer limits before allocating the queue")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/ce2bf6af-4382-4fe1-b392-cc6829f5ceb2@roeck-us.net/
> Reported-by: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218858
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/ata/pata_macio.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> index 817838e2f70e..3cb455a32d92 100644
> --- a/drivers/ata/pata_macio.c
> +++ b/drivers/ata/pata_macio.c
> @@ -915,10 +915,13 @@ static const struct scsi_host_template pata_macio_sht = {
>  	.sg_tablesize		= MAX_DCMDS,
>  	/* We may not need that strict one */
>  	.dma_boundary		= ATA_DMA_BOUNDARY,
> -	/* Not sure what the real max is but we know it's less than 64K, let's
> -	 * use 64K minus 256
> +	/*
> +	 * The SCSI core requires the segment size to cover at least a page, so
> +	 * for 64K page size kernels this must be at least 64K. However the
> +	 * hardware can't handle 64K, so pata_macio_qc_prep() will split large
> +	 * requests.
>  	 */
> -	.max_segment_size	= MAX_DBDMA_SEG,
> +	.max_segment_size	= SZ_64K,
>  	.device_configure	= pata_macio_device_configure,
>  	.sdev_groups		= ata_common_sdev_groups,
>  	.can_queue		= ATA_DEF_QUEUE,

-- 
Damien Le Moal
Western Digital Research

