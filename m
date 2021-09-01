Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5823FE485
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 23:06:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0GnX23Sgz3cW0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 07:06:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQaQ7eFj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=KQaQ7eFj; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Gh365hGz2xqx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 07:01:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=z+SxEsknd8tI+kUyzRYwWaYVqREcohaFxxJlN0ygQ94=; b=KQaQ7eFjqUbKqNvnzDssT/Ggjw
 mD4OcL+VRUeCxPHjxtIiAxctsEFC+XTBYOvYR1tKx3uEYQYDw0SkD8/RcJn5CvwNsm1SYtL/6jVnT
 P1XNxcnRxP6C5I8iP8Z+vbroaN2hk3CKuvA+j9Gr75D8nE+EStMszSPu184BVXzee3nA1McZHjL1Y
 LzHBYfcqvCzbbaFm9wev7pH5jko+MYDhUMDH7zWjO6y0H3dtNljnqOaS3TqSMXeXygbbLdBXBTmBZ
 XLyqk8ZOsFk+lhqocqUMUDaObKN/lZ+WvzVVWiN7MH5Db1z9pPRu9QqJWsxy4jMvhdbP35R/pcqEy
 VjuWrd2g==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLXLR-007LW1-53; Wed, 01 Sep 2021 21:00:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH 00/10] block: fourth batch of add_disk() error handling
 conversions 
Date: Wed,  1 Sep 2021 14:00:18 -0700
Message-Id: <20210901210028.1750956-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The full set of changes can be found on my branch titled
20210901-for-axboe-add-disk-error-handling [0] which is
now based on axboe/master.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210901-for-axboe-add-disk-error-handling

Luis Chamberlain (10):
  mtip32xx: add error handling support for add_disk()
  pktcdvd: add error handling support for add_disk()
  ps3disk: add error handling support for add_disk()
  ps3vram: add error handling support for add_disk()
  rnbd: add error handling support for add_disk()
  block/rsxx: add error handling support for add_disk()
  block/sunvdc: add error handling support for add_disk()
  block/sx8: add error handling support for add_disk()
  pf: add error handling support for add_disk()
  mtd/ubi/block: add error handling support for add_disk()

 drivers/block/mtip32xx/mtip32xx.c |  4 +++-
 drivers/block/paride/pf.c         |  4 +++-
 drivers/block/pktcdvd.c           |  4 +++-
 drivers/block/ps3disk.c           |  8 ++++++--
 drivers/block/ps3vram.c           |  7 ++++++-
 drivers/block/rnbd/rnbd-clt.c     | 13 +++++++++----
 drivers/block/rsxx/core.c         |  4 +++-
 drivers/block/rsxx/dev.c          | 12 +++++++++---
 drivers/block/sunvdc.c            | 14 +++++++++++---
 drivers/block/sx8.c               | 13 +++++++++----
 drivers/mtd/ubi/block.c           |  8 +++++++-
 11 files changed, 69 insertions(+), 22 deletions(-)

-- 
2.30.2

