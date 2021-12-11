Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A739E4713C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 13:32:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JB6by1q27z3cYG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 23:32:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=pdQRAijK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DF2SmC+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=pdQRAijK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DF2SmC+u; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JB6b75csnz3c7d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 23:31:47 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 35D595C00BA;
 Sat, 11 Dec 2021 07:31:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 11 Dec 2021 07:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=6/wXqVEJUeS+3l8IJfOqKpl5ze
 4JI8Ytw5mdJL0Cm5M=; b=pdQRAijKOe6+M9v2nW6WsRasLPhLU9GnD0CdCZEiLr
 SvT6nSrdoyCrqyqT2KSgNBJjYyfNLZdzHwFUmHEBgixf78l9qbHVMIx28IV3kw+6
 fdPhDz7hA/Cwz+7jLNmMHSI6OrIepp/khtcR9CBVcQxCuy/hnwdpNbENxry82/B7
 SgiF2uRMd7Lk5TSquF2ZLzaeNpGBCDaQJjygf7IfYgjcBGB9/MkX/PTU5pXUxjLc
 nTmVCkRLqxw80awmPfVeYdm3ClgcqAdySN8ZvyqvaGJbJ1/3UtJuZf9mw+YRmfGW
 suiNxFCdEZlM19cordbJ5eI84tSZM8z8ECVHCJsyqrDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6/wXqVEJUeS+3l8IJ
 fOqKpl5ze4JI8Ytw5mdJL0Cm5M=; b=DF2SmC+uQKK3NwCLYSV80BxKRDuqUSV3S
 /zR5MgDFtvx5/GxwIzy1A054+2WuuntZ+JZlptgINEBWNxB907lI00y6FckN0QkR
 zqBLkyxkyIhosOZNbe/VtZqLE1bs2/02+KzPcZ+Ils7YgU1CUeN3A9jfM0BDw5cF
 282V6oxuz4QleEnHOKM+gXpoyldG3df+2DpSJcIiJoEkhCTs5v0RJ5+8jnzP3CW/
 yN3Ue7NBmxUoDDoPTyOe6P0J6l6vgfiRX4aVcDfK3r+dyzyqERXK6p2O0Mnw7xQg
 lNpKNBGdhcnLEhlEtsq8I1m6sZ3HF0pEaM8PXrwrCWn1jL7yvxInw==
X-ME-Sender: <xms:Lpq0YXFMMAwt_TBowv_VT0SYrjM0nr1uZSvcqA6k88l75p6Ofou9aw>
 <xme:Lpq0YUUuYFNMal6Fi8JK6Q2HsXX0crVOMabPSDKHnTPR_qLTyVTa7TXoQNwlYocW-
 W0O36puKICg6T5KnQ>
X-ME-Received: <xmr:Lpq0YZIJgl7tjMSHlDBkgJQ8QYGx8J8dWz9LGmrPst2LzT1LO5vANyYuloIVmiVl5DKTSHv6hHTfo8x6vfJD4mlm40kS173yHMnosv969c6HWRy0B4Gy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeggdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeehveehge
 euvdetffegffegudejtdfgudeviefhudduueekgeevvdefveeukeffveenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:Lpq0YVGrcsWvIdept9diCLWvnCs2hMcix1DwJaZI8WhMx5HJ7JwzqQ>
 <xmx:Lpq0YdV7rYAzYMezyMeNSl0FNKmZb7rf2Dn7r286nYKmW6P76xq2Ig>
 <xmx:Lpq0YQO0YQY2zaNkjY-v-ks4LD6qVFg6RKouU0RXJBplnb4dIX-RCg>
 <xmx:L5q0YbcLdCEwHwcWIRexLFiRMrHHTQC1IgBrBzoAJpMTQDyRs4cqyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Dec 2021 07:31:40 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/code-patching: add patch_memory() for writing RO
 text
Date: Sat, 11 Dec 2021 22:31:10 +1000
Message-Id: <20211211123111.21044-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.34.1
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
Cc: joe.lawrence@redhat.com, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc allocates a text poke area of one page that is used by
patch_instruction() to modify read-only text when STRICT_KERNEL_RWX
is enabled.

patch_instruction() is only designed for instructions,
so writing data using the text poke area can only happen 4 bytes
at a time - each with a page map/unmap, pte flush and syncs.

This patch introduces patch_memory(), implementing the same
interface as memcpy(), similar to x86's text_poke() and s390's
s390_kernel_write().  patch_memory() only needs to map the text
poke area once, unless the write would cross a page boundary.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
Sorry I took so long to post this.
Some discussion here: https://github.com/linuxppc/issues/issues/375

 arch/powerpc/include/asm/code-patching.h |  1 +
 arch/powerpc/lib/code-patching.c         | 73 ++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 4ba834599c4d..604211d8380c 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -31,6 +31,7 @@ int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
 int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, struct ppc_inst instr);
 int raw_patch_instruction(u32 *addr, struct ppc_inst instr);
+void *patch_memory(void *dest, const void *src, size_t size);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c5ed98823835..3a566d756ccc 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -17,6 +17,7 @@
 #include <asm/code-patching.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
+#include <asm/cacheflush.h>
 
 static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, u32 *patch_addr)
 {
@@ -178,6 +179,73 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 
 	return err;
 }
+
+static int do_patch_memory(void *dest, const void *src, size_t size, unsigned long poke_addr)
+{
+	unsigned long patch_addr = poke_addr + offset_in_page(dest);
+
+	if (map_patch_area(dest, poke_addr)) {
+		pr_warn("failed to map %lx\n", poke_addr);
+		return -1;
+	}
+
+	memcpy((u8 *)patch_addr, src, size);
+
+	flush_icache_range(patch_addr, size);
+
+	if (unmap_patch_area(poke_addr)) {
+		pr_warn("failed to unmap %lx\n", poke_addr);
+		return -1;
+	}
+
+	return 0;
+}
+
+/**
+ * patch_memory - write data using the text poke area
+ *
+ * @dest:	destination address
+ * @src:	source address
+ * @size:	size in bytes
+ *
+ * like memcpy(), but using the text poke area. No atomicity guarantees.
+ * Do not use for instructions, use patch_instruction() instead.
+ * Handles crossing page boundaries, though you shouldn't need to.
+ *
+ * Return value:
+ * 	@dest
+ **/
+void *patch_memory(void *dest, const void *src, size_t size)
+{
+	size_t bytes_written, write_size;
+	unsigned long text_poke_addr;
+	unsigned long flags;
+
+	// If the poke area isn't set up, it's early boot and we can just memcpy.
+	if (!this_cpu_read(text_poke_area))
+		return memcpy(dest, src, size);
+
+	local_irq_save(flags);
+	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
+
+	for (bytes_written = 0;
+	     bytes_written < size;
+	     bytes_written += write_size) {
+		// Write as much as possible without crossing a page boundary.
+		write_size = min(size - bytes_written,
+				 PAGE_SIZE - offset_in_page(dest + bytes_written));
+
+		if (do_patch_memory(dest + bytes_written,
+				    src + bytes_written,
+				    write_size,
+				    text_poke_addr))
+			break;
+	}
+
+	local_irq_restore(flags);
+
+	return dest;
+}
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
 static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
@@ -185,6 +253,11 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 	return raw_patch_instruction(addr, instr);
 }
 
+void *patch_memory(void *dest, const void *src, size_t size)
+{
+	return memcpy(dest, src, size);
+}
+
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
 int patch_instruction(u32 *addr, struct ppc_inst instr)
-- 
2.34.1

