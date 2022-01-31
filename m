Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67A4A3DFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 07:50:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJbh2jBQz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 17:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MfXv6k0J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c8a487c16eeb054acd37+6735+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJb16lKjz2xrj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:49:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=G3eZFCktx2riD9Fj3jpqcTZpN3ouTd5tOKnvsSiUNyA=; b=MfXv6k0J576+bDzPKkd7XmOSk6
 Q7XFADAC+rGIOXNLxAiJprclkGI1atOQ+EUxxI1XOHDSFUTEB+n08NACzpmB7c/K5XUf6nOWW7ejJ
 NJ7KSXUKvKXa3MR/++aeuPRMGwq5OBa6pL8tbsJhs7gk3PVuGROtvO9X/XNfl51VGNNwp1FytN0J3
 X99/N1kFhFcMVB1wYK7lirZkjKe6HD0Uc4cECk2h6pvsnDrEzZNxmjrn04MBXOXcQKsakL+5BPby2
 z+1OXA3/T2MP9igSUyKllXpu1HyaJP0nCYf3rxjL9MW6aefNFPAKYlrvZt2i7y8Dcq8T9IZJQ2HLW
 iMASDxQg==;
Received: from [2001:4bb8:191:327d:13f5:1d0a:e266:6974] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEQVN-008AUM-0p; Mon, 31 Jan 2022 06:49:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: consolidate the compat fcntl definitions v2
Date: Mon, 31 Jan 2022 07:49:28 +0100
Message-Id: <20220131064933.3780271-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
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
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

currenty the compat fcnt definitions are duplicate for all compat
architectures, and the native fcntl64 definitions aren't even usable
from userspace due to a bogus CONFIG_64BIT ifdef.  This series tries
to sort out all that.

Changes since v1:
 - only make the F*64 defines uapi visible for 32-bit architectures

Diffstat:
 arch/arm64/include/asm/compat.h        |   20 --------------------
 arch/mips/include/asm/compat.h         |   23 ++---------------------
 arch/mips/include/uapi/asm/fcntl.h     |   30 +++++-------------------------
 arch/parisc/include/asm/compat.h       |   16 ----------------
 arch/powerpc/include/asm/compat.h      |   20 --------------------
 arch/s390/include/asm/compat.h         |   20 --------------------
 arch/sparc/include/asm/compat.h        |   22 +---------------------
 arch/x86/include/asm/compat.h          |   24 +++---------------------
 include/linux/compat.h                 |   31 +++++++++++++++++++++++++++++++
 include/uapi/asm-generic/fcntl.h       |   23 +++++++++--------------
 tools/include/uapi/asm-generic/fcntl.h |   21 +++++++--------------
 11 files changed, 58 insertions(+), 192 deletions(-)
