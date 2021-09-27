Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420AF41A24C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 00:05:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJGs81FkFz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 08:05:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=37HYpCsz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=37HYpCsz; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJGpM4fvwz2xtH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 08:02:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Qm1LFoZMfn5lSLKsNTBNPz2MUy7MRXKY17ahzFVUS3I=; b=37HYpCszFL1/b0oe/u8pFd9QH4
 +c+3j84RuEtSW5Qk6nZIclMOP2UEhpq86fk3g/zNpEtdKHuNE5BW9aa9ZQimPbGtXQ5W1rodKdCwR
 /Zrz64kre/ZLz98Q0kSUgNiY3OmmRtSWOxnaOgzxEX7YPUEmIItcEVUI0UxGlhpoGvm0TBpDaFjM4
 f6ccW7cjGNpKb8t58ADq1tt16SwJ/oaYFuW0KmAPiB5snBepZsnNwg3H1tSeitacXdf9g8tsZBa/W
 NPmUVPHx9iHPOioxoiJc5dEFjQpzx8D7ZXWu3TZeiCzx19T2ruTWOCCouk4YwPTKCN1N9y8RbvfR/
 ltsoAbLA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyhC-004UJ9-A2; Mon, 27 Sep 2021 22:01:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH v2 00/10] block: fourth batch of add_disk() error handling
 conversions
Date: Mon, 27 Sep 2021 15:01:47 -0700
Message-Id: <20210927220157.1069658-1-mcgrof@kernel.org>
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

This is the fourth batch of add_disk() error handling driver
conversions. This set along with the entire 7 set of driver conversions
can be found on my 20210927-for-axboe-add-disk-error-handling branch
[0].

On this v2 series the following modifications have been made since the
last v1 series of this patch set:

  - rebased onto linux-next tag 20210927
  - added the only reviewed-by tag for this series for rnbd Jack Wang

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210927-for-axboe-add-disk-error-handling

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

