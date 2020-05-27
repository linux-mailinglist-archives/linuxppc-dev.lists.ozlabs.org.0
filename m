Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1FB1E4260
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 14:33:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X9Gl5ByCzDqJP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 22:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X9B60m8vzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 22:29:16 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE142AF4C;
 Wed, 27 May 2020 12:29:13 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/bpf: Enable bpf_probe_read{, str}() on powerpc again
Date: Wed, 27 May 2020 14:28:44 +0200
Message-Id: <20200527122844.19524-1-pmladek@suse.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Brendan Gregg <brendan.d.gregg@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 0ebeea8ca8a4d1d453a ("bpf: Restrict bpf_probe_read{, str}() only
to archs where they work") caused that bpf_probe_read{, str}() functions
were not longer available on architectures where the same logical address
might have different content in kernel and user memory mapping. These
architectures should use probe_read_{user,kernel}_str helpers.

For backward compatibility, the problematic functions are still available
on architectures where the user and kernel address spaces are not
overlapping. This is defined CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE.

At the moment, these backward compatible functions are enabled only
on x86_64, arm, and arm64. Let's do it also on powerpc that has
the non overlapping address space as well.

Signed-off-by: Petr Mladek <pmladek@suse.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Brendan Gregg <brendan.d.gregg@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d13b5328ca10..b29d7cb38368 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -126,6 +126,7 @@ config PPC
 	select ARCH_HAS_MMIOWB			if PPC64
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API
+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
-- 
2.26.2

