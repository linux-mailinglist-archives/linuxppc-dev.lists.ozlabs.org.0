Return-Path: <linuxppc-dev+bounces-2226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 781C699CE94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 16:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS0Q70xrgz3bgy;
	Tue, 15 Oct 2024 01:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728917119;
	cv=none; b=YlGHBYY1+ZvFUxjWYbsK70Ct+XY3lrTEmq0N3Av2KmRAyl7492gSWH8cpg36Csx2K9JSQBRMUQX1HfurOQO+QjIFavawRrHSlVgRtwzwuxQRtKdZlzEL0kXgeUgbdsuGVTVlNwoaMZDieOY5WhdZFQBfE+B3NKiT1EnmpQkz+/Ms+WmfO2RzKvK9n+DohFNxEFmo4/XQMNcDOJxjgiBD+uQyUvPSQoOGaPtM4uBcEiyVeC+A21qYWFSzSUKaQ0l3Y6zYLMbtKB2bMcqCH53fIlIX9cyY/na8quTFd41x35CGYJMCzoaIeePLmaPAiDGVk/d5LuxAx1KhydeQlV3n5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728917119; c=relaxed/relaxed;
	bh=JoE9ZLXQHasCpAyzCryklYyAUInrPL5J/td+VUG8jMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/nI1Z38CB+iAubE0mffBDj49izegnLho5si1dSY9kKkMK+1JHaL4NKi7PN8eH73HEIlgmHKMMSXCdQl4nEysc78oH+tFe80Kv3rgKNTQXD3279OASBLbBy+bRl3DwpR+55ZWTEyqcmeky65uSrj2NDbxK0ybUL340PcNGvI8i8HBvA6IdkOHRF2XwcahiZ4oThIYJjovMFnVPWe3CiO2IclgAB+gCrbUFlHAPEbaZKF4bCrAAXQ4dTNr1xkXMp0qP514HztpAFBxyb577V6nFZIwOU/icL9Z/6kUy1xYRDcjX09dKJcgERXJ0HJL7B808rQC1wfNwvcZdcYB1qPwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zjgp4OV1; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zjgp4OV1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS0Q21Ncsz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 01:45:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=JoE9ZLXQHasCpAyzCryklYyAUInrPL5J/td+VUG8jMM=; b=zjgp4OV182malEVjeuLfhFAUAR
	xmTaQT0HuCKSDx2IeDd/JBjTrHhqfkl+Szn05qpqjKrNvmUj8/JaHpK4FQPUoWvdby2QX+YDppFJa
	fnVcfeymjbZ+yecTEh2dm6XsNLVzI5ocOjktQESgNxyVQvf/SXfGcfj0WOu3VujjnpBn73fMAqL+W
	EY565OnheiCX/9V1yI1if+1b6NMtjJahWCqdR9GQsw1Cmsiob/nR6QE1ApdS1HOXhB84T3t0hTNqY
	nqzVIESwCP4qeX4nf2DTEium4B9G5m9Aho7sQY9luxIGrSRJicrUhobTxscGaEVZSz5dyzs4FThd6
	p88G2Leg==;
Received: from 2a02-8389-2341-5b80-350d-7b06-b28a-173d.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:350d:7b06:b28a:173d] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0MJq-00000005Wvb-2tip;
	Mon, 14 Oct 2024 14:45:11 +0000
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
Subject: provide generic page_to_phys and phys_to_page implementations v2
Date: Mon, 14 Oct 2024 16:44:57 +0200
Message-ID: <20241014144506.51754-1-hch@lst.de>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
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

