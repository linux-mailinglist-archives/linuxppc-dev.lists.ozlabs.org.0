Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCC4188B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 14:47:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHQXh2RgNz305f
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=UhHGVNov;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=C+k4X3XQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=UhHGVNov; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=C+k4X3XQ; 
 dkim-atps=neutral
X-Greylist: delayed 370 seconds by postgrey-1.36 at boromir;
 Sun, 26 Sep 2021 20:05:54 AEST
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHLxt1LP0z2yV4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 20:05:54 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9036A580FBA;
 Sun, 26 Sep 2021 05:59:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 26 Sep 2021 05:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=mlHm6qJaY97xGTZYEJ3J85Alc/
 WY1AV0Z5CGewPFjJw=; b=UhHGVNovPleofpk5mVBeMMls1i4coOXmt80/bw0HyF
 HjTu8qNJvqq54MN3sIsFDgJESrj0RNMZQVjzoyzhPwXCLgqc0z0JmbbLEf6pOre9
 c+CcG+SVsywGs5PAldJ2a19z4ybEbY9jo7cJ7LmvMxxNT5vvrukSFYw4cwEMS01R
 ujwGvMLLRCnSKa/DRCd2Mud3MJCQjQEHYpbTww5DLoJydbzYNGM2Uat+qlrN4Vvc
 HTAZVNJR+hLdwKt3idxcKDhuexrgtTNidldPmydKEvSsdif0gGL/ryQY2S8iPOHa
 1tUSNKw5fCCbzKo/NMvy6jcyHy/OuadCOfIaoil20A9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mlHm6qJaY97xGTZYE
 J3J85Alc/WY1AV0Z5CGewPFjJw=; b=C+k4X3XQGbpbimAylv7MAWKQt8i7EYeJd
 KdPdfizHnI9ca95NaiC5zhGAh+s06MsAY/W7fz6IAOQZHhxdFjoeiIYMbtN7iZF1
 Ovo0e/8qWR3+72b7d1rRJ7mgkmj1eCNdR3cVm9BybT1zlt67tDINx4ykXpKmY8yM
 JVNF/Ye9/8XQ6iUxeOD5WoFtECxUhs5IEUAkEgMSOsuUwhTZiQbBmoNsYxHjqqs3
 ltzsJUwRyQ+zA7eRECsryljZeAfH58l2UkGQINKWiu3PdayRIOMr8w9DfCIikwli
 S+PpgH20QrEse5AvL8boFEyi9QWK7dHGT2JmgoD3NpuvxxhPhn0Wg==
X-ME-Sender: <xms:h0RQYRXZiAuQLxu98WuzRA1GKAKo7lZ5TgkHGPzE6jQ_RBzvwyZAjA>
 <xme:h0RQYRlon3kvGEoGf8ssQ7Zr1ey56tbFFgnGdcDxRNPSumxF69qUnFWqK00ncitYi
 LsShmwu_tbpWd_H-tI>
X-ME-Received: <xmr:h0RQYdYg0pyTyOsKq3dK4O0NYOPQTSq6_Ax9sMCZBEqLU6pz76G356hdZh7X5njEYyAw7XtCz49jYFnf-OFZGmxeRE6KUfM9VMGsMswQIJix3SDJH7PH8fs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
 thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
 epuefgleekvddtjefffeejheevleefveekgfduudfhgefhfeegtdehveejfefffffgnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnse
 hsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:h0RQYUWrI63n8st0IdGclKMwCsJ2qe7WGMSWb8aBL4Oq9tGwek7vmg>
 <xmx:h0RQYbmu77l-RqrKLv9zxNFr5a5FHhgHbDfRXpOzobmf3klJAaIMOw>
 <xmx:h0RQYRc3eoOzr42riAK7LCsVqofgE7BFY_vL0oBPd6mcaWQdO45vFw>
 <xmx:ikRQYVkJatlsCRiix6nVZAl1km8f-nsgg35hdbY_krP7h4iwIZmTeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:33 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 00/10] Add Apple M1 support to PASemi i2c driver
Date: Sun, 26 Sep 2021 11:58:37 +0200
Message-Id: <20210926095847.38261-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Sep 2021 22:47:12 +1000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This series adds support for the I2C controller found on Apple Silicon Macs
which has quite a bit of history:

Apple bought P.A. Semi in 2008 and it looks like a part of its legacy continues
to live on in the M1. This controller has actually been used since at least the
iPhone 4S and hasn't changed much since then.
Essentially, there are only a few differences that matter:

	- The controller no longer is a PCI device
	- Starting at some iPhone an additional bit in one register
          must be set in order to start transmissions.
	- The reference clock and hence the clock dividers are different

In order to add support for a platform device I first replaced PCI-specific
bits and split out the PCI driver to its own file. Then I added support
to make the clock divider configurable and converted the driver to use
managed device resources to make it a bit simpler.

The Apple and PASemi driver will never be compiled in the same kernel
since the Apple one will run on arm64 while the original PASemi driver
will only be useful on powerpc.
I've thus followed the octeon (mips)/thunderx(arm64) approach to do the
split: I created a -core.c file which contains the shared logic and just
compile that one for both the PASemi and the new Apple driver.

Now unfortunately I don't have access to any old PASemi hardware and
cannot confirm that my changes haven't broken anything for those.
I believe Hector was in contact with Olof a few months ago who
said that he might still have an old machine on which he could
test this.
I'd very much appreciate if he (or anyone else for that matter :-)) 
could give this series a quick test on the old PASemi machines.


Best,

Sven

Sven Peter (10):
  dt-bindings: i2c: Add Apple I2C controller bindings
  i2c: pasemi: Use io{read,write}32
  i2c: pasemi: Remove usage of pci_dev
  i2c: pasemi: Split off common probing code
  i2c: pasemi: Split pci driver to its own file
  i2c: pasemi: Move common reset code to own function
  i2c: pasemi: Allow to configure bus frequency
  i2c: pasemi: Refactor _probe to use devm_*
  i2c: pasemi: Add Apple platform driver
  i2c: pasemi: Set enable bit for Apple variant

 .../devicetree/bindings/i2c/apple,i2c.yaml    |  61 +++++++++
 MAINTAINERS                                   |   2 +
 drivers/i2c/busses/Kconfig                    |  11 ++
 drivers/i2c/busses/Makefile                   |   3 +
 drivers/i2c/busses/i2c-pasemi-apple.c         | 122 ++++++++++++++++++
 .../{i2c-pasemi.c => i2c-pasemi-core.c}       | 114 +++++-----------
 drivers/i2c/busses/i2c-pasemi-core.h          |  21 +++
 drivers/i2c/busses/i2c-pasemi-pci.c           |  85 ++++++++++++
 8 files changed, 334 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-pasemi-apple.c
 rename drivers/i2c/busses/{i2c-pasemi.c => i2c-pasemi-core.c} (77%)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-core.h
 create mode 100644 drivers/i2c/busses/i2c-pasemi-pci.c

-- 
2.25.1

