Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E52A454C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 13:34:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQTkX0rKMzDqNV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 23:34:44 +1100 (AEDT)
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
 header.s=2020 header.b=qh+T7IZJ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=r11Fcy33; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQR3H67qRzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:34:03 +1100 (AEDT)
Message-Id: <20201103095859.228149242@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=tAqolpusecj6Rd5JZ2LrxoX+tAqXPkBXuxrNCgE7FCw=;
 b=qh+T7IZJ6XcRj8DNIDr8HGAfo5YvTmXHwq7DmzffZLhC0V3WhpCRSbpdXm7hhOxtFFuwbX
 wcbVZVYetZLaKe7fxMMqkbtdTm/GbTXib0BTsgIk5kSnOSw9pXw7dXdWDZHGLuLfD8o7J5
 iC45ybMzMZHPHXGAY6pKU82Xsx4uzeXlXRI1QCfZtr2oUImFGtEYcJEW2pZcbSXkaBhDfz
 vpMVSLl8t8kbeOeTl0nQMa9QXaNtYJbeM0FUqyI7W0BkGez+lZ161K3tVZxVFnDyF0wgMR
 3UtPYUbq3j37JroTzUdlG8e/Z5n94SJYzJZktKJf9b+cElB2OmZliJy+9HhbJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=tAqolpusecj6Rd5JZ2LrxoX+tAqXPkBXuxrNCgE7FCw=;
 b=r11Fcy33cu1nvwv6ClgNjFFAD2Uh7JIIgyfidherdoguvpBCo73VaZrmwbm0NX6rZ9Kudo
 xO58/+jD1GK3/sBA==
Date: Tue, 03 Nov 2020 10:27:38 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 26/37] io-mapping: Provide iomap_local variant
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

Similar to kmap local provide a iomap local variant which only disables
migration, but neither disables pagefaults nor preemption.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: Restrict migrate disable to the 32bit mapping case and update documentation.

V2: Split out from the large combo patch and add the !IOMAP_ATOMIC variants
---
 Documentation/driver-api/io-mapping.rst |   76 +++++++++++++++++++-------------
 include/linux/io-mapping.h              |   30 +++++++++++-
 2 files changed, 74 insertions(+), 32 deletions(-)

--- a/Documentation/driver-api/io-mapping.rst
+++ b/Documentation/driver-api/io-mapping.rst
@@ -20,55 +20,71 @@ as it would consume too much of the kern
 mappable, while 'size' indicates how large a mapping region to
 enable. Both are in bytes.
 
-This _wc variant provides a mapping which may only be used
-with the io_mapping_map_atomic_wc or io_mapping_map_wc.
+This _wc variant provides a mapping which may only be used with
+io_mapping_map_atomic_wc(), io_mapping_map_local_wc() or
+io_mapping_map_wc().
+
+With this mapping object, individual pages can be mapped either temporarily
+or long term, depending on the requirements. Of course, temporary maps are
+more efficient. They come in two flavours::
 
-With this mapping object, individual pages can be mapped either atomically
-or not, depending on the necessary scheduling environment. Of course, atomic
-maps are more efficient::
+	void *io_mapping_map_local_wc(struct io_mapping *mapping,
+				      unsigned long offset)
 
 	void *io_mapping_map_atomic_wc(struct io_mapping *mapping,
 				       unsigned long offset)
 
-'offset' is the offset within the defined mapping region.
-Accessing addresses beyond the region specified in the
-creation function yields undefined results. Using an offset
-which is not page aligned yields an undefined result. The
-return value points to a single page in CPU address space.
-
-This _wc variant returns a write-combining map to the
-page and may only be used with mappings created by
-io_mapping_create_wc
+'offset' is the offset within the defined mapping region.  Accessing
+addresses beyond the region specified in the creation function yields
+undefined results. Using an offset which is not page aligned yields an
+undefined result. The return value points to a single page in CPU address
+space.
 
-Note that the task may not sleep while holding this page
-mapped.
+This _wc variant returns a write-combining map to the page and may only be
+used with mappings created by io_mapping_create_wc()
 
-::
+Temporary mappings are only valid in the context of the caller. The mapping
+is not guaranteed to be globaly visible.
 
-	void io_mapping_unmap_atomic(void *vaddr)
+io_mapping_map_local_wc() has a side effect on X86 32bit as it disables
+migration to make the mapping code work. No caller can rely on this side
+effect.
+
+io_mapping_map_atomic_wc() has the side effect of disabling preemption and
+pagefaults. Don't use in new code. Use io_mapping_map_local_wc() instead.
 
-'vaddr' must be the value returned by the last
-io_mapping_map_atomic_wc call. This unmaps the specified
-page and allows the task to sleep once again.
+Nested mappings need to be undone in reverse order because the mapping
+code uses a stack for keeping track of them::
 
-If you need to sleep while holding the lock, you can use the non-atomic
-variant, although they may be significantly slower.
+ addr1 = io_mapping_map_local_wc(map1, offset1);
+ addr2 = io_mapping_map_local_wc(map2, offset2);
+ ...
+ io_mapping_unmap_local(addr2);
+ io_mapping_unmap_local(addr1);
 
-::
+The mappings are released with::
+
+	void io_mapping_unmap_local(void *vaddr)
+	void io_mapping_unmap_atomic(void *vaddr)
+
+'vaddr' must be the value returned by the last io_mapping_map_local_wc() or
+io_mapping_map_atomic_wc() call. This unmaps the specified mapping and
+undoes the side effects of the mapping functions.
+
+If you need to sleep while holding a mapping, you can use the regular
+variant, although this may be significantly slower::
 
 	void *io_mapping_map_wc(struct io_mapping *mapping,
 				unsigned long offset)
 
-This works like io_mapping_map_atomic_wc except it allows
-the task to sleep while holding the page mapped.
-
+This works like io_mapping_map_atomic/local_wc() except it has no side
+effects and the pointer is globaly visible.
 
-::
+The mappings are released with::
 
 	void io_mapping_unmap(void *vaddr)
 
-This works like io_mapping_unmap_atomic, except it is used
-for pages mapped with io_mapping_map_wc.
+Use for pages mapped with io_mapping_map_wc().
 
 At driver close time, the io_mapping object must be freed::
 
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -83,6 +83,21 @@ io_mapping_unmap_atomic(void __iomem *va
 }
 
 static inline void __iomem *
+io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
+{
+	resource_size_t phys_addr;
+
+	BUG_ON(offset >= mapping->size);
+	phys_addr = mapping->base + offset;
+	return __iomap_local_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
+}
+
+static inline void io_mapping_unmap_local(void __iomem *vaddr)
+{
+	kunmap_local_indexed((void __force *)vaddr);
+}
+
+static inline void __iomem *
 io_mapping_map_wc(struct io_mapping *mapping,
 		  unsigned long offset,
 		  unsigned long size)
@@ -101,7 +116,7 @@ io_mapping_unmap(void __iomem *vaddr)
 	iounmap(vaddr);
 }
 
-#else
+#else  /* HAVE_ATOMIC_IOMAP */
 
 #include <linux/uaccess.h>
 
@@ -166,7 +181,18 @@ io_mapping_unmap_atomic(void __iomem *va
 	preempt_enable();
 }
 
-#endif /* HAVE_ATOMIC_IOMAP */
+static inline void __iomem *
+io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
+{
+	return io_mapping_map_wc(mapping, offset, PAGE_SIZE);
+}
+
+static inline void io_mapping_unmap_local(void __iomem *vaddr)
+{
+	io_mapping_unmap(vaddr);
+}
+
+#endif /* !HAVE_ATOMIC_IOMAP */
 
 static inline struct io_mapping *
 io_mapping_create_wc(resource_size_t base,

