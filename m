Return-Path: <linuxppc-dev+bounces-17801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHcrBpWpqmnjVAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278F21E8E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS2Pd2vKbz3cGZ;
	Fri, 06 Mar 2026 21:16:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772792197;
	cv=none; b=IPJmggXLcjQMH4SZ5yvvAfzv0FbP/X/jBuzXsOozzjDcWlVXJ1ype1Xa6cmap3dN+N9JnK1oMah77Z40JVTGaatLvMg3vjQ4/6+GYZXfZ+EgYLHRRLueXiWrFTBcabT04HLKhhZECB0H1Ss8yq9H0ZWM1EVhjIV9WAQfwS8h4TrNEe/s+GigH62ZLlF3N9zufxXhUK/VWBpAr5gG9yPJKPIDfQBOKAb4eHMLYu+WhWkHdUW/+dvf9wN9HBns7nNmhKxZUvEMXQRV/nB6kvnQ+Uge//fLKl0MY4aTxKsCpjHWnZjpGm1E7ap9ArBfEj7WedJMX0H+H/TZ720YRGGlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772792197; c=relaxed/relaxed;
	bh=z4QAwrW2GLBTtbMQBlpjYhRh1mC/IWhMZm5cbOWtGeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJ1O5k9by9bwS4QkQoP9J24Jq+xvTXvpCxpLX4aKPpT4RFbQjCYiqTme1yPVteKnoFB09uTn1gI1h7rS6Wcz37luh2/we/3GFHTb2NjUKwV1nFVuDl1AdIycoWUBFIW1ScJ+5zK5LqvS3BIwm/Wh3/qSDi+bzUdiaMJmFNsSA6+Wq5FxFjg3Jc6QO0m4m4bTwNxavEwsUO8yxPvpe9dEylgmx37dGlERh29xuXEKJ3cSbX0qGd3hswefp9eqbMPK+zT0YDsDP84mWABhjyqszn0vxc92oHh5x2GGRjfQbPgzrx5nD1SVUGTsSsa363+5fN0elOxYp7Vk5SSR0g4GeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sfMFKTIS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sfMFKTIS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS2Pc6NxDz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 21:16:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CEAB60130;
	Fri,  6 Mar 2026 10:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D250C4CEF7;
	Fri,  6 Mar 2026 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792194;
	bh=ltugaujY6fYQ/bBQe0co3tDjQ1T6cgZ91J0YQTonPoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfMFKTISWy6XmE2PIb9BpEGaudJtZSFT3m04+Td9Q5T7Gtl5odhVnpSKvAaWekMq5
	 YHbT6av2ZV+y2SZEABL2S1pqe2js5staTWbWCHUQ4B7m9ij0IMohuU27s1qBBdgbPv
	 /xvSBtXv6lHzyCRnpv+esgazI7+0+/ywXmzcHmgMjvA3sRdXUm2hLsggmuK9Ra3vRW
	 01wq2YBeDQDBfoijNG5nKwFgIVYW1Tdu+trdWwEzNjdxxjyrd/WSFkp0EGvSNT+xvh
	 NuY+Mjb/VVLtIe/Vr8TymfRbCZjTQbk4VUHJmhMxLi8b0TxsdAUHDe6yKXN4FWInAE
	 fumJUEFoLAn4w==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH v1 4/4] KVM: PPC: remove hugetlb.h inclusion
Date: Fri,  6 Mar 2026 11:16:00 +0100
Message-ID: <20260306101600.57355-5-david@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306101600.57355-1-david@kernel.org>
References: <20260306101600.57355-1-david@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 6278F21E8E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17801-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:david@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

hugetlb.h is no longer required now that we moved vma_kernel_pagesize()
to mm.h.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 08e5816fdd61..61dbeea317f3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -36,7 +36,6 @@
 #include <linux/gfp.h>
 #include <linux/vmalloc.h>
 #include <linux/highmem.h>
-#include <linux/hugetlb.h>
 #include <linux/kvm_irqfd.h>
 #include <linux/irqbypass.h>
 #include <linux/module.h>
-- 
2.43.0


