Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA099031F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:59:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=juelLKuk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyygK69Vjz3cWk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 15:59:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=juelLKuk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vyyff0fyfz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 15:59:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 591E8CE19AB;
	Tue, 11 Jun 2024 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B0C2BD10;
	Tue, 11 Jun 2024 05:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085543;
	bh=ytNiiCLVFE28gHr4h5G30TNqYehF/KogG4pSKSbNQ2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=juelLKuku0LFbgtXG9OzRzRWb3ooPaRYkdEGYbxCY/l/EREHcpsd6y+kWaUp4iBKj
	 Cs53RLnIaSbrZccm/GN9QVCVAOcAI/+By8TM/0/LFmq4RPTUmj+axscKmxzzB5coCx
	 TPpMXPmrdbBJt790n7mZ2SG7cnazZrwM4LN+e2wDErlp27GY0Q5cW5+prp1xuTs+nr
	 t3wCoIWjpcxWO+rGzFp9IqhsxvwTy7jx2vG3FMgsOx4qNL4tLOJuL4SBWR9Le8e1Gu
	 FbIAW9jk7NKo8gZzoXSm3zjx5aS60f2RIO1ZIKWZDZVw79ebRnV6Cm+DP9ptNCmDsn
	 briDJeVws9DJA==
Message-ID: <27e76310-1831-473e-803a-e0294b91463c@kernel.org>
Date: Tue, 11 Jun 2024 14:58:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] loop: also use the default block size from an
 underlying block device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-7-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-7-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Fix the code in loop_reconfigure_limits to pick a default block size for
> O_DIRECT file descriptors to also work when the loop device sits on top
> of a block device and not just on a regular file on a block device based
> file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 4f6d8514d19bd6..d7cf6bbbfb1b86 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -988,10 +988,16 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
>  {
>  	struct file *file = lo->lo_backing_file;
>  	struct inode *inode = file->f_mapping->host;
> +	struct block_device *backing_bdev = NULL;
>  	struct queue_limits lim;
>  
> +	if (S_ISBLK(inode->i_mode))
> +		backing_bdev = I_BDEV(inode);
> +	else if (inode->i_sb->s_bdev)
> +		backing_bdev = inode->i_sb->s_bdev;
> +

Why not move this hunk inside the below "if" ? (backing_dev declaration can go
there too).

>  	if (!bsize)
> -		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
> +		bsize = loop_default_blocksize(lo, backing_bdev);
>  
>  	lim = queue_limits_start_update(lo->lo_queue);
>  	lim.logical_block_size = bsize;

-- 
Damien Le Moal
Western Digital Research

