Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D0440A5A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 19:08:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HhQjh6fnqz2yXc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Oct 2021 04:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Wopv4tcW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20210112.gappssmtp.com
 header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Wopv4tcW; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HhQj335Ykz2x9P
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Oct 2021 04:07:51 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id f9so16297084ioo.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 10:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=cj7b4WzzJcmZ+tVCjhkRXyXcKv7YSLzrxMjWUHMImLY=;
 b=Wopv4tcWqOAJZGqYx1oWAbH++R5QUK3biTMI/xiKmgq8kzd4BjfbTwqyki2cw/dKMZ
 zMePBAMmf+SLZ1e8obk5O2B8EqEDPivRKlRqkehfknMQ8MNLufX0ul/cJWZhewILt5Oh
 6lHlndFiey7eEaiN0hgGC39LpO35JqvHs71OpDs0TY9XL4bVtIavn6nIEfmea/hq+LZm
 LUd2MMSVR+UBeThxm8no9AVI+Lkwbvjh/Wd3YPAJax1gQlPv8O8NjJriy/LoIbj10SRd
 9zfUre2XtVMt8acixbfHpVQ/bS6vxPEHVT/7jgMGiywvDrcUkISQerA52lYJTtjCW/Wj
 XOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=cj7b4WzzJcmZ+tVCjhkRXyXcKv7YSLzrxMjWUHMImLY=;
 b=c1AQGNRMTYx/GF8Ztk7wYsL1NeKQRRQH+/zG7OTdVC/12LOwI5jNmbcb5g13IEgQEq
 KU+eIy4i9/VxGFkKNBW7GwPmd+MZeZKO1g828noAVqpgOtQuvxrM8U/rkBM64m2+sg0Q
 br83GUtbvfUIuoGGiLEsH3qb4aDlUFK+/3I5BfVvhhIw2bTU3YGvjDun5ENmxuPT+Mbc
 WzE6QYNYjP0ip2eiVcT9QOcZHsM95O8nC4oYDmLrpaeQl9Ip6Nxah6rFOuJqI7G6eXxa
 MohLTOEQ94iTkz3wd4sYAHzBjO25nas7ZU8HzPOJ8CvjQ8HEwSEsglGmJ835Q0HBehAT
 12Cg==
X-Gm-Message-State: AOAM532KR8AvU2B0oroNDJ1sY8O5urqOYhALETWRSYOLNaWlvo0s2UMN
 U8E1MIpWx7KJ5rZsUAlex55NWg==
X-Google-Smtp-Source: ABdhPJzTVX/ZyGI7Pmdgi3Ji0UX3geoz9OnmwOkoYIKCEwZOPpGwJ2EvLzYUymZf8Uzb5XEpGHWwDg==
X-Received: by 2002:a02:cbb1:: with SMTP id v17mr13623686jap.51.1635613667880; 
 Sat, 30 Oct 2021 10:07:47 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id o8sm5504963ilu.2.2021.10.30.10.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: vigneshr@ti.com, richard@nod.at, geoff@infradead.org,
 vishal.l.verma@intel.com, kbusch@kernel.org, sagi@grimberg.me,
 minchan@kernel.org, mpe@ellerman.id.au, ira.weiny@intel.com, hch@lst.de,
 senozhatsky@chromium.org, dave.jiang@intel.com, miquel.raynal@bootlin.com,
 paulus@samba.org, dan.j.williams@intel.com, benh@kernel.crashing.org,
 jim@jtan.com, ngupta@vflare.org, Luis Chamberlain <mcgrof@kernel.org>
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
Subject: Re: (subset) [PATCH 00/13] block: add_disk() error handling stragglers
Message-Id: <163561366669.77445.6593243934116934390.b4-ty@kernel.dk>
Date: Sat, 30 Oct 2021 11:07:46 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 16:52:06 -0700, Luis Chamberlain wrote:
> This patch set consists of al the straggler drivers for which we have
> have no patch reviews done for yet. I'd like to ask for folks to please
> consider chiming in, specially if you're the maintainer for the driver.
> Additionally if you can specify if you'll take the patch in yourself or
> if you want Jens to take it, that'd be great too.
> 
> Luis Chamberlain (13):
>   block/brd: add error handling support for add_disk()
>   nvme-multipath: add error handling support for add_disk()
>   nvdimm/btt: do not call del_gendisk() if not needed
>   nvdimm/btt: use goto error labels on btt_blk_init()
>   nvdimm/btt: add error handling support for add_disk()
>   nvdimm/blk: avoid calling del_gendisk() on early failures
>   nvdimm/blk: add error handling support for add_disk()
>   zram: add error handling support for add_disk()
>   z2ram: add error handling support for add_disk()
>   ps3disk: add error handling support for add_disk()
>   ps3vram: add error handling support for add_disk()
>   block/sunvdc: add error handling support for add_disk()
>   mtd/ubi/block: add error handling support for add_disk()
> 
> [...]

Applied, thanks!

[01/13] block/brd: add error handling support for add_disk()
        commit: e1528830bd4ebf435d91c154e309e6e028336210

Best regards,
-- 
Jens Axboe


