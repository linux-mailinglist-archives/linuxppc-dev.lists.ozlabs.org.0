Return-Path: <linuxppc-dev+bounces-1879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F688996911
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 13:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNrd43GtGz2xrk;
	Wed,  9 Oct 2024 22:43:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728474232;
	cv=none; b=f2CXWsKF+SKYa9qR4PhN2G65fIsUxln8OVm9DiXlx7cQ6J94eZMI9ehd6I+UqhIfs8nrZsp5YayACX+72bpKz75AvvZc9eNiXMRRbmKCjgxV7bP0rNQkYxiXrOj2+2KUuDmM0uEix7LjTWxBgJzkxj+HkHdH3zTWDx2JcZDF8LDlhTcyMxNvxu2QAbyYDSk0n10EeidEtaSkpL04MHcme48eWBXI1RAdMwsPV02OSlQhkzK/n3M326OL24yAYDPx+oTHEuuj3nKqlGA1yRm2+oaZHFPkIeoOs3mQStLZs6y5ik57fA3kb0cLNCu1zKVmybWIgYmsZM8CtwwXUvj4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728474232; c=relaxed/relaxed;
	bh=kWHm4EzhmcRIg2+TkegJgMDV+hPGEBlUxndw3Jlx9rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EL3xgWozMoefDWkPFHNacInrk2DR+72jiQN8jKU3Gfpvb9K4E7FfymyF6NvtkmTc3gnAyubGbM7RB2Lzw9PknRtU67+Rjd43FhVr4H4WgQCgzogHUaZqzebDwyUg62gwVb1j4R3QP5udbAG/Ap72oaUpAm3hdFTlTEc7BGY2HDU96JAGpbzr/kjoHsdEvWnHU2Y3HfM87IWhrdLObtU7XGeTpg0I8+V7mr7KaOKXFhLc/l9dG5b0bP1kVkvTB7dzGe5gmtW1g/KfokHTMusAbjil++6ZJFKovUsThQPa4q1igDX6AZ8hF3owrRtVqIjnAdFunierDYsE3tY017yVFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+cb460f4b002c9a6a9c29+7717+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+cb460f4b002c9a6a9c29+7717+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNrcw0sNpz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 22:43:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kWHm4EzhmcRIg2+TkegJgMDV+hPGEBlUxndw3Jlx9rs=; b=2+yJsVy9LAMPiwBw1DaQUCVfFe
	QyJY3aXFefdtcO1fkvZGljTkLYposSgsM7AZReMFMa5vMMuXMOgGVdcU9zQdIJwBYrbb16tnCmCtE
	vNOARAY2QdRbLhLzwCmJJITCkzHE+z2s4LxbFJLnQnz72E/EgOytYrBCmqGlXUueTH43Zvn3iwPd5
	vtEkG0pez/ZHGQMmeP+HFbbWklO8Hx4jhRbB8X2oYTSaDFCiFaZqmXPSiknGB7DisHeJxUIdziTnh
	aK+QEe9gB1/Npt1KOI0PymNgFjaI09mZBm6jnkU8fF5L/BXNREkq5Tt9t1WB+iiUWzLTi/2D6PVUw
	TOOwM4Jg==;
Received: from 2a02-8389-2341-5b80-164d-fdb4-bac5-9f5e.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:164d:fdb4:bac5:9f5e] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1syV6O-000000095ov-1DQp;
	Wed, 09 Oct 2024 11:43:36 +0000
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
Subject: provide generic page_to_phys and phys_to_page implementations
Date: Wed,  9 Oct 2024 13:43:21 +0200
Message-ID: <20241009114334.558004-1-hch@lst.de>
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
 include/asm-generic/memory_model.h  |    3 +++
 22 files changed, 3 insertions(+), 71 deletions(-)

