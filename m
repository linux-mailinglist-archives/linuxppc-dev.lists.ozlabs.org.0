Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049337F53F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 12:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgnKy1QZqz30BR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 20:03:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bt3HWyrB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=jgross@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=Bt3HWyrB; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgnKT04gqz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 20:03:08 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620900185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mSXvMzPiVbs1p8U5teTrqe++A9Kur1ffFfsRtolTEq4=;
 b=Bt3HWyrBQzhFA/VHRnLOrbIQmpMXluR0avJegIDgYP/25lKg9FIZAPmZkKNNj4Tn46vHsx
 DqH+iMtGCUU89BF3407TPvLq70y+9QiQwuomJ/KD69JlH6Mpq8EAgwwGKMJeCtvkebsFoG
 WMLd9rAM4L+C5WZX30UyH56rbG89gqM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85808AFE5;
 Thu, 13 May 2021 10:03:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/8] xen: harden frontends against malicious backends
Date: Thu, 13 May 2021 12:02:54 +0200
Message-Id: <20210513100302.22027-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jiri Slaby <jirislaby@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xen backends of para-virtualized devices can live in dom0 kernel, dom0
user land, or in a driver domain. This means that a backend might
reside in a less trusted environment than the Xen core components, so
a backend should not be able to do harm to a Xen guest (it can still
mess up I/O data, but it shouldn't be able to e.g. crash a guest by
other means or cause a privilege escalation in the guest).

Unfortunately many frontends in the Linux kernel are fully trusting
their respective backends. This series is starting to fix the most
important frontends: console, disk and network.

It was discussed to handle this as a security problem, but the topic
was discussed in public before, so it isn't a real secret.

Juergen Gross (8):
  xen: sync include/xen/interface/io/ring.h with Xen's newest version
  xen/blkfront: read response from backend only once
  xen/blkfront: don't take local copy of a request from the ring page
  xen/blkfront: don't trust the backend response data blindly
  xen/netfront: read response from backend only once
  xen/netfront: don't read data from request on the ring page
  xen/netfront: don't trust the backend response data blindly
  xen/hvc: replace BUG_ON() with negative return value

 drivers/block/xen-blkfront.c    | 118 +++++++++-----
 drivers/net/xen-netfront.c      | 184 ++++++++++++++-------
 drivers/tty/hvc/hvc_xen.c       |  15 +-
 include/xen/interface/io/ring.h | 278 ++++++++++++++++++--------------
 4 files changed, 369 insertions(+), 226 deletions(-)

-- 
2.26.2

