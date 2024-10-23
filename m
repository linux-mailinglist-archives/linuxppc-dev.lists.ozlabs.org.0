Return-Path: <linuxppc-dev+bounces-2497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF49ABDED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 07:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYHq619Ysz2yY0;
	Wed, 23 Oct 2024 16:36:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729661810;
	cv=none; b=L2yhRGoGkatR5aLeuY1ocQCfjVoPJL/YEJ+qVJkUVMHYiC+WOmnRtmNoLPjWjwpnan+IBONSSnPY200Gfz05R3Gy4q/2p0zixD1frlzJ3AIFHmA1W71DInXYh+v2i/mac3M3trb1PZ70VA+W/mxhAUIDoz1RbD4cmQ/wiXyl9GcrueT6IPf7Fg6nWxz9MKlLe0sz6jkGPPBSMugBCHpRnrQL6QrIjkEF2xcYLwS675ugvrBMdOr3rMV6fuW2KbmZHqIa4FCqCHTV0cOOI8zyYt0/tRpsOayWJvEEaTx+33AhYkqsmWh9I9T3OJN8QvnDx7ZsBylXFKOscmxo8Mh50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729661810; c=relaxed/relaxed;
	bh=fLRpNAyXDIDQIA7HSndcO831t3mGv6BkJWEZG/+8nHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/fZjt1mYo4nlUo4jPmfeU0BNXf/Z+bVohGPayJqzd1W8ML6tbqZzmUmHFFTDyu95q/awEhXmWjNoD+sAwK+JrCrCNeAIRKqTW8ttASdHU4LeeBKRuEG1UPWF4kKRAqArVAXbQ7Rb/qt7y4mH3/55J0guQvmQQQrbOCMZQpRmtYorV7v87vtAA4g0TD2b3T6DnSdirT/C1/BM8I07Mds7cwlVZcPw/dGnVIwI3ak44dU32lFEp3jTeX3AowtdDClugd972EhuwlsMWJauTxd6TnouPsMOKtS4wp0hBbHEEOgX7smsu3o3BbWIkM/Quj69CH/jDlQ928A6X0vZ4mt+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e3yKJui3; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+16051c3a8dabb1c72812+7731+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e3yKJui3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+16051c3a8dabb1c72812+7731+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYHq52Z46z2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 16:36:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fLRpNAyXDIDQIA7HSndcO831t3mGv6BkJWEZG/+8nHM=; b=e3yKJui3E1F31NYxpyaXDU9W7H
	+UGx5mo0sIV2J4IRe3S0lKmAIwjnMnBQslhfMHmdi/AtNvCPQq8jOwp/ruOtXaFiw4c3pJcP7Slky
	PbaGDyP3HGNONuiaY/ACmdbI+BgedQmkkMQaSH4AioQhoJ7QRjxFz7MjTi/c01vFbTn9sHdxiMohI
	6JbxnMeER1pWyG8JXPtFYAEvUzIpMbKe30FHv1KAJDyxneeYpqjBh8LWHkoC5Ijd6IeGCCS15Sz8z
	Nj2X7+iDJITPMDsaPbrq7AWNeuDcMxHMRhSoEw7840C58hpQ3F3tqw//Ij4z5zduWot2M0oEg5VbW
	cuU3mdNA==;
Received: from 2a02-8389-2341-5b80-8c6c-e123-fc47-94a5.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:8c6c:e123:fc47:94a5] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3U34-0000000D4Ir-2Mk1;
	Wed, 23 Oct 2024 05:36:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: provide generic page_to_phys and phys_to_page implementations v3
Date: Wed, 23 Oct 2024 07:36:35 +0200
Message-ID: <20241023053644.311692-1-hch@lst.de>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

page_to_phys is duplicated by all architectures, and from some strange
reason placed in <asm/io.h> where it doesn't fit at all.  

phys_to_page is only provided by a few architectures despite having a lot 
of open coded users.

Provide generic versions in <asm-generic/memory_model.h> to make these
helpers more easily usable.

Changes since v2:
 - spelling fixes

Changes since v1:
 - use slightly less nested macros
 - port a debug check from the old powerpc version to the generic code

Diffstat:
 arch/alpha/include/asm/io.h         |    1 -
 arch/arc/include/asm/io.h           |    3 ---
 arch/arm/include/asm/memory.h       |    6 ------
 arch/arm64/include/asm/memory.h     |    6 ------
 arch/csky/include/asm/page.h        |    3 ---
 arch/hexagon/include/asm/page.h     |    6 ------
 arch/loongarch/include/asm/page.h   |    3 ---
 arch/m68k/include/asm/virtconvert.h |    3 ---
 arch/microblaze/include/asm/page.h  |    1 -
 arch/mips/include/asm/io.h          |    5 -----
 arch/nios2/include/asm/io.h         |    3 ---
 arch/openrisc/include/asm/page.h    |    2 --
 arch/parisc/include/asm/page.h      |    1 -
 arch/powerpc/include/asm/io.h       |   12 ------------
 arch/riscv/include/asm/page.h       |    3 ---
 arch/s390/include/asm/page.h        |    2 --
 arch/sh/include/asm/page.h          |    1 -
 arch/sparc/include/asm/page.h       |    2 --
 arch/um/include/asm/pgtable.h       |    2 --
 arch/x86/include/asm/io.h           |    5 -----
 arch/xtensa/include/asm/page.h      |    1 -
 include/asm-generic/memory_model.h  |   13 +++++++++++++
 22 files changed, 13 insertions(+), 71 deletions(-)

