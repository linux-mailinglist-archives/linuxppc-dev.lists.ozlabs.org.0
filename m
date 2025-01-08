Return-Path: <linuxppc-dev+bounces-4835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348FA057F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkSV2wlgz30TN;
	Wed,  8 Jan 2025 21:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331610;
	cv=none; b=M4fVLjpVuv2RUlzjts98jr0Ift2CSj1CTuHt53Y1A8MUKwRiNieeK0Wl9Z+UflJxxhbE0lJ2BlgVKYmOyzRZJGJBNQrSINHpfGuMTY3rhFjz4sgPrFS1O6rvXhGgBZpVDMQ5CvJpr2J9WVFzQriN1TAu2fSRR5MXQLUrztg3z99QCPg93sik6X0NlD/cmLgSQxPCN1xxxL1wUWmDj7Pzv9UhgOAPPSxO0tDszHh9uSlaQgUODuGG1eT/ufhO5kutUlpnw6tfMjXgQ4P3mqoNOlq8JrtwxNBwargtBka3iliXzOr3zZsQtxN04eF8gaCRgZZ8jRiAF4S2MyfpcoVGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331610; c=relaxed/relaxed;
	bh=Y6owPBcY60T80wXKuUA2cceM2T7gpcOliRiR2Av2h2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3l4P2u62aD2mQcMAvSykHgYPepGamRzo3GL8t/t7dfzH5lJBDk+V8tcTYJrRTXEXelri49ahuvdsmzfNu9ZEBo4E847vNDyb7Pz8hhtsYJX5ZwD+1N6eURP1ioJFABuJKTucCI77bQlUAkAgcOy9a7YO/5mXsDkz32YPIgZT6PeM2LvqKW7950ylw+8I71caM1NNPrupcJ1CVCLMWx3rcZPMmwiHPmm56EtGdUlTLoNh0sstBauym7WaKMVSOFVjD8VqB/C73UonhY1WkqOqkFrdiI8z11m40vGunF/wj+kW22QtgwCG6+4iIk78HOzciFExNfgiZirDmLPgHyq3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkST5KHmz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:20:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSjtl6Lmzz9sPd;
	Wed,  8 Jan 2025 10:54:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1ahVG1ecuQY; Wed,  8 Jan 2025 10:54:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSjtl5TCfz9rvV;
	Wed,  8 Jan 2025 10:54:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A7CDE8B768;
	Wed,  8 Jan 2025 10:54:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0zJmuMvXIIQ5; Wed,  8 Jan 2025 10:54:23 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 069258B767;
	Wed,  8 Jan 2025 10:54:22 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH v2] perf: Fix display of kernel symbols
Date: Wed,  8 Jan 2025 10:54:20 +0100
Message-ID: <2ea4501209d5363bac71a6757fe91c0747558a42.1736329923.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736330060; l=2170; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aS/ZNfXIjryjj5nOlcTWB1iEKCpllVRaNmysQEkDomU=; b=Z4Xvjo3Ubo9KZUR3Sfefad8rhGPY4SVug257NxyG9MhFE4E+egMqtewWN8CabnRwYGhNCe8qs T0kvu0s7piiDUICSW3h8OJ/YRA4oP00x1pJZtnPMAg0GuP+zhnOGX8d
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since commit 659ad3492b91 ("perf maps: Switch from rbtree to lazily
sorted array for addresses"), perf doesn't display anymore kernel
symbols on powerpc, allthough it still detects them as kernel addresses.

	# Overhead  Command     Shared Object  Symbol
	# ........  ..........  ............. ......................................
	#
	    80.49%  Coeur main  [unknown]      [k] 0xc005f0f8
	     3.91%  Coeur main  gau            [.] engine_loop.constprop.0.isra.0
	     1.72%  Coeur main  [unknown]      [k] 0xc005f11c
	     1.09%  Coeur main  [unknown]      [k] 0xc01f82c8
	     0.44%  Coeur main  libc.so.6      [.] epoll_wait
	     0.38%  Coeur main  [unknown]      [k] 0xc0011718
	     0.36%  Coeur main  [unknown]      [k] 0xc01f45c0

This is because function maps__find_next_entry() now returns current
entry instead of next entry, leading to kernel map end address
getting mis-configured with its own start address instead of the
start address of the following map.

Fix it by really taking the next entry, also make sure that entry
follows current one by making sure entries are sorted.

Fixes: 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted array for addresses")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
v2: Make sure the entries are sorted, if not sort them.
---
 tools/perf/util/maps.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 432399cbe5dd..09c9cc326c08 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1136,8 +1136,13 @@ struct map *maps__find_next_entry(struct maps *maps, struct map *map)
 	struct map *result = NULL;
 
 	down_read(maps__lock(maps));
+	while (!maps__maps_by_address_sorted(maps)) {
+		up_read(maps__lock(maps));
+		maps__sort_by_address(maps);
+		down_read(maps__lock(maps));
+	}
 	i = maps__by_address_index(maps, map);
-	if (i < maps__nr_maps(maps))
+	if (++i < maps__nr_maps(maps))
 		result = map__get(maps__maps_by_address(maps)[i]);
 
 	up_read(maps__lock(maps));
-- 
2.47.0


