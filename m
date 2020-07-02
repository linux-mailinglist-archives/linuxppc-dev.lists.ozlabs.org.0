Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625C212FAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:45:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yY8Q3HKnzDrCC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=colyli@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yLZm4ZZCzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:49:04 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD5A1ADFF;
 Thu,  2 Jul 2020 14:49:01 +0000 (UTC)
Subject: Re: [PATCH 16/20] block: move ->make_request_fn to struct
 block_device_operations
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200701085947.3354405-1-hch@lst.de>
 <20200701085947.3354405-17-hch@lst.de>
From: Coly Li <colyli@suse.de>
Autocrypt: addr=colyli@suse.de; keydata=
 mQINBFYX6S8BEAC9VSamb2aiMTQREFXK4K/W7nGnAinca7MRuFUD4JqWMJ9FakNRd/E0v30F
 qvZ2YWpidPjaIxHwu3u9tmLKqS+2vnP0k7PRHXBYbtZEMpy3kCzseNfdrNqwJ54A430BHf2S
 GMVRVENiScsnh4SnaYjFVvB8SrlhTsgVEXEBBma5Ktgq9YSoy5miatWmZvHLFTQgFMabCz/P
 j5/xzykrF6yHo0rHZtwzQzF8rriOplAFCECp/t05+OeHHxjSqSI0P/G79Ll+AJYLRRm9til/
 K6yz/1hX5xMToIkYrshDJDrUc8DjEpISQQPhG19PzaUf3vFpmnSVYprcWfJWsa2wZyyjRFkf
 J51S82WfclafNC6N7eRXedpRpG6udUAYOA1YdtlyQRZa84EJvMzW96iSL1Gf+ZGtRuM3k49H
 1wiWOjlANiJYSIWyzJjxAd/7Xtiy/s3PRKL9u9y25ftMLFa1IljiDG+mdY7LyAGfvdtIkanr
 iBpX4gWXd7lNQFLDJMfShfu+CTMCdRzCAQ9hIHPmBeZDJxKq721CyBiGAhRxDN+TYiaG/UWT
 7IB7LL4zJrIe/xQ8HhRO+2NvT89o0LxEFKBGg39yjTMIrjbl2ZxY488+56UV4FclubrG+t16
 r2KrandM7P5RjR+cuHhkKseim50Qsw0B+Eu33Hjry7YCihmGswARAQABtBhDb2x5IExpIDxj
 b2x5bGlAc3VzZS5kZT6JAlYEEwEIAEACGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYh
 BOo+RS/0+Uhgjej60Mc5B5Nrffj8BQJcR84dBQkY++fuAAoJEMc5B5Nrffj8ixcP/3KAKg1X
 EcoW4u/0z+Ton5rCyb/NpAww8MuRjNW82UBUac7yCi1y3OW7NtLjuBLw5SaVG5AArb7IF3U0
 qTOobqfl5XHsT0o5wFHZaKUrnHb6y7V3SplsJWfkP3JmOooJsQB3z3K96ZTkFelsNb0ZaBRu
 gV+LA4MomhQ+D3BCDR1it1OX/tpvm2uaDF6s/8uFtcDEM9eQeqATN/QAJ49nvU/I8zDSY9rc
 0x9mP0x+gH4RccbnoPu/rUG6Fm1ZpLrbb6NpaYBBJ/V1BC4lIOjnd24bsoQrQmnJn9dSr60X
 1MY60XDszIyzRw7vbJcUn6ZzPNFDxFFT9diIb+wBp+DD8ZlD/hnVpl4f921ZbvfOSsXAJrKB
 1hGY17FPwelp1sPcK2mDT+pfHEMV+OQdZzD2OCKtza/5IYismJJm3oVUYMogb5vDNAw9X2aP
 XgwUuG+FDEFPamFMUwIfzYHcePfqf0mMsaeSgtA/xTxzx/0MLjUJHl46Bc0uKDhv7QUyGz0j
 Ywgr2mHTvG+NWQ/mDeHNGkcnsnp3IY7koDHnN2xMFXzY4bn9m8ctqKo2roqjCzoxD/njoAhf
 KBzdybLHATqJG/yiZSbCxDA1n/J4FzPyZ0rNHUAJ/QndmmVspE9syFpFCKigvvyrzm016+k+
 FJ59Q6RG4MSy/+J565Xj+DNY3/dCuQINBFYX6S8BEADZP+2cl4DRFaSaBms08W8/smc5T2CO
 YhAoygZn71rB7Djml2ZdvrLRjR8Qbn0Q/2L2gGUVc63pJnbrjlXSx2LfAFE0SlfYIJ11aFdF
 9w7RvqWByQjDJor3Z0fWvPExplNgMvxpD0U0QrVT5dIGTx9hadejCl/ug09Lr6MPQn+a4+qs
 aRWwgCSHaIuDkH3zI1MJXiqXXFKUzJ/Fyx6R72rqiMPHH2nfwmMu6wOXAXb7+sXjZz5Po9GJ
 g2OcEc+rpUtKUJGyeQsnCDxUcqJXZDBi/GnhPCcraQuqiQ7EGWuJfjk51vaI/rW4bZkA9yEP
 B9rBYngbz7cQymUsfxuTT8OSlhxjP3l4ZIZFKIhDaQeZMj8pumBfEVUyiF6KVSfgfNQ/5PpM
 R4/pmGbRqrAAElhrRPbKQnCkGWDr8zG+AjN1KF6rHaFgAIO7TtZ+F28jq4reLkur0N5tQFww
 wFwxzROdeLHuZjL7eEtcnNnzSkXHczLkV4kQ3+vr/7Gm65mQfnVpg6JpwpVrbDYQeOFlxZ8+
 GERY5Dag4KgKa/4cSZX2x/5+KkQx9wHwackw5gDCvAdZ+Q81nm6tRxEYBBiVDQZYqO73stgT
 ZyrkxykUbQIy8PI+g7XMDCMnPiDncQqgf96KR3cvw4wN8QrgA6xRo8xOc2C3X7jTMQUytCz9
 0MyV1QARAQABiQI8BBgBCAAmAhsMFiEE6j5FL/T5SGCN6PrQxzkHk2t9+PwFAlxHziAFCRj7
 5/EACgkQxzkHk2t9+PxgfA//cH5R1DvpJPwraTAl24SUcG9EWe+NXyqveApe05nk15zEuxxd
 e4zFEjo+xYZilSveLqYHrm/amvQhsQ6JLU+8N60DZHVcXbw1Eb8CEjM5oXdbcJpXh1/1BEwl
 4phsQMkxOTns51bGDhTQkv4lsZKvNByB9NiiMkT43EOx14rjkhHw3rnqoI7ogu8OO7XWfKcL
 CbchjJ8t3c2XK1MUe056yPpNAT2XPNF2EEBPG2Y2F4vLgEbPv1EtpGUS1+JvmK3APxjXUl5z
 6xrxCQDWM5AAtGfM/IswVjbZYSJYyH4BQKrShzMb0rWUjkpXvvjsjt8rEXpZEYJgX9jvCoxt
 oqjCKiVLpwje9WkEe9O9VxljmPvxAhVqJjX62S+TGp93iD+mvpCoHo3+CcvyRcilz+Ko8lfO
 hS9tYT0HDUiDLvpUyH1AR2xW9RGDevGfwGTpF0K6cLouqyZNdhlmNciX48tFUGjakRFsxRmX
 K0Jx4CEZubakJe+894sX6pvNFiI7qUUdB882i5GR3v9ijVPhaMr8oGuJ3kvwBIA8lvRBGVGn
 9xvzkQ8Prpbqh30I4NMp8MjFdkwCN6znBKPHdjNTwE5PRZH0S9J0o67IEIvHfH0eAWAsgpTz
 +jwc7VKH7vkvgscUhq/v1/PEWCAqh9UHy7R/jiUxwzw/288OpgO+i+2l11Y=
Message-ID: <ded333a3-c6d9-2a4d-b427-b06aaa1e925c@suse.de>
Date: Thu, 2 Jul 2020 22:48:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701085947.3354405-17-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:28:34 +1000
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/7/1 16:59, Christoph Hellwig wrote:
> The make_request_fn is a little weird in that it sits directly in
> struct request_queue instead of an operation vector.  Replace it with
> a block_device_operations method called submit_bio (which describes much
> better what it does).  Also remove the request_queue argument to it, as
> the queue can be derived pretty trivially from the bio.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For the bcache part,

Acked-by: Coly Li <colyli@suse.de>

> ---
>  Documentation/block/biodoc.rst                |  2 +-
>  .../block/writeback_cache_control.rst         |  2 +-
>  arch/m68k/emu/nfblock.c                       |  5 +-
>  arch/xtensa/platforms/iss/simdisk.c           |  5 +-
>  block/blk-cgroup.c                            |  2 +-
>  block/blk-core.c                              | 53 +++++++------------
>  block/blk-mq.c                                | 10 ++--
>  block/blk.h                                   |  2 -
>  drivers/block/brd.c                           |  5 +-
>  drivers/block/drbd/drbd_int.h                 |  2 +-
>  drivers/block/drbd/drbd_main.c                |  9 ++--
>  drivers/block/drbd/drbd_req.c                 |  2 +-
>  drivers/block/null_blk_main.c                 | 17 ++++--
>  drivers/block/pktcdvd.c                       | 11 ++--
>  drivers/block/ps3vram.c                       | 15 +++---
>  drivers/block/rsxx/dev.c                      |  7 ++-
>  drivers/block/umem.c                          |  5 +-
>  drivers/block/zram/zram_drv.c                 | 11 ++--
>  drivers/lightnvm/core.c                       |  8 +--
>  drivers/lightnvm/pblk-init.c                  | 12 +++--
>  drivers/md/bcache/request.c                   |  4 +-
>  drivers/md/bcache/request.h                   |  4 +-
>  drivers/md/bcache/super.c                     | 23 +++++---
>  drivers/md/dm.c                               | 23 ++++----
>  drivers/md/md.c                               |  5 +-
>  drivers/nvdimm/blk.c                          |  5 +-
>  drivers/nvdimm/btt.c                          |  5 +-
>  drivers/nvdimm/pmem.c                         |  5 +-
>  drivers/nvme/host/core.c                      |  1 +
>  drivers/nvme/host/multipath.c                 |  5 +-
>  drivers/nvme/host/nvme.h                      |  1 +
>  drivers/s390/block/dcssblk.c                  |  9 ++--
>  drivers/s390/block/xpram.c                    |  6 +--
>  include/linux/blk-mq.h                        |  2 +-
>  include/linux/blkdev.h                        |  7 +--
>  include/linux/lightnvm.h                      |  3 +-
>  36 files changed, 153 insertions(+), 140 deletions(-)
> 
[snipped]

> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index 7acf024e99f351..fc5702b10074d6 100644
> --- a/drivers/md/bcache/request.c
> +++ b/drivers/md/bcache/request.c
> @@ -1158,7 +1158,7 @@ static void quit_max_writeback_rate(struct cache_set *c,
>  
>  /* Cached devices - read & write stuff */
>  
> -blk_qc_t cached_dev_make_request(struct request_queue *q, struct bio *bio)
> +blk_qc_t cached_dev_submit_bio(struct bio *bio)
>  {
>  	struct search *s;
>  	struct bcache_device *d = bio->bi_disk->private_data;
> @@ -1291,7 +1291,7 @@ static void flash_dev_nodata(struct closure *cl)
>  	continue_at(cl, search_free, NULL);
>  }
>  
> -blk_qc_t flash_dev_make_request(struct request_queue *q, struct bio *bio)
> +blk_qc_t flash_dev_submit_bio(struct bio *bio)
>  {
>  	struct search *s;
>  	struct closure *cl;
> diff --git a/drivers/md/bcache/request.h b/drivers/md/bcache/request.h
> index bb005c93dd7218..82b38366a95deb 100644
> --- a/drivers/md/bcache/request.h
> +++ b/drivers/md/bcache/request.h
> @@ -37,10 +37,10 @@ unsigned int bch_get_congested(const struct cache_set *c);
>  void bch_data_insert(struct closure *cl);
>  
>  void bch_cached_dev_request_init(struct cached_dev *dc);
> -blk_qc_t cached_dev_make_request(struct request_queue *q, struct bio *bio);
> +blk_qc_t cached_dev_submit_bio(struct bio *bio);
>  
>  void bch_flash_dev_request_init(struct bcache_device *d);
> -blk_qc_t flash_dev_make_request(struct request_queue *q, struct bio *bio);
> +blk_qc_t flash_dev_submit_bio(struct bio *bio);
>  
>  extern struct kmem_cache *bch_search_cache;
>  
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 21aa168113d30b..de13f6e916966d 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -680,7 +680,16 @@ static int ioctl_dev(struct block_device *b, fmode_t mode,
>  	return d->ioctl(d, mode, cmd, arg);
>  }
>  
> -static const struct block_device_operations bcache_ops = {
> +static const struct block_device_operations bcache_cached_ops = {
> +	.submit_bio	= cached_dev_submit_bio,
> +	.open		= open_dev,
> +	.release	= release_dev,
> +	.ioctl		= ioctl_dev,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct block_device_operations bcache_flash_ops = {
> +	.submit_bio	= flash_dev_submit_bio,
>  	.open		= open_dev,
>  	.release	= release_dev,
>  	.ioctl		= ioctl_dev,
> @@ -820,8 +829,8 @@ static void bcache_device_free(struct bcache_device *d)
>  }
>  
>  static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
> -			      sector_t sectors, make_request_fn make_request_fn,
> -			      struct block_device *cached_bdev)
> +		sector_t sectors, struct block_device *cached_bdev,
> +		const struct block_device_operations *ops)
>  {
>  	struct request_queue *q;
>  	const size_t max_stripes = min_t(size_t, INT_MAX,
> @@ -868,10 +877,10 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
>  
>  	d->disk->major		= bcache_major;
>  	d->disk->first_minor	= idx_to_first_minor(idx);
> -	d->disk->fops		= &bcache_ops;
> +	d->disk->fops		= ops;
>  	d->disk->private_data	= d;
>  
> -	q = blk_alloc_queue(make_request_fn, NUMA_NO_NODE);
> +	q = blk_alloc_queue(NUMA_NO_NODE);
>  	if (!q)
>  		return -ENOMEM;
>  
> @@ -1355,7 +1364,7 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
>  
>  	ret = bcache_device_init(&dc->disk, block_size,
>  			 dc->bdev->bd_part->nr_sects - dc->sb.data_offset,
> -			 cached_dev_make_request, dc->bdev);
> +			 dc->bdev, &bcache_cached_ops);
>  	if (ret)
>  		return ret;
>  
> @@ -1468,7 +1477,7 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
>  	kobject_init(&d->kobj, &bch_flash_dev_ktype);
>  
>  	if (bcache_device_init(d, block_bytes(c), u->sectors,
> -			flash_dev_make_request, NULL))
> +			NULL, &bcache_flash_ops))
>  		goto err;
>  
>  	bcache_device_attach(d, c, u - c->uuids);


