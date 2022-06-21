Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A055308B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 13:18:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS3sW2tQgz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 21:18:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=FVViAhny;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=FVViAhny;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS3rs4jBVz3059
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 21:17:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ckdE2
	t6xgT2fZFZu6JUyHh1s/liJ/TRFKfbZ2cUkH8I=; b=FVViAhny7QB8PJf25HnTX
	a7leOWbdKj+DqGdH7SKqKyE64MMnYFWt1NN7sNO+QAgKClMFb1ajvqS7z4vfgOd/
	MG+3S8VCY8y0i+TtiYfvjY4y8x5Je7tmNmfAH+LiQyxnrgcFiVuHcMoEvM17aOh7
	aCM4kzCFUE9EzWbRTKEZ8E=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgBHlWmuqLFihxk+FA--.21137S2;
	Tue, 21 Jun 2022 19:17:03 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	osalvador@suse.de,
	npiggin@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/pseries: Hold reference and fix refcount leak bugs
Date: Tue, 21 Jun 2022 19:17:01 +0800
Message-Id: <20220621111701.4082889-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgBHlWmuqLFihxk+FA--.21137S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UtrWfWrWfuw4Dtw47Jwb_yoW8Ar4kpr
	9rKa9xtF48Wr1xK3yIvFyDJr43X3yYkFW8Wa1Ut3ZxC3WDZrn5Aw12qw15XryrCryfur1f
	XrsYg3W5Z3WqqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziGg4kUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizg8nF18RPV4zrgAAsB
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pseries_cpuhp_cache_use_count() and pseries_cpuhp_detach_nodes(),
we need carefully hold the reference returned by
of_find_next_cache_node() and use it to call of_node_put() to keep
refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 0f8cd8b06432..e0a7ac5db15d 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -619,17 +619,21 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 static unsigned int pseries_cpuhp_cache_use_count(const struct device_node *cachedn)
 {
 	unsigned int use_count = 0;
-	struct device_node *dn;
+	struct device_node *dn, *tn;
 
 	WARN_ON(!of_node_is_type(cachedn, "cache"));
 
 	for_each_of_cpu_node(dn) {
-		if (of_find_next_cache_node(dn) == cachedn)
+		tn = of_find_next_cache_node(dn);
+		of_node_put(tn);
+		if (tn == cachedn)
 			use_count++;
 	}
 
 	for_each_node_by_type(dn, "cache") {
-		if (of_find_next_cache_node(dn) == cachedn)
+		tn = of_find_next_cache_node(dn);
+		of_node_put(tn);
+		if (tn == cachedn)
 			use_count++;
 	}
 
@@ -649,10 +653,13 @@ static int pseries_cpuhp_detach_nodes(struct device_node *cpudn)
 
 	dn = cpudn;
 	while ((dn = of_find_next_cache_node(dn))) {
-		if (pseries_cpuhp_cache_use_count(dn) > 1)
+		if (pseries_cpuhp_cache_use_count(dn) > 1) {
+			of_node_put(dn);
 			break;
+		}
 
 		ret = of_changeset_detach_node(&cs, dn);
+		of_node_put(dn);
 		if (ret)
 			goto out;
 	}
-- 
2.25.1

