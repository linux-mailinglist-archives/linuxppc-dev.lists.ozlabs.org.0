Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEFFE9732
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:33:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4730Yx1yjJzF3nc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:33:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="fUbva0VU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ddwjSpVs"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4730Wr5sgFzF1n5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 18:31:52 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id ED21B483;
 Wed, 30 Oct 2019 03:31:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 30 Oct 2019 03:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=PStFRxzl4Zn7i
 9v7bh9ypxBUch/1PPtigM566gooksQ=; b=fUbva0VUoW4csLSpYm3mhaiivuyMW
 8sRt1lYCXXnTTZXLkB5LnsRQpohIp+jOLZ7G8E/khms2c6mDCQciP53vZ5ECyykB
 XAXuhSKE/wGmk6vovf5uWpg+w0YvGFPQUhAuTkhJaGZULmeIqvOUtlhw2nzsSfi1
 mZ4IctumSoCBczPZPGmFWV8MtVHfkrK8cTInKsJiv0HjX5tiywY4WPaHJFevt6le
 ew40J9cOoLOJ0z2e49gUlW6lzmk3xY36cgNEQAvTscu5GUeGNkTNOpwCo76vzF52
 ZlA+hgxRPIh7xYHAZQOp7OLJJI0iUN7od84406T22WCgBzcno/xt35Q8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PStFRxzl4Zn7i9v7bh9ypxBUch/1PPtigM566gooksQ=; b=ddwjSpVs
 LKw6xFqSdtKm03wzi8XylLn+hmh8zexrnB/8UyWyn/dQjOQyYdjkYws6VEHaUf7Q
 /lOYNCoYzSArMuDq90/AkPIbDlN08ULCmT1U2Qjflpg4B8PZcnjbJfa5JxI83vRm
 NJM0VrWB/pzCv3iXAimWOJogfwF2A2liXElzTADN3M29W9eg9+O2RvpkBC3An205
 Y5evhL9SfXgKclnlVkMbauOfB5R5p5z/biylFgN0I0rbsxW4x1qHBKO5jtYk7tor
 JEROSdBWvMk7dsoaIKQU6To+cnPNMqsA4DhWnXIUY8uGd5EmT0poPvyrsXdCXTbv
 oCr9hGuKhQlx8A==
X-ME-Sender: <xms:Wzy5XUtUpGh_J3tFRNuk685KcAFHDfUnJ2ZbpS1SbbCQMhmBMigntw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
 fvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
 rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrd
 ekvddruddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghl
 lhdrtggtnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:Wzy5XbQKNx2Z1lMoi3eTW7w0IVPhbQmyOcPRLI6uhECqGej3G-gQdw>
 <xmx:Wzy5XcXOXuazJwufNpq4mmsDkUf06qNhC6DEf3d6AIJB4he6art3kQ>
 <xmx:Wzy5XUmCB9BiYtsUUUFi71_lo-zcDGkim07Dn4aJ9UjHkkiUZpZN3A>
 <xmx:Wzy5XZer6bJTupmDmacat4XrGphrb760Doh0XT65wVBBbtYljXoz9w>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7817480059;
 Wed, 30 Oct 2019 03:31:36 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/5] powerpc/kprobes: Mark newly allocated probes as RO
Date: Wed, 30 Oct 2019 18:31:08 +1100
Message-Id: <20191030073111.140493-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030073111.140493-1-ruscur@russell.cc>
References: <20191030073111.140493-1-ruscur@russell.cc>
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

