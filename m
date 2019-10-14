Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 698FFD5AAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 07:23:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s6QS4zyRzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 16:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="vhbXIo/Z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="a2s7BMG2"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s6NM4rQSzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 16:21:07 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3E3E43DC;
 Mon, 14 Oct 2019 01:13:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 14 Oct 2019 01:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=PStFRxzl4Zn7i
 9v7bh9ypxBUch/1PPtigM566gooksQ=; b=vhbXIo/Z3j5Nf53e2OQ97Qo4sy/ds
 RSzDav9/HWZXOsX8oFZ837S/vrCQPsFLmanIt+Pv0E8kCnAdsu6fS9g2q2BPVBNz
 nBfnXfdQXY1yT0pT1cmd86x0pRelX9vZV67DNg0ZRqaOa2AEgTLjV3qPVvWYwlrG
 AXdyhjloOWFAVnjjz1FFgREN/hp9Kl8bv2oZpZ4ASlilkhDwWewWeL1vSDt80yb5
 TXsG2R6l1wPWFGD51s7HouKHD9lfNuWZd96jkHQI7czs0aTvaxzmQ8fbPA0YOlpB
 ONmuPO/O2jYCVqBXkLR/ehHAtqBr4q3QxtxJJC/OTga1ZUxPxedz8aGrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PStFRxzl4Zn7i9v7bh9ypxBUch/1PPtigM566gooksQ=; b=a2s7BMG2
 Dn31nb6flKsEQkv7HZXBauPfAJqpQYCYpzGH3dANNZgTB9GH4K8A6uP7MR45NouM
 3McPoUv/wuYT1MmQfZrOfTdkn3vYZJvSQI75yoouWAgt2oai35U5VNBzESxRSbLD
 BHWnnJrUqvzQoaWyl4vZnmN16XFy5sAgY6kmDVBXQiqOP6KKS8APa4bYsx8HiYyQ
 317SNQrgS5KlaVPH4a3OQkRNKOeLPP1ioZXsppgGFgbpSRgXehA8HkUWxtSP2CZk
 dnY8gw3uMB4eiO0dk/LA11IzX+smR+jpwflKVZE2tFMHj16s5qS7utHKFSsCmGwk
 AdjhAvec6+u7JA==
X-ME-Sender: <xms:EASkXRpqK4osoWggscIjZd-uTCdApg3irNWzLacUHmoAifsblucw4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedtgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdr
 tggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:EASkXdfQMqUSdmYKmwBwAfhpmP_naNV1I89nm7lcrw8EJn_vq8nx9w>
 <xmx:EASkXdAAIfzUlIHoaTk02JY_j7S3FSIp1CpeWAA1U-YFTuNC_VpM3A>
 <xmx:EASkXYRi7b5yyhS58D2qJ9wprbzfJNfX5e6C61RPU468t2b6qUJcXg>
 <xmx:EASkXQL-wfbkKSc-6t2uG3AUF3Ea22FldJl_iVGkJEDe2gFAJ_rirA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFD7B80065;
 Mon, 14 Oct 2019 01:13:49 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/4] powerpc/kprobes: Mark newly allocated probes as RO
Date: Mon, 14 Oct 2019 16:13:18 +1100
Message-Id: <20191014051320.158682-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014051320.158682-1-ruscur@russell.cc>
References: <20191014051320.158682-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
W+X page at boot by default.  This can be tested with
CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
kernel log during boot.

powerpc doesn't implement its own alloc() for kprobes like other
architectures do, but we couldn't immediately mark RO anyway since we do
a memcpy to the page we allocate later.  After that, nothing should be
allowed to modify the page, and write permissions are removed well
before the kprobe is armed.

Thus mark newly allocated probes as read-only once it's safe to do so.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/kernel/kprobes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 2d27ec4feee4..2610496de7c7 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -24,6 +24,7 @@
 #include <asm/sstep.h>
 #include <asm/sections.h>
 #include <linux/uaccess.h>
+#include <linux/set_memory.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -131,6 +132,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
 	}
 
+	set_memory_ro((unsigned long)p->ainsn.insn, 1);
+
 	p->ainsn.boostable = 0;
 	return ret;
 }
-- 
2.23.0

