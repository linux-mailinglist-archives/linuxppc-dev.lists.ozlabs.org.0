Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C7212FAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:47:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yYBN2DbSzDrF1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:47:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yLdm5SKfzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:51:40 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1243DADFF;
 Thu,  2 Jul 2020 14:51:38 +0000 (UTC)
Subject: Re: [PATCH 17/20] block: rename generic_make_request to
 submit_bio_noacct
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200701085947.3354405-1-hch@lst.de>
 <20200701085947.3354405-18-hch@lst.de>
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
Message-ID: <d8e792a2-1333-6852-6334-a681953f0bdc@suse.de>
Date: Thu, 2 Jul 2020 22:51:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701085947.3354405-18-hch@lst.de>
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
> generic_make_request has always been very confusingly misnamed, so rename
> it to submit_bio_noacct to make it clear that it is submit_bio minus
> accounting and a few checks.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I will miss generic_make_request(). Anyway, if it is decided, for bcache
part,

Acked-by: Coly Li <colyli@suse.de>

> ---
>  Documentation/block/biodoc.rst                |  2 +-
>  .../fault-injection/fault-injection.rst       |  2 +-
>  Documentation/trace/ftrace.rst                |  4 +--
>  block/bio.c                                   | 14 ++++----
>  block/blk-core.c                              | 32 +++++++++----------
>  block/blk-crypto-fallback.c                   |  2 +-
>  block/blk-crypto.c                            |  2 +-
>  block/blk-merge.c                             |  2 +-
>  block/blk-throttle.c                          |  4 +--
>  block/bounce.c                                |  2 +-
>  drivers/block/drbd/drbd_int.h                 |  6 ++--
>  drivers/block/drbd/drbd_main.c                |  2 +-
>  drivers/block/drbd/drbd_receiver.c            |  2 +-
>  drivers/block/drbd/drbd_req.c                 |  2 +-
>  drivers/block/drbd/drbd_worker.c              |  2 +-
>  drivers/block/pktcdvd.c                       |  2 +-
>  drivers/lightnvm/pblk-read.c                  |  2 +-
>  drivers/md/bcache/bcache.h                    |  2 +-
>  drivers/md/bcache/btree.c                     |  2 +-
>  drivers/md/bcache/request.c                   |  7 ++--
>  drivers/md/dm-cache-target.c                  |  6 ++--
>  drivers/md/dm-clone-target.c                  | 10 +++---
>  drivers/md/dm-crypt.c                         |  6 ++--
>  drivers/md/dm-delay.c                         |  2 +-
>  drivers/md/dm-era-target.c                    |  2 +-
>  drivers/md/dm-integrity.c                     |  4 +--
>  drivers/md/dm-mpath.c                         |  2 +-
>  drivers/md/dm-raid1.c                         |  2 +-
>  drivers/md/dm-snap-persistent.c               |  2 +-
>  drivers/md/dm-snap.c                          |  6 ++--
>  drivers/md/dm-thin.c                          |  4 +--
>  drivers/md/dm-verity-target.c                 |  2 +-
>  drivers/md/dm-writecache.c                    |  2 +-
>  drivers/md/dm-zoned-target.c                  |  2 +-
>  drivers/md/dm.c                               | 10 +++---
>  drivers/md/md-faulty.c                        |  4 +--
>  drivers/md/md-linear.c                        |  4 +--
>  drivers/md/md-multipath.c                     |  4 +--
>  drivers/md/raid0.c                            |  8 ++---
>  drivers/md/raid1.c                            | 14 ++++----
>  drivers/md/raid10.c                           | 28 ++++++++--------
>  drivers/md/raid5.c                            | 10 +++---
>  drivers/nvme/host/multipath.c                 |  2 +-
>  include/linux/blkdev.h                        |  2 +-
>  44 files changed, 115 insertions(+), 118 deletions(-)
> 

[snipped]

> diff --git a/drivers/lightnvm/pblk-read.c b/drivers/lightnvm/pblk-read.c
> index 140927ebf41e9a..c28537a489bc10 100644
> --- a/drivers/lightnvm/pblk-read.c
> +++ b/drivers/lightnvm/pblk-read.c
> @@ -320,7 +320,7 @@ void pblk_submit_read(struct pblk *pblk, struct bio *bio)
>  		split_bio = bio_split(bio, nr_secs * NR_PHY_IN_LOG, GFP_KERNEL,
>  					&pblk_bio_set);
>  		bio_chain(split_bio, bio);
> -		generic_make_request(bio);
> +		submit_bio_noacct(bio);
>  
>  		/* New bio contains first N sectors of the previous one, so
>  		 * we can continue to use existing rqd, but we need to shrink
> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
> index 221e0191b6870f..3c708e8b5e2d34 100644
> --- a/drivers/md/bcache/bcache.h
> +++ b/drivers/md/bcache/bcache.h
> @@ -929,7 +929,7 @@ static inline void closure_bio_submit(struct cache_set *c,
>  		bio_endio(bio);
>  		return;
>  	}
> -	generic_make_request(bio);
> +	submit_bio_noacct(bio);
>  }
>  
>  /*
> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
> index 6548a601edf0e4..d5c51e33204679 100644
> --- a/drivers/md/bcache/btree.c
> +++ b/drivers/md/bcache/btree.c
> @@ -959,7 +959,7 @@ static struct btree *mca_alloc(struct cache_set *c, struct btree_op *op,
>   * bch_btree_node_get - find a btree node in the cache and lock it, reading it
>   * in from disk if necessary.
>   *
> - * If IO is necessary and running under generic_make_request, returns -EAGAIN.
> + * If IO is necessary and running under submit_bio_noacct, returns -EAGAIN.
>   *
>   * The btree node will have either a read or a write lock held, depending on
>   * level and op->lock.
> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index fc5702b10074d6..dd012ebface012 100644
> --- a/drivers/md/bcache/request.c
> +++ b/drivers/md/bcache/request.c
> @@ -1115,7 +1115,7 @@ static void detached_dev_do_request(struct bcache_device *d, struct bio *bio)
>  	    !blk_queue_discard(bdev_get_queue(dc->bdev)))
>  		bio->bi_end_io(bio);
>  	else
> -		generic_make_request(bio);
> +		submit_bio_noacct(bio);
>  }
>  
>  static void quit_max_writeback_rate(struct cache_set *c,
> @@ -1197,7 +1197,7 @@ blk_qc_t cached_dev_submit_bio(struct bio *bio)
>  		if (!bio->bi_iter.bi_size) {
>  			/*
>  			 * can't call bch_journal_meta from under
> -			 * generic_make_request
> +			 * submit_bio_noacct
>  			 */
>  			continue_at_nobarrier(&s->cl,
>  					      cached_dev_nodata,
> @@ -1311,8 +1311,7 @@ blk_qc_t flash_dev_submit_bio(struct bio *bio)
>  
>  	if (!bio->bi_iter.bi_size) {
>  		/*
> -		 * can't call bch_journal_meta from under
> -		 * generic_make_request
> +		 * can't call bch_journal_meta from under submit_bio_noacct
>  		 */
>  		continue_at_nobarrier(&s->cl,
>  				      flash_dev_nodata,
>

