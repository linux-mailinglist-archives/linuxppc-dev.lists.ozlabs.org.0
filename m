Return-Path: <linuxppc-dev+bounces-12283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B5B58E41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 08:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQs2t0dW8z301G;
	Tue, 16 Sep 2025 16:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758003045;
	cv=none; b=Ne1X9APapcSRtFB3afckw6d6Sc/kz+95PDxXcmb0G/rb1EXfemyAFmpxBVKUnqz32YhZtcTHsMfAiUWYpfLRwmL0mEpwLZ14xJyu+DErseO3OQ94bJUetwqQ1k413Iq09gu920GbtV2Kfdn+YcruuJw8rbVeZXZY7++wNPtI/ySp6uoIwSSbzL3KHo1NXwDE9NNJ/2CuGavU6WCxfwKgNOeRhMWpNAmRSb9jjFICmFTLrngXedJaZNilXUq8+bwKsjq2EhEhnQMe1/u0SHcXSYb1dZ9Dhq6oyX4WWyRxiEIjzlfYx+nTi3jV/qe+7dpUCxGoRk9VHfnGpNU99LCPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758003045; c=relaxed/relaxed;
	bh=gaWb8FaXTaOm9pYwQoptQTg8O5QNaVOVs+VrR+4evqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YPMouJhq1gz34E9oyd9CbWQlizgui4pwAooVoG+k4rPyuUjt0rPDOAz6KSJi3k+Ws5qUBdlog5xHOdJi10ZkOGOLtv+GHTFfToPQEDAe7Y3cuRtp8tNc5Dai17BX65VUhJO9nVzMQZ3UDnsWknFl8QlR9ul8u82vkqOo5c9B78tfnKhJqPgDdKL93SMN7uqo15fUqhojDo+Zd/wISkdMlwKJc37OteyrKNnKy+ZTxgGi5OSWtINHpNZrb6boLuQOr1ZnuxeJgAaNz57i1CQG3cwTCGdTqCDsAvOU33f72h/4O0i4FmannXTpFpupyqFx1Xrf5I890aPefhodqKc/jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mn1vmNJ2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W9BYIc0b; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mn1vmNJ2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W9BYIc0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQs2r2XPCz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 16:10:44 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758003038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gaWb8FaXTaOm9pYwQoptQTg8O5QNaVOVs+VrR+4evqs=;
	b=Mn1vmNJ29B3nn2f7ZDKYq6uh1x3lGn1KS1bymhPbhHUHYIXuwLU21nc9AVlkaXmEcyDruW
	m0x0ZHulo1bYfC0f0XqkJTk97e/cIHdH8jqCrXwJuHTtr1wHrCVhWAjMeUHYv6n/a/W6nl
	3eBw8r+z2oOataqwL5WfhRY6iSjdumIiPFv0Rm99jLQQTz/rif7/XGh7lwwlbg1nIdpb/o
	Vq5/Ub3PVL5Sm5tp9xYCKFwb7obq6afxX3jzvyUOdGYAd0a02gt5hl7vC8ENqUPGgDwjkI
	o9+OMgt4ISJlB5nNrMdIvstdVhBRGH/PXKFwrkSKExsa5yroBAKW9JWhCvd9hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758003038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gaWb8FaXTaOm9pYwQoptQTg8O5QNaVOVs+VrR+4evqs=;
	b=W9BYIc0bgetn+IO7V5IHipUl1Twp9sGJ6AA5upoFAXbKJILDMsiGARygGt0Egev4YNZGcZ
	Phd9o9TLtDhiMICA==
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] genirq/msi: Remove msi_post_free()
Date: Tue, 16 Sep 2025 08:10:07 +0200
Message-Id: <20250916061007.964005-1-namcao@linutronix.de>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The only user of msi_post_free() - powerpc/pseries - has been changed to
use msi_teardown().

Remove this unused callback.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
This patch depends on the powerpc/series conversion patch, which is
currently in powerpc tree:
https://lore.kernel.org/lkml/c7a6d8f27fd217021dea4daad777e81a525ae460.17549=
03590.git.namcao@linutronix.de/

I think it is most convenient to apply this patch to powerpc tree, if
everyone is okay with that?
---
 include/linux/msi.h | 4 ----
 kernel/irq/msi.c    | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index e5e86a8529fb..faac634ac230 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -431,8 +431,6 @@ struct msi_domain_info;
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
  *			function.
- * @msi_post_free:	Optional function which is invoked after freeing
- *			all interrupts.
  * @msi_translate:	Optional translate callback to support the odd wire to
  *			MSI bridges, e.g. MBIGEN
  *
@@ -473,8 +471,6 @@ struct msi_domain_ops {
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
 					    struct device *dev);
-	void		(*msi_post_free)(struct irq_domain *domain,
-					 struct device *dev);
 	int		(*msi_translate)(struct irq_domain *domain, struct irq_fwspec *fwspe=
c,
 					 irq_hw_number_t *hwirq, unsigned int *type);
 };
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 9b09ad3f9914..e7ad99254841 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1644,9 +1644,6 @@ static void msi_domain_free_locked(struct device *dev=
, struct msi_ctrl *ctrl)
 	else
 		__msi_domain_free_irqs(dev, domain, ctrl);
=20
-	if (ops->msi_post_free)
-		ops->msi_post_free(domain, dev);
-
 	if (info->flags & MSI_FLAG_FREE_MSI_DESCS)
 		msi_domain_free_descs(dev, ctrl);
 }
--=20
2.39.5


