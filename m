Return-Path: <linuxppc-dev+bounces-17800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJdAEo6pqmnjVAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083E21E8E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS2Pb3L1Cz3cFM;
	Fri, 06 Mar 2026 21:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772792195;
	cv=none; b=nuR9TnC8sa7ziOY917CJ59zjjSn3B9SuWcKbIvQeknXdO0luvnXXWFQ9DXnbeS7ODX9aBOcaq/g+QK9fmF00FZi7r2EPNjieqbvecbKaJQBy1BhzwT6+Lc+vtEWnRhufW1iM4Yj5mA2SAaKo4CeF2sRsb0qi6CLYvvtwbqzddH5go0210gVoZJACp1hYCJWz3SDYyui/sZ4kxdIl0RkY2PNPW9O0d62+jxQhAkNx3yH9BVe339G1LC0PvZc7h5hWUftOnH/p3h90RSxvnbTPC6HB/x7g80myi+u9Szt+zuwovIEyRejSVMETcArQOy7Ap1y2hUc/v6JgtYLzm6O1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772792195; c=relaxed/relaxed;
	bh=5/dkJdaAB+pKo1P+eI25ypsj40QWLqgHpKTD+Xjo1is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoWbG4FUYXhshHREks0Dy8PgvCTlEFpmk/eFRhh4NIAHRqlZz5+YZAAdBpaGE8nFoBXjukJZUru9nnu9lvOlLTLdOZNR6QC/LJGhV/CoaUJ5hKngxO+pBvBpl8Qj2/HkFWhx5+OvXlXjs33U37aXFYXn4yohQyJdXrU+gg7OY1TF3QreB5omhhhDfSb3RcjOZ8v6tYM3CQteeCLfHxZch7LzmwxLHv5gU5NsUvisoq57wehI++t61DcwK3SsCyDo4gyxkJ7/j8vaQnEQJYohL3haCBDqXXAL+BQwAaRcPTWchpJg6WzlmGRj9/mTNWSXWOLhGqg4y4JPrqVFvqJOzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UMh7g+zY; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UMh7g+zY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS2PZ5QYjz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 21:16:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D309F60131;
	Fri,  6 Mar 2026 10:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB1BC19422;
	Fri,  6 Mar 2026 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792192;
	bh=k5FQ3POVWHUqSFCK1KHjIrKMQkLSCam/RT4g8330CaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UMh7g+zYXegSicI9M1aLSZ+o/u9Faw6vtFXpS+dhIFChWaHhnesz2CqTrWf5lZ1YX
	 PwR/89DOY0KxCfaDF+zvV/j0Ch3nBLN4zXZ99O5x+zsLJnKtg+Jp/8d0ZrzcYbo67E
	 hJ4fiZkHg6cip8UbajFYj19bxe1E8BxOFId9YL/FGpdsypVTI0uZCX4EeT1GlBw/ab
	 v6QBUypGeW3DremKETuRvO9dxgJz/QXm1sCkZZIosBs97NVkjiLD8T1uFOzHSu9wWz
	 /ZloImQknfKb+rfKqLT+2ao8Mf7tlJQPkn+MKqx5VK5iK0Xrx6O7k0ZQZPwfkpqZws
	 H8SRiS+Qx0qUg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH v1 3/4] KVM: remove hugetlb.h inclusion
Date: Fri,  6 Mar 2026 11:15:59 +0100
Message-ID: <20260306101600.57355-4-david@kernel.org>
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
X-Rspamd-Queue-Id: 5083E21E8E2
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
	TAGGED_FROM(0.00)[bounces-17800-lists,linuxppc-dev=lfdr.de];
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
 virt/kvm/kvm_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 22f8a672e1fd..58059648b881 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -41,7 +41,6 @@
 #include <linux/spinlock.h>
 #include <linux/compat.h>
 #include <linux/srcu.h>
-#include <linux/hugetlb.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/bsearch.h>
-- 
2.43.0


