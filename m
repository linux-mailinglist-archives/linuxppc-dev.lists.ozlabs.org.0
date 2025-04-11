Return-Path: <linuxppc-dev+bounces-7599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F91A856E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 10:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYqxT0rtXz3c6Z;
	Fri, 11 Apr 2025 18:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744361085;
	cv=none; b=e1hdu+FF+03IImnXFxwsCm5oFQWjKL6PvYC75vijNZ724o1Udu7Vje/6BvTMvRWQTBnvwBdbSjeDSFr039LlN+u5zQ4Xk5alyt6mN+PlkV7bXo6UuxeJfJ/mf9TRxQ5bNQ1MD+CRNFusJ06YMEeHevLTdP7pdhar0O4bYI5ER1cBPuYk0Pvj3wZN2bYY+CJOTjjEgvZEwdBiksL9/J9JsCdllQPefqZlLqv75TdzCakum4ZsQxb2SQEvzQrVlYXsC6lLMLdaU4iMYmzd511KIn6lXZVuyUr5vXHN4+Ese3HX8qw/+R4x6t9MrA/Apr3hk8Xw1GzR73eTsKREDPYLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744361085; c=relaxed/relaxed;
	bh=MdTcTTn9V7geK5rQuA+yDIzL/vSURyQGllXaAX2HpQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IuKlIUCXtn4ys/OcGLC4Yy5Jod0nqC/AX4EyfvcLzCnOPDtk1GsN1XFRkJGbMX0yXj9uP4oNsxrZOmocxFcXGrDRNAINZgxB15SGIQekIZhaDgguCUDAta2ytxvb0KaRzdzSmxCu3ArG2L8+JG9IdHZt6NwnGYXneWHbjyAwYg+0KotgzEvorJpfzIT8I6IQHzD4Z+QFIzP5jdQcASRy7cW/c1R554GkbpaQ5VLZM6YCLEuWyPs35m7ACj+PooI/AQGH4B9BguBbVBBg5+UaNMbKgtkexNTRIC7bb/i+fVq9+uN1edOHs5sxB+N1wp+aHnIhcLRRW+/mBGT3vIfPmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.174; helo=out-174.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.174; helo=out-174.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 100 seconds by postgrey-1.37 at boromir; Fri, 11 Apr 2025 18:44:38 AEST
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYqxL5DjDz3c5h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 18:44:38 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744360953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MdTcTTn9V7geK5rQuA+yDIzL/vSURyQGllXaAX2HpQA=;
	b=QcoNEaICIR7s08TAtqE8OHsqC62eyCEeqIvkymDTx3s0HSiFqrlyKIq1Cx5BQ2Wdm5uf9X
	GZPohmMqYc36Wc1340M1ZJMOIhq6BVnn+Wa7VHeDsknIPSKvyLm5GHrRaKmSfcLvBJfkoR
	cWLY6m6MounWXUj/gsAPIQEieZIRiFU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] KVM: powerpc: Enable commented out BUILD_BUG_ON() assertion
Date: Fri, 11 Apr 2025 10:42:21 +0200
Message-ID: <20250411084222.6916-1-thorsten.blum@linux.dev>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The BUILD_BUG_ON() assertion was commented out in commit 38634e676992
("powerpc/kvm: Remove problematic BUILD_BUG_ON statement") and fixed in
commit c0a187e12d48 ("KVM: powerpc: Fix BUILD_BUG_ON condition"), but
not enabled. Enable it now that this no longer breaks and remove the
comment.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kvm/timing.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/timing.h b/arch/powerpc/kvm/timing.h
index 45817ab82bb4..14b0e23f601f 100644
--- a/arch/powerpc/kvm/timing.h
+++ b/arch/powerpc/kvm/timing.h
@@ -38,11 +38,7 @@ static inline void kvmppc_set_exit_type(struct kvm_vcpu *vcpu, int type) {}
 static inline void kvmppc_account_exit_stat(struct kvm_vcpu *vcpu, int type)
 {
 	/* type has to be known at build time for optimization */
-
-	/* The BUILD_BUG_ON below breaks in funny ways, commented out
-	 * for now ... -BenH
 	BUILD_BUG_ON(!__builtin_constant_p(type));
-	*/
 	switch (type) {
 	case EXT_INTR_EXITS:
 		vcpu->stat.ext_intr_exits++;
-- 
2.49.0


