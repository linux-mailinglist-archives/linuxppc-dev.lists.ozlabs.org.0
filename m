Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB80B2A4601
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 14:13:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQVZm2VbBzDq9s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 00:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=CdqukbVB; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=pfa+TpRf; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQR3f4GsBzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:34:21 +1100 (AEDT)
Message-Id: <20201103095900.367260321@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XzZnXq40Xta6eAd8+Z4XomSn8j1A2hSECk29QnRRbws=;
 b=CdqukbVBWMYI/RONrhSGzX6/xMHlDVBTWtfJrQb8BGeECEJqjOAzrpgd/S5gcYhw2K5fbn
 Eaab3vE9c+BoonfV0tN18iO2mipbe36uJxmY7lt1Q+Y/DUZ/Lt4ranrEwz1e8nCX8rE7ib
 zUEarU65A2JKzY8kRhVSr0Mov+N333GuC6WgQoQRke1a5GsVBT4qs+q/yyCNm0M0BVOUKi
 wwWaobx9qhLoUV9tFHktWx+AG8+ArEEhZ4OLWEEinwZC+qMmqYYw2bnvpObjtaVxDm8Ir6
 h+E3LFBQps2vHJjH1B0mTeQMdmzvDlwqg7xu3fUjiEVpzfRq4Nob09i6lYhuzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XzZnXq40Xta6eAd8+Z4XomSn8j1A2hSECk29QnRRbws=;
 b=pfa+TpRfmsyoL3kfRqJUVU2S9UUvIXMBP/3UXjO0TEtWrbhDCiNU865DGow3SSMVJwemxu
 95CKXmp2zPH8LuBg==
Date: Tue, 03 Nov 2020 10:27:49 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 37/37] io-mapping: Remove io_mapping_map_atomic_wc()
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 21:51:18 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No more users. Get rid of it and remove the traces in documentation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 Documentation/driver-api/io-mapping.rst |   22 +++++-----------
 include/linux/io-mapping.h              |   42 +-------------------------------
 2 files changed, 9 insertions(+), 55 deletions(-)

--- a/Documentation/driver-api/io-mapping.rst
+++ b/Documentation/driver-api/io-mapping.rst
@@ -21,19 +21,15 @@ mappable, while 'size' indicates how lar
 enable. Both are in bytes.
 
 This _wc variant provides a mapping which may only be used with
-io_mapping_map_atomic_wc(), io_mapping_map_local_wc() or
-io_mapping_map_wc().
+io_mapping_map_local_wc() or io_mapping_map_wc().
 
 With this mapping object, individual pages can be mapped either temporarily
 or long term, depending on the requirements. Of course, temporary maps are
-more efficient. They come in two flavours::
+more efficient.
 
 	void *io_mapping_map_local_wc(struct io_mapping *mapping,
 				      unsigned long offset)
 
-	void *io_mapping_map_atomic_wc(struct io_mapping *mapping,
-				       unsigned long offset)
-
 'offset' is the offset within the defined mapping region.  Accessing
 addresses beyond the region specified in the creation function yields
 undefined results. Using an offset which is not page aligned yields an
@@ -50,9 +46,6 @@ io_mapping_map_local_wc() has a side eff
 migration to make the mapping code work. No caller can rely on this side
 effect.
 
-io_mapping_map_atomic_wc() has the side effect of disabling preemption and
-pagefaults. Don't use in new code. Use io_mapping_map_local_wc() instead.
-
 Nested mappings need to be undone in reverse order because the mapping
 code uses a stack for keeping track of them::
 
@@ -65,11 +58,10 @@ Nested mappings need to be undone in rev
 The mappings are released with::
 
 	void io_mapping_unmap_local(void *vaddr)
-	void io_mapping_unmap_atomic(void *vaddr)
 
-'vaddr' must be the value returned by the last io_mapping_map_local_wc() or
-io_mapping_map_atomic_wc() call. This unmaps the specified mapping and
-undoes the side effects of the mapping functions.
+'vaddr' must be the value returned by the last io_mapping_map_local_wc()
+call. This unmaps the specified mapping and undoes eventual side effects of
+the mapping function.
 
 If you need to sleep while holding a mapping, you can use the regular
 variant, although this may be significantly slower::
@@ -77,8 +69,8 @@ If you need to sleep while holding a map
 	void *io_mapping_map_wc(struct io_mapping *mapping,
 				unsigned long offset)
 
-This works like io_mapping_map_atomic/local_wc() except it has no side
-effects and the pointer is globaly visible.
+This works like io_mapping_map_local_wc() except it has no side effects and
+the pointer is globaly visible.
 
 The mappings are released with::
 
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -60,28 +60,7 @@ io_mapping_fini(struct io_mapping *mappi
 	iomap_free(mapping->base, mapping->size);
 }
 
-/* Atomic map/unmap */
-static inline void __iomem *
-io_mapping_map_atomic_wc(struct io_mapping *mapping,
-			 unsigned long offset)
-{
-	resource_size_t phys_addr;
-
-	BUG_ON(offset >= mapping->size);
-	phys_addr = mapping->base + offset;
-	preempt_disable();
-	pagefault_disable();
-	return __iomap_local_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
-}
-
-static inline void
-io_mapping_unmap_atomic(void __iomem *vaddr)
-{
-	kunmap_local_indexed((void __force *)vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
-
+/* Temporary mappings which are only valid in the current context */
 static inline void __iomem *
 io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
 {
@@ -163,24 +142,7 @@ io_mapping_unmap(void __iomem *vaddr)
 {
 }
 
-/* Atomic map/unmap */
-static inline void __iomem *
-io_mapping_map_atomic_wc(struct io_mapping *mapping,
-			 unsigned long offset)
-{
-	preempt_disable();
-	pagefault_disable();
-	return io_mapping_map_wc(mapping, offset, PAGE_SIZE);
-}
-
-static inline void
-io_mapping_unmap_atomic(void __iomem *vaddr)
-{
-	io_mapping_unmap(vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
-
+/* Temporary mappings which are only valid in the current context */
 static inline void __iomem *
 io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
 {

