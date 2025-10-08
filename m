Return-Path: <linuxppc-dev+bounces-12706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1319BC3C5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 10:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chQlN27Bbz3057;
	Wed,  8 Oct 2025 19:14:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759911264;
	cv=none; b=R5/04JhV8Rs1pY+Mc1RYRU+i0bb6vCAtuXBrmaRVtSpLaMrdNDJF1TW+jdcdl1LFqX9M6iumYfwiX/OfY42Jpr4KoCaIedp+Zu0eIyOAl/ujwEK3GWk+tEg5sMRlcoS8c7JfUEJLWKmUhxglSad644UkdKT8apTmqS3aBs3qVaMfTqtBUSd9LpimB/Xz6IkPMQ6Fj/qAn5UEPdP6bIjE9grp4uxWg2Edo3Hsu4xeHIEn4C4laDjRjp4fD8Ditdn4+eWZ3byDlBTcVl+3XjxgAIc/X9suJG4bIZKC+EPvmQNEUMZ+/UzjGnlGH21jQky9R65iBPZ2FOXeaWc9lBGXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759911264; c=relaxed/relaxed;
	bh=H5TDg8FSvQpDKH++xWAtG1t0GE6Gx0i9+KrmLqybckU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lz5oPtjqG7iRYgUbtK8b9KDKMfo3pSWZiZZPvJGzPQLMNC7pOn9OnsHF+kokCtjPMetNaX98KQrUdPqgSq+f1ncatsJfjiYyRUUAtwG7tbSn3k5nfR6RisMz2VLmINI/FALCtAHtdqVorMVTYriUSXrCeuBdBHLM7I61vmkjbe5E8c3boAANIrnMQsqwryl2j94fYe8aBi7ZQZg7Xw+i84XP0KbCRNh+IKZ/kXkuG1NkyQE5UTGn5H8WE/35oavOygM3TR2FsZJXB5ekRTKLOD8blY23Vv9Z8DZC6KPPDhHlbCp1fUXOFATE91F9qC8tqgMWjPOR5gkKkjDsdHWuGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TLYzuiLZ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4Qldh2rM; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TLYzuiLZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4Qldh2rM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chQlL68N4z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 19:14:22 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759911254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H5TDg8FSvQpDKH++xWAtG1t0GE6Gx0i9+KrmLqybckU=;
	b=TLYzuiLZY2Sklg9yYjmr8SHWaWYn0YpZ3oWlUhhRWYX0FgK71fBDVLsVj+7pF1GnHowFUr
	+0kHfwZuCRBP5WXFLjnhcx8XthcjitAg3kn0GkJiWmVfw4rNv1m5UlxhgAXGk0KsBO/+uK
	AGJyiXtfB/bl6hLM+t/GE6wb5XFRqWSEinluaGYAN6j0qAzSjhtrMXFGGtB2c2QDxTsJOL
	89P+5l85eLHD4i3Nhsl7erpaHiTlAm2/Wt68VQhrwt7O60gRro6SeEa7o7bis0HvTsrkjd
	igxdjgWrL1hPnLwXlLt1U2OiX3TkzAlaV1jBNNlykpa312jmASbJgHFEclA9RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759911254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H5TDg8FSvQpDKH++xWAtG1t0GE6Gx0i9+KrmLqybckU=;
	b=4Qldh2rMCNzlzmnuLKwkQ4g4LcJEyGBAPvTu822MxwPO39Gsbk9N4VuL6B+PaZLocm8AHY
	+cU+LnQYG/jgo3BA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nam Cao <namcao@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] powerpc, ocxl: Fix extraction of struct xive_irq_data
Date: Wed,  8 Oct 2025 08:13:59 +0000
Message-ID: <20251008081359.1382699-1-namcao@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt
controller drivers") changed xive_irq_data to be stashed to chip_data
instead of handler_data. However, multiple places are still attempting to
read xive_irq_data from handler_data and get a NULL pointer deference bug.

Update them to read xive_irq_data from chip_data.

Non-XIVE files which touch xive_irq_data seem quite strange to me,
especially the ocxl driver. I think there ought to be an alternative
platform-independent solution, instead of touching XIVE's data directly.
Therefore, I think this whole thing should be cleaned up. But perhaps I
just misunderstand something. In any case, this cleanup would not be
trivial; for now, just get things working again.

Fixes: cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt cont=
roller drivers")
Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Closes: https://lore.kernel.org/linuxppc-dev/68e48df8.170a0220.4b4b0.217d@m=
x.google.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
VAS and OCXL has not been tested. I noticed them while grepping.
---
 arch/powerpc/kvm/book3s_xive.c       | 12 ++++--------
 arch/powerpc/platforms/powernv/vas.c |  2 +-
 arch/powerpc/sysdev/xive/common.c    |  2 +-
 drivers/misc/ocxl/afu_irq.c          |  2 +-
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 1302b5ac5672..89a1b8c21ab4 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -916,8 +916,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu=
, u8 prio,
 	 * it fires once.
 	 */
 	if (single_escalation) {
-		struct irq_data *d =3D irq_get_irq_data(xc->esc_virq[prio]);
-		struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+		struct xive_irq_data *xd =3D irq_get_chip_data(xc->esc_virq[prio]);
=20
 		xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_01);
 		vcpu->arch.xive_esc_raddr =3D xd->eoi_page;
@@ -1612,7 +1611,7 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned =
long guest_irq,
=20
 	/* Grab info about irq */
 	state->pt_number =3D hw_irq;
-	state->pt_data =3D irq_data_get_irq_handler_data(host_data);
+	state->pt_data =3D irq_data_get_irq_chip_data(host_data);
=20
 	/*
 	 * Configure the IRQ to match the existing configuration of
@@ -1787,8 +1786,7 @@ void kvmppc_xive_disable_vcpu_interrupts(struct kvm_v=
cpu *vcpu)
  */
 void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu, int irq)
 {
-	struct irq_data *d =3D irq_get_irq_data(irq);
-	struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
+	struct xive_irq_data *xd =3D irq_get_chip_data(irq);
=20
 	/*
 	 * This slightly odd sequence gives the right result
@@ -2827,9 +2825,7 @@ int kvmppc_xive_debug_show_queues(struct seq_file *m,=
 struct kvm_vcpu *vcpu)
 				   i0, i1);
 		}
 		if (xc->esc_virq[i]) {
-			struct irq_data *d =3D irq_get_irq_data(xc->esc_virq[i]);
-			struct xive_irq_data *xd =3D
-				irq_data_get_irq_handler_data(d);
+			struct xive_irq_data *xd =3D irq_get_chip_data(xc->esc_virq[i]);
 			u64 pq =3D xive_vm_esb_load(xd, XIVE_ESB_GET);
=20
 			seq_printf(m, "    ESC %d %c%c EOI @%llx",
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/=
powernv/vas.c
index b65256a63e87..9c9650319f3b 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -121,7 +121,7 @@ static int init_vas_instance(struct platform_device *pd=
ev)
 		return -EINVAL;
 	}
=20
-	xd =3D irq_get_handler_data(vinst->virq);
+	xd =3D irq_get_chip_data(vinst->virq);
 	if (!xd) {
 		pr_err("Inst%d: Invalid virq %d\n",
 				vinst->vas_id, vinst->virq);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/c=
ommon.c
index 625361a15424..8d0123b0ae84 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1580,7 +1580,7 @@ static void xive_flush_cpu_queue(unsigned int cpu, st=
ruct xive_cpu *xc)
 			cpu, irq);
 #endif
 		raw_spin_lock(&desc->lock);
-		xd =3D irq_desc_get_handler_data(desc);
+		xd =3D irq_desc_get_chip_data(desc);
=20
 		/*
 		 * Clear saved_p to indicate that it's no longer pending
diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
index 36f7379b8e2d..f6b821fc274c 100644
--- a/drivers/misc/ocxl/afu_irq.c
+++ b/drivers/misc/ocxl/afu_irq.c
@@ -203,7 +203,7 @@ u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int=
 irq_id)
 	mutex_lock(&ctx->irq_lock);
 	irq =3D idr_find(&ctx->irq_idr, irq_id);
 	if (irq) {
-		xd =3D irq_get_handler_data(irq->virq);
+		xd =3D irq_get_chip_data(irq->virq);
 		addr =3D xd ? xd->trig_page : 0;
 	}
 	mutex_unlock(&ctx->irq_lock);
--=20
2.51.0


