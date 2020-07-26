Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494722DAFC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 02:45:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDkkS18RGzDr1j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 10:45:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=YQMOv8Zu; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDkZM6NMqzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 10:38:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=qqBNtVYmHwnVeQr7ZDJy/dH44DWLhllZ51Sz2gAU7es=; b=YQMOv8Zu+XZPp0H4UPX23P+w1W
 6jXeekNCNZvuNSyCTvmgci4RfuMCdzQgFYvbLFFfTsgKerBwQjS86UUFebquf5vb7jPe781jNY3X/
 LrcUAmpJzFLYgY0hGNWYCv+sbRTlVJBMW8ty4zQKzmBnxWOn6lHkV5fbpE4qI2vlpX9bR+pukLjgY
 lJW0aWfDfLPHC64xhuUFD+OQ5ID4iTIa7leqpMPQ1pvewyTpM7hoqaNxDrbRu3rEWNgZ6JFd2JWiI
 bhi33Pjt1ZU0VxN7OqSvnRgnZloLn47UW+LX1zV28p+09qR0UX+JES1YVn2sPJf0YC4wxrjXIeU9A
 RvFUCxXQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzUg8-0003Cq-8T; Sun, 26 Jul 2020 00:38:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] powerpc: delete duplicated words
Date: Sat, 25 Jul 2020 17:38:00 -0700
Message-Id: <20200726003809.20454-1-rdunlap@infradead.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop duplicated words in arch/powerpc/ header files.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org

 arch/powerpc/include/asm/book3s/64/mmu-hash.h |    2 +-
 arch/powerpc/include/asm/book3s/64/radix-4k.h |    2 +-
 arch/powerpc/include/asm/cputime.h            |    2 +-
 arch/powerpc/include/asm/epapr_hcalls.h       |    4 ++--
 arch/powerpc/include/asm/hw_breakpoint.h      |    2 +-
 arch/powerpc/include/asm/ppc_asm.h            |    2 +-
 arch/powerpc/include/asm/reg.h                |    2 +-
 arch/powerpc/include/asm/smu.h                |    2 +-
 arch/powerpc/platforms/powernv/pci.h          |    2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)
