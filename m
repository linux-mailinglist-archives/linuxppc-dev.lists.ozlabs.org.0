Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0F3A0CA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 18:53:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Llp218fYzDqwv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2019 02:53:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=tom.leiming@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UHjKKPz1"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LlmG2nBvzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jun 2019 02:51:37 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id n4so5124890wrs.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jun 2019 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gR4IOaCCUTGvBaZhfnsBw7K29W8etkz1Veuscov6zNA=;
 b=UHjKKPz15vYhk+MgoG9uVx4fK1yxijnZCNRu6yIdLp9RluyynJHwDpOu21+vJzcAZN
 cpVWmxxo96r1H/xTIKiSgtEpDH7cUWuWgEykWij/Kirkrk6PL5l8nKxOCu4rsdC4VItv
 BLQ/9Qkoco8MZwsL78R+R/9TBT/cFYGNAt8pi9/XrvlIXgyjvLgNlYB0E+aDd0crD5dv
 fPdNDqK0EGGBqI7mGmY46jsr1w238NJglg6JZuUrXhwSuFW/tblEcuIpvR4p1GI0YOFR
 nRWclfFPiPJJD1DKoFNoxAM7tG3m95AuNk+cVYxJm3rBEDANJotjx0KEaAhPtW4Vm2y/
 C2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gR4IOaCCUTGvBaZhfnsBw7K29W8etkz1Veuscov6zNA=;
 b=c4HHLkXhkod56y/T+B2J47/IBPjuDgJTg9yQUeKUrUXC+SwnSeEeMYAnPoE+uGMVqu
 baHjz3RD+2HuL2iHu0Nha70kJi/omgr82gV3cRbqrQOucqruBneC1ILCzc5OXhLyPopT
 iHMxICDkPXESVStvuNEMpS01DW/6ZX1C3XksCt0AKJt5RXYflTE81JcOHugfzBhfGr2h
 luOJ3p8SM6bPgHSRZRQG/ruSmnJH4J8b6919l3iCGSpUz5IYxuG8JwfQpGiWsyilfaLF
 q6O+OErRUrGO/eYXduXjCBU8kLY/ZhQVx2l+ySaoSocqSgR+y4Fuf7uc11bWop9eejhz
 gsVg==
X-Gm-Message-State: APjAAAWa1qu1QCvOeqJQkc9h+AIDO+YDtTLxrp+gWRDQ19p2tRADLuLl
 IiYau+4KSpTb7IbJvm3TYskbPtKZtkG36JAiQoQ=
X-Google-Smtp-Source: APXvYqyW1YAlHxl5jkTyIcVuWsUg5I6pHPOlF0d5SX+3EM96SZi5nAuY5I1ng/URaIR2wG9ZaKlQHAS9xDFWTweJltc=
X-Received: by 2002:adf:fbc2:: with SMTP id d2mr12050109wrs.334.1560012692846; 
 Sat, 08 Jun 2019 09:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190423054131.GB31496@umbus.fritz.box>
 <20190425061958.GA7881@lst.de>
 <20190426010517.GA7378@umbus.fritz.box>
 <20190426035643.GB7378@umbus.fritz.box>
In-Reply-To: <20190426035643.GB7378@umbus.fritz.box>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 9 Jun 2019 00:51:20 +0800
Message-ID: <CACVXFVP09V_mAbYm-QgfDmSiLCw5Td-EeDZ-c=B7t-TxV6DZwQ@mail.gmail.com>
Subject: Re: powerpc hugepage leak caused by 576ed913 "block: use bio_add_page
 in bio_iov_iter_get_pages"
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Michael Ellerman <michael@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2019 at 12:41 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Fri, Apr 26, 2019 at 11:05:17AM +1000, David Gibson wrote:
> > On Thu, Apr 25, 2019 at 08:19:58AM +0200, Christoph Hellwig wrote:
> > > Just curious:  What exact trees do you see this with?  This area
> > > changed a lot with the multipage bvec support, and subsequent fixes.
> >
> > So, I tried it with 576ed913 itself and with 576ed913^ to verify that
> > it didn't happen there.  The problem also occurred with Linus' tree as
> > of when I started bisecting, which appears to have been 444fe991.
> > Actually, come to that, here's the whole bisect log in case it's
> > helpful:
> >
> > # git bisect log
> > git bisect start
> > # good: [bebc6082da0a9f5d47a1ea2edc099bf671058bd4] Linux 4.14
> > git bisect good bebc6082da0a9f5d47a1ea2edc099bf671058bd4
> > # bad: [444fe991353987c1c9bc5ab1f903d01f1b4ad415] Merge tag 'riscv-for-linus-5.1-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux
> > git bisect bad 444fe991353987c1c9bc5ab1f903d01f1b4ad415
> > # good: [399c4129eba6145924ab90363352b7bdcd554751] Merge tag 'pxa-for-4.19-dma_slave_map' of https://github.com/rjarzmik/linux
> > git bisect good 399c4129eba6145924ab90363352b7bdcd554751
> > # bad: [73b6f96cbc0162787bcbdac5f538167084c8d605] Merge branch 'drm-fixes-4.20' of git://people.freedesktop.org/~agd5f/linux into drm-fixes
> > git bisect bad 73b6f96cbc0162787bcbdac5f538167084c8d605
> > # good: [85a585918fb4122ad26b6febaec5c3c90bf2535c] Merge tag 'loadpin-security-next' of https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into next-loadpin
> > git bisect good 85a585918fb4122ad26b6febaec5c3c90bf2535c
> > # bad: [3acbd2de6bc3af215c6ed7732dfc097d1e238503] Merge tag 'sound-4.20-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> > git bisect bad 3acbd2de6bc3af215c6ed7732dfc097d1e238503
> > # good: [8f18da47211554f1ef674fef627c05f23b75a8e0] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next
> > git bisect good 8f18da47211554f1ef674fef627c05f23b75a8e0
> > # bad: [0d1b82cd8ac2e8856ae9045c97782ac1c359929c] Merge branch 'ras-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect bad 0d1b82cd8ac2e8856ae9045c97782ac1c359929c
> > # bad: [1650ac53066577a5e83fe3e9d992c9311597ff8c] Merge tag 'mmc-v4.20' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
> > git bisect bad 1650ac53066577a5e83fe3e9d992c9311597ff8c
> > # bad: [6ab9e09238fdfd742fe23b81e2d385a1cab49d9b] Merge tag 'for-4.20/block-20181021' of git://git.kernel.dk/linux-block
> > git bisect bad 6ab9e09238fdfd742fe23b81e2d385a1cab49d9b
> > # good: [528985117126f11beea339cf39120ee99da04cd2] Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> > git bisect good 528985117126f11beea339cf39120ee99da04cd2
> > # bad: [2cf99bbd106f89fc72f778e8ad9d5538f1ef939b] lightnvm: pblk: add helpers for chunk addresses
> > git bisect bad 2cf99bbd106f89fc72f778e8ad9d5538f1ef939b
> > # bad: [33b14f67a4e1eabd219fd6543da8f15ed86b641c] nvme: register ns_id attributes as default sysfs groups
> > git bisect bad 33b14f67a4e1eabd219fd6543da8f15ed86b641c
> > # bad: [27ca1d4ed04ea29dc77b47190a3cc82697023e76] block: move req_gap_back_merge to blk.h
> > git bisect bad 27ca1d4ed04ea29dc77b47190a3cc82697023e76
> > # bad: [07b05bcc3213ac9f8c28c9d835b4bf3d5798cc60] blkcg: convert blkg_lookup_create to find closest blkg
> > git bisect bad 07b05bcc3213ac9f8c28c9d835b4bf3d5798cc60
> > # good: [cbeb869a3d1110450186b738199963c5e68c2a71] block, bfq: correctly charge and reset entity service in all cases
> > git bisect good cbeb869a3d1110450186b738199963c5e68c2a71
> > # bad: [576ed9135489c723fb39b97c4e2c73428d06dd78] block: use bio_add_page in bio_iov_iter_get_pages
> > git bisect bad 576ed9135489c723fb39b97c4e2c73428d06dd78
> > # good: [c8765de0adfcaaf4ffb2d951e07444f00ffa9453] blok, bfq: do not plug I/O if all queues are weight-raised
> > git bisect good c8765de0adfcaaf4ffb2d951e07444f00ffa9453
> > # first bad commit: [576ed9135489c723fb39b97c4e2c73428d06dd78] block: use bio_add_page in bio_iov_iter_get_pages
> >
> > The problem also occurred with the RHEL8 downstream kernel tree.
> > That's based on 4.18, but has 576ed913 backported.
> >
> > > So I'd be really curious if it can be reproduced with Jens' latest
> > > block for-5.2 tree (which should be in latest linux-next).
> >
> > I'll see if I can try that when I next get access to the machine.
>
> Ok, I've now had a chance to test the next-20190423 tree.
>
> I can still reproduce the problem: in fact it is substantially worse,
> and somewhat more consistent.
>
> Previously I usually lost 2-3 hugepages per run, though I'd
> occasionally seen other values between 0 and 8.  With the next tree, I
> lost 46 hugepages on most runs, though I also saw 45 and 48
> occasionally.

Hi David,

The following two patches should fix the issue, please test it.

https://lore.kernel.org/linux-block/20190608164853.10938-1-ming.lei@redhat.com/T/#t

Thanks,
Ming Lei
