Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7E7F4D37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 17:50:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AqfJxO8X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb6g304HBz301f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 03:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AqfJxO8X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb1KD2782z3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:49:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58AFD61DC7;
	Wed, 22 Nov 2023 12:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD60AC433C9;
	Wed, 22 Nov 2023 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700657358;
	bh=7uZiA7BV1EHvD8gDrmgEuc8Q4gkEdBarx0UpVsG1vNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AqfJxO8XzZeGNu0mtpcXDTCSFRPOo0SlhhHv/QC0WO3Obsw0j2/dU4c4FuBQrd/OP
	 DbFK2NJl7j4VWDGp+SPsJ2YNue2rd7Zmwi8E3gfCSqgH9n/YLMrRNAlGE6SQVlsU23
	 vXqTRkoNBWRDxjRECNLDuPkVcLRsFUNxMuqqdeQsDkcrKlrPNXno9qOAJ6oepLCP+d
	 LXmPkukb1d8ai5dg0mrA/uqMeYv4stTQeV+VB3b1YYMaJJmaWGgihfWA/lNr2WTu1/
	 7/ZBuqxZhiJUisLEqasZPLQquM1tLv/D5upbL8C3NSwCaFqd+c3rIUmaf4Nu5T4QBL
	 r9gfOpX5Qg0Tw==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 22 Nov 2023 13:48:22 +0100
Subject: [PATCH v2 1/4] i915: make inject_virtual_interrupt() void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-vfs-eventfd-signal-v2-1-bd549b14ce0c@kernel.org>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
In-Reply-To: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
To: linux-fsdevel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=brauner@kernel.org;
 h=from:subject:message-id; bh=7uZiA7BV1EHvD8gDrmgEuc8Q4gkEdBarx0UpVsG1vNg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTG/lijOaknSTlcRJzPILDJVd/TRk51g3yQX9PrhU6dq
 73z7mzoKGVhEONikBVTZHFoNwmXW85TsdkoUwNmDisTyBAGLk4BmIggF8P/skrZDdMFRVfP+ti2
 XjtpR/st0cgfoZuOF904N6NM/+fZTYwMt20s3h3lyVj0+C63y4d/387vnKA8ry7MYWFejO+c6q/
 /mAE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mailman-Approved-At: Thu, 23 Nov 2023 03:46:57 +1100
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, netdev@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Christoph Hellwig <hch@lst.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>, Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>, x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe
  <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, Zhenyu Wang <zhenyuw@linux.intel.com>, Eric Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm
 .com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Christian Brauner <brauner@kernel.org>, Pavel Begunkov <asml.silence@gmail.com>, Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Barrat <fbarrat@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The single caller of inject_virtual_interrupt() ignores the return value
anyway. This allows us to simplify eventfd_signal() in follow-up
patches.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 drivers/gpu/drm/i915/gvt/interrupt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index de3f5903d1a7..9665876b4b13 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -422,7 +422,7 @@ static void init_irq_map(struct intel_gvt_irq *irq)
 #define MSI_CAP_DATA(offset) (offset + 8)
 #define MSI_CAP_EN 0x1
 
-static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
+static void inject_virtual_interrupt(struct intel_vgpu *vgpu)
 {
 	unsigned long offset = vgpu->gvt->device_info.msi_cap_offset;
 	u16 control, data;
@@ -434,10 +434,10 @@ static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
 
 	/* Do not generate MSI if MSIEN is disabled */
 	if (!(control & MSI_CAP_EN))
-		return 0;
+		return;
 
 	if (WARN(control & GENMASK(15, 1), "only support one MSI format\n"))
-		return -EINVAL;
+		return;
 
 	trace_inject_msi(vgpu->id, addr, data);
 
@@ -451,10 +451,10 @@ static int inject_virtual_interrupt(struct intel_vgpu *vgpu)
 	 * returned and don't inject interrupt into guest.
 	 */
 	if (!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
-		return -ESRCH;
-	if (vgpu->msi_trigger && eventfd_signal(vgpu->msi_trigger, 1) != 1)
-		return -EFAULT;
-	return 0;
+		return;
+	if (!vgpu->msi_trigger)
+		return;
+	eventfd_signal(vgpu->msi_trigger, 1);
 }
 
 static void propagate_event(struct intel_gvt_irq *irq,

-- 
2.42.0

