Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83D750A7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 16:12:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Wz9OuEdT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1KSF5JMjz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:12:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Wz9OuEdT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1KRL25ZTz3bts
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 00:11:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/DWXQqdXB8XEBn9nrcxVpdVWWih+jjCwvlX2nEsLPTI=; b=Wz9OuEdTC/U+pAiGDh2QSB1rQh
	estO8miU9AZSQNeT1ZfBneiErxb37LhSNHRZWtuGfrfLL1EYkRTytC/eqtBQ5flUhEkMN1zCFkngN
	CVzVfJexnFAvgPRqAnyVh6g8uw/+7RiOaL7qFDbPWf+LxBDspZS1XQHRjPG10xiWCycFSlzSeQ2pS
	qkhXaNVnuBwkoDhccV3f/fFDXhPTzT7MM2g/KNXJHQ/EEWc8ngzF5xbTsxRq1oXCgKmASiLZwPe8+
	dX/EJQBH+CNoE/6rDxPZB9iyHwbKpAVKYbdYizbASNU7oByvubO1HFOqmYxrD49elB6ZmrjF3w4C2
	y9jxJUrA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaYV-003fwd-0S;
	Wed, 12 Jul 2023 14:10:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5E17A30049D;
	Wed, 12 Jul 2023 16:10:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46BDE200D8DF7; Wed, 12 Jul 2023 16:10:56 +0200 (CEST)
Date: Wed, 12 Jul 2023 16:10:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [RFC][PATCH] sched: Rename DIE domain
Message-ID: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: juri.lelli@redhat.com, peterz@infradead.org, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vschneid@redhat.com, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, tglx@linutronix.de, dietmar.eggemann@arm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, bristot@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

Thomas just tripped over the x86 topology setup creating a 'DIE' domain
for the package mask :-)

Since these names are SCHED_DEBUG only, rename them.
I don't think anybody *should* be relying on this, but who knows.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/powerpc/kernel/smp.c   | 2 +-
 arch/s390/kernel/topology.c | 2 +-
 arch/x86/kernel/smpboot.c   | 2 +-
 kernel/sched/topology.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index fbbb695bae3d..5ed6b9fe5094 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1050,7 +1050,7 @@ static struct sched_domain_topology_level powerpc_topology[] = {
 #endif
 	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
 	{ cpu_mc_mask, SD_INIT_NAME(MC) },
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
 	{ NULL, },
 };
 
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 68adf1de8888..c803f5e6ab46 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -522,7 +522,7 @@ static struct sched_domain_topology_level s390_topology[] = {
 	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
 	{ cpu_book_mask, SD_INIT_NAME(BOOK) },
 	{ cpu_drawer_mask, SD_INIT_NAME(DRAWER) },
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
 	{ NULL, },
 };
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index e1aa2cd7734b..09cc9d0aa358 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -653,7 +653,7 @@ static void __init build_sched_topology(void)
 	 */
 	if (!x86_has_numa_in_package) {
 		x86_topology[i++] = (struct sched_domain_topology_level){
-			cpu_cpu_mask, SD_INIT_NAME(DIE)
+			cpu_cpu_mask, SD_INIT_NAME(PKG)
 		};
 	}
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index d3a3b2646ec4..e9d9cf776b7a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1670,7 +1670,7 @@ static struct sched_domain_topology_level default_topology[] = {
 #ifdef CONFIG_SCHED_MC
 	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
 #endif
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
 	{ NULL, },
 };
 

