Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A484948E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 08:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfZSZ4JVRz3clZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 18:50:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SoHKcLAb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SoHKcLAb; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfZFw4j4cz3cZY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 18:41:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0633F616AA;
 Thu, 20 Jan 2022 07:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD3C36AE3;
 Thu, 20 Jan 2022 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642664498;
 bh=KczpaYYxoMGx41tEylY7vYP9V7d2/gwOtWp0+pQI1sQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SoHKcLAbBRynCkDM25QymLddQPGokjxZWUXnz/C9Z/c9CM+6aBpTN2iW2HlHf8OcZ
 DvdM8kYes0KuSUihXi19oyVed9O24Fcyd3T1vlfejN0ZYrFb4SrYdvwkV5BXqengFt
 ptfJZ/LJQ+W4YCfoEbx8IQ1xgl8OjvN9joS2nfQPs6ajAG/EEwwXNGWEezEclwkyjg
 0Fjxfc0orzJMqb0vXLUw4X5LseWg+aWm18Rtx/Slt4NNvcGtQwXpD3gV0KOE2ePcTb
 GROcMJT9VT4/SBaQYee9ajIjuxe4cUqhulfkx3ziJhLfmtSOEm08Bnt9CZJ1Vcya5i
 76J8FDUpiSyjA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Subject: [PATCH V3 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from being
 selected
Date: Thu, 20 Jan 2022 15:39:10 +0800
Message-Id: <20220120073911.99857-18-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv doesn't support the 32bit KVM/arm API. Let's make it
clear by not selecting KVM_COMPAT.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 virt/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index f4834c20e4a6..a8c5c9f06b3c 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
 
 config KVM_COMPAT
        def_bool y
-       depends on KVM && COMPAT && !(S390 || ARM64)
+       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
 
 config HAVE_KVM_IRQ_BYPASS
        bool
-- 
2.25.1

