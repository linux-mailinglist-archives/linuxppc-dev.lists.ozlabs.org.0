Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C53421F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 17:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F28Yx1VXPz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 03:32:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=depni.sinp.msu.ru (client-ip=213.131.7.21;
 helo=depni-mx.sinp.msu.ru; envelope-from=belyshev@depni.sinp.msu.ru;
 receiver=<UNKNOWN>)
X-Greylist: delayed 520 seconds by postgrey-1.36 at boromir;
 Sat, 20 Mar 2021 03:32:03 AEDT
Received: from depni-mx.sinp.msu.ru (depni-mx.sinp.msu.ru [213.131.7.21])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F28Yb12Kgz3bsr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 03:32:02 +1100 (AEDT)
Received: from spider (ip-95-220-117-58.bb.netbynet.ru [95.220.117.58])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 16F391BF496;
 Fri, 19 Mar 2021 19:24:04 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
In-Reply-To: <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk> (Al Viro's message of
 "Thu, 18 Mar 2021 05:54:55 +0000")
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
 <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
Date: Fri, 19 Mar 2021 19:23:17 +0300
Message-ID: <87lfajun7u.fsf@depni.sinp.msu.ru>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Al Viro <viro@zeniv.linux.org.uk> writes:

> ...
>
> Do you have reports of libata variants of drivers actually tested on
> those?

PATA_CMD64X works fine on my 164LX for many years, last tested with 5.12-rc3.

(with a caveat: in my setup with CF card DMA is broken, but it is broken
with BLK_DEV_CMD64X as well).
