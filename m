Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A0440A55
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 19:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HhQdC4BMrz3cCs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Oct 2021 04:04:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TxRznXHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20210112.gappssmtp.com
 header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=TxRznXHi; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HhQcT2hwdz2yKJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Oct 2021 04:03:50 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id 62so8970660iou.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=mxOtNLa1eAMR0wpGD1VMaJkJmBISmLqnmjVIAsRcHvc=;
 b=TxRznXHiVxPacqnwtNIIT0ht6nYzSE2RDLvhKozr3LBin/ehB9sdFZDpWWjj4OSd+b
 wNVCVAvLw46JGTiAgUNZvEmvOxN66IADWaxYxM1QrR9lkXlSakotxqRDVZM1H74gZzC3
 dptCLtGLLsAefANWtuy2n0rGMRlWfacf/IHiKhBgdqwAXaaJe6kpIkKpb32JNyUJDsPQ
 h2JfNkORS5+nxcLRKrwXOlVNT9+6p7ra3ZV/bu0Di5bdLiqfxKarFy4zEtd9fllr2oYp
 7Q6VyWuncWNiiodyabAkyjZysJUsC526HyMFP48mdzk4scwMLVB6FI1dgulKgRvL0IOy
 PuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=mxOtNLa1eAMR0wpGD1VMaJkJmBISmLqnmjVIAsRcHvc=;
 b=rWYTXvLqXJLMfFkBYS5KF8FeoN67silS1S2mEJ4fnCR24iroMzVSUm18nysBYXs/ZT
 Gpr/5zmpiEhE9Ybg010VPFHd3Mmuj2BXhhtl5bhL3Te2YkH/9/0Mi69qA8u6tvD5ZSUA
 z2pcTxpl1F/suhAqvqUTAb/tMrCUB0p6R6RRKGHvS8R9d8b6FGMYvLq0wJQXnsY6qu44
 7tvhITDFmzAEIvWOcEINNY6iCK+jZU5dXv74hcMFi67vFqhCIh02Zv0mL9PDm1KCVBC4
 zwzOYwEWhCZNcCVl+3YdkqTP9C0I1/BFFFQQXkjCm6Q0pHu0x6ib2K2qId7tB2Gziq+H
 LD9w==
X-Gm-Message-State: AOAM531Nbsrgt9F8q0eLLw8xSxZ07+qpC5vsgdSmQGYNUA1AIqXAkXR9
 z1lj4dnfZ8ssFaQfrRmdUTEelg==
X-Google-Smtp-Source: ABdhPJzMkwx+8CSrFVSVUQuPKJKJNsEs+j3d0vp9XLDv6RRzhAFgLrCeu1vNWGVlfsmYjr2iZBeQpQ==
X-Received: by 2002:a05:6602:2a44:: with SMTP id
 k4mr13067137iov.56.1635613426348; 
 Sat, 30 Oct 2021 10:03:46 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id z26sm4948483ioe.9.2021.10.30.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:03:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: kbusch@kernel.org, dan.j.williams@intel.com, richard@nod.at, jim@jtan.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, miquel.raynal@bootlin.com,
 vigneshr@ti.com, ngupta@vflare.org, ira.weiny@intel.com,
 senozhatsky@chromium.org, hch@lst.de, paulus@samba.org,
 Luis Chamberlain <mcgrof@kernel.org>, sagi@grimberg.me, mpe@ellerman.id.au,
 minchan@kernel.org, geoff@infradead.org, benh@kernel.crashing.org
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
Subject: Re: (subset) [PATCH 00/13] block: add_disk() error handling stragglers
Message-Id: <163561342513.76453.10042066842818606438.b4-ty@kernel.dk>
Date: Sat, 30 Oct 2021 11:03:45 -0600
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

[08/13] zram: add error handling support for add_disk()
        commit: 5e2e1cc4131cf4d21629c94331f2351b7dc8b87c
[10/13] ps3disk: add error handling support for add_disk()
        commit: ff4cbe0fcf5d749f76040f782f0618656cd23e33
[11/13] ps3vram: add error handling support for add_disk()
        commit: 3c30883acab1d20ecbd3c48dc12b147b51548742

Best regards,
-- 
Jens Axboe


