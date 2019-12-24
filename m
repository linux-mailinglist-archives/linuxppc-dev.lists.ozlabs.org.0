Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CD129DF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 06:57:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hlqy61b2zDqP8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 16:57:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="E/oBDDmr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gG9hkhhz"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hlnt0Xs2zDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 16:56:02 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CA6322203C;
 Tue, 24 Dec 2019 00:55:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 00:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=g0JXM4p7ZeNbM
 /n/P1uBfa0xgPXj9o+bD1IfKhBoyFs=; b=E/oBDDmrGdr7dMrBGezj4+ZjJ1hjs
 SJkWR/CjPzeSBHXaMhNwy79AxONXFdHx6pWy+KPxSgo9sxBxBfzEMLW+chMb5IPg
 C85DOqebx73Mb4OalGKxyromzae4Vg0Ml7LdG/2uN6SnRZsPEEhoVTZkty60NEOv
 oPauEMNcwVyVodDFMcDNhI3ESN9b5MvbYmALr1RtrAjZu8fTbbIngpQ0ofJ13FWB
 rXzw7P+M5DK1FRhn66rRGIEonHICQmO4bFTF1+LCciFOnegS0xkF73kXffaYgt9G
 lr6xaRFOjAB1pnVNFUvoylmODzPXDcjCIXLNxI6eqn65RgbtDgwu1r9cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=g0JXM4p7ZeNbM/n/P1uBfa0xgPXj9o+bD1IfKhBoyFs=; b=gG9hkhhz
 K3dryN0VPnG8TXus1+47AVCkspzqvVHv1tfOvs4r8MHW6ZKB6TC8Rggm+O8aXXuK
 kNiThX5m29KP7QsDAsnaYtjU0OEX3cgAaqb+/9JhWVyTYzZ46Gm9ZeVrmLY76Ukv
 LVFHR7Lb4SmfxHzXsh4HMzn6Tby22TdmshTe/MiVqNtPerJGLXVEevI7YccdX8az
 nzohIQNB3QM6YISyl81wjF41XJctia0hDZYskSq0xLk9PFb3Y8pVJBmuHHkCSQiC
 +ck8gCIwMjFMFimVmdPqZYAefbPXhcjnnixNVrulAchmk0gyJWPPs2IS8WtaXiTE
 VBBlngQVxmSzvg==
X-ME-Sender: <xms:b6gBXkLsnayTj4L08TD1Y2-9IKUQ2cbjP9wC5fqS2zKjM9kQLQyScg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhl
 rdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:b6gBXr0THpikXk61fTMkMnslqE3TMjuHYhILDdZPESdIQkyRs_r6Hg>
 <xmx:b6gBXqjLZCg3mzcQApVfs74DQAmXyHclCw74OsiJpZgydJR20RXPug>
 <xmx:b6gBXizplQt_XCk6uUIZGcLAcSBu9xUkmelaPYygPmkXmmAfL54y5Q>
 <xmx:b6gBXvbNolUE-891FZDZEzMt2DUMb6TQ3pp-OIGsQH3szFsMd_eg9g>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFEE63060845;
 Tue, 24 Dec 2019 00:55:56 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/5] powerpc/kprobes: Mark newly allocated probes as RO
Date: Tue, 24 Dec 2019 16:55:42 +1100
Message-Id: <20191224055545.178462-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224055545.178462-1-ruscur@russell.cc>
References: <20191224055545.178462-1-ruscur@russell.cc>
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

The memcpy() would fail if >1 probes were allocated, so use
patch_instruction() instead which is safe for RO.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/kernel/kprobes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 2d27ec4feee4..b72761f0c9e3 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -24,6 +24,7 @@
 #include <asm/sstep.h>
 #include <asm/sections.h>
 #include <linux/uaccess.h>
+#include <linux/set_memory.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -124,13 +125,14 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		memcpy(p->ainsn.insn, p->addr,
-				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+		patch_instruction(p->ainsn.insn, *p->addr);
 		p->opcode = *p->addr;
 		flush_icache_range((unsigned long)p->ainsn.insn,
 			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
 	}
 
+	set_memory_ro((unsigned long)p->ainsn.insn, 1);
+
 	p->ainsn.boostable = 0;
 	return ret;
 }
-- 
2.24.1

