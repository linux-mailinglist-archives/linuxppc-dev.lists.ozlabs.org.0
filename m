Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C435BE5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:57:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJjLY5QmSz3cFs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:57:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N3qsnG3A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+68317ec28ad53de92ceb+6441+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=N3qsnG3A; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJjJf2chzz301x
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=AsS0qVynmQzQb3jMNW5nUdgLQlBP5gem8xAk3DyV6Nw=; b=N3qsnG3AazzqKHA9ERMeLn+ayA
 79zNMoOF8+tpwX3fO2Rh+XPpOxrsh5chPi9nl+OS+weKbQfRS1RhnAezt+rbfC8878F3qJcAWs1G8
 h1XkE6AKPUP0C1gSxJeRBD7OMHv8/OCx5KxF+Yi65kg+E2JiKFB++8QOpbhseR6Oi8zyXmYlH2MQh
 rzjyTDH2JUqIFhl4k3bFg/QleggRLVQW3VeTocjbzt8x45w4mHx+7g+anay83LhRTwKPDhdf8frSx
 qRuf7GS1+ruREWDPzYBTnLoH1vqzztN9pVyAE2pDOAtcZGZqvpfTvN5Q1czxF2ql9ZMBOgwFVUtJB
 rNnUaw9w==;
Received: from [2001:4bb8:199:e2bd:3218:1918:85d1:2852] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsMF-0060DS-FS; Mon, 12 Apr 2021 08:55:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: consolidate the flock uapi definitions
Date: Mon, 12 Apr 2021 10:55:40 +0200
Message-Id: <20210412085545.2595431-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

currently we deal with the slight differents in the various architecture
variants of the flock and flock64 stuctures in a very cruft way.  This
series switches to just use small arch hooks and define the rest in
asm-generic and linux/compat.h instead.

Diffstat:
 arch/arm64/include/asm/compat.h        |   20 --------------------
 arch/mips/include/asm/compat.h         |   23 ++---------------------
 arch/mips/include/uapi/asm/fcntl.h     |   28 +++-------------------------
 arch/parisc/include/asm/compat.h       |   16 ----------------
 arch/powerpc/include/asm/compat.h      |   20 --------------------
 arch/s390/include/asm/compat.h         |   20 --------------------
 arch/sparc/include/asm/compat.h        |   22 +---------------------
 arch/x86/include/asm/compat.h          |   24 +++---------------------
 include/linux/compat.h                 |   31 +++++++++++++++++++++++++++++++
 include/uapi/asm-generic/fcntl.h       |   21 +++++++--------------
 tools/include/uapi/asm-generic/fcntl.h |   21 +++++++--------------
 11 files changed, 54 insertions(+), 192 deletions(-)
