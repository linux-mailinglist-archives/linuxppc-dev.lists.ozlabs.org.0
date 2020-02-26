Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AED16F838
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:49:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S5xl1lfLzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=qKVARIbw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Iu1I3Rd3; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5fs6DYVzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:36:21 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 36240611;
 Wed, 26 Feb 2020 01:36:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=MN4A9pGwx4Xvy
 IA4PshSsOurx0y3KhuXjclcGJOa81k=; b=qKVARIbw0x5eCtrFuPUmoTHDzqDSp
 OJ5CJFklLKBigUnz/imTW09g/D6q2fWBJuMRuc1miBVr8eKhgzldeyS/7Be78HJ8
 4qog7c3SyUW79p03ALOvGxSWJuSviPWjrtxBD3N7OsTNlaUCQ9JxlB9uc6w505Ph
 3tgr/2eO2Thd10y3I9igdLZn68PkXZQgvh5NvbJjASmvS3z5OTwt/giKlWT92r5s
 +aRgkCIRNtGmD4ddHe7RtOUbvYazG/8MvDB7xTzkHS698Bbl9zvgdNyp8zuzlGs/
 YAupSLZ1DAyFy4KWLlfu+W+2RFCoxxokG/yL8F4jZvMgMR6hortGf2EgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=MN4A9pGwx4XvyIA4PshSsOurx0y3KhuXjclcGJOa81k=; b=Iu1I3Rd3
 LmpHdXYQgtkHsifnH0JPCkR5ClZqM3K9WyO8wATLuhwemGQMm4F66fmIdvIx76DW
 2Qj1qOdkwLfWKtNO859Ub0zdytm2OThaNFMYAdHpmQrj9MMRO+ufnMRFv8sR9/5R
 TdglbX7PLJOOQy+A3pezziOKjeLw1/bq+FOxrZw+ayUuqJjaRKb33X8BF/T1Rj2S
 d+Hk8uNXqj+9PspCFtgz5VenEImJS0rj5c2TA7Uo47Ly3Y6o3E8E0XiTPxf0ITbL
 +QKmBkfAXaCZXuwcZWjpSxUJ8Ga/W0PaaH0ZKO8vIMMTkePUygC1yXONps8qvx0y
 /SRbdR6y+W5DTw==
X-ME-Sender: <xms:4RFWXmYup2zcI3yatIANKt8DciA1UtlDG3arGg1G5EJE5-CodKbDcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrd
 gttg
X-ME-Proxy: <xmx:4RFWXs2JDd4tCVhkBjOucjkf7Cf0V4JFYLK3Y_svmE2pCq4Y3dtw-Q>
 <xmx:4RFWXn-eoBO9NZZfSThJxdqXUYMgJiw1NabUmU1pNCbwnOYK7IrOoA>
 <xmx:4RFWXl7DmuVaOCOWUhs95RiEG_t3SJP6US9YgnII1s3gb6ZxdxvL4Q>
 <xmx:4RFWXmmH2qFut3eB0SXaJ82N_nVu-MpVewOCCOg8UtuLOJIbTp1Bcw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 791C93060FE0;
 Wed, 26 Feb 2020 01:36:14 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/8] powerpc/kprobes: Mark newly allocated probes as RO
Date: Wed, 26 Feb 2020 17:35:45 +1100
Message-Id: <20200226063551.65363-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226063551.65363-1-ruscur@russell.cc>
References: <20200226063551.65363-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, npiggin@gmail.com, joel@jms.id.au,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

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

