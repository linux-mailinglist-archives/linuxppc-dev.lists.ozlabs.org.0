Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C84FB56F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 09:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcLnZ4fj8z3bdp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 17:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IvgqOHGa;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Sp57Rcc2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IvgqOHGa; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sp57Rcc2; 
 dkim-atps=neutral
X-Greylist: delayed 464 seconds by postgrey-1.36 at boromir;
 Mon, 11 Apr 2022 17:57:37 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcLmx4hBQz2x9J
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 17:57:37 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FA701F38C;
 Mon, 11 Apr 2022 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649663388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UF9BJAQdjavwAKw+euXPQUA7Z7EO/OVYg0QRzUslWD4=;
 b=IvgqOHGaFdjshxa1UDkK+QLm9FqPRzmLmunMRqM0QfNNLpd+DQQginWFEm0XxzS8QorlbV
 J/AO1l7IfnIVdqtmdl5pzm9oAe6u5fsw55jNePqudG3l2gB9lIlBPKv3MIhx5tcx7ashts
 i7yy3zJvwEQyVuXgxdoZxWF2OiR5zfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649663388;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UF9BJAQdjavwAKw+euXPQUA7Z7EO/OVYg0QRzUslWD4=;
 b=Sp57Rcc2z0XYsW6j15nn4ctHKttaxIIq1+CouY9birQ3jvXA2kFGC0xqGyEv1igAD9OJ2y
 KHp2RTFqtCOW5RDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCAF213A93;
 Mon, 11 Apr 2022 07:49:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XhWQMZvdU2JvHwAAMHmgww
 (envelope-from <osalvador@suse.de>); Mon, 11 Apr 2022 07:49:47 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
Date: Mon, 11 Apr 2022 09:49:34 +0200
Message-Id: <20220411074934.4632-1-osalvador@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc is the only platform that do not rely on
cpu_up()->try_online_node() to bring up a numa node,
and special cases it, instead, deep in its own machinery:

dlpar_online_cpu
 find_and_online_cpu_nid
  try_online_node

This should not be needed, but the thing is that the try_online_node()
from cpu_up() will not apply on the right node, because cpu_to_node()
will return the old mapping numa<->cpu that gets set on boot stage
for all possible cpus.

That can be seen easily if we try to print out the numa node passed
to try_online_node() in cpu_up().

The thing is that the numa<->cpu mapping does not get updated till a much
later stage in start_secondary:

start_secondary:
 set_numa_node(numa_cpu_lookup_table[cpu])

But we do not really care, as we already now the
CPU <-> NUMA associativity back in find_and_online_cpu_nid(),
so let us make use of that and set the proper numa<->cpu mapping,
so cpu_to_node() in cpu_up() returns the right node and
try_online_node() can do its work.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Tested-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
---
 arch/powerpc/include/asm/topology.h          |  8 ++-----
 arch/powerpc/mm/numa.c                       | 31 +++++++---------------------
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
 3 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 36fcafb1fd6d..6ae1b2dce83e 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -111,14 +111,10 @@ static inline void unmap_cpu_from_node(unsigned long cpu) {}
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
-extern int find_and_online_cpu_nid(int cpu);
+extern void find_and_update_cpu_nid(int cpu);
 extern int cpu_to_coregroup_id(int cpu);
 #else
-static inline int find_and_online_cpu_nid(int cpu)
-{
-	return 0;
-}
-
+static inline void find_and_update_cpu_nid(int cpu) {}
 static inline int cpu_to_coregroup_id(int cpu)
 {
 #ifdef CONFIG_SMP
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b9b7fefbb64b..b5bc8b1a833d 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1423,43 +1423,28 @@ static long vphn_get_associativity(unsigned long cpu,
 	return rc;
 }
 
-int find_and_online_cpu_nid(int cpu)
+void find_and_update_cpu_nid(int cpu)
 {
 	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
 	int new_nid;
 
 	/* Use associativity from first thread for all siblings */
 	if (vphn_get_associativity(cpu, associativity))
-		return cpu_to_node(cpu);
+		return;
 
+	/* Do not have previous associativity, so find it now. */
 	new_nid = associativity_to_nid(associativity);
+
 	if (new_nid < 0 || !node_possible(new_nid))
 		new_nid = first_online_node;
-
-	if (NODE_DATA(new_nid) == NULL) {
-#ifdef CONFIG_MEMORY_HOTPLUG
-		/*
-		 * Need to ensure that NODE_DATA is initialized for a node from
-		 * available memory (see memblock_alloc_try_nid). If unable to
-		 * init the node, then default to nearest node that has memory
-		 * installed. Skip onlining a node if the subsystems are not
-		 * yet initialized.
-		 */
-		if (!topology_inited || try_online_node(new_nid))
-			new_nid = first_online_node;
-#else
-		/*
-		 * Default to using the nearest node that has memory installed.
-		 * Otherwise, it would be necessary to patch the kernel MM code
-		 * to deal with more memoryless-node error conditions.
+	else
+		/* Associate node <-> cpu, so cpu_up() calls
+		 * try_online_node() on the right node.
 		 */
-		new_nid = first_online_node;
-#endif
-	}
+		set_cpu_numa_node(cpu, new_nid);
 
 	pr_debug("%s:%d cpu %d nid %d\n", __FUNCTION__, __LINE__,
 		cpu, new_nid);
-	return new_nid;
 }
 
 int cpu_to_coregroup_id(int cpu)
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index b81fc846d99c..0f8cd8b06432 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -398,7 +398,7 @@ static int dlpar_online_cpu(struct device_node *dn)
 			if (get_hard_smp_processor_id(cpu) != thread)
 				continue;
 			cpu_maps_update_done();
-			find_and_online_cpu_nid(cpu);
+			find_and_update_cpu_nid(cpu);
 			rc = device_online(get_cpu_device(cpu));
 			if (rc) {
 				dlpar_offline_cpu(dn);
-- 
2.16.4

