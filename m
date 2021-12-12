Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF42471779
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 02:06:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBRKl66fqz3cTy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 12:06:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=XZMCNJFu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=S7cSRbMJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=XZMCNJFu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=S7cSRbMJ; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBRK00mmSz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 12:05:39 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BC1025C008E;
 Sat, 11 Dec 2021 20:05:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 11 Dec 2021 20:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=UCtGHkaAir75DvjAoByvty2NUI
 1v20nsUVBoVw9VQgs=; b=XZMCNJFuj7D3jKchTa0TYvxu/dh1rAObxOJBLmiMBR
 2fu4YmJA0EM68xUpz10gF3806BZ2iXksnsPt5geFm/ni6CNbR9ia1dDtNhocMN45
 UXj4aZMxzXamXUhkmCEA4PIS0q52k7+aX/jWc0uEvlF4juBXgseJu9sQm+r4lwmi
 XskRSPS/9+XdXHrZ/t+kwfjTxUmxdVsqKgSwHS5z+rYxD7KQywWb3TzFP9wJQAr9
 JxHGM8/HkQshLgzzGuGbPBVFaWnff9AJgBeoEar4EscDAAdOSGjhXwHpJ9e9WaIj
 tzcu+JnGfsoSlMlIZQorjMZfamQbpFK6c4J2XPJf7sMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UCtGHkaAir75DvjAo
 Byvty2NUI1v20nsUVBoVw9VQgs=; b=S7cSRbMJ8pfXRJyQtnIMwwJGnyaH8kuw/
 rqwMzAj87OtvkA006rzi76/0RBXzAta/rRbH6CK+rl0XAkAV1h674L6vun665yow
 Dhub96pXdz/jb0VEMtzaz5SYpy/QiTeTKFQ01vx704NxrSVuxYMic6Fdo99dIPvl
 X6RvjWZaXxpqo63P3fks0F6N3OnGTt7LJ66B7Xmts3/hDSaV4TPo8puzBRNrZDbs
 idMNiUMGZt0r2bkBHbbjffgxiK5/wZEMx2/7J9CkHFJm6zOO3o56xUdWEZPI2y6R
 6g23DetI3NNCbgzlovId/RALZOfryJoRbmAqiqf4ZAPxW/IsIXlhA==
X-ME-Sender: <xms:3Uq1YfDDdabUVy3wwWXsmF_W7cSrVhKnkU_AAQdS5V-qHbd1zLo7Jw>
 <xme:3Uq1YVgpZLftBbCqivIJ6-d8OMbgvA2j4rb2uttTUZw1gbh2DK2JVOn9HTe2uxorq
 VFO7rKszp4ajZgfDA>
X-ME-Received: <xmr:3Uq1YakCS3eImK3sGvA6_IgSPmtSr7stNRkTecvAyVgftGgUqVVUoCPteaWvH71PY8TFVzdktWOzlLvmItl-syY9y35SPWVYzTzhBy75LfOQdVO0Iu8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeehgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvuf
 ffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicu
 oehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeehveehge
 euvdetffegffegudejtdfgudeviefhudduueekgeevvdefveeukeffveenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:3Uq1YRxkA3YIViWiENEngh8GrSuUJ69R4JYtZfXrYaIrBDWEhsnfJQ>
 <xmx:3Uq1YUSMdhkgZ7hdac3jgIuCTMxIhJGeTIGtTJxJSL-TvkR-7H6Yrw>
 <xmx:3Uq1YUZtFSHMjorP8bPIrZWRncILaf9Qpx4400P6nDIV5_hfvu44JQ>
 <xmx:3kq1YTEFnKPzE0SKJWelwkqzYoH2ceJhr77S1Cwq-rlczRFHDtlvUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Dec 2021 20:05:31 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/code-patching: add patch_memory() for writing
 RO text
Date: Sun, 12 Dec 2021 11:03:56 +1000
Message-Id: <20211212010357.16280-1-ruscur@russell.cc>
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
 Russell Currey <ruscur@russell.cc>, joel@jms.id.au,
 naveen.n.rao@linux.vnet.ibm.com
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
v2: Use min_t() instead of min(), fixing the 32-bit build as reported
    by snowpatch.

Some discussion here: https://github.com/linuxppc/issues/issues/375

 arch/powerpc/include/asm/code-patching.h |  1 +
 arch/powerpc/lib/code-patching.c         | 74 ++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

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
index c5ed98823835..330602aa59f1 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -17,6 +17,7 @@
 #include <asm/code-patching.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
+#include <asm/cacheflush.h>
 
 static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, u32 *patch_addr)
 {
@@ -178,6 +179,74 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 
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
+		write_size = min_t(size_t,
+				   size - bytes_written,
+				   PAGE_SIZE - offset_in_page(dest + bytes_written));
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
@@ -185,6 +254,11 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
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

