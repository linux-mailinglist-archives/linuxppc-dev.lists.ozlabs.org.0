Return-Path: <linuxppc-dev+bounces-4535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204579FEB11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 22:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMV2b49jFz2xJT;
	Tue, 31 Dec 2024 08:43:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735594983;
	cv=none; b=AjvwTzySmm6y2Lpsk/eSqyYwDcqbmgTrUWE5bSM10kuUoO/5pxsUg0ctpuKAVx708QBVZCdjAxbktb4TI6E+4/1kpXHNxvSoEpvxPsC2Hu0BtkHAv5ytfAnJZvTOy0ifZEqRCKnisMtpjea7pl6kHkeBxWUro+yXZ4+mZWL/a1A9T6qMi70wGSk+o5ef8RJtzxIB+6QJhRu4F8mNeyj1PHe27Mc+0qFZ6PeIjpN5riavQrsazAcxRrr12cOT2FD/PcSQOKjTT6BlH5HaQa5jiiPEKsdfD3QBpyOmDPavPwBHqU2k84vwt/c2yM0RTkBxEYpysgCNY9BN/KBWC87bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735594983; c=relaxed/relaxed;
	bh=jC14eZi7B7sA2R+7iUTvGWkYRvEG9XHIhaxsc9wJrVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRdvBI4THFNumD5ZXBh8x1Dqxj0p68xtrBEYntoR/tmJKH8emMZGow0ry3H91MQ2GrgiF9GQslO/LXqQDEzwbZC0nYiWu10hdUd2PSF2SFGpG/1hmpTvN3slvOrvSAXXM8q1IikpbappedPkOWFDpsbZIYGgcLO2f6JHfImmY3XSgl7BwjOrZiBTpVVtcA5MXoKh/OLWzE9bpnVg+xk12R9G8CNcsK1aZLgbwJmYnUlEDN1+7YqhIB0QgQUDt6n+jUVNUO8l/seSWVaCe3iI1zlaSJZ6UxHEgpNQsA+iCk1BBAlc9K92yJnqn43+199mmShrGkhB8tVmo8MSYWAI6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b7; helo=out-183.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b7; helo=out-183.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMV2R6cs6z2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 08:42:55 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735594939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jC14eZi7B7sA2R+7iUTvGWkYRvEG9XHIhaxsc9wJrVo=;
	b=MsIcUxuugptvGWjSequdFimi+Rz8rudiAPVo2eglSn9T3N9rRd6MqxSsR0vnTLZ6ZABz/o
	iW9NtJNNFLZohgSeJw+294aSeHgAMwiWtlaLFW2Yl9P7aePNfcZ1UjddwoqMokFOvoI782
	m7QZNO39G0F/gF5rk5sB06jnKNeXg3k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Baoquan He <bhe@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fadump: Use str_yes_no() helper in fadump_show_config()
Date: Mon, 30 Dec 2024 22:41:40 +0100
Message-ID: <20241230214142.952706-2-thorsten.blum@linux.dev>
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
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/fadump.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..8c531533dd3e 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
 	if (!fw_dump.fadump_supported)
 		return;
 
-	pr_debug("Fadump enabled    : %s\n",
-				(fw_dump.fadump_enabled ? "yes" : "no"));
-	pr_debug("Dump Active       : %s\n",
-				(fw_dump.dump_active ? "yes" : "no"));
+	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
+	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
 	pr_debug("Dump section sizes:\n");
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
-- 
2.47.1


