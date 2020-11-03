Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 979FB2A45D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 14:01:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQVKJ43XYzDqGm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 00:01:24 +1100 (AEDT)
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
 header.s=2020 header.b=GwnXKbEI; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=424XRIi1; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQR3X23rkzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:34:15 +1100 (AEDT)
Message-Id: <20201103095900.045603050@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=OzKi4KfRSiayLw9s5jUGcNXItjMfuzYpuhZfqAXbJNg=;
 b=GwnXKbEIqkRQFphTfyyhEussT50fE4Q/Rtr8i3I6bL47vbeTYIYQ6UVM+drv+7G8Cmj+rY
 g16Tt970CN4tDL7XsrP5N/CULxniLl8kanEX1UplWKeCwi1meMKwrw5MI/SmTkn/dP4eev
 sCZGKciYM+RP5p60cmecCzp9vo8on8Ks4clC8Yi4MmEf6tjoZnl3CUvzkIHlqjvXfD2htJ
 AHP/lPnGfKyEnVHVRwRl5x2CJs1P15k2EB2mqqOT6q4N3HMbqBeyiyTtbkBeXjhUr9R2yo
 HqXuKjti0pWISxIxXF8cdxvq/PrSNHMx8V6kyYszM2mQ0GrsOpopuRvjEVUVdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=OzKi4KfRSiayLw9s5jUGcNXItjMfuzYpuhZfqAXbJNg=;
 b=424XRIi1Uhletx0n1NZWfkf3ftCg+AOY3lAwWYkHQHLwaqbQrb2mHhEEVUPsq9qkg3BOrH
 2Ngm2Btbw77Je/AA==
Date: Tue, 03 Nov 2020 10:27:46 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 34/37] drm/qxl: Replace io_mapping_map_atomic_wc()
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
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Dave Airlie <airlied@redhat.com>,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

None of these mapping requires the side effect of disabling pagefaults and
preemption.

Use io_mapping_map_local_wc() instead, rename the related functions
accordingly and clean up qxl_process_single_command() to use a plain
copy_from_user() as the local maps are not disabling pagefaults.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
V3: New patch
---
 drivers/gpu/drm/qxl/qxl_image.c   |   18 +++++++++---------
 drivers/gpu/drm/qxl/qxl_ioctl.c   |   27 +++++++++++++--------------
 drivers/gpu/drm/qxl/qxl_object.c  |   12 ++++++------
 drivers/gpu/drm/qxl/qxl_object.h  |    4 ++--
 drivers/gpu/drm/qxl/qxl_release.c |    4 ++--
 5 files changed, 32 insertions(+), 33 deletions(-)

--- a/drivers/gpu/drm/qxl/qxl_image.c
+++ b/drivers/gpu/drm/qxl/qxl_image.c
@@ -124,12 +124,12 @@ qxl_image_init_helper(struct qxl_device
 				  wrong (check the bitmaps are sent correctly
 				  first) */
 
-	ptr = qxl_bo_kmap_atomic_page(qdev, chunk_bo, 0);
+	ptr = qxl_bo_kmap_local_page(qdev, chunk_bo, 0);
 	chunk = ptr;
 	chunk->data_size = height * chunk_stride;
 	chunk->prev_chunk = 0;
 	chunk->next_chunk = 0;
-	qxl_bo_kunmap_atomic_page(qdev, chunk_bo, ptr);
+	qxl_bo_kunmap_local_page(qdev, chunk_bo, ptr);
 
 	{
 		void *k_data, *i_data;
@@ -143,7 +143,7 @@ qxl_image_init_helper(struct qxl_device
 			i_data = (void *)data;
 
 			while (remain > 0) {
-				ptr = qxl_bo_kmap_atomic_page(qdev, chunk_bo, page << PAGE_SHIFT);
+				ptr = qxl_bo_kmap_local_page(qdev, chunk_bo, page << PAGE_SHIFT);
 
 				if (page == 0) {
 					chunk = ptr;
@@ -157,7 +157,7 @@ qxl_image_init_helper(struct qxl_device
 
 				memcpy(k_data, i_data, size);
 
-				qxl_bo_kunmap_atomic_page(qdev, chunk_bo, ptr);
+				qxl_bo_kunmap_local_page(qdev, chunk_bo, ptr);
 				i_data += size;
 				remain -= size;
 				page++;
@@ -175,10 +175,10 @@ qxl_image_init_helper(struct qxl_device
 					page_offset = offset_in_page(out_offset);
 					size = min((int)(PAGE_SIZE - page_offset), remain);
 
-					ptr = qxl_bo_kmap_atomic_page(qdev, chunk_bo, page_base);
+					ptr = qxl_bo_kmap_local_page(qdev, chunk_bo, page_base);
 					k_data = ptr + page_offset;
 					memcpy(k_data, i_data, size);
-					qxl_bo_kunmap_atomic_page(qdev, chunk_bo, ptr);
+					qxl_bo_kunmap_local_page(qdev, chunk_bo, ptr);
 					remain -= size;
 					i_data += size;
 					out_offset += size;
@@ -189,7 +189,7 @@ qxl_image_init_helper(struct qxl_device
 	qxl_bo_kunmap(chunk_bo);
 
 	image_bo = dimage->bo;
-	ptr = qxl_bo_kmap_atomic_page(qdev, image_bo, 0);
+	ptr = qxl_bo_kmap_local_page(qdev, image_bo, 0);
 	image = ptr;
 
 	image->descriptor.id = 0;
@@ -212,7 +212,7 @@ qxl_image_init_helper(struct qxl_device
 		break;
 	default:
 		DRM_ERROR("unsupported image bit depth\n");
-		qxl_bo_kunmap_atomic_page(qdev, image_bo, ptr);
+		qxl_bo_kunmap_local_page(qdev, image_bo, ptr);
 		return -EINVAL;
 	}
 	image->u.bitmap.flags = QXL_BITMAP_TOP_DOWN;
@@ -222,7 +222,7 @@ qxl_image_init_helper(struct qxl_device
 	image->u.bitmap.palette = 0;
 	image->u.bitmap.data = qxl_bo_physical_address(qdev, chunk_bo, 0);
 
-	qxl_bo_kunmap_atomic_page(qdev, image_bo, ptr);
+	qxl_bo_kunmap_local_page(qdev, image_bo, ptr);
 
 	return 0;
 }
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -89,11 +89,11 @@ apply_reloc(struct qxl_device *qdev, str
 {
 	void *reloc_page;
 
-	reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
+	reloc_page = qxl_bo_kmap_local_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
 	*(uint64_t *)(reloc_page + (info->dst_offset & ~PAGE_MASK)) = qxl_bo_physical_address(qdev,
 											      info->src_bo,
 											      info->src_offset);
-	qxl_bo_kunmap_atomic_page(qdev, info->dst_bo, reloc_page);
+	qxl_bo_kunmap_local_page(qdev, info->dst_bo, reloc_page);
 }
 
 static void
@@ -105,9 +105,9 @@ apply_surf_reloc(struct qxl_device *qdev
 	if (info->src_bo && !info->src_bo->is_primary)
 		id = info->src_bo->surface_id;
 
-	reloc_page = qxl_bo_kmap_atomic_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
+	reloc_page = qxl_bo_kmap_local_page(qdev, info->dst_bo, info->dst_offset & PAGE_MASK);
 	*(uint32_t *)(reloc_page + (info->dst_offset & ~PAGE_MASK)) = id;
-	qxl_bo_kunmap_atomic_page(qdev, info->dst_bo, reloc_page);
+	qxl_bo_kunmap_local_page(qdev, info->dst_bo, reloc_page);
 }
 
 /* return holding the reference to this object */
@@ -149,7 +149,6 @@ static int qxl_process_single_command(st
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
 	int i, ret, num_relocs;
-	int unwritten;
 
 	switch (cmd->type) {
 	case QXL_CMD_DRAW:
@@ -185,21 +184,21 @@ static int qxl_process_single_command(st
 		goto out_free_reloc;
 
 	/* TODO copy slow path code from i915 */
-	fb_cmd = qxl_bo_kmap_atomic_page(qdev, cmd_bo, (release->release_offset & PAGE_MASK));
-	unwritten = __copy_from_user_inatomic_nocache
-		(fb_cmd + sizeof(union qxl_release_info) + (release->release_offset & ~PAGE_MASK),
-		 u64_to_user_ptr(cmd->command), cmd->command_size);
+	fb_cmd = qxl_bo_kmap_local_page(qdev, cmd_bo, (release->release_offset & PAGE_MASK));
 
-	{
+	if (copy_from_user(fb_cmd + sizeof(union qxl_release_info) +
+			   (release->release_offset & ~PAGE_MASK),
+			   u64_to_user_ptr(cmd->command), cmd->command_size)) {
+		ret = -EFAULT;
+	} else {
 		struct qxl_drawable *draw = fb_cmd;
 
 		draw->mm_time = qdev->rom->mm_clock;
 	}
 
-	qxl_bo_kunmap_atomic_page(qdev, cmd_bo, fb_cmd);
-	if (unwritten) {
-		DRM_ERROR("got unwritten %d\n", unwritten);
-		ret = -EFAULT;
+	qxl_bo_kunmap_local_page(qdev, cmd_bo, fb_cmd);
+	if (ret) {
+		DRM_ERROR("copy from user failed %d\n", ret);
 		goto out_free_release;
 	}
 
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -172,8 +172,8 @@ int qxl_bo_kmap(struct qxl_bo *bo, void
 	return 0;
 }
 
-void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
-			      struct qxl_bo *bo, int page_offset)
+void *qxl_bo_kmap_local_page(struct qxl_device *qdev,
+			     struct qxl_bo *bo, int page_offset)
 {
 	unsigned long offset;
 	void *rptr;
@@ -188,7 +188,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl
 		goto fallback;
 
 	offset = bo->tbo.mem.start << PAGE_SHIFT;
-	return io_mapping_map_atomic_wc(map, offset + page_offset);
+	return io_mapping_map_local_wc(map, offset + page_offset);
 fallback:
 	if (bo->kptr) {
 		rptr = bo->kptr + (page_offset * PAGE_SIZE);
@@ -214,14 +214,14 @@ void qxl_bo_kunmap(struct qxl_bo *bo)
 	ttm_bo_kunmap(&bo->kmap);
 }
 
-void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev,
-			       struct qxl_bo *bo, void *pmap)
+void qxl_bo_kunmap_local_page(struct qxl_device *qdev,
+			      struct qxl_bo *bo, void *pmap)
 {
 	if ((bo->tbo.mem.mem_type != TTM_PL_VRAM) &&
 	    (bo->tbo.mem.mem_type != TTM_PL_PRIV))
 		goto fallback;
 
-	io_mapping_unmap_atomic(pmap);
+	io_mapping_unmap_local(pmap);
 	return;
  fallback:
 	qxl_bo_kunmap(bo);
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -88,8 +88,8 @@ extern int qxl_bo_create(struct qxl_devi
 			 struct qxl_bo **bo_ptr);
 extern int qxl_bo_kmap(struct qxl_bo *bo, void **ptr);
 extern void qxl_bo_kunmap(struct qxl_bo *bo);
-void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
-void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
+void *qxl_bo_kmap_local_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
+void qxl_bo_kunmap_local_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
 extern struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo);
 extern void qxl_bo_unref(struct qxl_bo **bo);
 extern int qxl_bo_pin(struct qxl_bo *bo);
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -408,7 +408,7 @@ union qxl_release_info *qxl_release_map(
 	union qxl_release_info *info;
 	struct qxl_bo *bo = release->release_bo;
 
-	ptr = qxl_bo_kmap_atomic_page(qdev, bo, release->release_offset & PAGE_MASK);
+	ptr = qxl_bo_kmap_local_page(qdev, bo, release->release_offset & PAGE_MASK);
 	if (!ptr)
 		return NULL;
 	info = ptr + (release->release_offset & ~PAGE_MASK);
@@ -423,7 +423,7 @@ void qxl_release_unmap(struct qxl_device
 	void *ptr;
 
 	ptr = ((void *)info) - (release->release_offset & ~PAGE_MASK);
-	qxl_bo_kunmap_atomic_page(qdev, bo, ptr);
+	qxl_bo_kunmap_local_page(qdev, bo, ptr);
 }
 
 void qxl_release_fence_buffer_objects(struct qxl_release *release)

