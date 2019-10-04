Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B6CB588
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:55:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l2HF1YDWzDqC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 17:55:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="Gt4jIzSc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XxRBTMbV"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l2Bb3FJHzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 17:51:32 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 92613527;
 Fri,  4 Oct 2019 03:51:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Oct 2019 03:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=84GAe97wSSrJ+
 RLtJE/uwAKdBCLCrrIFVnAIva0xZlw=; b=Gt4jIzSceMH89g7CK4vVme7Pn+wv8
 Y8y1VZxjQ89NGMI2qAPx5orArDtPfYBEibxKQKkgN/VYlT8fbEI1wzUOJmcbvKFu
 6j06uco9gA2dCdvhvMO/iQof2hmsz4SQ/k3TGmjK4qqaWAgMinwRlTaCZzxO2JIL
 5OGM0bEqMtmdlGo8VHvlJlZQHN8cTLUePeXO9bxKqi1d3/UWeu+RueQTuluK283X
 0hZFSrrVXBum0nKgAt3uRhKYJFHx+1pIyB/mn9UynlZVeixRk9UgW7I/5NLeHOvs
 lCSGA3c0Xy9oj5XnsY3AmIHqo9VTwV7SNXzmfpQrxro4KAbikdWMJAl+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=84GAe97wSSrJ+RLtJE/uwAKdBCLCrrIFVnAIva0xZlw=; b=XxRBTMbV
 KYeFcOPaQ25G/uC7wnMlGtjT0Zzwhsgi3VNX/7NjUSKk1tMJ2guYB2UmNMllvqsE
 526/Jf8CbZbu5umNIh0VfO2d/YT6V0O1CkisQQrxMXATsKfbbNgthNlPZ2LQELT4
 rzASmncGSWyRupOcNZ5Gjg+b0pwez97bJeYtOw11bXM7BQaJzlk19C4EnNxyXmO4
 uTe7wiWEM+CJnereLzdJjGt75wucKlvIrf1ioWpw0kNwfYHoeYfS8wkKIcaB6SDH
 d5QkkzXNpJBE1GjRn8PKzzqm9TqQLEVz5gn8P/3tqB5lfOpwL/3prHnal3BBQgXD
 +DDPmP2iYVut5w==
X-ME-Sender: <xms:AfqWXQZG7eqVTlBgPdRKHmjq7D22Idt9P5OFA_CrLOtYOVYrS7l7VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdr
 tggtnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:AfqWXXshI7fd9usBPRLl-2k3lyucis2ehyWddnxmxSjZG7koOLCRxQ>
 <xmx:AfqWXdvMbCAJO_CzKKXSmySTS6bzlkZGazalnv2KmTaWRq9HqNKU7A>
 <xmx:AfqWXcea1yrlAtn5bSmXyO6Hj1by-T_F3nnRd9wiyS17vHu_inKJqw>
 <xmx:AfqWXbS-wS7PpuDuvHCF9_JdwD8ApPZ6oLaRU0fcT00291WL_v5BjQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17A5E80064;
 Fri,  4 Oct 2019 03:51:25 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/4] powerpc/kprobes: Mark newly allocated probes as RO
Date: Fri,  4 Oct 2019 17:50:48 +1000
Message-Id: <20191004075050.73327-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004075050.73327-1-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, rashmica.g@gmail.com, dja@axtens.net
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

