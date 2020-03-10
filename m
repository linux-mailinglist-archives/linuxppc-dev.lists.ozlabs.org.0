Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480717EDB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:09:25 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bxn01wm8zDr1Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=oeizcQzI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=4EtLZISv; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxgc10z5zDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:04:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 71E392221E;
 Mon,  9 Mar 2020 21:04:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 21:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rbKCbCnmR9GXx
 mtJou+K7Pnxzo/ovG3+Yd2kZ0wEDhA=; b=oeizcQzI4Ef8d3DdoggyRSJGO9l1E
 Hj0oNPN1ciaJ2C+itnhDvZl6M4U/ZWQIQszds0jnY1SlHx5cnt1aUjBOcLHfX4gu
 1iBMZECH6QAeWFcc2lQu2Fu5rLeJkABtgpEJAkeetJIstUytDVKh9Xw1DQyBHkOb
 QwJ/i59XBbQuqysVoZe2dUR9ekdWvHiR02mjzNB8UbF6gwQvaoJyO8Fo4NdDYvLJ
 8bB2w1RoP+xXentEJly93gRS3plY9QuPMDC8AhqaybHBIXCavtEUGDBaaJbBZyN6
 9uKx18paIfrD/cjOPn/eUyJOdDvzaFnxDwp+h/LfAFh6aejdd3B7bnfpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=rbKCbCnmR9GXxmtJou+K7Pnxzo/ovG3+Yd2kZ0wEDhA=; b=4EtLZISv
 PWXvRcLZzh6BkE+I3HwyNdNtcrEfmCfnP8wjZ9QgflWgJFO3SA1zbwWXpCL2drVD
 W/KMaqZohrZNWNbtBs18KW2TxNb8RalZleOohjKGL4QQc3p14YVsFIy3vNXa5oEv
 TGvNlnnNt5pfTAZb1xE842gj82GKBADxKhPddmatC1jpi7DslcHTxOylC5UAE+Uc
 SLlRJYQsjfqXXzJ5W/sjdwNr6i1/+igiFyQ573U9SKXPXpG1vUT2HcUdzmk9fjs+
 GFe9jqH9DC8VRvpQNJk32nKU/cXlpTJYcqySilsixSZ5SQVGfPGSZJOg5CqlpYsg
 7xXQ5nwvv3trMw==
X-ME-Sender: <xms:iedmXiqZzkYnqMx5xmRfCnMgJUk8WCtn9qryU0NNtj_5p8Jyqg0v4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:iedmXg-kaOac3--OPyjdZKIrcWtAJ_Ecw7QLeidZgCld-DYwO2NjGQ>
 <xmx:iedmXrIvtC-Ug1t_WYtrJ4LWzGKhqR5scP5s2ROS4c3yimsDX5ddyA>
 <xmx:iedmXlX22Ia92jC7wPNcIlaMNBsxTwrWNaQgw_8uez527A1imHDeTA>
 <xmx:iedmXlUe9nfb4cnJQXmqWIP5f7Ko65VzyEvb2LRPDxn1lvzpCLf2zQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id A84B33280069;
 Mon,  9 Mar 2020 21:04:06 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/7] powerpc/kprobes: Mark newly allocated probes as RO
Date: Tue, 10 Mar 2020 12:03:33 +1100
Message-Id: <20200310010338.21205-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310010338.21205-1-ruscur@russell.cc>
References: <20200310010338.21205-1-ruscur@russell.cc>
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
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/kprobes.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 2d27ec4feee4..bfab91ded234 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -24,6 +24,8 @@
 #include <asm/sstep.h>
 #include <asm/sections.h>
 #include <linux/uaccess.h>
+#include <linux/set_memory.h>
+#include <linux/vmalloc.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -102,6 +104,16 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	return addr;
 }
 
+void *alloc_insn_page(void)
+{
+	void *page = vmalloc_exec(PAGE_SIZE);
+
+	if (page)
+		set_memory_ro((unsigned long)page, 1);
+
+	return page;
+}
+
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
@@ -124,11 +136,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		memcpy(p->ainsn.insn, p->addr,
-				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+		patch_instruction(p->ainsn.insn, *p->addr);
 		p->opcode = *p->addr;
-		flush_icache_range((unsigned long)p->ainsn.insn,
-			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
 	}
 
 	p->ainsn.boostable = 0;
-- 
2.25.1

