Return-Path: <linuxppc-dev+bounces-3615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9A9DEBBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 18:34:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0L0B3360z2ytQ;
	Sat, 30 Nov 2024 04:34:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732901674;
	cv=none; b=jgC2s/jNYDrHDkGFCEJ4xZ+J1A8ByA8osMPuT4HzQAzCW7eaRxiKXTTT1XhCUC6DgXaUFAjorU4FlcAV0d202ogC0OGFaQpZlC8FD+oA3GPmAlgIqQqXNo/OP92FKggYlnIxn5zr9+GdFOsNnpuDHxIpz+OFo9YGAdZxpVaI1lVfzqP6xFyRaMKzbAc6844lKBT1loZf31W5TLWvQWUPcpWWlm1Dnc5rAKkIZUUt4RF3L50dz3Dfq1f24hBCF/vkN9gXpLDX67c3+DcOiCnjTPQsyVRmcpr9V1lNBYVrYjWwRu06TRYDaJRkUvTN8/mlvLZCQMYuTzIVP5Q6wtS67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732901674; c=relaxed/relaxed;
	bh=Z+kXbYdmzlPc4e8p4W9r9eGRyuvZV5ymgfeFex00yNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SX/chgVU97/DZuvXqAeZUitYq9xj/zAeLCJ9osiW5wsrg1/5kDNnt/6ePAy77HBe6jnjd1fBY2dVTP0wsfLgNdUORA6SOn988lauju34uNDi6QEiQKPy5hv2FeQtMcZ7QPqNSmkUP6ZLg/zyJI/2el1CvF64VchhB131KxEKcNPElliKXUaab8pL20uXj5wIFP9i15BpvPdv8aRX0ZF01xENGYtm3xrLRksj8arwurExPXmeucwq/MpO882ybWk+JT7nPfn0UYzf8tWoArXtWiAfIOr+N928cUQPZNoz58luJUnyRAzJiRLeazY0z8Iy41oZtJmt744AazNmC9G4xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0L083Tnyz2yNJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 04:34:29 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/xmon: Use str_yes_no() helper in dump_one_paca()
Date: Fri, 29 Nov 2024 18:33:35 +0100
Message-ID: <20241129173337.57890-2-thorsten.blum@linux.dev>
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
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/xmon/xmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e6cddbb2305f..6c84169b309d 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2623,9 +2623,9 @@ static void dump_one_paca(int cpu)
 
 	printf("paca for cpu 0x%x @ %px:\n", cpu, p);
 
-	printf(" %-*s = %s\n", 25, "possible", cpu_possible(cpu) ? "yes" : "no");
-	printf(" %-*s = %s\n", 25, "present", cpu_present(cpu) ? "yes" : "no");
-	printf(" %-*s = %s\n", 25, "online", cpu_online(cpu) ? "yes" : "no");
+	printf(" %-*s = %s\n", 25, "possible", str_yes_no(cpu_possible(cpu)));
+	printf(" %-*s = %s\n", 25, "present", str_yes_no(cpu_present(cpu)));
+	printf(" %-*s = %s\n", 25, "online", str_yes_no(cpu_online(cpu)));
 
 #define DUMP(paca, name, format)				\
 	printf(" %-*s = "format"\t(0x%lx)\n", 25, #name, 18, paca->name, \
-- 
2.47.0


